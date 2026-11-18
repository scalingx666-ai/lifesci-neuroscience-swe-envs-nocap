# Issue

**Title:** Custom user plugin [fix #574]

## Description

Hello, 

As discussed here:  , this allows the usage of custom plugins that are not officially supported in Brainstorm.  This can be used to share processes within a lab by having a common GitHub repository and having that repo as a custom plugin in Brainstorm.

This is done by defining the customs plugin in specific JSON files under the .brainstorm folder. Each json can contain one or multiple plugins (although one plugin per json might be better as recommended by Francois)  

Here is an example of plugins.json file with 2 plugin definition: 
[plugins.json](https://github.com/brainstorm-tools/brainstorm3/files/14289268/plugins.json)

Splitted into two files: 

[plugin_bids_matlab.json](https://github.com/brainstorm-tools/brainstorm3/files/14289410/plugin_bids_matlab.json)
[plugin_bst_users.json](https://github.com/brainstorm-tools/brainstorm3/files/14289411/plugin_bst_users.json)


The creation of the JSON file can be a bit tedious and prone to error but this is just the first PR to get feedback and we might improve the addition of a plugin in that json file later :)   As you suggested, made json file could easily be shared in the bst_plugin repo. 


Edouard

[Hs: i cant believe i posted that issue in 2022] 

TODOs
- [x] Update plugin menu without restarting Brainstorm
- [x] Add user-defined plugins with URL
- [x] Add user-defined plugins with file
- [x] Add user-defined plugins manually (user input)
- [x] Remove user-defined plugins
- [x] Tests with archiving
- [x] Tests with deploy
- [x] Documentation

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5778a5e8281b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.