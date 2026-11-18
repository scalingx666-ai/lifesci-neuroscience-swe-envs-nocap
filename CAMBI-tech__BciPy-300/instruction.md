# Issue

**Title:** upgrades to permit use on m2 chips

## Description

# Overview

Further requirement upgrades to make compatible with m2 architectures. 

## Ticket

https://www.pivotaltracker.com/story/show/185257315

## Contributions

- Upgrade libraries, add install script, update code where needed.

## Test

- `make test-all`
- Tested on 14-inch MacBook Pro (M2 Pro). Sonoma 14.1.

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? No yet

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f1559d5a9d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.