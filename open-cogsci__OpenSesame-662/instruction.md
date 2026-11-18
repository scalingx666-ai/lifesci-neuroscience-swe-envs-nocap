# Issue

**Title:** Enable scaling on HiDPI displays

## Description

This simple fix should cause OpenSesame to play well with HiDPI displays. Especially in setups with multiple monitors that each have different DPI, OpenSesame can behave funky when being dragged from one screen to another, causing it to display everything too large or too small. The example below is when I dragged OpenSesame from a HiDPI (4k) to lower dpi (Full HD) screen; everything became quite large.

![OSScreenshot](https://user-images.githubusercontent.com/689044/57067497-7f394300-6ccf-11e9-8c0f-8f0008c60311.png)

Qt has built in functions to incorporate for this, thereby becoming 'dpi aware', but you need to explicitly activate this, and we never did so.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8d0bcee7873`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.