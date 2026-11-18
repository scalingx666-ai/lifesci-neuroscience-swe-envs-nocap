# Issue

**Title:** Merging very recent dev changes to main (mostly doc updates and new STP lesson)

## Description

Need to merge in prep for another nudge of ngc-learn pip to 1.2.1-beta -- these include a merge of some of the most recent doc edits/revisions, including newly written (and tested) short-term-plasticity lesson in the doc folder. 

Minor revisions on some minor touches to a few ngc-learn components, primarily adding in the "resist_scale" argument to the `RateCell` component class to improve its applicability for use in continuous ODE model of electrical current.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `84626197142e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.