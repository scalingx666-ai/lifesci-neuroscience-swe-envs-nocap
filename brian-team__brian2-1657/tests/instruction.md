# Issue

**Title:** Feat: Introduce abstract RateMonitor class for unified rate analysis

## Description

Based on the great discussions and instructions in the issue (thanks, they were really helpful!), I've started the implementation for a unified rate-handling mechanism.

So far, I've created the abstract `RateMonitor` base class and refactored `PopulationRateMonitor` to inherit from it. I've also added the new `binned()` method to `PopulationRateMonitor` to allow for re-binning of the recorded population rate.

So I guess , `EventMonitor` is a bit more complex since it handles generic events, not just spikes. I'll need to look more closely at how to pass the correct variable information to the template for that implementation.

**Did:**
- Added the abstract `RateMonitor` class.
- Refactored `PopulationRateMonitor` to inherit from `RateMonitor`.
- Implemented the `binned()` method for `PopulationRateMonitor`.

**ToDo:**
- [X] Implement the `binned()` method for `EventMonitor` to calculate binned rates from event times.
- [X] Thoroughly test the new functionality.
- [X] Write unit tests for the new methods.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8481c85d0bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.