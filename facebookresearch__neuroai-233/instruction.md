# Issue

**Title:** neuralbench: depend on neuralfetch[quickstart] instead of a datasets extra

## Description

## Problem

`neuralbench`'s task configs reference 104 study names. 103 of them are defined
in `neuralfetch`; only `Mne2013SampleEeg` comes from `neuralset`. Since
`neuralfetch` was not a dependency, a plain `pip install neuralbench` could run
exactly one task (`eeg audiovisual_stimulus`).

The `datasets` extra did not fix this: it listed download backends
(`boto3`, `botocore`, `gdown`, `openneuro-py`, `synapseclient`) but never the
package that registers the studies, so even `pip install 'neuralbench[datasets]'`
left 103 of the 104 study names unresolvable.

## Change

Make `neuralfetch[quickstart]` a base dependency of `neuralbench` and remove the
`datasets` extra:

- `quickstart` already carries the download backends (`openneuro-py`, `praatio`,
  `pyunpack`, `boto3`, `osfclient`, `awscli`), so the extra had nothing left to
  contribute.
- `synapseclient` moves to `neuralfetch[quickstart]`, next to the `Synapse`
  downloader that requires it.
- `gdown` is dropped: nothing in the monorepo imports it or declares it in a
  `requirements` tuple.
- `botocore` is dropped as an explicit requirement. It is a hard transitive
  dependency of `boto3`, and `_check_requirements` resolves through
  `importlib.util.find_spec`, so `S3Downloader`'s `("boto3", "botocore")` stays
  satisfied.
- The `openneuro-py` floor becomes `>=2026.4.0` in `quickstart`. The `datasets`
  extra pinned `>=2025.2.0` while `quickstart` was unpinned, so moving as-is
  would have dropped the floor; `>=2026.4.0` is what the `Openneuro` downloader
  itself declares.

The comment on the new dependency records why it exists, since `neuralbench`
never imports `neuralfetch` — the study catalog arrives through the
`neuralset.studies` entry point.

`docs/neuralbench/install.md` was the only doc referencing the extra; its
"Optional dependencies" section now points at `[models]` and states that dataset
downloading ships with the base install.

## Validation

- Built both wheels and checked `METADATA`: `Requires-Dist: neuralfetch[quickstart]`
  with no `extra` marker, no `Provides-Extra: datasets`, and `quickstart` carrying
  `synapseclient` plus the `openneuro-py>=2026.4.0` floor.
- `ruff check .` and `ruff format --check .` pass.
- No source or test changes, so no pytest/mypy impact. Docs are not collected by
  `pytest neuralbench` (`pytest-markdown-docs` is not enabled via `addopts`).

## Compatibility

`pip install 'neuralbench[datasets]'` now warns about an unknown extra instead of
failing, and installs the same set of packages the extra used to provide (plus
`neuralfetch` itself).

CI is unaffected: `setup-python-env` installs `neuralbench-repo/.[dev,wandb,models]`
and has never used `datasets`, and the wheel smoke test installs with `--no-deps`.

Supersedes #218, which identified the same problem but added `neuralfetch` to the
`datasets` extra and a packaging-metadata regression test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16e697b4cf31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.