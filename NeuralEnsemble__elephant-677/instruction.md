# Issue

**Title:** [Fix] Documentation build errors

## Description

This PR fixes some errors during the documentation build process:

1. The `docs` test job and the ReadTheDocs build job in the CI are based on `environment-docs.yml`, which specifies `python>=3.8`. However, the test job sets the environment to Python 3.12, while ReadTheDocs tries to build the documentation on Python 3.14, which is causing errors. The first fix in this PR is to set the Python version in `environment-docs.yml` to 3.12, ensuring both CI jobs are consistent and the documentation build runs without error.
2. Small errors in docstring formatting that generated Sphinx warnings during the build were fixed.
3. The HTML page generated for the UE tutorial notebook was missing a user-defined function for plotting, due to an explicit request for NbSphinx to hide the cell. It was replaced by the equivalent Viziphant function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `066c48dca658`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.