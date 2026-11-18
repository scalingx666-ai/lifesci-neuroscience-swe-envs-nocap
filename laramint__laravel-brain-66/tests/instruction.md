# Issue

**Title:** Stop re-parsing and re-walking the project on every lookup

## Description

## What

A build asks the same questions over and over. Seventeen classes under `src/` construct their
own `PhpFileParser`, so each one read, tokenized, parsed and name-resolved the same files again.
Every FQCN that PSR-4 could not place triggered a fresh recursive walk of `app/` — once per
class asked about. Every `(file, method)` question ran a full-file traversal, and the
visibility lookup ran a second one over the same node.

Six changes make each of those happen once per build. What Brain discovers does not change: the
complete build output is byte-identical to `main` on three real applications.

| application | app files | `main` | this branch | | peak RSS |
|---|---:|---:|---:|---:|---|
| **A** — non-standard layout | 1,084 | 30.2 s | **2.36 s** | **12.8x** | 454 → 296 MB |
| **B** — Livewire-heavy | 1,885 | 25.0 s | **2.24 s** | **11.1x** | 369 → 304 MB |
| **C** — largest | 4,152 | 133.4 s | **3.54 s** | **37.7x** | 871 → 705 MB |

Peak memory falls *despite* the added caches: parsing a file once instead of several times over
produces far less garbage than the retained ASTs occupy.

Where the time went, on B's analyze phase. Two steps were 76% of it, and both were dominated by
work they repeated rather than by anything they uniquely do.

| step | `main` | this branch |
|---|---:|---:|
| graph | 10.64 s | 0.48 s |
| facades | 5.94 s | 0.37 s |
| lifecycle | 1.71 s | 0.33 s |
| the other 15 steps, combined | 1.24 s | 0.40 s |
| not attributed to a step | 2.36 s | 0.16 s |
| **analyze total** | **21.89 s** | **1.74 s** |

## Why

