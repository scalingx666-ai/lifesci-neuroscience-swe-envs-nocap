# Issue

**Title:** feat: add vertex based connected components

## Description

```
zmesh.connected_components(mesh)
```

Topologically, it's a bit sounder to do connected components using faces and edges. Should I do it now or later?

This algorithm seems to be quite a bit faster than what I was getting with trimesh + scipy, but also the results look better too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b844b3d2b9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.