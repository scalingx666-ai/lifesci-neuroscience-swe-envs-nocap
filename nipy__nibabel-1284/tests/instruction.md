# Issue

**Title:** MNT: Add tool for generating GitHub-friendly release notes from RST changelog

## Description

GitHub releases don't automatically convert RST to Markdown, so a direct copy ends up with warts, such as too many line breaks in the rendered output and unlinked references.

This PR fixes the former, mostly, and implements an extremely basic dereferencer. I also replace `pr/...` with `#...` to link to PRs.

This will probably need minor updates with each release, but it's a good starting point and should save time overall.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70795b063c48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.