# Issue

**Title:** rewrite model test to unittest

## Description

so now you can run individual test as
```bash
python tests/test_models.py
```
or when having multiple tests you can just
```bash
pytest tests
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d503314faffc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.