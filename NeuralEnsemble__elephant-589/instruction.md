# Issue

**Title:** Fix/dither spike train with numpy>1.23.0

## Description

This PR addresses issue #586 .

### Changes
- refactor unit tests using `setUpClass`
- add regression test for issue #586 
- refactoring `dither_spikes` function
- updated docstrings
- added typehints

### Notes
- option `edges` has no effect if `refractory_period` is of type `pq.Quantity `
- no default value for `dither`, e.g. use `0 * pq.s` and just return copies of the input spiketrain ? similar to the behavior of passing an empty spiketrain as input ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bd871aec145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.