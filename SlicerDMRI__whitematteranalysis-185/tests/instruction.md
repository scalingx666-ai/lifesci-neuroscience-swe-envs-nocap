# Issue

**Title:** ENH: Install package using `pip` in GHA workflow

## Description

Install package using `pip` in GHA workflow following the recommended way for package installation.

Prefer:
```
$ pip install -e .
```

over
```
python setup.py install
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f60ae4b623c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.