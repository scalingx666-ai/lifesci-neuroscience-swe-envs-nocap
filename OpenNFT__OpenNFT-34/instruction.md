# Issue

**Title:** Modifications necessary to read dcm definition from protocol file

## Description

Hi all!
 
I incorporated the DCM definition process into the protocol JSON file, as we (SNS lab) are internally trying to minimize the number of experiment-specific files/scripts one needs to modify for each experiment. Here, 

* I incorporated the DCM definition into the protocol JSON file by adding a new key: `dcmdef`. This includes target and opposed model topology, options and ROI names. 
* created `parseDCMdef.m`, a function that extracts the DCM definition from the JSON file and returns the DCM fields
* Adapted `dcmPrep.m` to read from the protocol file and set the DCM definitions accordingly
* Adapted `dcmBegin.m` to dynamically depend on dcmPrep (no longer requiring manual modification)
* Made a minor change to `loadProtocolData.m` to remove the newly introduced JSON field from the `P` struct so as not to cause data type errors in python

In my tests, this version yielded the exact same feedback values as the default implementation. 

Perhaps this is something you might be interested in incorporating.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `253555108fcd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.