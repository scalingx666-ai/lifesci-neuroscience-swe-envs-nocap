# Issue

**Title:** DOC: Add Markdown tutorial files to the documentation

## Description

Add Markdown tutorial files to the documentation.

Add the necessary Sphinx extensions and source suffixes for Sphinx to be able to render the Markdown files.

Install the `myst-parser` package as a pre-build step so that it is available for `readthedocs`.

Documentation:
https://www.sphinx-doc.org/en/master/usage/markdown.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84b2da1c9b65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.