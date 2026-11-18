# Issue

**Title:** Remove a stray character introduced in #9

## Description

@mjanusz  I apologize for a stray character that I mistakenly introduced in #9.  This PR eliminates that error.

[flake8](http://flake8.pycqa.org) testing of https://github.com/lake8 testing of https://github.com/google/ffn on Python 3.7.1

$ __flake8 . --count --select=E901,E999,F821,F822,F823 --show-source --statistics__
```
./ffn/inference/seed.py:157:2: E999 IndentationError: unexpected indent
  def __init__(self, canvas, min_distance=7, threshold_abs=2.5,
 ^
1     E999 IndentationError: unexpected indent
1
```
__E901,E999,F821,F822,F823__ are the "_showstopper_" [flake8](http://flake8.pycqa.org) issues that can halt the runtime with a SyntaxError, NameError, etc. Most other flake8 issues are merely "style violations" -- useful for readability but they do not effect runtime safety.
* F821: undefined name `name`
* F822: undefined name `name` in `__all__`
* F823: local variable name referenced before assignment
* E901: SyntaxError or IndentationError
* E999: SyntaxError -- failed to compile a file into an Abstract Syntax Tree

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c8628c3bb47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.