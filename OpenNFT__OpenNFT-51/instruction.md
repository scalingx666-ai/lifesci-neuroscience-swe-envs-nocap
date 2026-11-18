# Issue

**Title:** explicit contrast specification

## Description

This allows explicitly specifying contrast. It work only for the (volume) iGLM, because (signal) cGLM uses different approach I could not figure out, yet. I am happy to receive help in cGLM, because I did not paid much attanetion to it, because it was suggested to be replaced with iGLM.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6de8edd87ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.