# Issue

**Title:** Adding classification tags options to `ica_reclassify`

## Description

.
This is in response to #1182 and discussion in #1184.

Changes proposed in this pull request:

- `ica_reclassify` gets two new command line options `--tagacc` and `--tagrej`. Following the confection for `--manacc`, these are `tag_accept` and `tag_reject` in the workflow
- When `ica_reclassify` is run these tags will be added to all listed components, whether or not the classification changes. That means one could add a tag like "AROMA reject" and it would be added to the existing tags whether or not a component was already classified as rejected.
  - This was always the desired functionality within the API, but I noticed & corrected an edge case where this didn't work & now it is accessible via the CLI
- The inputted tags can be either a single tag or a comma delimited string (i.e. `--tagrej "AROMA reject reason 1, AROMA reject reason 2"`). I think this makes the full functionality @tsalo wants possible, but you'd need to run & write out new outputs for every different combination of new tags. This is inefficient.
- tests added for all new functionality and some existing tests were improved to confirm details of outputs while I was editing them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b373d0664a33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.