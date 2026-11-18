# Issue

**Title:** Move manage.py script one folder level up

## Description

Django changed the default manage.py location already multiple versions ago. This has been done do prevent duplicate imports under different names, which caused some log entries to appear twice. This was so far no big problem, but with Python 3.5 the relative imports used in `settings.py` and `settings_base.py` had to be replaced to work both in a module and non-module environment (e.g. uwsgi vs. manage.py). To make this easier and more consistent with recent Django versions, the manage.py script was moved up a level. This way, the Django settings module is consistently available as `mysite.settings`, duplicate imports are prevented, and our settings configuration works with Python 3.5.

I am putting this into a pull request mainly for documentation purposes and for comments or concerns in case I overlooked something.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7180e3bfe219`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.