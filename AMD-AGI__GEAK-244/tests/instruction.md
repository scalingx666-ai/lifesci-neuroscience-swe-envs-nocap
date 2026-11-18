# Issue

**Title:** fix(save_and_test): fall through to diff -ruN when git diff fails or is empty

## Description

## Two complementary fixes to `_get_patch_content`

This PR composes two orthogonal fixes against the same function in `src/minisweagent/tools/save_and_test.py`. Both are needed for the next 24h GEAK session; they were authored independently and now coexist on this branch.

### Fix A — fall-through when `git diff` fails or is empty (this branch's original change)

Slot worktrees created by `git worktree add` (without `--recurse-submodules`) leave submodule `.git` files missing under `3rdparty/`. The first command in `_get_patch_content`'s git branch:

```
git add -N . && git diff -- . ...
```

then aborts with:

```
fatal: not a git repository: '3rdparty/composable_kernel/.git'
```

…returns no stdout, exits non-zero, but the previous code did `return result.stdout` regardless. The orchestrator recorded a zero-byte `patch_*.patch`, Hyperloom clamped the round to `1.00x` speedup, and the round was **discarded as "no changes detected" — even when the agent really did edit `kernel.py` and the test really did pass.**

Reproduction fingerprint from the 20260523 GEAK session: `geak-89318a6d/results/round_5/fixed-canonical-fill-1/patch_0.patch` is exactly 0 bytes despite a passing test on a non-trivial agent edit.

Two minimal changes inside `_get_patch_content`:

1. **Add `3rdparty/` (git pathspec form) and `3rdparty` (diff exclude form)** to the existing exclude lists. Keeps the common case from tripping the submodule traversal in the first place.
2. **Fall through from the git branch to the `diff -ruN` backup branch when `git diff` returns non-zero or empty stdout.** `diff -ruN` does not understand submodule pointers and is robust to this failure mode.

The fall-through is a strict superset of current behaviour:
- `git diff` succeeds with non-empty patch → unchanged.
- `git diff` fails or empty AND `base_repo_path` is set → previously returned `""`; now returns the `diff -ruN` patch.
- `git diff` fails or empty AND no `base_repo_path` → unchanged.

### Fix B — drop JIT-cache sections from rendered patches (merged in from `fix/final_report_optimized_codes`, originally authored by @chao-xu-spec)

`git add -N . && git diff` can capture JIT runtime caches (e.g. `flydsl_cache/*.pkl`) when a harness imports the package. Those pkls leak into the patch text, get persisted into `final_report.optimized_codes`, and pollute downstream analysis.

This PR includes the original author's two-layer fix verbatim:
- **Layer A** — `_strip_jit_cache_from_patch` post-processes the rendered patch text in `_get_patch_content` to drop any `diff --git` section whose path is a JIT cache.
- **Layer B** — `run/postprocess/optimized_codes.py` provides a defence-in-depth pass on the final-report side, plus wiring into `pipeline_types.py`, `results.py`, `homogeneous_agent.py`, and a new public helper `strip_jit_cache_sections` in `run/utils/generated_artifacts.py`.

### Conflict resolution

The two fixes both rewrote the single `return result.stdout` line on the git-branch success path. Resolved combined form:

```python
if result.returncode == 0 and result.stdout.strip():
    return self._strip_jit_cache_from_patch(result.stdout)
# ... fall through to diff -ruN backup
```

The `diff -ruN` branch auto-merged cleanly: `_strip_jit_cache_from_patch(_normalize_diff_ruN_to_git(...))`.

## Tests

29 tests pass across the merged surface:

- **6 fall-through tests** in `tests/tools/test_save_and_test_diff_fallthrough.py` — happy path, both fall-through triggers, no-fallback degenerate case, and `3rdparty` exclude pinning in both branches.
- **1 composition test** — `test_git_branch_success_path_still_strips_jit_cache` — pins that both fixes coexist on the git-branch success path: a captured patch containing a real `kernel.py` edit AND a `flydsl_cache/*.pkl` section keeps the kernel edit and drops the JIT-cache section.
- **17 tests** in `tests/run/test_optimized_codes.py` (Fix B's full suite, unchanged).
- **5 existing** `tests/tools/test_save_and_test_registry.py` tests (regression-clean).

`ruff check` and `ruff format --check` are clean on all modified files.

## Risk

Lowest tier on Fix A side (behaviour unchanged on every existing successful path). Fix B side has its own regression coverage (17 tests).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `738c66ce3fef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.