# Issue

**Title:** BF: Using $ and \n in a textbox together wasn't translating to JS correctly

## Description

Using a newline character in a text param is fine:
```
this is a line
this is another
```
As is using \n in a code param:
```
"this is a line\nthis is another"
```
But using a newline in a text param *with a $ to indicate that it's code* isn't:
```
$"this is a line\nthis is another"
```

This is because multiline code is handled in `Param.__str__`, but only if `valType == "code"`, not if `valType == "str" and "$" in val`. This fixes it by adding in a similar if statement to that part of the stringifying code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37f7bc353fc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.