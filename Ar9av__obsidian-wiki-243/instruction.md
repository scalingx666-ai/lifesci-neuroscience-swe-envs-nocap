# Issue

**Title:** feat(daily-update): systemd timer and cron scheduling for Linux

## Description

Ship obsidian-wiki-daily-update.service/.timer next to the launchd plist
and have daily-update setup mode pick launchd, a systemd user timer, or a
crontab line per platform. Units verified with systemd-analyze on Ubuntu.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33ce8ce444b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.