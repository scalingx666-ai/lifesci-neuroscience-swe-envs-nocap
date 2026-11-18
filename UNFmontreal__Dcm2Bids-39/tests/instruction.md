# Issue

**Title:** updating anonymiser process - new version of pydeface

## Description

Fix for new version of pydeface, where "--outfile" flag is needed if one needs to indicate the outfile. Related to #38.

Potentially the existing solution is more flexible and users would simply need to wrap their anonymiser in a shell script that has the required outputs/inputs. In this case it would be good to improve documentation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1014be0d785`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.