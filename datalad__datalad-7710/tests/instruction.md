# Issue

**Title:** chore: for github tests CI - py 3.13 matrix should also (as for 3.12) use most recent available git-annex

## Description

ATM 3.13 environment cannot install our old minimal git-annex version, try

    rm -rf /tmp/test-env*; src/datalad_installer.py -E /tmp/test-env.sh miniconda --batch --path /tmp/test-env -c conda-forge -e python=3.13 git-annex=8.20201007

and I now spotted that we did custom installation for 3.12 so I guess we are doomed to do that for 3.13 as well.  Verified that

    rm -rf /tmp/test-env*; src/datalad_installer.py -E /tmp/test-env.sh miniconda --batch --path /tmp/test-env -c conda-forge -e python=3.13 git-annex

worked

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dda7c0557d22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.