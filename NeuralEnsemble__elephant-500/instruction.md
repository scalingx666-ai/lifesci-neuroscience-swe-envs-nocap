# Issue

**Title:** fix/#410, UE cast to int in 'unsafe' mode

## Description

This PR addresses Issue #410  

The following error occurred in https://github.com/NeuralEnsemble/elephant/blob/0df45812b93229b3186c061cb84ec29fd380e09c/elephant/unitary_event_analysis.py#L585

```
TypeError: Cannot cast array data from dtype('int64') to dtype('int32') according to the rule 'safe'
```

This might be fixed by using np.astype(int) instead of np.in64() to cast to int. 
`np.astype` allows 'unsafe' casting by default, see:
https://numpy.org/doc/stable/reference/generated/numpy.ndarray.astype.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0df45812b932`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.