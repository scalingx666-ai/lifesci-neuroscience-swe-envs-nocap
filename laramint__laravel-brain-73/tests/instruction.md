# Issue

**Title:** Resolve same-namespace class references instead of leaving them short

## Description

.

## What

A class in the same namespace needs no `use` statement, so it has no entry in the file's import
map. Three analyzers resolved written class names through that map alone, and the name stayed
short.

A short name is worse than a missing one. Where the real class is already in the graph, the short
one becomes a **second node for it**, and the edge points at that one instead — so a relationship
or a call looks connected while joining nothing, and it is indistinguishable from a real edge
without reading the id. A bare word also trips the single-word model heuristic, so a traced hop
comes back typed as a model.

| analyzer | where |
|---|---|
| `MethodTracer` | the `new X()` extractor feeding the event, job and `Bus` dispatch handlers; the `Mail`/`Notification` `send()` handler; `authorize()`'s `Model::class`; the constructor-dependency type the property-call path reads |
| `RouteAnalyzer` | a controller named in a routes file that **declares a namespace**, where a sibling controller needs no import |
| `ModelAnalyzer` | a relationship target — `$this->hasMany(Book::class)` — the most common case of all, since related models normally sit together in `App\Models` |

All six sites now prefer `PhpFileParser::resolvedName()`. #63 already annotates every `Name` with
its resolved form, and several other sites were already reading it — these were the ones left
behind. It applies the rule PHP itself applies, so no separate qualification step is needed, and
the existing `useMap` fallback still covers a `Name` from an AST this parser did not produce. The
one place that deliberately shortens a name, matching the `Route` facade, is left alone.

`new Sibling()` on its own already resolved and is covered by tests from #63. The issue reports it
as broken, but that half is already fixed on `main`; what remained were the paths above, which read
the class name from somewhere other than the `new` handler.

## Effect on a real graph

The measure that matters is the duplicate node — a short name that stands in for a class the graph
already has under its real name. Edges are compared on `(source, target, type, label)` so a
re-keyed endpoint shows up rather than being normalised away.

| application | duplicate nodes | nodes | edges | edges vanished |
|---|---:|---:|---:|---:|
| A — 1,084 files | 47 → **2** | 2,934 → 2,891 | 5,574 → 5,576 | **0** |
| B — 1,885 files | 67 → **0** | 2,746 → 2,766 | 4,795 → 4,986 | **0** |
| C — 4,152 files | 65 → **0** | 2,532 → 2,467 | 5,018 → 5,018 | **0** |

Nothing vanished anywhere. Node counts fall on A and C because the duplicates collapse into the
real nodes they were standing in for, and the relationship edges re-point at those — C keeps
exactly its 5,018 edges while losing 65 phantom nodes. B gains 191 edges instead, because its
controllers were the ones being renamed, and once qualified they join the rest of the graph.

Counting it a second way, every short class name `MethodTracer` produces during a full build of B:

| | short names |
|---|---:|
| `main` | 440 |
| tracer sites only | 370 |
| all three analyzers | **5** |

The five are `Throwable`, a real root-namespace class where no separator is correct. This is also
why the PR covers three analyzers rather than the one the issue names: of the 370 the tracer fix
alone left behind, 365 were a controller referring to itself, inheriting a short name handed in
from a namespaced routes file.

What still remains is a different mechanism. A names its controllers with Laravel's legacy string
syntax — `Route::resource('users', 'UsersController')` — resolved against a namespace prefix in
`RouteServiceProvider`, not against PHP imports. Nothing here addresses that. The other leftovers
are middleware group names like `web` and `api`, which are not class names.

## Cost

Scan time, medians of five, three rounds alternating between a checkout of each:

| application | `main` | this branch | |
|---|---:|---:|---|
| A | 1,903 ms | 1,894 ms | −0.5% |
| B | 1,663 ms | 1,709 ms | +2.8% |
| C | 3,182 ms | 3,130 ms | −1.6% |

The direction follows what happens to the graph rather than the resolution itself. B pays about
3%, repeatably across all three rounds, and it is the application that gains 191 edges — the extra
time is spent tracing reach that was previously invisible. C comes out slightly ahead because it
sheds 65 nodes and the splitter has less to lay out. A does not move.

## One case where a resolved name is emitted less, not more

`authorize('view', Invoice::class)` only records the target when `looksLikeModel()` accepts it,
and that helper treats **any** bare capitalised word as a model. So a model outside the
conventional namespaces — `App\Domain\Billing\Invoice`, say — was accepted while it stayed short
and is rejected once resolved. That call now records nothing where it previously recorded
`Invoice`.

This is the same invariant, applied in the less comfortable direction. Write that class as an
import and `main` records nothing either, today, before this change: the qualified name fails the
same check. The same-namespace form was only being kept by the accident of being short, and the
node it produced was a phantom of the kind this PR exists to remove.

The real gap is that `looksLikeModel()` recognises models by location, so a project that keeps
them elsewhere loses the `authorize()` target either way. Widening it is a heuristic change that
would alter edge counts on its own terms, so it is not folded in here. None of the three
applications hit this — no edge vanished on any of them — and it is the only heuristic that can
flip this way: the job, mail, notification and resource checks all match on substrings, so a
longer name can only match more.

## One thing this deliberately does not change

On the `Mail`, `Notification` and `event` paths the specific handler and the generic `new` handler
both emit a hop for the same expression, so the call is recorded twice. That is pre-existing and
unrelated to name resolution: an **imported** class duplicates identically on `main` today, before
and after this change.

Resolving the name makes the same-namespace form reach the same handler, so it now duplicates the
same way. The invariant is that how a class is written no longer changes what is traced, and one
test asserts exactly that by comparing the two forms rather than counting hops. Collapsing the
duplicate changes edge counts for every application, which does not belong in a resolution change.

## Tests

`193 passed (671 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Seven new cases, each failing on `main` and passing here: the constructor-injected sibling, the
dispatched sibling job, the model named in `authorize()`, the controller in a namespaced routes
file, the related model in the same namespace, and two equivalences between a same-namespace
reference and the same class imported — one where resolving gains an edge, one where it gives one
up.

The model case needed no new fixture — `Order::user()` already does `$this->belongsTo(User::class)`
with `User` a same-namespace sibling, so the bug was sitting in the fixture project the whole time,
untested. The others build throwaway projects in a temp directory rather than extending that
fixture, whose route, node and edge counts other suites assert against.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3687ae425513`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.