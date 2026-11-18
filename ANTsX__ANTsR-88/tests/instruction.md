# Issue

**Title:** Enabling clonediskfiles in save.ANTsR

## Description

# clonediskfiles enables saving ANTsR sessions including the files that are on disk, but to which vectors of filenames point to (i.e., antsRegistration()$fwdtransforms). This allows a complete re-instantiation of the workspace on another computer, and the potential for saved sessions to be shared between collaborators without worrying about copying the files separately. It also allows finally saving and reloading antsRegistration() outputs in full.

A fix will be needed if people start to use this feature to work on the same session folder by loading and saving. Currently the folder is wiped before saving the new session, which will cause the disk files to be deleted before being copied. This will need a fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd5099e4bb7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.