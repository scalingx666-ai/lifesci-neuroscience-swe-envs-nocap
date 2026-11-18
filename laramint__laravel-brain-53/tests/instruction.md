# Issue

**Title:** Detect $this->dispatch() and dispatch_sync() job dispatches

## Description

`MethodTracer` already maps the `dispatch()` helper and `Job::dispatch()`, but two common dispatch shapes aren't recognised, so the jobs they send don't appear in the graph:

- **`$this->dispatch(new Job)` / `$this->dispatchSync(new Job)`** — the `DispatchesJobs` trait form (controllers, etc.)
- **`dispatch_sync(new Job)`** — the synchronous global helper (sibling of `dispatch()`)

This adds both, plus the matching labels in `FlowExtractor` so the flow diagram stays in sync with the graph.

It stays consistent with the existing dispatch detection:

- Same hop shape (`'type' => 'job'`, `'method' => 'handle'`), so it flows straight into the current job-node / `dispatches`-edge handling — no downstream changes.
- Same `looksLikeJob` gate the existing `dispatch()` helper and `Job::dispatch()` already use, so a class is treated as a job by the same rule everywhere.
- The instance form is restricted to `$this->` (not an arbitrary `$obj->dispatch(...)`) to avoid false positives on unrelated `dispatch()` methods.

As with the existing detectors, only literal `new Job()` arguments are resolved — a job held in a variable isn't.

Tests and a fixture are included; the full suite (Pint, Pest, PHPStan) is green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f078d5a5cc08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.