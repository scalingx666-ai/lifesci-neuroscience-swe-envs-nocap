# Issue

**Title:** fix: clone - do not run  'git annex init'   if there is .noannex file

## Description

ATM we would run annex init if there is any sign that repository has git-annex in it, e.g. if there is some git-annex branch etc. I think that more correct would be to avoid running annex init if cloned branch has .noannex since then annex init would simply fail.  But since situation is not fully kosher and there might be some cleanup to be done (e.g. removal of git-annex branch), we issue a warning like

  [WARNING] Dataset(/tmp/code_process2p_noannex) seems to know about git-annex, but has .noannex file present. We skip running 'git annex init'.

- Closes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32d27d736b0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.