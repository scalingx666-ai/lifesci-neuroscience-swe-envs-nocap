# Issue

**Title:** [REF] Use logging instead of printed statements

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

.

To do:

- [x] Finish converting timing logger
- [x] Add additional fields (variables and voxel counts) to timing logger
- [x] Convert general logger's formatter to freeform text
- [ ] Finish converting memory usage logger
- [ ] Figure out how to handle `memprofile` with memory usage logger. I'm still not sure what it's for, but I'll figure it out.
- [x] Remove sys.exit statements.

Changes proposed in this pull request:

- Replace print statements in rapidtide workflow with logged messages.
- Remove `verbose` and `debug` if statements. The logger natively handles different levels of messages, although I _did_ have to add a new level for the verbose messages.
- Replace timing and memory usage trackers with additional, separate loggers.
- Streamline `fftpack` import. Will need to be propagated across the package.
- Use f-strings instead of concatenating strings, when appropriate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e37daefeef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.