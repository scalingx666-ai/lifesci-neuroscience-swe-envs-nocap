# Issue

**Title:** enh: ft_electrodeplacement compatibility with newer matlab versions

## Description

Past versions of ft_electrodeplacement would use html-coded font color to indicate whether an electrode had been localized or not. However, newer versions (presumably 9.5 and up) no longer allow per-item coloring in listboxes. To make behavior more robust across matlab versions, this PR keeps the original html-based display where supported, but falls back to plain text status markers (`○` / `●`) when HTML rendering is unreliable.

I also made additional small GUI layout adjustments to improve the placement of the listbox.

Original: 
![](https://www.fieldtriptoolbox.org/assets/img/tutorial/human_ecog/figure2.png)

Bug:
<img width="254" height="333" alt="Screenshot 2026-05-31 at 10 28 38 PM" src="https://github.com/user-attachments/assets/0f5e2c5f-9153-48cb-904c-a41e3f19b408" />

Fixed using status markers:
<img width="1105" height="695" alt="Screenshot 2026-05-31 at 10 27 09 PM" src="https://github.com/user-attachments/assets/e2103227-5369-4066-bd38-1454170ce175" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `704c85f4da64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.