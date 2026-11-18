# Issue

**Title:** Add SpikingRectifiedLinear to cache whitelist

## Description

Previously ensembles with this neuron type would not have its decoders cached.

**Motivation and context:**
.

**How has this been tested?**
Added a unit test for this isolated incident as a short-term solution.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [N/A] I have updated the documentation accordingly.
- [N/A] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35db7e6861a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.