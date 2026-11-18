# Issue

**Title:** Refactored CSD estimation framework

## Description

Completes the CSD framework for dmipy.

The default solver for MCSphericalHarmonics models is 'csd', with other options being 'csd_tournier07' and 'csd_cvxpy'. Choosing 'csd' will make the solver automatically choose which one to use and whether or not to use unity_constraint to enforce the FOD integral equals one.
- When **one non-voxel-varying kernel** is given it will choose the 'tournier07' solver and unity_constraint=False - no reason to enforce unity if the kernel doesn't fit the signal properly.
- When **one voxel-varying kernel** is given it will choose the 'tournier07' solver and unity_constraint=True - it will assume the input comes from a spherical mean model. 
- When **more than one non-voxel-varying kernels** are given - but the **volume fractions fixed** - it will still use the tournier07 solver with unity_constraint=False, as the kernels are combined internally.
- When **more than one voxel-varying kernels** are given - but the **volume fractions fixed** - it will still use the tournier07 solver with unity_constraint=True, as it will assume it comes from a spherical mean model.
- When **multiple kernels** are given, **voxel varying or not**, and the **volume fractions not fixed**, then it will use the csd_cvxpy solver with unity_constraint=True, as tournier07 cannot estimate volume fractions.

Manually setting the solver to tournier or cvxpy will for that solver choice and you can define unity_constraint yourself. Multiple kernels without set volume fraction will give error for tournier07 since it can't take it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1a0e74ce303`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.