# Issue

**Title:** Spawn missing tables on cascading RestrGraph

## Description

# Description

- Long distance restrictions require tables to be imported to be checked in the cascade
- Unexpected or unimportable tables on shared prefixes make unusable in the window between development and merging (or patch release)
- On initial development, auto-import was dismissed as too slow and would not adhere to the user's import conventions
- With hindsight, the process of finding/importing the table is much slower
- This PR sets `dj.VirtualModule` as a fallback for within-Spyglass schema names

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] No. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75645d453bb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.