# Issue

**Title:** Add edgelist converter

## Description

`dotmotif.ingest.EdgelistConverter` now supports importing from a dask or pandas dataframe edgelist in addition to files on disk.

```python
from dotmotif.ingest import EdgelistConverter

EdgelistConverter(
    my_dataframe,
    source_column, target_column
).to_graph()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f67a81b97b9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.