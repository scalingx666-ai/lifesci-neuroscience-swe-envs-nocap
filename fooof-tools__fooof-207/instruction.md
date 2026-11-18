# Issue

**Title:** [BUG] - Fix estimation of the exponent guess

## Description

Someone emailed to point out that the guess exponent estimation, line 745 of fit, looks to have missing parentheses. What should be `[abs((a-b) / (c-d))]` was actually `[abs( a - b / c - d )]`, meaning the calculated value is wrong (is not the slope estimate we want it to be. This fixes that. 

Note that the exponent guess is just an initial value into curve_fit. In all my checks on this, fixing this makes literally zero difference to the model solution - so this shouldn't impact any fits in practice.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9aea06d77e27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.