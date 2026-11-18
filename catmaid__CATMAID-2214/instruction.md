# Issue

**Title:** Dependency handling with setuptools

## Description

In short, this turns

```sh
pip install \
  -r django/requirements.txt \
  -r django/requirements-async.txt \
  -r django/requirements-dev.txt \
  -r django/requirements-doc.txt \
  -r django/requirements-optional.txt \
  -r django/requirements-production.txt \
  -r django/requirements-test.txt
```

into

```sh
pip install ./django[asynch,dev,doc,optional,production,test]
```

The requirements files themselves are unchanged. Note that the async extra is called "asynch", so that it doesn't collide with the `async` keyword.

Originally this was going to have a slightly broader scope, A) adding `manage.py` to the PATH so it can be called from anywhere, and B) installing all of CATMAID's packages as well, but both seem to be incompatible with how django handles settings.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23bfe159feb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.