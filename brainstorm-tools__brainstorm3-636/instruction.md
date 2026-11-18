# Issue

**Title:** add function to get brain entropy version

## Description

This adds the function to read the VERSION.txt file to get the version number of the toolbox (added here: )

When looking at the installed plugin, shouldn't this number appear instead of 'Github-master' ?
edit: Done here 

![Screenshot from 2023-08-09 13-45-46](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/59e8bca6-34a5-4cf4-bc43-71db15f8b544)

The following code 
```
>> PluginDescription  = bst_plugin('GetInstalled', 'brainentropy');
>> PluginDescription.GetVersionFcn()
```

return

    '2.7.3'


Note: this is ready for review :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `513e17a11761`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.