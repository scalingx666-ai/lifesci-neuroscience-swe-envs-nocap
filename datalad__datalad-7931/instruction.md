# Issue

**Title:** BF+RF: support linked git worktrees, where `.git` is a file (save, copy-file)

## Description

`GitRepo._save_add_submodules()` bypasses `git` and appends directly to
`.git/config` for speed when registering multiple new subdatasets in a single
`save()` run.  That assumes `.git` is a directory, which does not hold for a
linked `git worktree` checkout: there `.git` is a "gitlink" file pointing at the
worktree's private git directory, so opening `<worktree>/.git/config` raises
`NotADirectoryError`.

With git-annex present the bug is masked, since git-annex turns that `.git` file
into a symlink to the git directory during checkout.  In a pure-git
(`--no-annex`) superdataset there is no such conversion, so `datalad save`
reliably failed when registering a newly created subdataset from within a
worktree.

### What is in here

- **`save`**: resolve the `config` to append to via a new `GitRepo.dot_git_common`
  rather than `<repo>/.git/config`.  For a worktree, `dot_git` ( `$GIT_DIR`) holds
  only the per-worktree files (`HEAD`, `index`, ...), while `config` is shared and
  lives in the *common* git directory (`$GIT_COMMON_DIR`), which git points to via
  a `commondir` file — see the `commondir` entry in `gitrepository-layout(5)`.
  For a plain repository or a submodule the two are the same, so nothing changes
  there.  This matches what `git submodule add` itself does: it registers
  submodules in the common config, with or without `extensions.worktreeConfig`.

- **`copy-file`**: `_CachedRepo.get_tmpdir()` made the same assumption
  (`pathobj / '.git' / 'tmp' / ...`, then `mkdir(parents=True)`) and broke the same
  way in a worktree.  It now uses `dot_git`.

- **Internal**: `GitRepo.dot_git` became a property, so that everything derived
  from the `.git` location is established in one place — its setter.  `init()`
  reassigns `dot_git` once the repository exists, and `_valid_git_test_path` did
  not follow along; for a bare repository that made `is_valid()` report `False`
  (and the flyweight discard and recreate that instance on every lookup).
  `dot_git_common` is invalidated there and computed on first access, rather than
  eagerly — it costs a stat, and only `_save_add_submodules()` asks for it, while
  `GitRepo` instantiation is frequent.

### Tests

- `test_save_subds_in_worktree` — the reported scenario end to end; fails with
  `NotADirectoryError` without the fix.
- `test_dot_git_common` — `dot_git_common` for a plain repository and for a
  worktree, and that it agrees with `git rev-parse --git-path config` (so that
  `config` being a common rather than per-worktree file is checked against git
  itself, not against a reading of the docs), including with
  `extensions.worktreeConfig` enabled, where the per-worktree overlay is a
  separately named `config.worktree`.
- `test_dot_git_derived_state_after_init` — the bare-repository case above, for
  both attributes derived from `dot_git`.

### Not addressed here

A few more spots construct `.git` paths the same blunt way, left alone as they
are lower priority and would widen this PR:

- `local/clean.py` builds the annex-tmp/annex-transfer/cached-archives paths as
  `wds.pathobj / <a '.git/...'-prefixed constant>`, rather than through
  `wds.repo.dot_git` as it already does a few lines below for the search index.
  In a worktree that silently finds nothing to clean rather than failing, and
  fixing it implies revisiting those constants in `consts.py` (consumed the same
  way by `tests/test_clean.py`).
- `customremotes/archives.py` and `AnnexRepo.is_valid_repo()`'s
  `git_file_has_annex()` are similar, but only matter for annex-enabled
  repositories, where git-annex's own worktree handling masks the issue — as it
  did for the bug reported here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b3ab8a144af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.