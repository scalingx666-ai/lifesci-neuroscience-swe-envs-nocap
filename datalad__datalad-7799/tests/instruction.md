# Issue

**Title:** BF: Ensure annex-ignore config is immediately written for RIA stores

## Description

The test_ria_postclone_noannex was failing because git-annex was auto-initializing the remote bare repository during clone, creating an annex/ directory that shouldn't exist in RIA stores.

The issue was that ds.config.set() might not immediately flush the config to disk, so git-annex couldn't see the annex-ignore setting when it auto-initialized remotes during "git annex init".

Fix by using git config directly to ensure the setting is written to .git/config immediately before git-annex-init runs.

-  regression with newer git-annex versions.

from @yarikoptic: fix investigated/done by claude code. not 100% sure it is right. But hope is that should eliminate this sporadic fails on our testing of git-annex builds (of `FAILED ../datalad/core/distributed/tests/test_clone.py::test_ria_postclone_noannex - assert not True`) so if tests pass I merge and see how it goes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31876745ae37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.