# Issue

**Title:** Upgrade Django from v1.8 to v1.9

## Description

Django 1.9 brings in a few features that are nice too have: Parallel tests, hooks for action on successful transaction commits, slightly simpler PostGIS integration, Django's JSONField now supports Postgres' jsonb type and more. This upgrade will also simplify a future migration to Django 1.10, which was released just a few days ago. Since this branch has been sitting around for quite a while now, I was curious if this would still work nicely with history tracking activated. Additionally, it provides a good opportunity to show a small migration that updates a column type of a history table manually to save space (`client_data` now uses Postgres' `jsonb` type).

As far as I can tell, everything is working fine. All tests pass and quick testing of admin tools and regular tracing as well as image browsing works without problems. The admin panel has a slightly different style now.

@aschampion just FYI: I had to upgrade `djangorestframework` to v3.4.3. From what I read, our patched version of `django-rest-swagger` should still be able to work with it and I tested the volume API as well as the API documentation, both work fine (of course only the latter uses `django-rest-swagger`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e65d4f1f73de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.