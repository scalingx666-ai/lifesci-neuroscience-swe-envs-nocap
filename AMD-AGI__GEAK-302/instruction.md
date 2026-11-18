# Issue

**Title:** fix(litellm): force streaming for AMD Primus-Safe gateway

## Description

## Summary

- Fixes 100% run failure against the AMD / core42 Primus-Safe gateway, whose VertexGenAI backend rejects **non-streaming** predictions with an opaque `400 INVALID_ARGUMENT`.
- In `LitellmModel._query`, when the call targets the gateway (`_is_amd_llm_gateway_api_base`), force `stream=True` and reassemble the chunks with `litellm.stream_chunk_builder` into a normal `ModelResponse`. Downstream `query()` access (`choices[0].message`, `model_dump()`, cost calc) is unchanged.
- Non-gateway providers keep the original non-streaming call.

.

## Root cause (reproduced against the live gateway)

Using GEAK's exact `litellm.completion` form (`openai/claude-opus-4-8`, gateway `api_base`, `max_tokens=16384`):

| Request | Result |
|---|---|
| non-streaming (current) | **400 INVALID_ARGUMENT** |
| **`stream=True` + `stream_chunk_builder`** | **200 OK** |

`stream=True` is the only field that yields 200 — independent of model id and token cap (so it is unrelated to the earlier `claude-opus-4-7` -> `4-8` deployment change).

## Test plan

- [x] `tests/models/test_litellm_model.py` passes (41 passed), incl. two new tests: gateway call forces `stream=True` + reassembles; non-gateway call stays non-streaming.
- [x] Verified end-to-end against the live gateway: streamed call + `stream_chunk_builder` returns content and a `model_dump()`-able response.
- [ ] Observe a live GEAK run against the gateway and confirm preprocess no longer dies with `INVALID_ARGUMENT`.

## Notes

- Usage/cost: `stream_chunk_builder` reconstructs the assembled response; `completion_cost` continues to work on it (verified). `stream_options={"include_usage": true}` was not required.
- `timeout` semantics: the forced-stream branch passes the same `timeout` to `litellm.completion`; chunk iteration happens within the call's lifetime.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e18490438c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.