# Issue

**Title:** fix/basedonmni options

## Description

As per , I updated the `basedonmni` method case in the `ft_prepare_sourcemodel` to access the options + kept backwards comparability by having checkconfig check the config `nonlinear`. 

I should mention that one could also add "unit" as a variable to checkconfig, but doesn't change functionality at all (would just clean prepare_sourcemodel a bit and remove legacy code from there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e696d65a5b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.