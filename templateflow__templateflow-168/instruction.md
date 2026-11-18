# Issue

**Title:** Fix duplicate tpl-onavg dataset

## Description

The Canadian Open Neuroscience Platform (CONP) Portal is a web interface that facilitates open science for the neuroscience community by simplifying global access to and sharing of datasets and tools.

One of our dataset uses templateflow as a submodule dependency. Datalad fails to install it because of the multiplicity of the tpl-onavg module. We suspect this duplication is a typo and can be removed, therefore we would like to propose the change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c507fc0a648`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.