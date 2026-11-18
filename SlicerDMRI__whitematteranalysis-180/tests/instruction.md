# Issue

**Title:** DOC: Fix Sphinx documentation

## Description

Fix Sphinx documentation:
- Add a pre-build task to the `readthedocs` config file in order to
  generate the `rst` files from the package docstrings so that Sphinx
  build the HTML files from them.
- Add the `napoleon` extension to the Sphinx config file so that it can
  parse NumPy and Google style docstrings.
- Fix the `index.rst` file so that the package API is effectively
  displayed: set `whitematterpackage` as the entry for the reference
  section.
- Set the `bin` and `utilities` packages as the entries for the scripts
  section in the `index.rst` file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bd4a2224749`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.