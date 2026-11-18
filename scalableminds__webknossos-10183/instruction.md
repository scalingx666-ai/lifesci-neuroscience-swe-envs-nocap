# Issue

**Title:** Respect "Include 3D meshes" checkbox in animation modal

## Description

### Summary
The "Include 3D meshes" checkbox in the Create Animation modal was never read when submitting the job, so all visible meshes were sent to the worker even when the box was unticked. Unticking it now submits no meshes (and skips them in the triangle-count validation).

### Steps to test:
- Open an annotation, load one or more meshes and open "Create Animation"
- Untick "Include 3D meshes" and start the job; the job's `commandArgs.meshes` should be empty and the rendered video should show no meshes
- With the box ticked, visible meshes should still be included as before

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03e824915b35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.