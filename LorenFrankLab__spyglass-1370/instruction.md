# Issue

**Title:** PR QoL: codecov fail limit, PR template edits

## Description

# Description

This PR adds a [coverage target](https://docs.codecov.com/docs/gitlab-3-customizing-codecov#set-coverage-standards) to prevent a failing test on small edits. PRs that add more than 1-2% to the code base will trigger this fail

This PR also simplifies the checklist below for a more streamlined pattern of `If A, B // If C, D // changelog`

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80a008353400`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.