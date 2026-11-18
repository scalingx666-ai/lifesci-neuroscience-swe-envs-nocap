# Issue

**Title:** [Feature] Trial handling in Elephant

## Description

This PR is the initial contribution to introduce a trial handling functionality into Elephant.

The PR includes the following changes:

1. Meta class: `Trials`: This meta class is responsible for defining the behavior and structure of the trial objects in Elephant. It includes methods and attributes related to handling and manipulating trials.

2. Implementations: `TrialsFromBlock` and `TrialsFromLists`: These two implementations are  specific ways to create `Trials` objects from different data structures. `TrialsFromBlock` may create trial objects from a neo.block of data, while `TrialsFromLists`  creates trial objects from lists of data.

3. Modification to `elephant.statistics.instantaneous_rate`: The `instantaneous_rate` function in the Elephant library is modified to accept a `Trials` object as input. This modification enables the calculation of firing rates based on the values of `cross_spiketrain` and `cross_trial`. The firing rate calculation can now be averaged over trials or spiketrains within a trial, or both.

Overall, this PR adds trial handling functionality to the Elephant library, allowing users to work with trials and for now calculate averaged firing rates .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `913a99826077`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.