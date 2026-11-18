# Issue

**Title:** [ENH] Move PET DICOM correspondences into term definitions

## Description

.

This PR moves the `Corresponds to [DICOM Tag ...` section into `objects.metadata` terms for PET. This excludes terms like `InstitutionName`, which are recommended for many data types that are not converted from DICOM.

Minor cleanups here:

1) Remove a duplicate `BodyPart` entry. This was probably just an error in schematization.
2) For `InjectionStart` and `InjectionStop`, change "with respect to `"TimeZero"` in the default unit seconds." to "with respect to `"TimeZero"`, in seconds." BIDS does not support alternative units, so we can use simple language here.
3) Added "Note that this is distinct from any radiotracer or contrast agent used in the scan protocol." to `PharmaceuticalName`. While worth pointing out, it doesn't need to be pointed out multiple times, and it seems reasonable to include this in the term definition itself.
4) Some DICOM notices were removed from `rules.sidecars.pet` without adding to `objects.metadata` because they were already present in the `objects.metadata` term.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `308395fc0176`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.