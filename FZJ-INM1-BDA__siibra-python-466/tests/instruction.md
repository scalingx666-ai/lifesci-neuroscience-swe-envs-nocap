# Issue

**Title:** Connectivity as compound feature

## Description

(This PR builds on top of )
```python
import siibra
fts = siibra.features.get(siibra.parcellations['julich 2.9'], 'connectivity')
for f in fts:
    print(f.name)
print(fts[0][0].data.head())  # 0th subject
print(fts[0].data.head())  # average
```
Also to try:
```python
fts[0].plot()  # mean
fts[0].plot(7)  # 7th matrix key
```
```python
fts[0].plot(region=fts[0][0].regions[:20], logscale=True, backend='plotly')  # selected regions as matrix. Can use nilearn as backend to pass `reorder` kwarg.
```
```python
fts[0].plot(region=fts[0][0].regions[0], backend='plotly')  # profile
```
TODO:
- [x] choose a new matrix key property besides from `subjects` (perhaps `matrix_key`). This will enable us to digest F-Tract data with minimal effort.
- [x] Then, clean or replace the references to `subject` and `subjects`
- [x] carry the same logic to regional timeseries features like bold
- [x] Update examples
    - [x] Figure out a way to plot average matrix from compound feature

PS: This will allow the digestion of connectivity features as the other features in siibra-explorer, eliminating the need for handling specially. (caveat: the click and travel mechanism won't work.) (colors should be available from plotly json but not sure it is easy for explorer to use)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68c0c30cb336`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.