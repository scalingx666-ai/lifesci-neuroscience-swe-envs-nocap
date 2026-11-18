# Issue

**Title:** sonarcloud issue : scanf("%s", buf) buf can overflow

## Description

Fix two sonarcloud issues noticed for #3605

"scanf()" and "fscanf()" format strings should specify a field width for the "%s" string placeholder
High
2 opened on Oct 2, 2023 • Detected by SonarCloud in src/ivoc/ocfile.cpp :120

"scanf()" and "fscanf()" format strings should specify a field width for the "%s" string placeholder
High
1 opened on Oct 2, 2023 • Detected by SonarCloud in src/oc/fileio.cpp :354
master

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c4ab95b7de9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.