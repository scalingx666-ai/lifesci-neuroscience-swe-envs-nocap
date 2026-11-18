# Issue

**Title:** fix structure paths in the australian mouse brain

## Description

addresses #963 
The issue was that this script merged several label volumes into one. this required renumbering the individual volumes to avoid overlaps. we forgot to also renumber the structure paths which lead to non-existent IDs in the ID paths. 

**Previously**
```python
In [15]: region_69 = atlas.structures[69]
    ...: print(region_69['name'], "->", region_69['structure_id_path'])
Lateral cerebellar nucleus -> [9999, 1002, 35]
```

**Now**
```python
In [13]: # Inspect region 69's path
    ...: region_69 = atlas.structures[69]
    ...: print(region_69['name'], "->", region_69['structure_id_path'])
    ...: # Lateral cerebellar nucleus -> [9999, 1002, 69]
Lateral cerebellar nucleus -> [9999, 1002, 69]
```
We also uncovered a seperate unrelated bug which was that the IDs were being written into a uint8 array but the larger ids were overflowing


**Previously**
```python
In [20]: atlas.annotation.max()
Out[20]: np.uint32(255)


```

**Now**
```python
In [18]: atlas.annotation.max()
Out[18]: np.uint32(262)

```

I have tested this fix in napari and am ready to upload the files to s3 once this is approved

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43ce9bf56dfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.