# Issue

**Title:** Visual test now combines all three tests in one and gives more quantitat...

## Description

I combined the three visual presentation tests into one test.
The information given is not a plot anymore, but a more quantitative measure of the system's performance.

The threshold for the colours are debatable. They are currently:

innacuracy: 0ms = green, larger 0ms = red
delays:  smaller 1% = green,  between 10% and 1% = yellow,  larger 10% = red

@lindemann09 Please let me know what you think (especially about the thresholds for the colours. What is reasonable here?)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7796665a94f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.