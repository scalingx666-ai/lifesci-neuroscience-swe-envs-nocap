# Issue

**Title:** Add/ants24x

## Description

ANTS 2.4.1 was released on 2022-08-23 and includes prebuilt binaries as ZIP files. This PR adds 2.4.1 as an option. 

The pre-built 2.4.1 binaries include both ./bin and ./lib64 folders. For consistency with 2.3.x binaries, I moved the ./bin/* files to the install_path. I wasn't sure if there was the ability to have a conditional ANTSPATH (e.g., /opt/ants-2.3.4 or /opt/ants-2.4.1/bin).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `942c7295eeda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.