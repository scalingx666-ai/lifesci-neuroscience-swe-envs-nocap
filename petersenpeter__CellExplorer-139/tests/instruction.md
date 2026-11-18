# Issue

**Title:** Fix gui_MonoSyn control positioning on MATLAB R2025a+

## Description

The controls in gui_MonoSyn overlap the plotting area in newer MATLAB versions. In MATLAB R2025a and newer, changes to the default figure sizing expose the original pixel-based positioning assumption, causing the controls to overlap the plotting area.

This patch instead specifies the controls directly using normalized coordinates so that the navigation buttons, connection-type menu, checkbox, and title remain positioned along the top of the figure. The change only affects GUI layout and does not modify connection detection or manual curation behavior.

Tested on:
* MATLAB R2025a, R2025b, and R2023b on Windows 11

**Before (MATLAB R2025b):** GUI controls overlap the plotting area after the figure is maximized.
<img width="1429" height="847" alt="image" src="https://github.com/user-attachments/assets/486f0efc-8159-48ac-b109-87d1a00fb7b7" />
**After patch:** Controls remain aligned along the top of the figure.
<img width="1426" height="856" alt="image" src="https://github.com/user-attachments/assets/19180fe6-b927-4caf-a73b-291ed362f604" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76beccb175fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.