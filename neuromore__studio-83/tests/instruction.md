# Issue

**Title:** more flexible osc path pattern and id extract

## Description

* Allows device classes to specify the OSC path pattern that they are interested in, instead of enforcing the old fixed pattern: `/{typename}/{int-id}/foo`
* Allows devices classes to provide the required integer device id from the OSC path whatever way they like, instead of enforcing it to be the second part in the route.
* Backwards compatible for Muse and Mitsar201 (devices already using OSC)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86b71780ddce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.