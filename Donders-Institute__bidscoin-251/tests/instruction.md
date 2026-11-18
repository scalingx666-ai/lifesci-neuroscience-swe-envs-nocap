# Issue

**Title:** Make Marcel whole again for   git shortlog -sn

## Description

With this file you would get

    ❯ git shortlog -sn
      3802  Marcel Zwiers
       212  Rutger van Deelen
        23  Anthony Galassi
        22  Dominika Zemanovicova
         6  Stefano Moia
         ...

instead of current

    ❯ git shortlog -sn
      2907  MarsMellow
       495  Marcel Zwiers
       400  marcelzwiers
       212  Rutger van Deelen
        23  Anthony Galassi
        22  Dominika Zemanovicova
        ...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab90a17cc2cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.