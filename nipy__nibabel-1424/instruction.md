# Issue

**Title:** STYLE: Fix type checking errors in `volumeutils.rec2dict`

## Description

Fix type checking errors in `volumeutils.rec2dict`:
- Ensure that the recarray is iterable; return immediately if no fields are found.
- Accomodate `Any` type in return the dictionary type

Fixes:
```
nibabel/volumeutils.py:1391: error:
 Item "None" of "MappingProxyType[str, tuple[dtype[Any], int] | tuple[dtype[Any], int, Any]] | None"
 has no attribute "__iter__" (not iterable)  [union-attr]
```

and
```
nibabel/volumeutils.py:1398: error:
 Incompatible return value type (got "dict[str | Any, ndarray[tuple[Any, ...], dtype[Any]]]",
 expected "dict[str, generic[Any] | ndarray[tuple[Any, ...], dtype[Any]]]")  [return-value]
nibabel/volumeutils.py:1398: note: Perhaps you need a type annotation for "dct"?
 Suggestion: "dict[str, generic[Any] | ndarray[tuple[Any, ...], dtype[Any]]]"
```

raised for example in:
https://github.com/nipy/nibabel/actions/runs/16092302666/job/45410655458?pr=1422#step:7:22

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5ecf482648a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.