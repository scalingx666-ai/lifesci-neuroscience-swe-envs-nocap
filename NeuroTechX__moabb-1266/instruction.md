# Issue

**Title:** ci(docs): deploy versioned docs (stable at /docs/ + /stable/, dev at /dev/) with version switcher

## Description

### ci(docs): deploy versioned docs (stable at /docs/ + /stable/, dev at /dev/) with version switcher

, .

- Docs workflow: also build on v* tags; MOABB_DOCS_VERSION=stable for v* tags
  and master, dev otherwise. develop deploys to dev/; release builds deploy
  to docs/ (existing URL) and stable/. Both targets (NeuroTechX/moabb.github.io
  master and this repo's gh-pages) are kept; deploy jobs are serialised per
  target.
- conf.py: switcher version_match from MOABB_DOCS_VERSION, json_url pointing
  at dev/_static/versions.json, version-switcher in navbar_end, release label
  without -dev on stable builds.
- Add docs/source/_static/versions.json (stable preferred, dev).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f83dd59f11f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.