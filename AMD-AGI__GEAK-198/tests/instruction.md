# Issue

**Title:** feat(tools): add translation tool profile for TranslationAgent

## Description

## Summary

- Adds a dedicated `"translation"` tool profile to `_TOOL_PROFILES` in `tools_runtime.py`, restricting the TranslationAgent to only the 4 tools it needs: `bash`, `str_replace_editor`, `save_and_test`, and `submit`.
- Wires `tool_profile` through `AgentConfig` and `DefaultAgent` so any agent can declare a restricted tool set via YAML config, enabling future agents to define their own profiles.
- Applies the `translation` profile to the lean PyTorch-to-FlyDSL translation config.

This restricts the TranslationAgent to only the 4 tools it needs, eliminating MCP tool usage during translation runs.

- Validated on Vultr SLURM cluster: translation of `25_Swish` and `14_Gemm` completed without MCP hangs
- Confirmed agent only used the 4 tools in the translation profile (zero MCP tool calls)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ef30d041604`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.