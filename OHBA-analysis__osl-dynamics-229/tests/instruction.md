# Issue

**Title:** Feat: Allow extra session labels as extra channels in Data class.

## Description

This allows extra information (session labels) to be added as extra channels to the Data class.

- the previous `session_id` channel has been removed by default.
- To add session labels, it can be passed as arguments (`training_data = Data(..., session_labels={"session_id": np.arange(n_sessions)})`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9769f705c540`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.