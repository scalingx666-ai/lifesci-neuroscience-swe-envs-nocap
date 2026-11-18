# Issue

**Title:** Add badge to tests README

## Description

# Description

This PR...
1. Fixes some failing position tests from #1304 specific to the `TEARDOWN` case 
2. Adds a badge as a reminder of coverage using Codecov. This also adds a nice GUI for the dev team to reference 

<details><summary>GUI Example</summary>

![image](https://github.com/user-attachments/assets/ba6e4b31-8146-4d43-b37e-1d5ad8961a8f)

</details>

# Checklist:


- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] Yes. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0c86caf4296`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.