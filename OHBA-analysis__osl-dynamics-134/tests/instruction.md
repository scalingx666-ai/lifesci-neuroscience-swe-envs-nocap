# Issue

**Title:** feat: add ability to plot asymmetric maps

## Description

`nilearn` automatically chooses symmetrical color ranges. This is problematic when dealing with surface maps for quantities which do not behave like power data. An example is lifetimes which could exist for example between 250 and 350ms.

Following changes:

```python
power.save(
    power_map=lifetimes,
    mask_file="mask_file_name",
    parcellation_file="parcellation_file_name",
    asymmetric_data=False,  # The default value
)  
```
<img src="https://user-images.githubusercontent.com/17300500/234920480-d6876b95-c0b6-4d48-af5d-0cdbf4e1339b.png" width=400>

```python
power.save(
    power_map=lifetimes,
    mask_file="mask_file_name",
    parcellation_file="parcellation_file_name",
    asymmetric_data=True,
)  
```
<img src="https://user-images.githubusercontent.com/17300500/234920340-368a0291-77d2-4559-a1ae-8c5fb7625022.png" width=400>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3dbd224aa760`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.