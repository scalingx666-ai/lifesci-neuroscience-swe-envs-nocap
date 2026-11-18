# Issue

**Title:** Show the work a callback does in the method flow

## Description

.

## What

A method whose body sits inside `DB::transaction(function () { ... })` charted as a single step —
the wrapper — and nothing else. Everything the transaction did was missing from the one view you
open to see what a method does.

`FlowExtractor` turned every call into a leaf and never looked at its arguments, so a closure
passed to one was never entered. Nothing about that is specific to transactions:
`Cache::remember`, `retry`, a collection `each`, anything taking a callback lost its contents the
same way.

```
before   DB::transaction(...)

after    DB::transaction(...)
           └─ $this->payer->charge()
              $this->ledger->record()
```

## The type matters more than the body

A call given a callback now carries that body, in the shape a `try` block already uses. It is also
retyped `loop`, which is what the viewer calls a block with a body — and that part is not cosmetic.
Both renderers in the shipped bundle read `body` for the `loop` type and for no other:

```js
else if (t.type === `loop`) { … t.body && t.body.length > 0 && walk(t.body, e) … }
```

A `call` carrying a `body` is dropped without a word. The fix would have looked correct in the
JSON, passed a test written against the JSON, and changed nothing on screen — which is the bug
being reported, not the fix for it. One of the tests pins the type for that reason.

Only the first callback of a call is entered. A call taking two is rare, and one body under one
label reads better than two merged.

## What it costs

Flow charts get bigger, so the question is whether they get unreadable. Measured over every action
node of two production applications:

| application | total flow steps | largest single chart | actions gaining a nested body |
|---|---|---|---|
| B — 1,885 files | 4,698 → 4,834 (+2.9%) | 65 → 65 | +38 |
| C — 4,152 files | 5,090 → 5,512 (+8.3%) | 50 → 54 | +81 |

The growth lands where work was hidden rather than spread across every chart, and the worst case
barely moves. Nothing else about a scan changes.

## Tests

`235 passed (806 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Ten new, and the first tests `FlowExtractor` has had. Five fail on `main`: the transaction body,
the step type the viewer needs, an arrow function, a collection callback, and the N+1 that was
hidden inside one.

The other two pass on `main` and are there to fence the change in rather than to demonstrate it:
one asserts a call *without* a callback is untouched — no type change, no `body` key — and the
other that a callback merely containing a query is not itself an N+1. That second one exists
because I first read the new warnings this produces as false positives and drafted the PR saying
so. They are real: callback bodies are walked with `inLoop = false`, so a step can only be marked
by a loop genuinely nested inside.

## Bounded, after review

@mrmarchone found that following callbacks into each other had no depth limit, and that it
compounded with the pretty-print fallback in `shortExpr`: a call with one closure argument
rendered the whole closure into its label, so a chain re-rendered everything inside it at every
level. Reproduced — 4 ms at depth 40, 56 ms at 160, 514 ms at 320, and a fatal at 640 from
exhausting a 128 MB limit inside the pretty printer, which takes the scan with it.

A closure is now labelled by its signature (`function ($query, $user) {...}`), keeping the
parameters and dropping the body — which for a callback is charted underneath the step anyway.
And the descent stops at 32 levels, truncating rather than throwing: measured across three
production applications the deepest chart nests 5, out of ~14,000 steps, so that is about six
times real code. Depth 320 is now 2 ms and 640 is 1 ms.

That label change is visible in output: 452 labels change on one application and 414 on another,
and every changed line in a full dump is a `"label"` — no node, edge or step type moves.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89f243945a65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.