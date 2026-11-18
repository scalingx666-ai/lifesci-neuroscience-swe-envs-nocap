# Issue

**Title:** Added smoke CLI test for suite2p command

## Description

PR addresses #473:

- Added smoke test for general `suite2p` command. There were problems with using `os.system` as suite2p hangs indefinitely (since it closes when GUI is closed) and prevents the running of our other tests. Unlike `os.system`, `subprocess.Popen` doesn't block and can be terminated by the developer. The sleep(10) was just set so there's enough time for the suite2p window to open up.  
- CLI version output tests have been added

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5932a648f76e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.