# Issue

**Title:** Do not fetch submodules when fetching upstream tags in doc build workflow

## Description

I ran into this after pushing a branch to my fork: the "Fetch tags from main repository" step in `test_doc_build.yml` fails with `fatal: remote error: upload-pack: not our ref 2f75d710...` while fetching the `docs_sphinx/resources` submodule.

From what I can tell, here's what's going on. A fork usually only has `master`, so fetching from upstream pulls in all of Brian's other branches too. Since the checkout uses `submodules: true` (added in #1479), git then also tries to fetch the submodule commits those branches point to. One of them, `2f75d710` (set in 3308b52e, "Update resource submodule"), doesn't exist in `brian2-doc-resources` anymore. In the main repository this step has nothing new to fetch, which is why it never shows up there.

The step only needs the tags, so this PR just adds `--no-recurse-submodules` to the fetch. I reproduced the error locally with a fresh clone of my fork, and with the flag the fetch goes through fine. On my fork, "Fetch tags from main repository" now passes: https://github.com/Anish-185/brian2/actions/runs/37954950389

One heads-up, not fixed here: that run then fails at "Setup Conda and Python," because the workflow now picks up Python 3.15, which conda-forge can't install yet. The last scheduled run on master (Oct 5) passed, so the next one will probably hit the same failure.

Also, if you still have `2f75d710` locally, pushing it back to `brian2-doc-resources` would fix the original error as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `240e2f0210e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.