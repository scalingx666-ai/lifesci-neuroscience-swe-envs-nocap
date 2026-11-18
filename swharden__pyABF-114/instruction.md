# Issue

**Title:** improve user list support

## Description

ABF1 files now support the user list (from fixed byte positions) although I don't have any ABF1 files with user lists to test against.

ABF2 files have improved support for user lists. ABF.userListParamToVary and ABF.userListParamToVaryName how provide additional information. Tests were added for 4 ABF2 files that use user lists.

 

```py
abf = pyabf.ABF("user-list-durations.abf")
print(f"ParamNumber={abf.userListParamToVary}")
print(f"ParamName={abf.userListParamToVaryName}")
print(f"ParamValues={abf.userList}")
```

```
ParamNumber=[35] 
ParamName=['EPOCHINITLEVEL'] 
ParamValues=[4000.0, 6000.0, 6000.0, 10000.0, 20000.0, 30000.0, 30000.0, 30000.0, 30000.0]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `623cfb4ecaf6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.