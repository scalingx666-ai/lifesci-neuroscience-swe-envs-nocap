# Issue

**Title:** Don't show Welcome tab when error occurred.

## Description

Don't show *Welcome* tab when error occurred. This will make sure the *Error* tab is not 'overwritten/covered' by the *Welcome* tab. I think this is especially important in *One-tab mode* because one might get very confused when missing the "No module named SomeMissingPlugin" message. When the SomeMissingPlugin plugin isn't on their system.

Try opening the attached experiment (after changing .txt to .osexp) by double clicking it. Using opensesame_3.1.9-py2.7-win32-1.exe with the Welcome message still enabled and in One-tab mode

[Example.txt](https://github.com/smathot/OpenSesame/files/1299981/Example.txt)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61c02176df51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.