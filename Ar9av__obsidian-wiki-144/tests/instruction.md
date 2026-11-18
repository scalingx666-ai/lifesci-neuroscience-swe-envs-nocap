# Issue

**Title:** fix: bundle wiki-stop-capture.sh in the published wheel

## Description

.

## Problem

`wiki-setup`'s "Install the Stop Hook" step wires `~/.claude/settings.json` to run
`<REPO_PATH>/.claude/hooks/wiki-stop-capture.sh`. But the sdist prunes `/.claude`,
and the wheel is built from the sdist — so the script was **never shipped in the
published pip/uv package**. Anyone who installed via `uv tool install` / `pip install`
got a Stop hook pointing at a file that doesn't exist (`bash: No such file or directory`
on every session Stop).

## Fix

- **Packaging:** force-include `wiki-stop-capture.sh` into the wheel under
  `obsidian_wiki/_data/hooks/`, and re-add it to the sdist force-include (since
  `/.claude` is excluded and the wheel builds from the sdist). Verified with a
  real `python -m build`: the script now appears in both artifacts.
- **Skill:** `wiki-setup` now resolves the hook robustly — packaged
  `<REPO_PATH>/hooks/` path first, then the source-checkout `.claude/hooks/`
  path, then a GitHub-raw fallback for older wheels — and points settings.json
  at the resolved absolute path.
- **Secondary note:** `wiki-setup` now creates an empty `.manifest.json`, so
  `obsidian-wiki doctor`'s required-core-files check flips from `warn` to `pass`.
- **Tests:** new `tests/test_stop_hook_packaging.py` pins the packaging config
  and skill wiring so this can't silently regress.

## Verification

```
$ unzip -l dist/*.whl | grep hook
    3079  ...  obsidian_wiki/_data/hooks/wiki-stop-capture.sh
$ python3 -m pytest tests/test_stop_hook_packaging.py tests/test_doctor.py -q
... passed
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e508c528d349`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.