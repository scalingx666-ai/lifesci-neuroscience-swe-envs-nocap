# Issue

**Title:** Link dispatched events to their listeners

## Description

## What

Brain links event *dispatches* (`event(new X)`, `Event::dispatch`) to event nodes, but never to the listeners that handle them — so the graph can't answer "what actually runs when this event fires". This adds that link.

A new `ListenerAnalyzer` discovers listeners **by convention**: a class under the configured listener directories (default `app/Listeners`) whose `handle()` or `__invoke()` type-hints an event in its first parameter is treated as a listener for that event. Each pairing emits one `event → listener` edge.

## How

- The edge rides the **existing** `$callChain` (`CallChainEdge[]`) channel into `GraphBuilder::build()` — no signature change. The edge's caller is the event FQCN (method `__construct`), which maps onto the same event node a dispatch creates, so the listener connects to the existing event rather than spawning a duplicate.
- Adds a `listener` node type and a `handled by` edge label, mirroring the existing `event`/`job` cases.
- Adds a `listeners.paths` config block, consistent with `channel_paths` / `commands` / `models`.

## Scope (deliberately narrow)

- **Auto-discovery only.** `$listen` arrays, subscribers, and `#[AsEventListener]` attributes are out of scope here — a natural follow-up that plugs into the same analyzer.
- The edge connects where the event is dispatched in traced code (the impact-analysis case). A listener for an event that's never dispatched stays an isolated node.

## Tests

`tests/Unit/ListenerAnalyzerTest.php`:
- discovers the `event → listener` edge by convention (correct caller/callee/method/type)
- discovers an invokable (`__invoke`) listener
- end-to-end: the fixture's `event(new UserLoggedIn)` dispatch connects to its listener in the built graph with a `handled by` edge

Full suite green, PHPStan clean, Pint clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f078d5a5cc08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.