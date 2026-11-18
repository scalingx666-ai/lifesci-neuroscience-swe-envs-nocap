# Issue

**Title:** dev --> 1.x

## Description

### Some significant changes and features

* 
* 
* 
* ...and made `VelocityCells` subclass of `HeadDirectionCells`
* Changes to `ratinabox/__init__.py` so it is possible to import `Environment`, `Agent`, and `Neurons`,  with: 

```python 
import ratinabox as riab
Env = riab.Environment()
Ag = riab.Agent(Env)
PCs = riab.PlaceCells(Ag)
```

* README update

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `462aaa318fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.