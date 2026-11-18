# Issue

**Title:** Improve statement parsing: clear diagnostics, paren validation

## Description

Enhance [parse_statement](https://github.com/brian-team/brian2/blob/a5eccc280cdce34a4a7101098349440f91afa1fe/brian2/parsing/statements.py#L26) with descriptive error messages (using pyparsing labels and the - operator), automatic balanced-parenthesis checking, and full support for # inside trailing comments. This replaces generic parsing failures with clear, caret-based error diagnostics.


For the wrong input `v = (5 + 3` now it gives -
```
ERROR MSG:
Unbalanced parentheses in expression: '(5 + 3'
v = (5 + 3
    ^^^^^^
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a2988610fe4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.