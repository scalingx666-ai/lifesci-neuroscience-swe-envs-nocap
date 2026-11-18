# Issue

**Title:** fix: make Sprintf interpret %% -> % correctly when no args are passed

## Description

Sprintf now correctly converts %% to % when used with format literals
and no extra arguments (previously produced %%g instead of %g).

Before this fix, (and after the old Sprintf macro was replaced with a template using snprintf)
```
Sprintf(pform, " %%g ")
```
would result in a pform of ```" %%g "``` instead of the desired ```" %g "```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `981458ff96c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.