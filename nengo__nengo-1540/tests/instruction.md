# Issue

**Title:** Solver documentation fixup

## Description

**Motivation and context:**
Fixes changelog and improves documentation of base solver class (confused me while I was looking into ).

**Interactions with other PRs:**
None

**How has this been tested?**
N/A

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**
- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [N/A] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

**Todo:**
 - [x] I think the solver docstring can be improved. In particular, `non-compositional` solvers don't necessarily work with neuron-to-neuron weight matrices if `weights=False`? This docstring makes the case sound different: https://github.com/nengo/nengo/blob/18c13fb417748630c9f07d329031de59b7d8353a/nengo/solvers.py#L21-L26

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d91c95f05fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.