# Issue

**Title:** change -np.Inf to -np.inf

## Description

Hi, I got the following error when running GLMsingle
```
File ~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:21, in select_noise_regressors(r2_nrs, pcstop)
     [19](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:19) # initialize (this will hold the best performance observed thus far)
     [20](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:20) chosen = 0
---> [21](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:21) best = -np.Inf
     [22](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:22) for p in range(numpcstotry+1):  # notice the +1
     [23](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:23) 
     [24](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:24)     # if better than best so far
     [25](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:25)     if curve[p] > best:
     [26](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:26) 
     [27](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/glmsingle/utils/select_noise_regressors.py:27)         # record this number of PCs as the best

File ~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:397, in __getattr__(attr)
    [394](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:394)     raise AttributeError(__former_attrs__[attr])
    [396](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:396) if attr in __expired_attributes__:
--> [397](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:397)     raise AttributeError(
    [398](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:398)         f"`np.{attr}` was removed in the NumPy 2.0 release. "
    [399](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:399)         f"{__expired_attributes__[attr]}"
    [400](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:400)     )
    [402](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:402) if attr == "chararray":
    [403](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:403)     warnings.warn(
    [404](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:404)         "`np.chararray` is deprecated and will be removed from "
    [405](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:405)         "the main namespace in the future. Use an array with a string "
    [406](~/miniconda3/envs/glmsingle/lib/python3.11/site-packages/numpy/__init__.py:406)         "or bytes dtype instead.", DeprecationWarning, stacklevel=2)

AttributeError: `np.Inf` was removed in the NumPy 2.0 release. Use `np.inf` instead.
```

so I made this change.

thanks for the package!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c96337cf8b17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.