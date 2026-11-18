# Issue

**Title:** test: Generate derivative datasets to test workflow construction with precomputed derivatives

## Description

This is a parallel to nipreps/smriprep#586, intended to go in before #3687. I want to shore up the testing and increase coverage before making a big refactor.

There are three non-test changes:

1) Wrapping `collect_derivatives()` with `collect_func_derivatives()` and `collect_fieldmaps()` with `collect_fmap_derivatives()`. As in smriprep, these handle merging multiple derivative datasets and the vagaries of the specific collector they call. These functions will survive the transition to nipreps.
2) Using the wrappers from (1) and niperps/smriprep#586 in `init_single_subject_wf`.
3) A fix for subject- or session-level registration when all derivatives are found. If there is nothing to do, `inputnode` doesn't get added to the newly created workflow, and a connect fails. This was discovered by one of the tests.

The following tests/testing utilities are added/modified:

* Skeleton generation using a derivative YAML file. sMRIPrep already had one to update, I introduce it here.
* Unit tests for (1), above.
* `workflows.bold.tests.test_fit.test_bold_fit_precomputes` now uses the skeleton to generate derivatives, and follows the (empty, full, one, and all-but-one) derivatives pattern that we used in sMRIPrep, which would cover all but the most baroque conditional logic.
* `workflows.tests.test_base.test_reuse_precomputed_coreg` builds workflows for all run levels with and without transforms and boldrefs, catching (2) above.
* `workflows.tests.test_base` gains tests to call `init_single_subject_wf()` with two input derivatives and precomputed fieldmaps.

A couple xfails were added that will either be fixed by switching to nipost or aren't worth fixing prior to the fix.

Possibly some of this test infrastructure also makes sense to move to nipost, but that would be putting the cart before the horse.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `651103a134d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.