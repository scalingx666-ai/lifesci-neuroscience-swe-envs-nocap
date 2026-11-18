# Issue

**Title:** Coregistration GUI modernisation (phase 4)

## Description

#### Reference issue (if any)

following  and phase 4 of 


#### What does this implement/fix?

- Icons on coreg GUI dock buttons, reusing mne.viz.Brain's existing icon set
- some text fixes
- Color-coded fit-quality badge
- mm to/from cm display-unit toggle
- Colorblind-safe color pair 

#### Additional information

I implemented and Claude opus 5 reviewed the changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `277fd531bb1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.