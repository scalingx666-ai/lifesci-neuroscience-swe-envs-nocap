# Issue

**Title:** Fix `test_export_html` and run it on CI

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The previously `pytest.mark.local` test `test_export_html.py` was failing locally.

**What does this PR do?**
* Makes `test_export_html.py` pass locally and now also on the CI system, achieved by:
   * I had a visual look at the created `test.html` file and it looks as I would expect it (below).
   * updated calls to vedo
   * the decision that the `export` function should not affect the current camera, and therefore removing a line from `export()`.
* Minor refactor of the test so it's more modular

![image](https://github.com/brainglobe/brainrender/assets/10500965/4742b44b-ccfc-4005-b915-ac1e6b82dc4d)

## References

 

## How has this PR been tested?

CI passes with new non-local test. Note there was a presumably spurious crash [on the Windows CI at one commit here](https://github.com/brainglobe/brainrender/actions/runs/6878493665/job/18708343153).

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [NA] Tests have been added to cover all new functionality (unit & integration)
- [NA] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49817bd3bc65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.