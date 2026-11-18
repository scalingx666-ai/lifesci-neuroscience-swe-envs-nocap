# Issue

**Title:** FIX: Restore access to private attr Nifti1Extension._content

## Description

gh-1336 reused the private attribute ``ext._content`` to exclusively refer to the ``bytes`` representation of the extension contents. This neglected that subclasses might depend on this implementation detail.

Let's be nice to people and rename the attribute to ``_raw`` and provide a ``_content`` property that calls ``self.get_content()``.

Also adds a test to ensure that multiple accesses continue to work as expected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1712cb08fcb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.