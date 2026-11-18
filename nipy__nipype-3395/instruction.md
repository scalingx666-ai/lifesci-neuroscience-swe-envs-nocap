# Issue

**Title:** FIX: Improve error handling of ``CommandLine`` interfaces

## Description

Currently, errors arising from interpolating the command line of these interfaces is handled poorly at the ``Node`` level.
If the command line cannot be built, the error is printed in the logfile but the exception is caught and never raised (i.e., likely leading to an infinite loop as the execution is not stopped).

I have experienced that while debugging fMRIPrep. To learn which of the inputs of a faulty interface derived from
``CommandLine`` was not being formatted, I had to also add the error annotation proposed for the ``_parse_inputs`` inner loop.

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eab4b2a966ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.