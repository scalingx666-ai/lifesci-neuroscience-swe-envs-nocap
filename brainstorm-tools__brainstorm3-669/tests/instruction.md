# Issue

**Title:** Expose update plugDesc function

## Description

Small update to expose a function to update the plugin.mat file of a plugin.

This is quite useful at developing plugins as it allows adding/removing processes without having to manually change the plugin.mat file.
 
For example, the two following lines can now be used to update the mat file for NIRSTORM: 

```matlab
PlugDesc = bst_plugin('GetInstalled', 'NIRSTORM');
% OR
% [isOk, errMsg, PlugDesc] = bst_plugin('Load', 'NIRSTORM');

[isOk, errMsg, PlugDesc] = bst_plugin('UpdateDescription', PlugDesc);
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a145a4fb743f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.