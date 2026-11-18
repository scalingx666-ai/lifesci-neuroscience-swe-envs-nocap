# Issue

**Title:** [dictionary] Translate filter categories except for instruments

## Description

## Brief summary of changes

This PR translates the derived filter categories in the Data Dictionary module into French.

#### Testing instructions (if applicable)

1. Go to 'Tools' -> 'Data Dictionary'
2. Switch the language to French
3. Select every module expect instruments from the Modules dropdown
4. Verify that its derived categories are translated

I excluded 'Instruments' module from the PR because the 'categories' or test full names are not available through a Query Engine file like the other modules. I had previously implemented database translations for Instruments in another PR, but since the list of instruments was not exhaustive, that change was requested to be reverted. See the referenced review comment for details.



#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6023fddf3d8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.