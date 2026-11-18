# Issue

**Title:** Discover listeners registered via $listen, $subscribe and #[AsEventListener]

## Description

## What

, which discovered listeners **by convention only**. The same `ListenerAnalyzer` now also links events to listeners registered the other three ways Laravel supports, so the graph can answer "what runs when this event fires" regardless of how the listener was wired.

## How

- **`$listen` maps** — parses `EventServiceProvider::$listen` (`event => [listeners]`), including the `[Listener::class, 'method']` and `'Listener@method'` shapes.
- **`$subscribe` subscribers** — for each subscriber listed in `$subscribe`, follows its `subscribe()` method via both `$events->listen(...)` calls and a returned `[event => method]` map.
- **`#[AsEventListener]` attributes** — on a listener class or method; the event comes from the attribute argument, or the method's first parameter when the argument is omitted.
- Edges **reuse** the `listener` node type and `handled by` label added in #54 — no `GraphBuilder` change. They ride the same `CallChainEdge[]` channel, and a listener wired by more than one mechanism is de-duplicated into a single edge.
- Provider scan directories are configurable via `laravel-brain.listeners.provider_paths` (default `app/Providers`), alongside the existing `listeners.paths`.

## Scope / limitations

- Consistent with the existing detectors, only statically-resolvable references are followed (`Event::class` / string literals for events; a class reference for listeners). A listener held in a variable isn't resolved.
- A `$listen` / `$subscribe` entry that doesn't name a method defaults to `handle` (an invokable listener registered via `$listen` is linked at the class, labelled `handle`).
- Subscriber files are located by the conventional `App\ → app/` PSR-4 mapping plus an `app/`-relative fallback; a subscriber outside that layout is skipped rather than guessed.

## Tests

`tests/Unit/ListenerAnalyzerTest.php` adds coverage for each form:

- `$listen`-array listener (correct caller / callee / method / type)
- subscriber handlers from both the `listen()` calls and the returned `[event => method]` map
- method-level and class-level `#[AsEventListener]`
- de-duplication when a listener is registered by both convention and `$listen`

Full Pest suite green (97 passed), Pint clean. PHPStan is clean on the changed files; the 2 pre-existing `ModelAnalyzer::collectClassParents()` errors reported on `v2.x` are unrelated to this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09bd448276c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.