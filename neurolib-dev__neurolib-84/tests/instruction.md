# Issue

**Title:** Load evolution from disk

## Description

* Load an evolution from disk that was previously saved using `dill`.
Saving:
```python
... # evolution done here
evolution.saveEvolution("data/evolution.dill")
```
Loading, in another session:
```python
# initialize object
evolution = Evolution(lambda x: x, ParameterSpace(['mock'],  [[0, 1]]))
# load from disk
evolution = evolution.loadEvolution("data/evolution.dill")
```

Because the objects are not serializable, I needed to use `dill` for saving and loading. This means, this would be a new dependency (which I' obviously trying to avoid as much as possible). At the same time, saving and loading a previous evolution / exploration is, I think, a very important feature and reinitializing the evolution with the loaded dill is a bit non-trivial, so I thought it makes sense to solve this issue for the user instead of letting them figure it out themselves. I'd be happy about comments on this (@jajcayn?).

* Pandas DataFrame with all individuals from the entire evolution
```python
evolution.dfEvolution
```
Sorry:
Most of the changes are actually black formatting.... :( more coming very soon.

Todo:
* [x] Testing of `saveEvolution()` and `loadEvolution()`
* [ ] Lazy import of dill, is it ok? Should give `ImportError` if import fails
* [x] Docstring dfEvolution

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6da23b70dc5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.