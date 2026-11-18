# Issue

**Title:** Support annotation links as inference job results

## Description

### Summary
The `infer_neurons`, `infer_instances` and `infer_mitochondria` worker jobs now return the path of an annotation (`/annotations/<id>`) that refers to the newly created dataset (see scalableminds/voxelytics#4916), instead of a dataset identifier.

`JobResultLinks` now decides how to build the result link from the job's return value:
- a path or URL (starts with `/`, `http://` or `https://`) is used as the link unchanged
- anything else is treated as a dataset id / directory name / name, as before, so old jobs keep working

This also replaces the special case for neuron jobs with evaluation, since the return value no longer depends on the evaluation flags. Old evaluation jobs returned an annotation path and are covered by the same check.

### Steps to test:
- Open the job list with an old inference job (dataset id as return value): "View" still links to the dataset.
- Open the job list with a job whose return value is `/annotations/<id>`: "View" links to the annotation.

### Issues:
- depends on scalableminds/voxelytics#4916
- fixes 

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [ ] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31531339478f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.