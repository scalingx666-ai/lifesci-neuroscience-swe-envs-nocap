# Issue

**Title:** ENH: Update PETsurfer interface

## Description

## Summary
This PR updates the PETsurfer interface in nipype to be in line with the FreeSurfer implementation and closes issue 

## List of changes proposed in this PR (pull-request)
1. Update description of GTMPVC interface (before it was a duplicate of the GTMSEG interface)
2. Add extra outputs to the GTMPVC interface
3. Update kinetic modeling naming schemes to be in line with actual implementation. MRTM has been updated to MRTM1 as this definition is more correct (also the flag used in FreeSurfer). Furthermore, LoganRef has been renamed to Logan, as it is the Logan modeling (https://www.pmod.com/files/download/v31/doc/pkin/2329.htm) and NOT the Logan reference modeling (https://doc.pmod.com/pkin/pmclass_lib_pmkin_models_pklogannoninvasivev2.html) that is currently implemented in FreeSurfer.
4. Two extra PET-specific arguments (bp-clip-neg and bp-clip-max) have been added to the mri_glmfit interface. These have been a part of FreeSurfer since v. 7.2.0

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2f4953f964c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.