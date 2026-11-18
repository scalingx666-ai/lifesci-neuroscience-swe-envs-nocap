# Issue

**Title:** Experience Wizard

## Description

This adds a new feature/window called ExperienceWizard to neuromore Studio.
It allows to quickly create a customized experience for a selected user by:

a) Selecting a classifier
b) Selecting a state machine
c) Specifying a name for the experience
d) Configuring "quick config" nodes in the classifier

So far only supports 'channels' attribute of ChannelSelector node in (d).
But can be extended to support any kind of configuration for any kind of node.

Screenshot:

![exp_wiz](https://user-images.githubusercontent.com/780159/87024352-47823100-c1d9-11ea-90ea-a994c3ebb777.PNG)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2569f03f64b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.