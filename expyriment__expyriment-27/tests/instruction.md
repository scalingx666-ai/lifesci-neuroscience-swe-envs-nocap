# Issue

**Title:** Trim textline

## Description

Hi Florian,

I guess trimming of too long text lines and word ins text boxes is a nice feature that also makes it easy to handle the recent bug in Android text_menu. Timing happens only if a width is defined. Thus, it occurs automatically for Textbox (but can be switch off) and for text_line, if a width is defined.
Please approve and merge.

Oliver

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79f4de71d81b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.