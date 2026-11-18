# Issue

**Title:** BUG: Fix data download URLs in tests

## Description

Fix data download URLs in tests: the Slicer testing data was moved from kitware midas hosting to GitHub repositories. Related thread: 

Fixes:
```
12: ERROR: test_fiber_visibility_crash24381 (fiber_visibility_crash2438.fiber_visibility_crash2438Test)
12: Ideally you should have several levels of tests.  At the lowest level
12: ----------------------------------------------------------------------
12: Traceback (most recent call last):
12:   File "SlicerDMRI/Modules/Loadable/TractographyDisplay/Testing/Python/fiber_visibility_crash2438.py",
 line 203, in test_fiber_visibility_crash24381
12:     tractNode = slicer.util.getNode('tract1')
12:   File "Slicer-build/bin/Python/slicer/util.py", line 1566, in getNode
12:     raise MRMLNodeNotFoundException("could not find nodes in the scene by name or id '%s'" % (pattern if (isinstance(pattern, str)) else ""))
12: slicer.util.MRMLNodeNotFoundException: could not find nodes in the scene by name or id 'tract1'
```

and similar errors raised for example at
https://github.com/SlicerDMRI/SlicerDMRI/actions/runs/7144096978/job/19456990401#step:8:1568

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c4b00b1ea07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.