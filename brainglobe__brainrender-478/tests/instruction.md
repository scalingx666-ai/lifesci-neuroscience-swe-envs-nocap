# Issue

**Title:** Bump vedo to >=2026.6.3 and drop the vtk<9.7.0 pin

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

vtk 9.7 broke the ruler (OBBTree IndexError), so vtk was pinned below 9.7.0. vedo 2026.6.3 handles this, so the pin is no longer needed.

**What does this PR do?**

Sets `vedo>=2026.6.3` and removes the `vtk<9.7.0` pin. Dependency change only, keeping vtk out of brainrender as suggested in the issue.

## References

## How has this PR been tested?

Ran `pytest tests/test_ruler.py` with vedo 2026.6.3 on vtk 9.7.0 and 9.7.1, passes on both. As a control, the old vedo 2025.5.4 on vtk 9.7 still fails with the same IndexError, so the bump is what fixes it.

## Is this a breaking change?

No, only raises the minimum vedo version.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3230767c28d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.