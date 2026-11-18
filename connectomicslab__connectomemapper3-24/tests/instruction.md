# Issue

**Title:** Version release v3.0.0-beta-20200206

## Description

Fix an error when executing the Nipype interface to AFNI 3DBandPass on HCP fmri preprocessed data.

 **Error**
HCP fmri preprocessed data lies in MNI space. 
Consequently 3DBandPass outputs are in talairach space and generates automatically output with suffix and extension +tlrc.BRIK.
However, the Nipype interface looks for outputs with suffix and extension +orig.BRIK for successful execution raising the error

**Solution**
As a first hot fix, an in-house interface to 3DBandPass is implemented, where we overload the _list_outputs() function to look for either +orig.BRIK or +tlrc.BRIK output files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7af46620adcd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.