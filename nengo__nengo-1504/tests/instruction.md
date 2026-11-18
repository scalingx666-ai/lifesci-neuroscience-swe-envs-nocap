# Issue

**Title:** Skip unsupported tests instead of xfail

## Description

When a simulator does not support a test, skip it instead of
xfailing. This does not actually change how the test is run,
because the way we were using xfail it would not actually
execute the test, so skip will do the same. Now tests will
be marked as skipped in the log, to differentiate them from
tests that are marked xfail and run (which could potentially xpass).

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

When nengo_loihi is working with nengo master again, I will test it there.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- n/a I have updated the documentation accordingly.
- n/a I have included a changelog entry.
- n/a I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

**Still to do:**
<!--- If this is a work in progress, note below what you still plan to do. -->
<!--- Use the task list syntax `- [ ]` so that progress can be tracked. -->
- [x] test with nengo_loihi

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `954368d9cdb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.