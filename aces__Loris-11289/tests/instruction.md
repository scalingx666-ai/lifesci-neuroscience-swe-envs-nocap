# Issue

**Title:** [module | help_editor] [library | Module] Backport (to 26.0-release) security fixes for GHSA-rch2-f5fw-cg95

## Description

## What was wrong

The help editor contained two security issues:

- The `help.php` endpoint returned JSON-encoded responses without explicitly setting the `Content-Type` header, potentially allowing browsers to interpret the response as HTML.
- `Module::getHelp()` constructed a file path directly from the requested page name. The resolved path was not verified to ensure it remained within the module directory, potentially allowing unintended file access through path traversal.

## What changed

- Added the following JSON response header to `modules/help_editor/ajax/help.php`:

```php
header('Content-Type: application/json; charset=utf-8');
```

- Updated `Module::getHelp()` function.

## Reference

Backport security fix addressing [[GHSA-rch2-f5fw-cg95](https://github.com/aces/Loris/security/advisories/GHSA-rch2-f5fw-cg95)].

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.