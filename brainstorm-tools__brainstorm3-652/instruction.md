# Issue

**Title:** Update connectivity

## Description

Four updates in connectivity functions:

1. Return to simpler Comment in Pipeline editor for coherence processes
2. Remove formulae from coherence processes GUI
3. Add time-resolution option correlation processes (1xN, NxN and AxB)
4. Update FigureName in Graph figures
5. Move name of connectivity metric from Colorbar to figure Title for Image and Graphs representations

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/ec0669f4-f80d-4b77-87cb-fca5fae782e0)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4186fccddb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.