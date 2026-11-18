# Issue

**Title:** Refuse a scoped rebuild that cannot name what it claims to rebuild

## Description

.

## What

A scoped rebuild could hand back the previous graph as though it were current.

`scopedTo($files, $previous)` matched `$files` against the project two different ways. The
controller filter resolves both sides with `realpath()`; the soundness check matched them verbatim
against the path each node recorded. Any path form only one of them accepted fell between the two.

The check compares what the scope owns in the previous graph against what it owns in the fresh
one. A scope that matches nothing owns nothing in **both**, two empty sets compare equal, the
check approves, and the merge substitutes nothing. The less a scope matched, the more confidently
it was accepted.

Reproduced with a route → controller → service fixture, editing the controller so its call moves
from `Publisher::run()` to `Publisher::log()` — the edit the check exists to refuse:

```
scope as the build recorded it   ScopedRebuildNotApplicable   correct
scope through realpath()         accepted, and the graph still says index → Publisher::run
```

Both graphs have four nodes and three edges. The stale one is not smaller, it is wrong — so a
check that counts sees nothing, which is why the tests here compare edges by endpoint, type and
label.

## Two changes

**`GraphProvenance` resolves a caller's path form.** `byFile` is keyed on `data.file` as the
analysis wrote it. A lookup that misses verbatim is retried against the recorded keys resolved
through `realpath()`, so the ownership lookup agrees with the controller filter that already
worked this way. It is lazy and only runs after a miss, so the case that always hits — every path
watch mode passes, which a build produced itself — costs nothing.

**A scope that cannot name anything is refused up front.** Path form was the common way in, not
the only one: a path naming no file at all was accepted too, with the same result. Every scoped
path now has to be an existing file inside the project, checked before any work happens. A file
deleted since the previous run, a path from another checkout, a typo, and an empty scope are all
`ScopedRebuildNotApplicable` rather than a stale graph.

## What it deliberately does not do

The issue's second suggestion was to refuse any scope matching no provenance. That is sound, and
it is too blunt: a file the graph attributes nothing to is the common case, not the exception,
because the graph only holds what an entry point reaches.

| application | php files in app/ | graph attributes something | attributes nothing |
|---|---:|---:|---:|
| A | 1,089 | 596 (55%) | 493 (45%) |
| B | 1,899 | 840 (44%) | 1,059 (56%) |
| C | 4,181 | 597 (14%) | **3,584 (86%)** |

That rule would send 45–86% of single-file edits down the full-rebuild path, which is most of what
watch mode exists to avoid, and it buys little: an edit to a file nothing reaches cannot change
the graph without an edit to its caller, and that caller is a changed file too, is therefore in
the scope, and does own provenance. A test pins that this case still takes the scoped path.

## Scope of the bug

Watch mode was never affected. `ScanCommand` passes `base_path()` unmodified into both the mtime
walk and `analyze()`, and the directory iterator preserves that form, so its scope paths and the
recorded paths agree by construction. This reached consumers calling `scopedTo()` directly, which
is how it was found.

## Tests

`217 passed (759 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Seven new, and the first tests `scopedTo()` has had — the classes it composes were each covered,
the seam that composes them was not, which is why this shipped. Four fail on `main`: the
normalised path, a path naming nothing, a path outside the project, and an empty scope.

The other three pass on `main` and are there to fence the change in: a scoped rebuild still
reproduces a full build when the edit left the call graph alone, still refuses an edit that moved
a call, and still takes the scoped path for a file the graph attributes nothing to.

The normalised-path test builds through a symlink it creates rather than relying on the platform's
temp directory being one — it is on macOS, where `/var` resolves to `/private/var`, and is not on
Linux, so without that the test would quietly assert nothing on CI. It asserts the two path forms
really do differ before relying on them.

## Gate

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is
byte-identical to `main` on three applications, and scan time and parse counts are unchanged with
the arms interleaved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05a31095910`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.