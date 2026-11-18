# Issue

**Title:** Resolve datetime library warnings

## Description

# PR Summary
This small PR resolves the `datetime` library warnings:
```python
/home/runner/work/datalad/datalad/_datalad_build_support/formatters.py:39: DeprecationWarning: datetime.datetime.utcfromtimestamp() is deprecated and scheduled for removal in a future version. Use timezone-aware objects to represent datetimes in UTC: datetime.datetime.fromtimestamp(timestamp, datetime.UTC).
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f69bfd6b8391`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.