# Issue

**Title:** Deep-link to the trained model in training success email

## Description

### Summary
The "Your model training is ready" email linked to the dashboard, because training jobs had no result link.

- Training jobs now get the result link `/aiModels#<modelId>` (email, Slack notification, job list).
- The AI models list prefills its search from the URL hash (like the project and task type lists) and can be searched by model id.
- If the linked model is not listed but lives in another organization the user can access (or the user is a super user), a full-page prompt offers to switch organizations, like for datasets, annotations and workflows. `GET /api/auth/accessibleBySwitching` accepts an optional `aiModelId` for this.
- The login redirect of secured routes now keeps the URL hash, so the deep link survives logging in.
- The job list shows a "View" link for finished training jobs (also for `train_instance_model`, which previously fell through to the generic case).

### Steps to test:
- Train a neuron or instance model and let it succeed
- The success email's "Open WEBKNOSSOS" button opens `/aiModels#<modelId>`, the list shows only that model
- Open the same link while logged out: after login the filtered list appears
- Open the link while a different organization is active (or as a super user outside the organization): a full-page prompt offers to switch; after switching, the filtered list appears
- In the job list, the finished training job shows a "View" link to the model

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2a75fc16db2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.