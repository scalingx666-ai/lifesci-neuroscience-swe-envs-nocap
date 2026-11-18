# Issue

**Title:** Bci gui rewrite

## Description

# Overview

Rewrite BCIGui code to be simpler and more maintainable

## Ticket

[GUI Refactor](https://www.pivotaltracker.com/story/show/188031090)
[Intertask Action](https://www.pivotaltracker.com/story/show/187994028)

## Contributions

- Rewrite base GUI class
- Rewrite Experiment registry to extend base gui class
- Create intertask action with new ui code

## Test

- Manual testing (may want to look into Qt Test in the future for automated GUI testing)

## Documentation

- Inline documentation written for GUI methods

## Changelog

- Changelog updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1f2e41d0939`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.