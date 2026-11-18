# Issue

**Title:** feat: add option for closed meshes on the dataset boundaries

## Description

```python
mesher.mesh(data, close=True)
```

This was produced using igneous, but is the same effect produced by a different code path:

<img width="632" alt="image" src="https://user-images.githubusercontent.com/2517065/151612600-d8adb5b9-3b57-48b5-a9c4-2cb72ef2d723.png">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e4e5c18d99a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.