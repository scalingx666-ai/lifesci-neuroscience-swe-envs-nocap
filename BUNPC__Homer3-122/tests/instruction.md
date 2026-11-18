# Issue

**Title:** v1.35.4 - -- Fix SNIRF file probe - which does not have 2D optodes - not loading correctly because 3D-to-2D default projection was not being called due to incorrect condition check.

## Description

-- Fix SNIRF file probe - which does not have 2D optodes - not loading correctly because 3D-to-2D default projection was not being called due to incorrect condition check.
-- Remove fsolve warnings and print statements from project_3D_to_2D.
-- MainGUI No Sessions view not selcting correct current element when selecting from Group level to Run level in data tree listbox display.
-- Fix issue in StimEditGUI with a dataset that has NO stims or conditions at all and where a) selecting Syncronize Browsing menu option b) switch to another run in MainGUI which atriggers StimEditGUI Update function to display the newly selcted run c) set stim causes error. Fix by adding call to current element Load() method to load the acquired data. This needs to when using distributed storage scheme for DataTree which is the default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6405dbc5d551`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.