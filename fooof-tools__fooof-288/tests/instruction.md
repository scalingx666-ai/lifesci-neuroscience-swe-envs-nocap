# Issue

**Title:** [ENH] - Add `interpolate_spectra` function

## Description

This is a minor update that adds a convenience function, `interpolate_spectra`, that can be directly applied to interpolate away frequency regions across a group of power spectra.

To do so, it wraps `interpolate_spectrum` so it can be applied across an array of PSDs. 
This PR also includes a minor update to `docs_get_section` to assist in copying over information. 

Adding this was mentioned here:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8ed771263fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.