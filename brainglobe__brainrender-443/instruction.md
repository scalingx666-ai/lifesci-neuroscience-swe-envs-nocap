# Issue

**Title:** fix: set SHOW_AXES to False by default

## Description

**What is this PR:**
- [x] Bug fix

**Why is this PR needed?**
The axes are shown by default but don't need to be. 
Users who don't want axes currently have to explicitly 
set settings.SHOW_AXES = False in their code.


**What does this PR do?**
Sets SHOW_AXES to False in brainrender/settings.py so 
axes are hidden by default.


**References:**



**How has this PR been tested?**
Changed the setting locally and verified the grep output 
confirms SHOW_AXES = False in settings.py. The change is 
a single boolean value with no logic implications beyond 
what is already tested via the existing render.py usage.


**Is this a breaking change?**
This could be considered a minor breaking change for users 
who rely on axes being shown by default. They will need to 
explicitly set settings.SHOW_AXES = True.


**Does this PR require an update to the documentation?**
The examples/settings.py already demonstrates how to toggle 
SHOW_AXES, so no documentation update is needed.

**Checklist:**
- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62a434f5e57b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.