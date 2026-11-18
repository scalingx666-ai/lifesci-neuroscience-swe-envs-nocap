# Issue

**Title:** fmrinoise script: /bin/sh instead of /usr/bin/sh

## Description

- Change the #! of the fmridenoise script to /bin/sh
- I was just supporting a user who was running on an OS without
  /usr/bin/sh, a university machine that doesn't yet link /bin/ to
  /usr/bin.
- I think that /bin/sh should be the canonical location according to
  the relevant standards, and this should also work on newer systems
  where /bin is linked to /usr/bin.
- My other idea was `/usr/bin/env sh` but that seems like needless
  indirection.

To review:
- Is this package used on any other weird platforms that I don't know about, or other reasons why /usr/bin is needed?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42f38f638642`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.