# Issue

**Title:** MAINT: Validate docs

## Description

I shouldn't have to make the comment  , let's have CIs do it :smile: 

We did have some incorrect orders, a missing param, mis-rendered parameters (due to them being `acquisition: ` instead of `acquisition : ` for example), mis-ordered sections. Nothing really new added here other than the missing description for `tracking_system` (which I got wrong previously, it's for motion tracking :facepalm: ).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a83fb2fde83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.