# Issue

**Title:** [INFRA] Replace npm-requirements hack with package.json

## Description

When we were young and didn't know anything about Javascript, we made an `npm-requirements.txt` for our Javascript utilities, following the lead of Python's `requirements.txt`, and then just hacked it to make it work.

Now we're sadder, wiser, and already tried this out in 

I added a dependabot config so the package lock can be updated. It should only be triggered once a month.

Also updated the uv lockfile while about it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c539c01ecee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.