# Issue

**Title:** OSC regions cli

## Description

Adds a CLI workflow for configuring EEG channel “regions” (channel groups) and wires that configuration into the VRChat OSC bridge so OSC can stream per-region values (or fall back to a global average).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de52da8da6c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.