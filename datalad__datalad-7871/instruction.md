# Issue

**Title:** NF: add -J cpus option for explicit CPU-based parallelism

## Description

## Summary

Following #7868 (which fixed `-J auto` crashing push/drop), this adds `cpus` as a new `-J`/`--jobs` value that resolves to the number of CPUs available to the process.

**Motivation:** `-J auto` is intentionally conservative — it's capped by `datalad.runtime.max-annex-jobs`, which defaults to `1` (, where unbounded CPU-count parallelism caused crashes). With the default config `auto` therefore resolves to `1` (effectively serial). Users who *want* CPU-based parallelism currently have no way to request it without knowing their CPU count and passing a literal number.

`-J cpus` fills this gap: an explicit opt-in to CPU-count-based parallelism, without changing the safe `auto` default.

**Safety note:** unlike `auto`, `cpus` is deliberately *not* bounded by `datalad.runtime.max-annex-jobs`. On many-core machines this can be resource-intensive and, for git-annex operations, can reach the regime that #4404 guarded against. This trade-off is documented in the `-J` help text so inexperienced users are warned.

**Related future work (not in this PR):** arguably `-J auto` should itself resolve to something `> 1` but below a sensible cap, instead of the current default of `1`. That is a larger change to the default-parallelism policy and is left to the maintainers; `cpus` gives the explicit "use all available CPUs" knob in the meantime.

## Changes

| File | Change |
|------|--------|
| `utils.py` | Add `available_cpu_count()`: uses `os.sched_getaffinity()` on Linux (respects cgroups/containers), falls back to `os.cpu_count()` on macOS/Windows, `1` if undeterminable |
| `common_opts.py` | Add `'cpus'` to `EnsureChoice` for `jobs_opt`; document it and warn that it is not bounded by `max-annex-jobs` |
| `annexrepo.py` | Handle `'cpus'` → `available_cpu_count()` in `_call_annex()`; also switch the existing `auto` path from `multiprocessing.cpu_count()` to `available_cpu_count()` (no behavior change under the default `max-annex-jobs=1`) |
| `parallel.py` | Handle `'cpus'` in `ProducerConsumer.get_effective_jobs()` |
| `tests/test_jobs.py` | Tests for get/push/drop with `jobs='cpus'`, plus unit tests for resolution and `available_cpu_count()` |
| `changelog.d/` | scriv fragment under "🚀 Enhancements and New Features" |

## Test plan

- [x] `test_jobs_cpus_get` — get with `jobs='cpus'` is accepted and runs
- [x] `test_jobs_cpus_push` — push with `jobs='cpus'` works
- [x] `test_jobs_cpus_drop` — drop with `jobs='cpus'` works
- [x] `test_jobs_cpus_resolves_to_cpu_count` — resolves to `available_cpu_count()` in the `ProducerConsumer` path
- [x] `test_available_cpu_count` — returns a positive integer
- [x] Existing push and drop tests pass without regressions

### Manual end-to-end verification

Tested in a real dataset (16 available CPUs) — `-J cpus` resolves to `-J16` and is passed through to git-annex, completing successfully:

```
$ datalad -l debug get . -J cpus 2>&1 | grep -E -- "-J[0-9]+"
[DEBUG] Run ['git', ..., 'annex', 'get', ..., '-J16', '--', '.'] (protocol_class=AnnexJsonProtocol) (cwd=.../figures)
[DEBUG] Finished ['git', ..., 'annex', 'get', ..., '-J16', '--', '.'] with status 0
```

Ref: #7867

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43ace70cf011`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.