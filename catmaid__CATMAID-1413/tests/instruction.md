# Issue

**Title:** fix off by 1 error in user analytics default month

## Description

* getMonth() returns a month in the range 0-11 but date picker must be
  expecting 1-12 since the default is always a month off.
* see http://www.w3schools.com/jsref/jsref_getmonth.asp
* same deal with https://github.com/catmaid/CATMAID/blame/5ed4d560218afc62f6b3895b0cdeae984b467e49/django/applications/catmaid/templates/catmaid/userproficiency.html#L156-L160

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bf701df75b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.