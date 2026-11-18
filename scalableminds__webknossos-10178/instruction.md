# Issue

**Title:** Show runs that executed a task in the Voxelytics workflow viewer

## Description

### Summary
Each task in the Voxelytics workflow viewer now has a **Runs** tab listing the runs in which the task was actually executed (skipped/pending runs are omitted), newest first, with state, begin time, duration, user and host. Each run links to that run, and the task is re-expanded there.
In the consolidated view, the Logs tab now links to the latest run that executed the task instead of only asking to select a run.

Frontend only: the workflow report already contains every task's runs.

<img width="3252" height="1453" alt="image" src="https://github.com/user-attachments/assets/fbf22504-4db7-4878-80bc-d6561c338457" />


### Steps to test:
- Open a workflow with several runs where some tasks were skipped in later runs (e.g. reruns with cached tasks)
- Expand a task: the Runs tab should list only runs that executed it; clicking a run opens it with the task still expanded
- In the consolidated view, the Logs tab links to the latest run that executed the task
- With a specific run selected, the Runs tab still lists all executing runs and highlights the current one
- A task that was never executed has no Runs tab

### Issues:
- 

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c48d26b14a9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.