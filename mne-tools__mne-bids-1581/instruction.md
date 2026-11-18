# Issue

**Title:** DOC: Fix bad links from default_role="autolink"

## Description

As suggested by the warning comment in `doc/conf.py`, there were indeed many little errors in doc liking etc. due to `default_role = 'autolink'`. Switch it to `py:obj` but prefer explicit syntax anyway.

FYI this regex find/replace in VSCode helped me get 95% of them (not perfect but good enough, put here for future reference):
```
([^\w\):`]`)([^_:`]+)(`[^`_\w])
$1`$2`$3
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `671e315dfbf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.