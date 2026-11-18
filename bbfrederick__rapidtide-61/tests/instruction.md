# Issue

**Title:** [MAINT] Do not bundle unnecessary data in build

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Stems from #35.

Changes proposed in this pull request:

- Eliminates unnecessary data from build, because there is a file size limit on PyPi builds of 60 MB and the files were ending up at 160 MB. What is "unnecessary" should be determined by @bbfrederick, but I don't think test files, at least, should be included.
- Run `black` on setup.py.
- Add PyPi badges to README.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe0367d5ee94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.