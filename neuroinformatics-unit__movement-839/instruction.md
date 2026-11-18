# Issue

**Title:** Make `transforms.scale` require an explicit `factor`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`movement.transforms.scale` currently provides a default value of `1.0` for the [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) argument. Calling [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22) without specifying a factor silently does nothing (multiplies by 1.0), which is almost certainly a user mistake. Making [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) required forces explicit, intentional usage.

**What does this PR do?**

- Removes the default value (`1.0`) from the [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) parameter in [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22), making it a required argument.
- Updates the docstring to remove mentions of "optional" and "Default is 1.0".
- Updates two existing test parametrizations (`"Do nothing"` and `"No scaling, add space_unit"`) to pass an explicit [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) value.
- Adds a new test [test_scale_requires_factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) confirming that a `TypeError` is raised when [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) is omitted.

## References



## How has this PR been tested?

- All 60 tests in [tests/test_unit/test_transforms.py](cci:7://file:///d:/SS/movement/tests/test_unit/test_transforms.py:0:0-0:0) and [tests/test_integration/test_netcdf.py](cci:7://file:///d:/SS/movement/tests/test_integration/test_netcdf.py:0:0-0:0) pass.
- New test [test_scale_requires_factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) verifies `TypeError` is raised when [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) is not provided.
- `pre-commit run --all-files` passes (ruff, mypy, codespell, etc.).
- Sphinx docs build verified — no new warnings introduced.

## Is this a breaking change?

Yes — any existing user code that calls [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22) without specifying [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29) will now raise a `TypeError`. However, since calling [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22) without a factor was a no-op (multiplying by 1.0), such calls were almost certainly unintentional, so this change improves correctness.

## Does this PR require an update to the documentation?

No. The docstring for [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22) has been updated in-place. No example files or doc pages call [scale()](cci:1://file:///d:/SS/movement/movement/transforms.py:13:0-117:22) without a [factor](cci:1://file:///d:/SS/movement/tests/test_unit/test_transforms.py:285:0-288:29), so no other documentation changes are needed.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0fbb2b31d1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.