# Issue

**Title:** Process: verify that folder exist before using `cd`

## Description

This is a minor fix.  I had the error after deleting a plugin manually (without going from the brainstorm interface): 

``` 
BST> Invalid Plug-in function: "/Users/edelaire1/.brainstorm/plugins/brainentropy/best-brainstorm-master/processes/process_inverse_mem.m"
     Unable to open file
Error using cd
Unable to change current folder to '/Users/edelaire1/.brainstorm/plugins/nirs-dpf' (Name is
nonexistent or not a folder).

Error in panel_process_select>ParseProcessFolder (line 3067)
            cd(curDir);

Error in panel_process_select (line 32)
eval(macro_method);

Error in bst_startup (line 496)
panel_process_select('ParseProcessFolder', 1);

Error in brainstorm (line 134)
        bst_startup(BrainstormHomeDir, 1, BrainstormDbDir, TemplateName);
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ca877612ecb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.