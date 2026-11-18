# Issue

**Title:** Compliance with AMD's guidelines on user request with LLM calls

## Description

Previously only AmdClaudeModel and AmdGeminiModel sent a "user" request header, and the value resolved to "unknown" inside the Docker container because os.getlogin() raises under `docker exec` and $USER was not forwarded. As a result the gateway could not attribute most requests back to the originating host user.

- Add a module-level `get_amd_llm_user()` helper in `amd_base.py` that prefers `$GEAK_USER`, then `$USER`, then `os.getlogin()`, falling back to "unknown". `_get_user` now delegates to it.
- Forward `-e USER` and `-e GEAK_USER` from the host in `scripts/run-docker.sh` (existing containers must be `--rebuild`ed).
- Send the `"user"` header from `AmdOpenAIModel`, the `LitellmModel` completion path (via `extra_headers`, preserving any explicit override), and the standalone test-discovery MCP server.
- Add unit tests for the resolver and for the header construction in each backend (Claude, OpenAI, Gemini via importorskip, LiteLLM).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9c4e09ee4d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.