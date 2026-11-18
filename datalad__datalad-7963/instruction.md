# Issue

**Title:** BF: create-sibling-{github,gitea,gogs,gin}: time out HTTP requests instead of hanging forever

## Description

None of the `requests` calls behind `create-sibling-{github,gitea,gogs,gin}` had a timeout, so a lost response hung the command forever. They now use `_GitHubLike.request_timeout` (30 s to connect, 120 s to read), and a hang surfaces as `requests.Timeout`.

Seen in dandi/backups2datalad, which mass-creates GitHub repositories: a creation POST created `dandizarrs/325e2654-…` but never returned.

### PR checklist

- [x] Overview of the changes and why (above).
- [x] Changelog snippet: `changelog.d/pr-7963.md`.
- [x] No existing issue to reference.
- [x] Complete; not a draft.

<details>
<summary>Details</summary>

- Covered: the authenticated-user and repository GETs and the creation POST in `create_sibling_ghlike.py`, and `_GitHub.repo_delete_request()`'s DELETE. The Gitea/GOGS/GIN subclasses add no requests of their own; the token lookup and `siblings configure` make none.
- A class attribute rather than a config option, like the class's other per-platform settings (endpoints, response codes), so that it fits `maint`. A `datalad.create-sibling-ghlike.timeout` option could follow on `master`.
- The read timeout bounds the time between bytes, not the whole request. 120 s is ~12× GitHub's server-side cut-off, leaving room for slow self-hosted forges.
- A POST that times out may still have created the repository. Rerunning with `--existing reconfigure` adopts it.
- Test: `test_requests_have_timeout` fails without the fix and passes with it. Checked by hand that `datalad create-sibling-gitea` against a server that never answers now exits with `Read timed out` instead of hanging.

</details>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01H8e21sqa9n3Eji7VUPpuUF

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e614f951c8a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.