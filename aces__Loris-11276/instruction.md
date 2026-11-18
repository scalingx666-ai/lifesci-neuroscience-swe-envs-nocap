# Issue

**Title:** [modules | survey_accounts] Backport (to 26.0-release) GHSA-776p-5pwh-vc8p security fix

## Description

## What was wrong

The ValidateEmailSubmitInput.php endpoint returned JSON-encoded responses without explicitly setting the Content-Type header, potentially allowing browsers to interpret the response as HTML and resulting in XSS.

## What changed

Added the following header after the permission check:

```php
Content-Type: application/json; charset=utf-8
```

## Reference

Backport of the upstream security fix addressing [GHSA-776p-5pwh-vc8p](https://github.com/aces/Loris/security/advisories/GHSA-776p-5pwh-vc8p).

This change is submitted specifically as a security backport to the 26.0-release branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9dfd069b099d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.