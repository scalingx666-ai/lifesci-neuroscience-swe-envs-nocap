# Issue

**Title:** [REF] Continue shifting to logging

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

References #41.

Changes proposed in this pull request:

- Change how the general logger is initialized. I realized that the console messages were being weirdly duplicated because I was changing root settings for the general logger, which was only necessary when the general logger was initialized using each file's `__name__` (basically creating unique loggers, AFAIK). When you replace `__name__` with `"GENERAL"` (i.e., a shared logger, as with `"TIMING"` and `"MEMORY"`, you can change the settings for the general logger across all files.
    - The console outputs look WAY better and the log file is unaffected.
- Fix up the TimingLGR. It doesn't require `try`/`except` statements. I just had to fix up the `TimingFormatter`.
- Remove `debug` arguments for functions in `calcsimfunc.py`, `correlate.py`, and `dlfilter.py`. The goal is to replace `debug` with `LGR.debug` calls (hence no need for the argument).
    - Hopefully I removed `debug` from all calls to these altered functions, but I'm not 100% sure.
- Replace print statements with `LGR.info` calls. This also involves replacing comma-separated strings containing variables with f-strings.
    - E.g., `print("testing", var, "here")` --> `LGR.info(f"testing {var} here")`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03af00dd3a96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.