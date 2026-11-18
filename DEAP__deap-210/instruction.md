# Issue

**Title:** Fix these flake8 warnings:

## Description

cma.py:141:25: W503 line break before binary operator
cma.py:145:23: W503 line break before binary operator
cma.py:156:19: W503 line break before binary operator
cma.py:162:33: W503 line break before binary operator
gp.py:296:16: E713 test for membership should be 'not in'
gp.py:301:32: E713 test for membership should be 'not in'
gp.py:389:12: E713 test for membership should be 'not in'
gp.py:1027:5: E731 do not assign a lambda expression, use a def
gp.py:1074:9: E731 do not assign a lambda expression, use a def
gp.py:1082:9: E731 do not assign a lambda expression, use a def
gp.py:1083:9: E731 do not assign a lambda expression, use a def

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d0834b051ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.