# Issue

**Title:** Fix PES learning with sliced post

## Description

**Motivation and context:**
@celiasmith was having issues doing learning on a connection in which the `post` was an `ObjView`. This was failed when using a weight-based solver because we used the full encoder matrix. This PR adds a test for that case, and fixes the builder to slice the encoder matrix when the post object is an `ObjView`.

One discussion point:

Currently, this slices the `post` by slicing into the `encoders` signal. However, in `builder/connections.py`, we have a `slice_signal` helper function that is required for advanced indexing. I seem to recall that we talked about disallowing advanced indexing for Nengo objects, but I think it is still possible. Are we allowing advanced indexes?

**How has this been tested?**
Added a unit test which fails without this PR.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `736a92ac6cc8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.