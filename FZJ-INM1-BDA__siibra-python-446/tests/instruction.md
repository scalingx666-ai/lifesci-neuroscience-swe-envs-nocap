# Issue

**Title:** Labelled maps with multiple volumes can be fetched wo args as a joint volume

## Description

The following code snippet raised `InsufficientArgumentException` previously. This PR allows fetching such maps when no argument has been provided in `fetch`.
```python
import siibra
mp = siibra.get_map(parcellation='julich 2.9', space='bigbrain')
img = mp.fetch()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `019ee2128937`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.