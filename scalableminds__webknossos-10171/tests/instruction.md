# Issue

**Title:** Insert worker in initialData if jobsEnabled

## Description

- A worker is now inserted in the database on startup for the dev setup if features.jobsEnabled=true
 - This means that a `application.local.conf` with features.jobsEnabled=true is now enough to enable jobs locally for the dev setup. no need for `yarn enable-jobs`.
 - This will hopefully reduce the number of erroneously checked-in application.confs during development.
 - If this is accepted by all our devs we may reduce the dbtool enable-jobs after some grace period.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87db9e1b8470`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.