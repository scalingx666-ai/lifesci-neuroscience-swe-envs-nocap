# Issue

**Title:** ENH: Add JAMICA as an ICA method

## Description

#### Reference issue (if any)

Related to #14207.

#### What does this implement/fix?

Adds `method="jamica"` as an optional, single-model ICA backend using the public `jamica.amica` API from JAMICA 0.3.0. MNE retains ownership of pre-whitening, PCA, dimension selection, reconstruction, and persistence; multi-model AMICA remains available through JAMICA directly.

The tests cover the external-solver matrix contract, deterministic direct-call equivalence, iteration metadata, optional-dependency handling, multi-model error propagation, source reconstruction, and FIF round trips without JAMICA installed.

JAMICA backend release: https://github.com/snesmaeili/jamica/releases/tag/v0.3.0

#### Additional information

Validation included the complete ICA test module, focused integration tests against the published JAMICA 0.3.0 package, configuration and docstring tests, pre-commit checks, and wheel/sdist validation.

AI assistance disclosure: OpenAI Codex was used to inspect both codebases, help implement the integration and tests, and run validation. I reviewed and approved the resulting changes before submission.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b410a9c713ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.