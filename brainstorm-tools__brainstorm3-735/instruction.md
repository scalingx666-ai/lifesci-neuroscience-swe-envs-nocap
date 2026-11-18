# Issue

**Title:** Improved handle opening Data, Results and Matrices with different time definition

## Description

Summary:

* Improved handle opening Data, Results and Matrices with different time definition.
  Allows user to unload the other files through a dialog window
  
* Bugfix: Correctly load montages when opening a new Data file and unloading other Data files

* Bugfix: Error handling in for opening Result files with diff time definition (See description of bug below)

---

Currently, if you open two files with different time definition, Brainstorm will show the nice error: 

```
***************************************************************************
** Error: Time definition for this file is not compatible with the other files
** already loaded in Brainstorm.
** Close existing windows before opening this file, or use the Navigator.
***************************************************************************
```

followed by a matlab error: 

```
***************************************************************************
** Error: Line 175:  isempty
** Not enough input arguments.
** 
** Call stack:
** >view_surface_data.m at 175
** >tree_callbacks.m at 293
** >bst_call.m at 28
** >panel_protocols.m>CreatePanel/protocolTreeClicked_Callback at 125
** >bst_call.m at 28
** >panel_protocols.m>@(h,ev)bst_call(@protocolTreeClicked_Callback,h,ev) at 75
** 
***************************************************************************
```

This PR ensure that view_surface_data doesn't continue if an error occurs during loading. Removing the matlab error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7bceedb6c96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.