# Issue

**Title:** Fix release publish

## Description

I think I screwed up the conditional for publishing releases. I think its supposed to be like this. Basing it off of https://github.com/scientific-python/cookie/blob/c7b897cf4f2f4d8f374d112d1fc694d92a2793a7/%7B%7Bcookiecutter.project_name%7D%7D/.github/workflows/%7B%25%20if%20cookiecutter.__type%3D%3D'compiled'%20%25%7Dcd.yml%7B%25%20endif%20%25%7D#L67

This should allow it to be triggered by clicking creating a new release through the github page.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8837c18d84e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.