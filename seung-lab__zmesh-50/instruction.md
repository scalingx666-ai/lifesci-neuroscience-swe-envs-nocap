# Issue

**Title:** feat: add fqmr algorithm and fast obj reading

## Description

Adds a memory optimized version of the pyfqmr algorithm. We dropped double precision, texture maps, and materials while increasing precision from int to uint32_t.

```python
simplified_mesh = zmesh.simplify_fqmr(mesh)
```

`Mesh.load` is also significantly faster. It can also handle `.gz` extensions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eb057a79c5c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.