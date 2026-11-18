# Issue

**Title:** [FIX] issue #29

## Description

I had the same problem as mentioned . According to [NumPy 1.20.0 Release Notes](https://numpy.org/devdocs/release/1.20.0-notes.html), changing np.float to float should work. 

I think it is better to change every occurrence of np.float (and also np.int, np.bool and np.object, because they are also deprecated) in the package, not only mesh_elements.py, because it will cause problems in the other places as well. I went through all the occurrences and tried to do the changes. 

I was not sure about some decisions base.py. In this file, `np.float` is always used as dtype in `np.loadtxt` function. It is not necessary to specify `dtype=float` in this function because it is the default option (https://numpy.org/doc/stable/reference/generated/numpy.loadtxt.html), but it might be useful for readability, so I changed `np.float` to `float` everywhere in this file. There are also occurrences of `np.loadtxt` function with `dtype='str'`. I did not want to mix two types of dtype settings (string and python type) and this is the only place using string, so I changed `dtype='str'` to `dtype=str`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70151fa92888`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.