# Issue

**Title:** [FIX, DOC] Consolidate and correct dependencies for RTD build and CI

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes None. Apologies of the unsolicited PR, but I noticed that the [`build_docs` CI step is failing](https://app.circleci.com/jobs/github/bbfrederick/rapidtide/2911?utm_campaign=vcs-integration-link&utm_medium=referral&utm_source=github-build-link) because Sphinx removed the `add_stylesheet` function in a recent version, and the [RTD build is failing](https://readthedocs.org/projects/rapidtide/builds/14436093/) because `numba` currently only supports numpy 1.17 - 1.20 (and not 1.21, which is installed by default).

I'm ramping up to run `rapidtide` on a large sample on my university's HPC, and discovered that I couldn't install `rapidtide` in a miniconda environment due to missing libraries, so I thought I'd dig into what was happening.

Changes proposed in this pull request:

- Consolidate requirements in `setup.py` file. Any tool that needs a list of requirements should be able to read them from this file, rather than a `requirements.txt` file. If this affects anything, I can help fix it.
- Use `setup.py` file in RTD config (I can also rename the file so it's used if you want).
- Pin Sphinx version to >= 1.8.0, so that it will consistently use `use_css_file` instead of `use_stylesheet`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e211235aef5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.