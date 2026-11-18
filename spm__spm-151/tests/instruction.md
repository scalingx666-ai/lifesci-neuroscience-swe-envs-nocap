# Issue

**Title:** Test: run the unit test suite inside the official container

## Description

A GitHub runner and a container are not the same environment: the suite passes on a plain ubuntu runner while some tests hang in the container, typically because they reach for graphics that a headless container cannot provide. Nothing in CI covered that.

This lives here rather than in spm-docker because the unit tests are compiled and encrypted into the CTF archive, so a change to tests/*.m only takes effect once the standalone is recompiled. spm-docker builds its images from published release assets and cannot test unreleased code. Compiling needs the MATLAB Compiler licence, which is configured in this repository.

The container recipe is not duplicated here. It is checked out from spm-docker so the two cannot drift apart, which is what makes a failure here say something about the shipped image. The repository and ref are inputs so a change to the recipe can be tried from a fork before it is merged.

Runs weekly on main, and on demand against any branch. The test input restricts a run to a single test file, which is how a fix for a failing test is demonstrated: red before, green after. Without it the whole suite runs in one session first, falling back to one container per test file only when that fails, so a hang is attributed to a named test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5831fb0f402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.