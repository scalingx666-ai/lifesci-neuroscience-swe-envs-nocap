# Issue

**Title:** [modules | publication] [smarty | templates | email] Backport (to 26.0-release) publication notification security fix (GHSA-6prw-34x8-3gpg)

## Description

## What was wrong

The publication module trusted the `baseURL` value submitted through a users POST request when generating URLs for publication notification emails.

A user with access to the publication module could potentially provide an attacker-controlled external URL, causing LORIS notification emails to include a link to a domain under the attackers control.

## What changed

- Removed the user-controlled `$_POST['baseURL']` parameter from publication notification calls.
- Removed the `$baseURL` parameter from the `notify()` function.
- Removed construction and passing of the user-supplied URL to notification templates.
- Updated the publication submission, edit, and review email templates to direct users to the LORIS website instead of including the submitted URL.

## Reference

Backport security fix addressing [[GHSA-6prw-34x8-3gpg](https://github.com/aces/Loris/security/advisories/GHSA-6prw-34x8-3gpg)].

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.