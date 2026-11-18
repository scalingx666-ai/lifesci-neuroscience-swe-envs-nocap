# Issue

**Title:** Increase intensity profile compounding speed

## Description

This PR increases the speed of combining anchors of Bigbrain intensity profiles significantly since the pairwise summing of point anchors scales linearly with the number of points. Potentially, there could be 170k points if one queries for the whole big brain template. This could take up to an hour with the current methods. This PR allows the implementation of a method special to such features to quickly produce a merged anchor.

```python
import siibra
fts = siibra.features.get(siibra.get_template('bigbrain'), siibra.features.cellular.BigBrainIntensityProfile)
```

Or simply
```python
import siibra
fts = siibra.features.get(siibra.get_region('julich 2.9', 'occipital cortex'), siibra.features.cellular.BigBrainIntensityProfile)
```
speeds up from 136.9s to 0.03s (on an i5-1145G7)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `760d10ba0bf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.