# Issue

**Title:** BF(CI): pin asv-runner<0.2.2 in benchmarks workflow

## Description

## Summary

Every Benchmarks CI run since 2026-06-29 (workflow run  and later) has failed with `FileNotFoundError: bm_heavy.tar` at `benchmarks/save_run.py:77`.  The regression is deterministic and affects every PR regardless of branch content -- `git log maint --since=2026-06-22 --until=2026-06-30` is empty, so nothing changed on our side.

**Cause:** `asv-runner` 0.2.2 (released 2026-06-27) added a fix for  so that parameter-free `setup(*args, **kwargs)` hooks -- like pandas's random-seed helper -- run before `setup_cache()`.  The heuristic in `asv_runner/benchmarks/_base.py::_is_parameter_free_setup` uses `inspect.signature(setup).bind()`, but for bound methods `self` is already excluded from the signature, so any class-level `def setup(self):` also passes.  Our `save_run` benchmarks have that exact shape (`setup(self)` reads `bm_heavy.tar`, `setup_cache` writes it), so 0.2.2+ inverts the order and every run explodes.

Reported upstream at **** with a minimal reproducer and a suggested one-line fix (exclude bound methods from `_is_parameter_free_setup`).  Pin `asv-runner<0.2.2` in the benchmarks workflow until that ships.

## Bisect

| Benchmarks run | Date | Branch | asv | asv-runner | Result |
|---|---|---|---|---|---|
|  | 2026-06-22 | dependabot | 0.6.5 | 0.2.1 | ✅ |
| — | 2026-06-27 | — | — | 0.2.2 released | — |
|  | 2026-06-29 | `bf-update-target-adjusted` | 0.6.6 | 0.2.5 | ❌ |
|  | 2026-07-01 | `bf-7882` | 0.6.6 | 0.2.5 | ❌ |
|  | 2026-07-01 | `bf-7882` (amended) | 0.6.6 | 0.2.5 | ❌ |
|  | 2026-07-01 | `nf-reset` | 0.6.6 | 0.2.5 | ❌ |

## Test plan

- [x] Root cause confirmed in the asv-runner 0.2.5 source (`do_setup_cache` at `_base.py:740`, `_is_parameter_free_setup` at `_base.py:647`)
- [x] Reproducer verified against both versions in isolated venvs (`asv-runner==0.2.1` → OK, `asv-runner==0.2.5` → `FileNotFoundError`)
- [x] Filed  with the reproducer and suggested fix
- [ ] Verify Benchmarks CI turns green on this PR
- [ ] Unpin once the upstream fix is released

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecccaf144db3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.