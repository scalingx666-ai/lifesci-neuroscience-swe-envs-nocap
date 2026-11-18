# Issue

**Title:** fix(server): key-gate /mcp and bind its host so LAN clients stop getting 421

## Description

.

`/mcp` is mounted with `app.mount`, and FastAPI route dependencies don't reach mounted apps, so `require_key` never ran on it. Every MCP tool answered without `WIKI_API_KEY`. The only thing keeping it off the network was mcp's loopback DNS-rebinding guard, which is also what 421'd every LAN/Docker request in #266. The fix suggested in the issue (pass `host`) would have opened the endpoint to the LAN with no key.

- `/mcp` now checks the bearer token itself, using the same `_key_ok` as `require_key`.
- `WIKI_HOST` is passed into `streamable_http_app`, so a server bound to `0.0.0.0` accepts LAN Host headers.

Tests: `test_mcp_needs_a_key` and `test_mcp_answers_a_lan_host_when_bound_to_every_interface` both fail on `main` and pass here. Full suite: 1224 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a3d143eb854`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.