# Issue

**Title:** docs: versioned docs (stable, dev, per release) with a version switcher

## Description

The site only shows `main`, which drifts from the released packages. Docs are now published per version on gh-pages:

- `dev/` from `main`, `X.Y/` from each `vX.Y.Z` tag, `stable/` = highest `X.Y`; re-publishing an older patch of a published `X.Y` fails instead of rolling it back
- old root URLs (README/PyPI links, intersphinx `objects.inv`) redirect to `stable/` (path, query and `#anchor` kept); root pages missing from stable redirect to its index, so no previously published URL 404s; any other missing URL is retried in `stable/`, then `dev/`, then the version index by a root `404.html`; `CNAME` and `robots.txt` at the root are left alone
- a version dropdown in the sidebar (same page in the other version, else its index) and a banner on `dev` / older versions linking to the stable page; both read `versions.json`, so older builds pick up new versions without a rebuild
- release pages link source (`linkcode`, furo "view") to their tag; edit links stay on `main`; non-stable pages get `noindex` so search results land on stable

How: the docs job moves to its own workflow `docs.yml` (push to main, release tags, docs PRs, `workflow_dispatch` with a ref to (re)build any tag). A read-only job builds and uploads the HTML as an artifact (also a PR preview); a separate job with write access publishes it. `docs/scripts/publish_docs.py` copies the build into its folder and post-processes every page (switcher script, tag source links, `noindex`) at publish time, independent of `conf.py`, so it also works for tags built before this PR. The branch stays a single orphan commit, pushed with `--force-with-lease` and retried on concurrent deploys.

Why not Read the Docs: builds there start without the 5–6 GB venv and data caches the gallery needs.

Test plan:
- `pytest docs/scripts/test_publish_docs.py` (also runs in the workflow, before the Sphinx build)
- published `main`, `v0.3.1`, `v0.4.0` into a copy of the current gh-pages and browsed it with headless Chromium: dropdown/banner per version, switching keeps page, query and anchor, missing page falls back to the version index, the 404 page (served under `/neuroai/`) reroutes dev-only and unknown URLs, old root URLs and `/` redirect to `stable/`, no JS errors, works under a sub-path
- ran the publish loop against a local bare remote, including a concurrent push (lease rejected, retry keeps both deploys)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6965981ae797`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.