# Issue

**Title:** MAINT: Fully switch to Schema Validator

## Description

This drops the legacy validator from our CI's. Since we no longer have to use the legacy validator, I changed the CI setup from installing a `bids-validator` command on PATH, to just installing deno runtime. The `_bids_validate` fixture will now use deno to run the validator, optionally allowing the dev to control the spec version via a bash environment variable. For example:

`BIDS_VALIDATOR_VERSION='2.4.0'`

For this environment variable, we special case two values, (`'stable'`, and `'dev'`), as aliases to run the latest version version on [JSR](https://jsr.io/@bids/validator), and the development spec, respectively. Personally I find this very handy!

 
Finally, if deno is not available, `_bids_validate` will check if the PyPI CLI is installed: `bids-validator-deno`. I think this will be nice for new and/or casual contributors, who don't want to install a non-python testing dependency. They can just do `python -m pip install bids-validator-deno` before running the test suite.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8a8c49f0156`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.