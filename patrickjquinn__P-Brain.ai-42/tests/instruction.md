# Issue

**Title:** Adds promiscuous mode

## Description

Hi Pat,

I wanted to run this by you mainly because of the default settings. I've removed the creation of the demo user and replaced it by having promiscuous mode enabled by default, and by default that those promiscuously created users are admins. When setting up the server make sure to set promiscuous_admins to false.

Changelist:
- Added promiscuous_mode. If a user does not authenticate correctly, and the user does not exist then the user can be created if the setting is set to true.
- Changed default to not create a demo user. It now enables promiscuous mode and promiscuous admins.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8af25dba9144`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.