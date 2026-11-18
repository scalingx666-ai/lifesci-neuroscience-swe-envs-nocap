# Issue

**Title:** Raise `ValueError` when parameter for GLM_single is misspelled

## Description

Just a minor suggestion after our discussion on potentially mixing up 'chunknum' and 'chunklen'. Any spelling mistakes would now stop the user before running `.fit()`.

Example
```
from glmsingle.glmsingle import GLM_single
gs = GLM_single(params=dict(
    chunknumber=1000,
))

```
```
---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
<ipython-input-8-74015f237f63> in <module>
      1 from glmsingle.glmsingle import GLM_single
----> 2 gs = GLM_single(params=dict(
      3     chunknumber=1000,
      4 ))

/LOCAL/ocontier/thingsmri/bids/code/external_libraries/GLMsingle/glmsingle/glmsingle.py in __init__(self, params)
    266                 Input parameter not recognized: '{key}'
    267                 Possible input parameters are:\n{list(default_params.keys())}
--> 268                 """)
    269 
    270         self.params = params

ValueError: 
                Input parameter not recognized: 'chunknumber'
                Possible input parameters are:
['numforhrf', 'hrfthresh', 'hrffitmask', 'R2thresh', 'hrfmodel', 'n_jobs', 'n_pcs', 'n_boots', 'extra_regressors', 'wantlibrary', 'wantglmdenoise', 'wantfracridge', 'chunklen', 'wantfileoutputs', 'wantmemoryoutputs', 'wantparametric', 'wantpercentbold', 'wantlss', 'brainthresh', 'brainR2', 'brainexclude', 'pcR2cutoff', 'pcR2cutoffmask', 'pcstop', 'fracs', 'wantautoscale', 'seed', 'suppressoutput', 'lambda']
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cc31cce3a40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.