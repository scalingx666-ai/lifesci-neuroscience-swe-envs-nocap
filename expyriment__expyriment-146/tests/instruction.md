# Issue

**Title:** FIX: process_control_keys forgetting quit callback

## Description

io.keyboard.Keyboard.process_control_keys shouldn't forget quit_confirmed_function after recursion

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `953965b37bf1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.