# Issue

**Title:** [bugfix] panel_ieeg: reading coordinates must always happen from MRI Viewer

## Description

Steps:

1. Right click on CT in anatomy and do SEEG/ECOG Implantation
2. Panel iEEG opens up. Click **+**  to create a new electrode. Give a name and press **OK**. If the current active window is 3D Viz then the error below occurs:
![Screenshot 2024-03-25 152829](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/1b5cccbf-0181-4aca-a2ad-83e52b692ca6)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47fc9e62ff6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.