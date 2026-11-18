# Issue

**Title:** reformat tables in oneliners

## Description

A better fix for 

Doesnt give the error: 
```python
pip._vendor.tomli._parser.TOMLDecodeError: Can not mutate immutable namespace ('tool', 'portray', 'mkdocs', 'markdown_extensions') (at line 71, column 42)
```
when trying to `pip install -e .`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ba6f28602b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.