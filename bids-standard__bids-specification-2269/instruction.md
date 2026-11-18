# Issue

**Title:** feat(bst): Defer type imports

## Description

This PR aims to keep import times low by deferring imports for types, avoiding many altogether in normal usage.

The goal is to make bidsschematools as lightweight as possible for downstream tools to use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f9b1f314a3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.