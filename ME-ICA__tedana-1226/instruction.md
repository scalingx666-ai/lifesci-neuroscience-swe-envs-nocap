# Issue

**Title:** Add external regressor-mixing matrix correlation heat map

## Description

.

Changes proposed in this pull request:

- Add seaborn as a dependency. Seaborn's only requirements are numpy and matplotlib, so I don't think this is a problem.
- Create heat map figure showing correlations between external regressors and component time series, and add it to the HTML report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `768b6fad1da3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.