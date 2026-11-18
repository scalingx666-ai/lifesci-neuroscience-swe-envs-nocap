# Issue

**Title:** Give each edge an id derived from the edge itself

## Description

## Heads-up: this changes edge ids, once

The manifest now carries `graphFormatVersion: 2`. Edge ids change format in this PR, so anything
holding v1 ids — a saved layout, a stored diff, an external tool keyed on them — should discard
them once. Nothing inside this repository does: the viewer looks ids up by equality and never
parses them, and the only persisted state in the frontend is keyed by route. Node ids are
untouched.

## What

An edge's id came from a build-order counter: `e{N}_{source}_{target}`. The counter advanced
with every edge added, so inserting one edge renumbered every edge built after it. Adding a
single call to a controller rewrote most of the ids in the graph.

Each id now comes from the edge itself — its source, target, type and label. An edge keeps its
id for as long as it describes the same relationship, regardless of what else the build finds.

```
before   e0_route::GET::/errors/render-exception_middleware::web
after    e_2056369c5f93e260385517edb39b4c52
```

## Why it matters

Two builds of the same project can now be compared, because an unchanged relationship has an
unchanged id, so a graph diff shows what actually changed rather than a renumbering.

That matters for consumers outside the build. Code inside it can always compute its own content
key from the edge, and the incremental-rebuild work does exactly that rather than depending on
this, so treat stable ids as something that makes a diff meaningful to whoever reads it, not as
a precondition for rebuilding.

It is also the honest answer to a smaller annoyance: the old ids embedded the source and target,
so they were both long and duplicated data the edge already carried.

## The graph is otherwise unchanged

Ids are supposed to differ here, so byte-comparison cannot express the gate. What a consumer
depends on is the node set and the edge set, and those are compared directly — nodes
byte-for-byte, edges as a multiset of (source, target, type, label), since the builder
deliberately keeps genuinely identical edges and dropping one would have to show up.

On a real 1,885-file application:

| | `main` | this branch |
|---|---:|---:|
| nodes | 2,572, byte-identical | 2,572 |
| edges | 4,469 | 4,469, multiset equal |
| distinct edge ids | 4,469 | 4,469 |

Identical edges get a stable per-occurrence suffix, which is what keeps the count and the
distinct-id count equal to each other.

## Tests

`176 passed (624 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Two new cases, both of which fail on the old scheme:

- ids are identical across two independent builds, and every one is content-addressed;
- **every existing id survives a new edge appearing.** This is the property the change exists
  for, and determinism alone does not demonstrate it — two identical builds produce identical
  counter-based ids too. The test rebuilds with one extra call, the way an added line of code
  would produce one, and asserts the build differs by exactly one id.

## On the prefix

Ids read `e_<hash>` rather than `e2_<hash>`. The format version belongs in the manifest, and
`e2_` was itself a valid v1 prefix — it is what the third edge of any old build was called — so
it cannot be used to tell the formats apart. A v1 id always has a digit after the `e`; a v2 id
never does, which makes a stale id obvious if one turns up somewhere during the migration.

## Note

Nothing here depends on the incremental-rebuild work that motivated it — this stands on its own
as diff-stable ids, and that work can follow whenever it is ready.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e88edf159630`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.