# Issue

**Title:** Stop re-deriving whether a file has a rules() method

## Description

## What

`hasNonAbstractRulesMethod()` answers one question about one file: does it declare a concrete
`rules()`. The graph builder asks it while classifying call-chain edges and while wiring Form
Requests onto route actions, so the same file is asked about once per edge that reaches it.

The parse is already shared, but the traversal that looks for `rules()` was not. Worse, it is a
traversal with no early exit in the common case: `STOP_TRAVERSAL` fires only when a method named
`rules` is found, so for the great majority of files, which have none, it descends through every
method body, every expression and every argument before returning nothing.

Measured over three applications:

| application | calls | distinct files asked about | repeats | time inside it |
|---|---:|---:|---:|---:|
| A | 3,936 | 370 | 3,566 | 538 ms |
| B | 1,116 | 345 | 771 | 246 ms |
| C | 604 | 142 | 462 | 183 ms |

Between 76% and 91% of the calls re-derive an answer already derived for that exact file.

This remembers the verdict, keyed on path + mtime + size — the same identity `PhpFileParser` keys
its shared cache on, including its rule for a file whose mtime is not yet in the past. Such a file
can change again without changing its key, so it is answered from source and not remembered.

## Cost

| application | scan before | scan after | |
|---|---:|---:|---|
| A | 2,694 ms | 2,173 ms | **−19%** |
| B | 1,775 ms | 1,557 ms | −12% |
| C | 3,278 ms | 3,175 ms | −3% |

Medians of four runs with both arms interleaved in one session, each arm a separate checkout.
Nothing else about a scan changes: parse counts are identical, since the parses were already
shared and it is the walking that stops.

C is the honest disappointment. 183 ms of its scan is spent in this method and about three
quarters of that is recoverable, but its scan is 3.3 s — the gain is small enough that one of the
four reps had the patched arm come out slower. Take the instrumented 183 ms as the real figure
there and the −3% as being at the edge of what this machine can resolve. Most of C's scan is
still facade scanning; on a branch with #80 applied, where that is gone, the same change is worth
−13%. The two are independent and compose.

## Where this came from

Profiling a scan by phase, with the nested `views` step subtracted from `graph` and the work that
falls outside every step reported separately, `graph` is 25–47% of a scan while accounting for 39
to 93 parses. A phase that expensive doing almost no file reading is doing something repeatedly in
memory, and this was it.

## Gate

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is
**byte-identical on all three applications**. A memo that returns a stale answer would change the
graph, so byte-identical output on 7,169 files is the evidence that matters here.

## Tests

`213 passed (754 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Three new, mirroring `PhpFileParserSharedCacheTest` one for one, and all about what caching can
get wrong rather than what it speeds up:

- the verdict changes once the file changes
- a file whose mtime is still in the future is not remembered at all
- a *false* verdict is remembered, not only a true one

The third is the one worth explaining. The memo stores booleans and the usual answer is false, so
a membership test that read a stored false as absent would still be correct — it would just
re-derive everything and hand back the entire saving without failing anything.

Both versions of the file in each test are written to the same byte length on purpose. The key is
path + mtime + size, so a size that moved with the content would let a broken key still pass. Each
test was checked by breaking the thing it guards: the first fails if the key drops mtime, the
second if the unsettled-file check goes, the third if the membership test treats false as absent.

## Bounds

The memo is capped at 8,000 entries with the oldest quarter evicted in one pass, which is how
`PhpFileParser` bounds the cache this one is keyed like. No build comes close — the most any of
these applications asks about is 370 distinct files, and an extractor lives exactly one build,
since `ScanCommand` constructs a `ProjectAnalyzer` per rescan. The cap is for the design
`IncrementalAnalyzer` describes, where a builder is kept across rescans and every edit mints a key
whose superseded entry would otherwise stay for the life of the process.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05a31095910`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.