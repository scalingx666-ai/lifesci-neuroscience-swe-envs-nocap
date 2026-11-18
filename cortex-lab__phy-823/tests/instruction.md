# Issue

**Title:** Calls to exists, load_json, save_json parse Path objects to str

## Description

In Windows, `op.exists`, `_ensure_dir_exists`, `_load_json` and `save_json` can fail since `WindowsPath` are not handled by os. 

I just addeed a parse into `str` to the pathlib object when tose functions are called. This solves our problems in running phy on windows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6ee09071087`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.