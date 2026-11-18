# Issue

**Title:** Fix an ImproperlyConfigured exception when updating oauth app

## Description

This adds tests and fixes for E#184 in Opbeat.

The exception was caused by having both `fields` and `form_class` attributes set in `ApplicationUpdate` view class. Where `form_class` was specified explicitly,  `fields` was inherited from a base class. Looks like the presence of both attributes was ok in Django < 1.8 and not ok in recent versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4835b436de90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.