# Issue

**Title:** fix the tools call list in litellm

## Description

## Summary
LitellmModel was producing tool definitions that LiteLLM's OpenAI-compatible completion() could not consume, and was applying Anthropic prompt-cache breakpoints after assistant tool_calls had already been coerced into LiteLLM's API shape. This PR fixes both in a single 2-line change to src/minisweagent/models/litellm_model.py.

## Changes
1. convert_openai_tools_to_litellm: input_schema → parameters
LiteLLM's litellm.completion(tools=...) expects the OpenAI tool schema, where each function's JSON Schema lives under the parameters key:

{"type": "function", "function": {"name": ..., "description": ..., "parameters": {...}}}
We were emitting function.input_schema (the Anthropic-native key). On the OpenAI-compatible path LiteLLM silently dropped the schema, so the model received tools with no argument types and could not produce well-typed tool calls (manifested as empty / malformed tool_use blocks against Anthropic via LiteLLM, and as schemaless tool listings against OpenAI gateways).

2. LitellmModel.query: run set_cache_control before normalize_messages_for_litellm_api
set_cache_control operates on the agent-internal message list (where tool_calls is a single dict, as written by DefaultAgent). normalize_messages_for_litellm_api then deep-copies and rewrites tool_calls into the OpenAI list shape required by LiteLLM's Anthropic/Vertex path.

The previous order normalized first, so cache-control breakpoints were placed on the post-coercion copy rather than on the canonical agent messages. The new order matches the in-file comment ("attach cache breakpoints on the agent message list before coercing tool_calls shape for LiteLLM") and mirrors AmdOpenAIModel._query_api semantics.

## Impact
Tool-using models routed through LitellmModel (including AnthropicModel, which subclasses it) now receive correctly typed tool schemas and call tools reliably.
Anthropic prompt caching is again applied to the actual agent messages, restoring the intended cache-hit behavior for Claude routes.
No public API or config changes; default behavior is preserved for non-Anthropic models (set_cache_control still defaults to None for plain LitellmModel).
## Test Plan

- [x] pytest tests/models/test_litellm_model.py
Note: TestConvertOpenaiToolsToLitellm::test_input_schema_used asserts on the now-removed input_schema key and must be renamed/updated to check function["parameters"] 

- [x] Smoke run via python -m minisweagent.models.litellm_model (the __main__ block) against an Anthropic-via-LiteLLM gateway and confirm the assistant emits a tool call for the "list all tools you have" turn.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9a80f7b9331`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.