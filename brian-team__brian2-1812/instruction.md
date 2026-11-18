# Issue

**Title:** Draft: Fix #1350 - Preserve exprel, expm1, and log1p during SymPy translation

## Description

Hi @mstimberg,

Got the `evaluate=False` fix working in `rendering.py`. It intercepts `exprel`, `expm1`, and `log1p` during the AST walk and passes the flag directly. 

This preserves the AST nodes for the C++ codegen without touching the global parser or breaking float evaluations downstream.

Tests are passing locally and I've added a regression test, but opening this as a draft so you can verify the architecture.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3137c687390c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.