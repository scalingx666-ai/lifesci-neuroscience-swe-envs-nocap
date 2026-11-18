# Issue

**Title:** FIX: cat12 - fix cobra/hammers field swap, add missing atlases and WMHstr parameter

## Description

- Fix swapped field paths for cobra and hammers ROI atlases: cobra was pointing to 'output.ROImenu.atlases.hammers' and vice versa
- Add 9 new atlas inputs present in current CAT12 but missing from the interface: ibsr, aal3, mori, anatomy3, julichbrain3, thalamus, thalamic_nuclei, suit (all default False as they require optional atlas files to be installed)
- Add wm_hyper_intensity_correction_strength (extopts.WMHCstr, default 0.5) to control the strength of WMH reclassification when WMHC is 1 or 2

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8d71305b7c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.