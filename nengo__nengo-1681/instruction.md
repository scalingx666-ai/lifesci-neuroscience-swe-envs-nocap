# Issue

**Title:** Remove duplicate output probeable in Neurons

## Description

**Motivation and context:**
When you look at `nengo.Ensemble(10, 1, add_to_container=False).neurons.probeable`, you get:

```
('output', 'input', 'output', 'voltage', 'refractory_time')
```

Why's that duplicate `'output'` in there? Seems to have been an oversight from this change: 036a0ce07b24ec247423ff6651c4222d5e2aba38

This PR fixes it:

```
>>> nengo.Ensemble(10, 1, add_to_container=False).neurons.probeable
('output', 'voltage', 'refractory_time', 'input')
```

Note that the order changes such that `'input'` is now at the end. That's so that `'output'` still appears first.

**How has this been tested?**
Verified in the console, but we still need to write tests for this.

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Where should a reviewer start?**
Implement a test.

**Types of changes:**

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [na] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e91d3484b2d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.