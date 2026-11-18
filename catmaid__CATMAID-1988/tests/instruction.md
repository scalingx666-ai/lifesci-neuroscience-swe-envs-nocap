# Issue

**Title:** Sphinx quality of life improvements

## Description

- All build targets clean out their target directories before building: previously, target files for removed source files would not be deleted or overwritten
- All build targets have a `watch-` counterpart, which watches the source files for changes and automatically rebuilds
- `serve` recipe does `watch-html`, and serves them on port 8889 (which is forwarded in the vagrant config)

These changes have been documented in the Contributing page.

Additionally, I documented the use of flake8 and mypy for linting, and added flake8 to the test requirements file.

I will test everything tomorrow (my ISP is throttling me so I don't want to re-provision my VM right now).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fde0638d1b47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.