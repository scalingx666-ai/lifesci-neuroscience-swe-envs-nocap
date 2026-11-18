# Issue

**Title:** Get resampled template of a map instance

## Description

```python
import siibra
mp = siibra.maps.COLIN27_JBA29_LABELLED
mp_img = mp.fetch()
print(mp_img.shape)

template = siibra.spaces['colin27'].get_template().fetch()
print(template.shape)

resamp_template = mp.get_resampled_template()
print(resamp_template.shape)
```
Out:
```
(256, 256, 256)
(181, 217, 181)
(256, 256, 256)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4989012916f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.