# Issue

**Title:** fix(atom): serve recipe EXTRA_ATOM_ARGS, verify ATOM launches, reap Magpie ATOM group

## Description

## Summary

Three fixes to the ATOM serving path, found while reviewing Hyperloom + GEAK runs of GLM-5.2-MXFP4 / MiniMax-M3-MXFP4 on 8×MI355X. Hyperloom #1792 now hands AgentX runs to GEAK's Magpie launcher instead of forcing native, which puts ATOM on a path that had not been exercised before.

### 1. Serve the flags an ATOM recipe records in `EXTRA_ATOM_ARGS`

`interface/effective_config.py` only knew `EXTRA_VLLM_ARGS` / `EXTRA_SGLANG_ARGS`, so an ATOM recipe's server flags (MTP, block size, online quant, max-num-seqs, ...) stayed behind as an environment variable:

- **Magpie launcher**: a schema-v2 handoff sets `EFFECTIVE_SERVER_ARGS_COMPLETE=1`, so `magpie.sh` stops prepending the recipe's `EXTRA_ATOM_ARGS`. Nothing had actually folded them in, and the copy in `EXTRA_ENV` is dropped as non-assignment tokens. Replaying the 2026-10-13 GLM-5.2 handoff with `bench_launcher` unset (the Hyperloom #1792 behaviour), the server received only `--max-model-len --gpu-memory-utilization`.
- **Native adapter**: nothing reads `EXTRA_ATOM_ARGS`, so the server ran adapter defaults (block 16, no MTP, no quant) unless an agent copied the flags by hand.

Fix: register `atom` in `_RECIPE_ARG_ENVS`.

The flags carry JSON and list values, which the resolver renders shell-quoted. Both consumers expand them unquoted (`$EXTRA_SERVER_ARGS` in `adapters/atom.sh`, `$EXTRA_ATOM_ARGS` in the recipe script), so the server would get literal quotes, and `*` / `[0-9]` inside the quant config were open to globbing. To handle this:

- New `adapters/split_args.py` splits by shell quoting rules: bare JSON stays one token, and nothing is evaluated.
- `atom.sh` launches from the resulting array.
- `magpie.sh` re-renders the args as bare words before handing them to the recipe.

### 2. Verify ATOM launches (`server_identity`)

`server_identity` only parsed SGLang's `ServerArgs(`, so every ATOM run reported `unverified`. That includes the 2026-10-04 GLM-5.2 run, whose servers had no MTP, block 16 instead of 64, and 512 seqs instead of 8.

- Parse ATOM's `Engine kwargs: {...}` line into stable launch facts. Run-scoped values such as ports and the profiler dir are left out.
- When the upstream identity is an opaque digest, compare against the orchestrator's baseline server log, from `baseline_env_spec.measurement_evidence.actual_server_log_path`.
- Also check the servers GEAK launched itself (profile r0, validation base/final). The Setup baseline can be imported from the orchestrator, so a match at Setup proves nothing about later launches. Differing fields are listed under `mismatches`.

Replayed on the real sessions:
- 2026-10-04 reports `mismatched` and spells out the missing MTP, block, seqs and quant.
- 2026-10-13 reports `matched`.

### 3. Teardown reaps a Magpie-launched ATOM group directly

Under Magpie, ATOM leads its own process group while `SERVER_PID` is GEAK's supervisor in another group. Reaping ATOM therefore depended entirely on the supervisor's TERM trap. That trap cannot be installed when TERM arrives already ignored, and it never runs if the supervisor is SIGKILLed. In either case the rank workers keep every GPU.

`server_teardown` now also reaps `MAGPIE_INNER_SERVER_PID`'s group on every exit path (TERM, then grace, then KILL), with the same safety checks as the main path.

## Test plan

- [x] New tests:
  - `test_effective_config.py`: atom recipe args become flags.
  - `test_atom_server_argv.py`: quoted/bare JSON, no globbing, fallback.
  - `test_magpie_launcher_extra_args.py`: recipe receives bare JSON.
  - `test_run_e2e_alignment.py`: ATOM parse, orchestrator-log fallback, mismatch on GEAK-launched legs.
  - `test_magpie_inner_reap.py`: real processes; reproduces the leak with a TERM-ignoring supervisor, and shows the group reaped with the fix.
