# Issue

**Title:** Decouple Engine Reset and Session Start

## Description

* Adds a new classifier attribute `Init time (s)` (default: `0s`) to specify init phase until e.g. filters are stable
* Add classifier attributes to serialized and persisted JSON
* Session Start: 
  * Starts a timer with specified classifier init time after resetting the Engine instead of starting session directly
  * Keeps state-machine paused during initialization phase
  * Shows a `Preparing` label in `Session Control` widget during new initialization phase
  * Starts the session after time elapses
  * Resets OutputNode and FileWriterNode once more to not persist samples from init phase

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `193bda41badf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.