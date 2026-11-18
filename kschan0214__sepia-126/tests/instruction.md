# Issue

**Title:** Two pass masking, reworked mask refinement structure

## Description

Hi Kwok,

Updated the two-pass masking to allow for various mask refinement strategies.

remaining todo's:

update QsmIOWrapper to also use the new two-pass masking code
figure out sensible defaults
double check that the two pass masking is providing the desired results.

Best,

Patrick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `115a18c31da4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.