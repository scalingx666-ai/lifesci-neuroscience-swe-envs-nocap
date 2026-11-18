# Issue

**Title:** MacOS and Linux Matlab connection fix

## Description

MacOS and Linux users could face the problem of connection to Matlab. They could avoid it via startmatlab script, so I made its execution during initialization process optional. It still needs some time to run three Matlab sessions in desktop-mode.

UPDATE:

1. New script for Linux, which could be used for matlab running
2. New parameter in config.py which allow to auto-execute startmatlab script according to your system

FIXES:

1. Matplotlib depricated method warning was fixed
2. Installation of pyqtgraph from master. Now it works with Python 3.8.
3. Add "wheel" installation in README.md

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0e9e7accaa3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.