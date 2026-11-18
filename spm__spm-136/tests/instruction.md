# Issue

**Title:** Enable auto-merge (squash) on FieldTrip sync PRs

## Description

## Summary

Enables GitHub auto-merge (squash) on the PRs opened by the `sync-fieldtrip` workflow, so a successful sync PR merges itself once required checks pass instead of waiting for a manual click.

Two changes to `.github/workflows/sync-fieldtrip.yml`:

1. Add `id: create-pr` to the **Create or update FieldTrip sync pull request** step so its outputs can be referenced.
2. Add a final **Enable auto-merge (squash) on the FieldTrip sync PR** step that runs `gh pr merge --auto --squash` on `steps.create-pr.outputs.pull-request-number`.

### Safety

- Gated on a PR actually existing and the `pull-request-operation` being `created` or `updated`.
- Authenticated with `PAT_FIELDTRIP_SYNC` (falling back to `GITHUB_TOKEN`).
- Wrapped in a `|| echo "::warning::..."` fallback, so if auto-merge can't be enabled (e.g. "Allow auto-merge" off or no branch protection on `main`) it logs a warning and **never fails the sync job**.

No repository settings are changed by this PR. Enabling "Allow auto-merge" and configuring branch protection on `main` remain repo-admin actions.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28d1f103b021`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.