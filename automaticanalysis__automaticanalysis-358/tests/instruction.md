# Issue

**Title:** Use WSL bash for FSL commands if available

## Description

All directories and files which are generated from MATLAB on Windows using AA need to be converted to a WSL compatible version of them before they are run by FSL. Due to this I implemented a function which can convert a Windows directory to it's WSL counterpart. Can you please review this function for me? I guess it may cause issues if the command contains ":" in it. Are there any FSL commands which may have that marker in it? 

A better approach could have been to use Regex, which I don't know very well, but I can check.

I made it so that the paths in the FSL command are converted, so hopefully it will only be directories in the command.

Additionally, at line 46 the second parameter of the export command is converted to WSL compatible version as people may put a windows path to their user parameter file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b332aaec0c06`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.