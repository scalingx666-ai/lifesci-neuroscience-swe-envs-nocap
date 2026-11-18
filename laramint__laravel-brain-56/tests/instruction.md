# Issue

**Title:** Detect unresolved job dispatches and support custom dispatch helpers

## Description

## What

Companion to #52 / #53 (job-dispatch detection). Two gaps remain after those PRs:

1. Brain resolves a *literal* dispatch (`dispatch(new Job)`, `Bus::dispatch(...)`) but emits nothing when the job is a variable or factory result — so a job reachable only through such a dispatch shows as "no impact" rather than "unknown".
2. Custom global dispatch helpers (e.g. a project's `dispatch_with_retries()`) aren't recognised at all.

## How

- **Unresolved-dispatch reporting.** `MethodTracer` records the dispatcher (`FQCN::method`) whenever a recognised dispatch verb's job argument can't be resolved statically — the global helpers, `$this->dispatch()`/`dispatchSync()`, and `Bus::dispatch`/`dispatchSync`/`chain`/`batch`. Exposed via `MethodTracer::unresolvedDispatchers()` and surfaced on the new additive `AnalysisResult::$unresolvedDispatchers`, so a consumer can mark such a dispatcher "may reach unknown jobs" rather than "reaches none".
- **Configurable dispatch helpers.** A `laravel-brain.dispatch.helpers` config list registers custom global helpers that wrap a queued job, so their dispatches are followed (and their unresolved cases reported) exactly like `dispatch()`.

## Scope

- **Additive only** — no method signature changes; the new `AnalysisResult` field defaults to `[]`. No `GraphBuilder` change: the signal rides on `AnalysisResult`, not as graph nodes/edges.
- The marker is per dispatcher *method*, not per call site: a method with both a resolved and an unresolved dispatch still emits the resolved job edge and is reported once.
- Consistent with #52/#53, `Job::dispatch()` (the class is the job) is always resolved; only verbs whose job *argument* is non-literal count as unresolved.

## Tests

`tests/Unit/MethodTracerUnresolvedDispatchTest.php`:

- reports a method whose `dispatch($var)` / `$this->dispatch($var)` / `Bus::batch($x)` / partial `Bus::chain([new, $x])` can't be resolved, while still emitting the literal job edge
- a fully-resolved dispatcher is not flagged
- a configured custom helper resolves its literal job and flags its unresolved case
- an unconfigured custom helper is ignored

Full Pest suite green, Pint clean. PHPStan is clean on the changed files; the 2 pre-existing `ModelAnalyzer::collectClassParents()` errors on `v2.x` are unrelated to this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28e57201638c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.