Found while building [richter](https://github.com/SanderMuller/richter) on top of Brain. Its
change-detection workflow rebuilds the graph on every run — the diff *is* the workload, so a
graph cache can never help — and Brain's build dominated its runtime. Profiling kept returning
the same shape: no single hot function, just the same file being resolved, read, parsed and
traversed once per consumer.

## The six changes, and what each is worth

Measured **leave-one-out**: each row is the build with everything in this PR *except* that one
change, so it answers the question that matters for a set of overlapping caches: what does this still buy
once the others are in place? Cumulative measurement would have credited whichever change
happened to be applied first.

| removed from the set | A | B | C |
|---|---:|---:|---:|
| shared parse cache — parse each file once per build, not once per analyzer | +387% | +250% | +126% |
| project filename index — walk each root once per build, not once per unresolved class | +303% | +448% | +3022% |
| per-file method map — collect a file's methods in one shallow pass | +26% | +9% | +8% |
| resolution memos — `resolveFile()` / `inspectFile()` are pure for a build | +9% | +14% | +11% |
| facade pre-filter — skip files that cannot define a facade before parsing | +7% | +8% | +10% |
| shallow class scan — stop descending into bodies to collect signatures | +3% | +2% | +1% |

Run-to-run drift, measured by repeating the full set first and last in every sweep, was 0.7%,
0.1% and 0.7% — so every row above is a real effect, including the small ones.

The two structural changes trade places by codebase: the parse cache leads on A, the filename
index leads on B, and on C the index is the difference between a two-minute build and a
four-second one. Neither is safe to drop on the evidence of one application. That is why they are here together.

## Behaviour

The gate is stronger than comparing node and edge counts. A harness serialises the entire
observable result of a build — the full graph, every subgraph, the tab manifest, the totals, the
unresolved-dispatch signal, and the entry-point tracer's complete edge list with types and
visibilities — and compares it byte-for-byte between `main` and this branch:

| | fixtures | A | B | C |
|---|---|---|---|---|
| dump size | 192 KB | 19.9 MB | 13.9 MB | 15.4 MB |
| subgraphs / traced edges | 14 / 0 | 537 / 3,536 | 358 / 1,968 | 404 / 1,269 |
| `main` vs branch | identical | identical | identical | identical |

Each arm was dumped twice as well, to show the comparison can detect anything at all and that a
build is deterministic to begin with. (Happy to push the harness somewhere if it is useful — it
is currently a scratch script, not part of this PR.)

**One deliberate exception**, where `main` was wrong. It has a regression test that fails on
`main` and passes here:

> **An anonymous class no longer shadows the method that contains it.** `loadClass()` collected
> methods by descending into method bodies, so `public function handle()` containing
> `return new class { public function handle() {} };` collected the anonymous one *last* and
> overwrote the real method. Tracing then walked the anonymous body and dropped the real
> method's entire call chain. `GraphBuilder`'s chain walk had the same blind spot from the other
> side: it could return that anonymous method as the outer class's own.

Neither shape occurs in the three applications above, which is why their output is unchanged.

One semantic that is deliberately *not* changed, but is now pinned by a test: where one file
declares the same method name twice, the **first** declaration still wins, matching the
stop-at-first-match traversal that was replaced. The natural way to build a method map — last
write wins — silently inverts it.

## Safety of the shared cache

This adds two pieces of process-wide state, so both are worth spelling out:

- **Sharing AST objects between analyzers is safe by inspection.** No visitor in `src/` returns a
  replacement node — every one returns `null` or a traversal-control int — and the `NameResolver`
  from #63 runs in additive mode. Brain reads the tree; it never rewrites it.
- **Keys are absolute paths**, so two projects analysed in one process cannot collide.
- **Watch mode and long-lived processes.** `ScanCommand::runScan()` builds a fresh
  `ProjectAnalyzer` per rescan, so every per-build memo really is per-build. The two static
  caches invalidate explicitly: the parse cache keys on mtime + size, and the filename index is
  cleared at the top of `analyze()` so a rescan sees files added since the last build.
- **`filemtime()` has one-second resolution**, so a same-size edit inside a single second — any
  single-character change — would collide with the cached entry's key. Files whose mtime is the
  current second are parsed from source and never cached, until their mtime settles into the
  past. That is the failure mode that would otherwise let watch mode serve a stale AST; it has a
  test that fails without the guard.
- The cache is bounded at 8,000 entries (oldest quarter evicted). A single build cannot reach it;
  it exists so a long editing session cannot accumulate superseded entries forever.
- One caveat worth knowing: code that drives `MethodTracer` directly, outside `analyze()`, in a
  long-lived process keeps whatever filename index the last build produced. `analyze()` callers
  are unaffected; anything else should call `ProjectFileIndex::clear()` between builds.

## Tests

New coverage: `PhpFileParserSharedCacheTest` (deduplication across instances, invalidation on
edit, the same-second race), `ProjectFileIndexTest` (directory precedence, nested files, misses,
and that `clear()` is what lets a new build see new files), `MethodTracerAnonymousClassTest` plus
two cases in `FindMethodNodeInChainTest` (the shadowing fix, and first-declaration-wins), and a
`FacadeAnalyzerTest` case pinning that the pre-filter is case-insensitive — `class X EXTENDS Y`
is valid PHP, and `str_contains` would have skipped it.

The 3 deprecation notices are pre-existing vendor tooling on PHP 8.5 (`pest-plugin-arch` calling
`ReflectionProperty::setAccessible()`), unrelated to this change.

## Method

Every arm is a fresh build with all build-scoped caches cleared, 1 warm-up plus 2–3 measured
iterations, median reported. Arms are interleaved and the reference arm is measured both first
and last in each sweep, so drift appears in the numbers instead of being assumed away. The
machine was shared, so the correctness claims rest on counts (parses, nodes, edges, byte-equal
dumps) and only the timings depend on load.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1672c75e4a83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.