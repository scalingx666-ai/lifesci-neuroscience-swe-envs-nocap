# Issue

**Title:** Add Motif class interface

## Description

a slightly more elegant way of doing the same things:

#### old

```python
from dotmotif import dotmotif

dotmotif(...).from_motif("A -> B")
```

#### new

```python
import dotmotif

dotmotif.Motif("A -> B", ...)
```

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fa31c9feafb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.