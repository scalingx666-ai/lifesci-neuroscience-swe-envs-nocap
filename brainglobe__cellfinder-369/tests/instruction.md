# Issue

**Title:** Remove `pytest-lazy-fixture` due to incompatibility with `pytest v8.0.0`

## Description

|

Turns out we were only using `pytest-lazy-fixture` for one test anyway.

Workaround is to pass the fixture name to `pytest.param` as a string, and then use the `requests` fixture (built in to `pytest`) to fetch the value of that fixture.

As such, `pytest-lazy-fixture` is no longer a dependency.

Also fixes:

- We're not shipping `scikit-image` even though cellfinder depends on it?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae104466281f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.