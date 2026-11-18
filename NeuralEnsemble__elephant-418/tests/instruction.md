# Issue

**Title:** Changed __repr__ in BinnedSpikeTrain to support quantities<0.12.4

## Description

The unit test for method `__repr__` in `conversion.BinnedSpikeTrain` fails if `quantities` is `0.12.3` or below.

The old method was using `Quantity` scalars inside an f-string. This required the `__format__` method implemented in `quantities==0.12.4` to generate the correct string representation of `BinnedSpikeTrain` with magnitudes and units.

This PR changes the string generation by casting the `Quantity` scalars to string, which uses the `__str__` method in `Quantity` and displays the magnitudes and units as expected. This does not rely on any formatting method and thereby it is compatible with older versions of `quantities`.

This addresses issue #409.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `165276fe2617`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.