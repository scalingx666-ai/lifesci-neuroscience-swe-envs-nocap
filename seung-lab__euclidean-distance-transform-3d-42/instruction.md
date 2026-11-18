# Issue

**Title:** feat: edt.each — extract individual dts rapidly

## Description

Extracts individual dts rapidly from a dense multi-label distance transform. 

```python
for label, dt in edt.each(labels, dts, in_place=False):
   pass
```

This concept is based on the version in cc3d, but is not an exact duplicate because edt requires transferring the dt based on a label volume (i.e. it needs two inputs instead of one).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f897d10a8c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.