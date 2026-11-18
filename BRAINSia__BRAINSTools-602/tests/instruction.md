# Issue

**Title:** COMP: Use itksys::SystemTools::FindProgram in BRAINSConstellationDetector

## Description

`itksys::SystemTools::FindProgramPath` was removed from the bundled KWSys. `FindProgram` returns the resolved program path directly (empty when not found), so the obsolete `errorMsg` out-parameter is dropped.

<details>
<summary>Validation</summary>

Compiles and links in a full BRAINSTools SuperBuild against current ITK (Linux/GCC 14); `BRAINSConstellationDetector` builds and reports version 5.8.0.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6595e24e5225`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.