# Issue

**Title:** [bugfix] tess_isosurface, panel_ieeg

## Description

**ISSUES (tess_isosurface):**
1. In functional view, go to an **implantation node> SEEG/ECOG (with some channels)**
2. Double click to open 3D VIZ and MRI Viewer
3. Use **Thresh** slider to update iso surface 
     **Updated figure is generated in  a new 3D Viz.**
5. Add coordinates panel. Repeat step 3.
     **A bunch of errors pop up**

**SOLUTION:** 

**ISSUES (panel_ieeg):**
When trying to update view type between depth electrode and sphere, the update always occurs in MRI Viewer only. 

**SOLUTION:**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a32988e53758`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.