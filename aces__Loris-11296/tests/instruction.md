# Issue

**Title:** [modules | media] Backport (to 26.0-release) media module access checks (GHSA-p42c-4gmq-hrjw)

## Description

## What was wrong

The media module frontend filtered files based on user access, but the backend did not consistently enforce site-level access checks.

A user who knew or could guess a media filename could potentially access a file associated with a site they were not authorized to access.

## What changed

- Made changes according to the

## Reference

Backport security fix addressing GHSA-p42c-4gmq-hrjw.

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.