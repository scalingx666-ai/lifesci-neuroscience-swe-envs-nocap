# Issue

**Title:** Sync atlas table from docs repo; add SWC female rat atlases

## Description

## Description

Sync atlas table from docs repo; add SWC female rat atlases
- Add markers and sync note in README, link to docs repo
- Add tools/update_atlas_table.py for manual sync
- Add SWC Female Rat and Waxholm-aligned SWC Female Rat atlases


**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**What does this PR do**

- Makes the BrainGlobe documentation repository the single source of truth for the Available Atlases table.
- Adds a script to manually sync the table into this repository.
- Reduces duplication and keeps atlas listings consistent across repos.

## References

#747  


## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db913d40f2a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.