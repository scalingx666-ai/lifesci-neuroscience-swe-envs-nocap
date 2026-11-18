# Issue

**Title:** Collect preprocessed T2w image in collect_derivatives

## Description

. This adds a `t2w_preproc` query to the io_spec.json and an extra workaround for queries that start with `t2w_` in `collect_derivatives`. I don't think this is the most elegant solution, so I'm happy to switch to another approach if one makes sense.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf1df32119fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.