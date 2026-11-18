# Issue

**Title:** Support Route::match([...], ...) in RouteAnalyzer

## Description

## Summary

`Route::match([...], $uri, $action)` is not in `RouteAnalyzer::HTTP_METHODS` and has no dedicated branch in `enterNode()`, so `brain:scan` silently drops every route declared with it — no route count, no lifecycle/graph entry, no Filament/command chain tracing, nothing.

.

## Change

- Added `handleMatchRoute()`, which reads the methods array (`Route::match`'s first argument), and delegates to `handleHttpRoute()` once per verb.
- Gave `handleHttpRoute()` an `$argOffset` parameter, since `match()`'s URI/action arguments are shifted by one position compared to `get()`/`post()`/etc.
- Wired `match` handling into both the `StaticCall` and `MethodCall` branches of `enterNode()`, alongside the existing `resource`/`apiResource`/`livewire` special-casing.
- Also handled `match` as the base call inside `tryHandlePostChainedRoute()`, so `Route::match([...], '/uri', $action)->middleware(...)` style post-route chaining works too.

## Test plan

- Added a new test (`expands Route::match into one route per HTTP verb`) covering: multiple HTTP verbs, a wrapping `prefix()`/`middleware()` group, and post-chain `->middleware(...)`.
- `vendor/bin/pest tests/Unit/RouteAnalyzerTest.php` — all 26 tests pass.
- `vendor/bin/pest --order-by=random` — full suite passes except 4 pre-existing, unrelated failures in `DatabaseGraphStoreTest` caused by a missing `pdo_sqlite` driver in my local PHP 8.4 build (reproducible on `v2.x` before this change too).
- `vendor/bin/pint --test` on the touched files — passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.