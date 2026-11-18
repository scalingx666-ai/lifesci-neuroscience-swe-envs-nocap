# Issue

**Title:** Fix EEG dependency installation in CI

## Description

## Brief summary of changes

This PR fixes CI failures on Ubuntu 26.04 caused by outdated package dependencies that are no longer available. It removes unnecessary dependencies while keeping the required packages for the workflows. It also updates the MySQL startup command to use `systemctl`, as recommended for Ubuntu 26.04 runners https://github.com/actions/runner-images/blob/ubuntu26/20261101.186/images/ubuntu/Ubuntu2604-Readme.md#mysql:~:text=start%20postgresql.service%27-,MySQL,-MySQL%208.4.11%2D0ubuntu0.26.04.1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d363237a4fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.