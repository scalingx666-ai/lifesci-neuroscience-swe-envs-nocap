# Issue

**Title:** Fix handling of op3 in dec_left_op_right

## Description

Closes none, but addresses a bug I identified while working on a decision tree. In nodes with three conditionals, the operator from the second conditional (op2) was being used in place of the third conditional's operator (op3).

Fortunately, the only decision tree impacted by this bug (i.e., the only one where op2 and op3 were different) is `demo_external_regressors_motion_task_models`, for the "Fits motion external regressors" (< vs >), "Fits CSF external regressors" (< vs >), and "Fits task" (just > vs >=) nodes.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Use `op3` where appropriate in `dec_left_op_right`.
- Compare left3, right3, and op3 against None instead of implicit boolean, which would be a problem for thresholds of 0, to match handling of first and second conditionals.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `010b44375a61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.