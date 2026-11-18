# Issue

**Title:** TVB-3042 TVB-3043 Fixes for SiibraCreator token handling

## Description

- [x] don't show in an operation overlay the actual value in case of UserSessionStrField
- [x] store ebrains_token as a user-session field, instead of UserPreference 
- [x] test with keycloak HBP

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ce1c5da05f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.