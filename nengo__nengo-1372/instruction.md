# Issue

**Title:** Disable default validation for some parameters

## Description

Some parameters rely on attributes of their parent object to perform the validation, so the validation cannot be performed until the attribute value is set on that object.  Previously, attempting to set the default value for one of these parameters (e.g. `net.config[nengo.Connection].transform = 2`) would result in an error (because it would try to perform the validation and fail).  This PR disables the validation for the defaults on those parameters.  Note that the validation will still be performed when the attribute is set on an object instance (e.g., `my_conn.transform = 2` or `self.transform = Default`).

Also adjusted some parameters that were set to non-optional with a value of None (or vice versa), which were revealed by the new test.

**How has this been tested?**
Added a new test, see `test_params.py:test_coerce_defaults`

**How long should this take to review?**
- Average (neither quick nor lengthy)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58af869c802c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.