# Issue

**Title:** updated environment.yml so people can also install env with that

## Description

@rossant Welcome back!

I saw in the issues that some people were using the `environment.yml` file for install, so people don't use the yaml file with wrong versions I updated that.

In short I added all the dependencies you listed. Fixed the sklearn->scikit-learn and had it pull from git instead of pypi.

I just tested creating a conda env with 
`conda env create --file environment.yml`
and it worked fine on my computer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7245370ecd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.