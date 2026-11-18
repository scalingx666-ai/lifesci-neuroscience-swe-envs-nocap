# Issue

**Title:** Correlation between entropy/FD metrics for data traces from Hodgin-Huxley model

## Description

Continuation of the discussion in #4
PR includes only a single notebook that shows correlation between all currently available metrics in the library.
This notebook uses simulated voltage traces from [the Hodgkin-Huxley model](https://en.wikipedia.org/wiki/Hodgkin%E2%80%93Huxley_model) of an excitable cell and could potentially serve as a sequel to previous two notebooks that compute correlation on noisy data and sine time series, respectively.
No additional dependencies other than `scipy` are used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1bdedb2f5ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.