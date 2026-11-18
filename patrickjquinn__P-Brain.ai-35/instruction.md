# Issue

**Title:** IoT Skill And Windows Compilation Fix

## Description

Hi Patrick,

Another PR. This one fixed windows compilation by moving away from node-expat. (It also now seems to run with a npm install instead of yarn).

I've also added an IoT skill. I've made it as generic as I can so users can replace it with whatever they're doing but it still isn't that useful on its own. Let me know if you want it removed from this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ac4379fa32d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.