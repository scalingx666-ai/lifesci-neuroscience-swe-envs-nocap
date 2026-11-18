# Issue

**Title:** Detect jobs dispatched via the Bus facade

## Description

`MethodTracer` already maps `Job::dispatch()` and `Event::dispatch()`, but the `Bus` facade isn't recognised — so jobs sent through `Bus::dispatch()`, `Bus::chain([...])`, or `Bus::batch([...])` don't appear in the graph.

This adds the `Bus` facade alongside the existing `Event` one, plus the matching label in `FlowExtractor`:

- `Bus::dispatch(new Job)` / `Bus::dispatchSync(new Job)` → one job edge
- `Bus::chain([new A, new B])` / `Bus::batch([new A, new B])` → a job edge per job in the array

It emits the same hop shape as the existing job detection (`'type' => 'job'`, `'method' => 'handle'`), so it flows straight into the current job-node / `dispatches`-edge handling with no downstream changes.

Like the existing dispatch detectors, only literal `new Job()` arguments are resolved — a job held in a variable isn't.

Tests and a small fixture are included; the full suite (Pint, Pest, PHPStan) is green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f078d5a5cc08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.