# Issue

**Title:** TaskEnvironment

## Description

This PR introduces a `TaskEnvironment` that inherits `ratinabox.Environment` and `pettingzoo.env` environments. The main goal is to provide a streamlined interface for encoding and executing tasks and to improve the integration of RIB with reinforcement learning tools compatible with Gym APIs, like Stable Baselines3 and Rllib.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `462996819f00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.