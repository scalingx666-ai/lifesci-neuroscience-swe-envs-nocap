# Issue

**Title:** Move build notice of compiler type to stdout from stderr.

## Description

Hi,

When BrainFlow is a dependency to another project these messages in stderr can trigger undesired effects.

Right now, the messages are more of an annoyance when using colcon and building many projects.

If it is important that they be printed to stderr, then a CMake cache variable could be used to toggle them. Let me know if they are printed to stderr for a specific reason and I can come up with another solution.

Cheers,
Al

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eaaea228cfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.