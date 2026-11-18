# Issue

**Title:** Support of configuration for multi-installations

## Description

This PR adds support of configuration for multi-installations (#11).

Now the application settings will be store to INI-file in the unique settings folder like this:
```
c:\Users\espdev\AppData\Local\OpenNFT\OpenNFT\189fccf5-f0f6-0313-1022-106cdc949320\
```
Where `189fccf5-f0f6-0313-1022-106cdc949320` is unique UUID for app instance (app installation directory).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee817295642a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.