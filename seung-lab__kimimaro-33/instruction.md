# Issue

**Title:** feat: specify extra_targets_before and after

## Description

feat: specify root for core skeletonization routine

This allows an end user to specify e.g. the location of
synapses in a neuron to ensure we trace to them. Note that
unlike border_targets, extra_targets do not have an effect
on what the root node will be. This is because they are totally
uncontrolled and can be located off of the shape.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86958c9949c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.