- [x] Full `interface` + `e2e_workflow/scripts/tests`: 2743 passed. 2 failures are pre-existing on `main` and unrelated: `test_run_e2e_trace_mirror::test_a_copy_failure_is_recorded_and_the_pass_continues` and `test_llm_ledger::test_brackets_balance`.
- [x] Offline replay of the 2026-10-13 GLM-5.2 handoff through the Magpie launcher: the server argv has `--method mtp --block-size 64 --max-num-seqs 8`, and `online_quant_config` parses as JSON (`main`: none of them).
- [x] On-box: GLM-5.2-MXFP4 on MI355X in the ATOM container, TP8 and TP4. Results are below.

## Not in this PR

- vllm/sglang native adapters expand `$EXTRA_SERVER_ARGS` the same unquoted way.
- AgentX measurement window and acceptance metric (total tok/s vs interactivity); this needs alignment with Hyperloom.
- Timeout result recovery and zero-baseline gating.

## On-box verification (2026-10-18)

**Setup**
- Image: `rocm/atom-dev:nightly_202609211553`, the InferenceX recipe image (`sha256:b3f62840…`).
- Node: `crsuse2-m2m-100`. Same node and same container for `main` (`bf067427`) and this PR (`d0c06575`).
- Recipe: builtin `atom_mi355x.sh`, with the GLM-5.2-MXFP4 agentic-MTP flags (conc 4) in `EXTRA_ATOM_ARGS`.
- Handoff: shaped as Hyperloom #1792 emits it, with `bench_launcher` unset, so GEAK resolves `magpie`.
- Launch path: GEAK's deterministic path only, `run_e2e` setup → `bench_e2e.sh` → Magpie launcher. No agent-written scripts.
- Load: a short native bench (16 requests) on each server.

**Flags the server received**

| Server `Engine kwargs` | recipe | main TP8 | PR TP8 | main TP4 | PR TP4 |
|---|---|---|---|---|---|
| speculative method / tokens | mtp / 5 | None / 0 | mtp / 5 | None / 0 | mtp / 5 |
| kv_cache_block_size | 64 | 16 | 64 | 16 | 64 |
| max_num_seqs | 8 | 512 | 8 | 512 | 8 |
| cudagraph_capture_sizes | [1,2,4,8] | 11 defaults | [1,2,4,8] | 11 defaults | [1,2,4,8] |
| kv / index cache dtype | fp8 / fp4 | bf16 / None | fp8 / fp4 | bf16 / None | fp8 / fp4 |
| online quant | ptpc_fp8 | none | ptpc_fp8 | none | ptpc_fp8 |
| requests served | | yes | yes | yes | yes |
| `server_identity` | | mismatched | matched | unverified¹ | unverified¹ |
| leftover processes after teardown | | none | none | none | none |

On `main`, the launch line Magpie executed was only `... -tp 8 --max-model-len 1048576 --gpu-memory-utilization 0.85`.

With this PR, `--online_quant_config` reached ATOM as one token, including the `*` / `[0-9]` patterns in its JSON value, and ATOM parsed it as ptpc_fp8. The same holds for `--cudagraph-capture-sizes [1,2,4,8]`.

¹ There is no orchestrator baseline log for TP4 to compare against. For TP4 the per-flag table above is the check.

Throughput is not compared. The recipe forces speculative acceptance ("throughput numbers from this run are synthetic"), and `main` ran without speculation at all.

**The same failure in a real Hyperloom run.** In Hyperloom's own run on GEAK `main` (`glm52-magpie-geakmain-20261014T194321Z`), one kernel capture had no agent-copied flags. That server came up with the same defaults (`speculative_config: None`, block 16, 512 seqs, no quant). The flags only matched in that run where an agent had hand-copied them into `EXTRA_SERVER_ARGS`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2b581563349`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.