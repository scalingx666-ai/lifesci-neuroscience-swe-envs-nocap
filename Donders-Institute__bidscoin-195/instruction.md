# Issue

**Title:** Add dynamic run index <<>> option

## Description

## Feature request: dynamic run index naming

Hello,

I would like to suggest a small extension to the way how dynamic run indexes are handled. Right now, with option run `<<1>>`, each filename will get `run` keyval, even when it doesn’t need it when no more runs are present. It would be amazing if there was an option to automatically increment run index while not to include it in the filename if it is not needed, as that pollutes a bit the filenames.

I suggest a solution which preserves the original behavior for dynamic `<<1>>` run index, but for `<<>>` empty run index files are named without `run` keyval. Only when file with the same name is found, bidscoin adds `run-2` index to its filename and retrospectively adds `run-1` to the corresponding other file with which it has matched. Next found run gets `run-3`, `run-4` etc.

What do you think about the solution?
I might have missed some errors this could introduce, although I tested the results.

As an alternative approach, I've been thinking about making a script that would run after bidscoin, renaming the files. But that would also mean all references to the files would need to be renamed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e55898274fd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.