# Issue

**Title:** Fix Markdown header rendering

## Description

GitHub recently updated their Markdown renderer to require a space
between the `#` characters and the title of a header. See here for
details:

This change was made by running:

    sed --in-place 's/^\(##*\)\([^# ]\)/\1 \2/' README.markdown

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89f0fdb39ef6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.