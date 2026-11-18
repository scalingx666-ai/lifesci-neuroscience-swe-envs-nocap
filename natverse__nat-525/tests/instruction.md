# Issue

**Title:** nlapply: progress bars during parallel execution

## Description

## Summary

Lets `nlapply()` show a progress bar while running in parallel — something the previous `plyr::llply` backend could not do — by routing both sequential and parallel paths through `pbapply::pblapply`.

`nlapply(.parallel = 6, .progress = TRUE)` now Just Works, as does `nlapply(.parallel = cl)` with a user-built cluster.

## Key design decisions

- **Single backend.** `plyr::llply` and `pbapply::pblapply` are no longer split between sequential and parallel modes; everything goes through `pblapply`. `plyr` stays in `Imports` only because `plyr::rbind.fill` is still used elsewhere in the file.
- **`.parallel` shape.** Accepts `FALSE` / `TRUE` / a single integer / a `cluster` object. No more `"future"` string sentinel (it wasn't wired up), no more hand-rolled Windows PSOCK branch (pbapply does this for us).
- **doMC compatibility, softly.** Existing scripts that do `doMC::registerDoMC(n); nlapply(.parallel = TRUE)` keep working: `.parallel=TRUE` reads `foreach::getDoParWorkers()` if a backend is registered, and falls back to `getOption("mc.cores", 2L)`. `foreach` is in `Suggests` and the call is wrapped in `requireNamespace` + `tryCatch`, so users who never used `doMC` see no new dependency. We don't actually drive `foreach` — we just reuse the worker count, and on Unix that ends up using `mclapply` which has the same fork semantics `doMC` was going to use anyway.
- **Progress threshold.** `.progress = "auto"` defers to pbapply's "estimated total runtime > 2s" heuristic. Explicit `.progress = TRUE` / `"text"` forces the bar immediately, which preserves prior `expect_output(.progress = T)` test behaviour for short loops.
- **`.paropts` dropped.** Was added briefly during exploration; unnecessary once everything routes through `pblapply`'s standard signature.
- **`.inform` example removed.** That was a plyr-specific debugging knob; not portable to pbapply.

## What changes for users

| Form | Status |
|---|---|
| `nlapply(x, f)` | unchanged, sequential, auto progress |
| `nlapply(x, f, .progress=TRUE)` | unchanged |
| `doMC::registerDoMC(6); nlapply(x, f, .parallel=TRUE)` | still works (worker count reused) **and now shows a progress bar** |
| `nlapply(x, f, .parallel=6)` | **new**, recommended modern form |
| `nlapply(x, f, .parallel=cl)` | **new**, accepts cluster objects |
| `nlapply(x, f, .inform=TRUE)` | no longer supported (was plyr-only) |

Docs include a migration note in the `@details` block pointing existing `doMC` users at `.parallel=n`.

## Test plan

- [x] `devtools::test()` — 1091 / 1091 passing
- [x] `devtools::check()` — 0 errors, 0 warnings, 0 notes
- [x] Manual smoke test: sequential / `.progress=TRUE` / `.parallel=2` / `.parallel=TRUE` after `registerDoMC` — all produce identical output and progress bars where expected
- [ ] Reviewer to sanity-check on Windows (pbapply handles cluster creation, but worth a look)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf82fad17fe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.