# Issue

**Title:** Settings: Automatically add extensions to apps

## Description

Previously, users installing extensions would have to manually add their
app config to INSTALLED_APPS. Now, settings.py.example includes a line
which will populate this based on INSTALLED_EXTENSIONS, which is already
populated automatically.

This has been added to `settings.py.example` rather than `settings_base.py` because if extensions depend on other django apps, they will need to be added before this line (and so should be in user-editable space).

Two edge cases which probably don't merit thinking about too hard:

1. The extension's appconfig isn't in the expected module path (it should be if they've used `python manage.py startapp` or the catmaid extension cookiecutter)
2. A django app which isn't a CATMAID extension both depends on a CATMAID extension and is depended upon by another CATMAID extension (and so would need to be inserted into INSTALLED_APPS between them)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68b892cf2ced`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.