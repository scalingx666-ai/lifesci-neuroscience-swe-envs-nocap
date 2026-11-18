# Issue

**Title:** Piecewise param

## Description

**Motivation and context:**
piecewise() function accepts a dictionary of time points and corresponding function/constants. We want to turn this into be a process. Thus we need a new parameter type(s) used to define a piecewise function.

Previous PR used two NdArrays, tp and yp to define a piecewise function. This limits users from defining a piecewise function that includes non-constant subdomains (i.e. sin() from 0.5 < t < 1). The following are two options I considered:

Option 1: use NdArray for tp, and add a parameter NumericalSeries, which represents a list of either numerical constants OR callable functions whose output dimentions are the same
Option 2 (chosen):  Add a dictionary parameter who keys are time points and values are either callable functions or numerical constants

Both parameters would be specific to piecewise process. I chose option 2 to maintain previous interface of piecewise() function


**Interactions with other PRs:**
This change includes changes from  Addition of PiecewiseDataParam is included.

**How has this been tested?**
Added new unit tests andran them

**How long should this take to review?**
- Average (neither quick nor lengthy)

**Where should a reviewer start?**
Please have a look at the first PR. Then, have a look at PiecewiseDataParam to see if the logic makes sense, as well as the choice of such parameter type.

**Types of changes:**
- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

**Still to do:**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f32273567b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.