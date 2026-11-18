# Issue

**Title:** Manage multiple clusterings

## Description

``` python
session.model.add_clustering(name, spike_clusters)
session.model.rename_clustering(old_name, new_name)
session.model.copy_clustering(name, new_name)
session.model.delete_clustering(name)
```
-
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81da5161983a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.