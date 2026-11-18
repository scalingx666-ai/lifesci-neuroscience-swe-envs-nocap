# Issue

**Title:** BF: Harden test_gitea against transient demo.gitea.com failures

## Description

demo.gitea.com is unreliable -- analysis of 139 AppVeyor runs in Feb 2026 shows 8 failures (5.8%): 401 Unauthorized (4), 500 Internal Server Error (2), 404 Not Found (2).

The 404 errors are secondary: when repo creation fails (401/500), the cleanup finally block's raise_for_status() on the DELETE call raises a 404 (repo was never created), masking the original error.

Two fixes:

- check4real() finally block: only suppress 404 from the cleanup DELETE (with a warning log) since it means the repo was never created; keep raise_for_status() for any other unexpected status code

- test_gitea: add @pytest.mark.flaky(retries=3, only_on=[HTTPError]) to automatically retry on transient API errors from demo.gitea.com

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a2f10e5f96a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.