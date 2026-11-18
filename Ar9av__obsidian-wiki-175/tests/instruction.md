# Issue

**Title:** feat(graph): make the vault graph queryable , and stop routing paths through index.md

## Description

Makes the vault's wikilink graph a first-class, queryable surface — and fixes a
correctness bug in the query path that has been there all along.

## The bug

`graph-query` is the front door `wiki-query` calls first. It built its own graph
in `graphrag.py` — its own page selection, its own slug helper, its own BFS — and
that graph included `index.md`. Since the index links to every page, almost any
two pages looked ~2 hops apart:

```
owasp-agentic-quotes -> prismor-overview
before:  owasp-agentic-quotes -> index -> arnav -> prismor-overview
after:   owasp-agentic-quotes -> agentic-governance-maturity -> prismor -> arnav -> prismor-overview
```

On a 38-page vault, **52 of 630 page pairs (8%) routed through a bookkeeping file,
and 51 of those were shorter than the real path**, so BFS preferred the meaningless
one. The share grows with vault size. `graphrag` now shares `graph_analysis`'s page
selection and BFS, so there is one graph and one BFS in the codebase.

## What's new

**Graph algorithms** (`graph-analyse`), pure Python, package stays dependency-free:

| | |
|---|---|
| `bridges` | exact Brandes betweenness — the pages holding the vault together |
| `cohesion` | intra-cluster edge density per community; <0.15 flags fragmentation |
| `--path A B` | shortest wikilink chain between two pages |
| `--around P --depth N --direction in\|out\|both` | N-hop neighbourhood; `in` = blast radius |
| `--diff-against` / `--snapshot` | diff against a previous `_insights.md` snapshot |
| `suggested_questions` | from bridges, sink hubs, isolates, low-cohesion clusters |

**Structural questions in plain English** (`graph-query`), returned fully computed
in a new `graph` field (`null` for ordinary queries, so the response stays
backwards compatible):

```
impact      "what breaks if I delete X" / "what depends on X"
bridges     "which pages bridge my clusters" / "what would fragment my vault"
hubs        "what's central" / "top hubs" / "my main topics"
clusters    "what clusters do I have" / "how is my wiki organised"
surprising  "surprising connections" / "unexpected links"
```

`wiki-query` inherits all of it with no rewrite.

## Measured end-to-end

Claude Sonnet, headless, on a real 38-page vault, asking plain-English questions
with no graph definition supplied. 4 questions x 2 conditions x 2 reps, serial.

| | before | after |
|---|---|---|
| wall time | 81s | **19s** (4.4x) |
| accuracy | 44% | **83%** |
| agent turns | 9.9 | **4.6** |
| cost | $0.202 | $0.208 (unchanged) |

Per question — path 122s->18s, bridges 61s->12s, clusters 117s->21s, impact 26s->24s.

The accuracy gain is the bug being real: unaided, the model answered "3 hops" in
both path runs (routed through `index.md`) and returned `index` as a top-3 bridge.

Ground truth was verified against **networkx**, not against this implementation:
betweenness matches to 3.5e-18 across all nodes, all 630 shortest-path pairs agree,
blast radius and cohesion match exactly.

## Performance — only one intent is expensive

Measured per intent on a synthetic 5,000-page vault:

| intent | cold | warm |
|---|---|---|
| path / impact / hubs / clusters / surprising / ordinary lookup | 0.40–0.71s | same |
| **bridges** | **42.9s** | **0.98s** |

Betweenness is O(V·E) and the only expensive step (parsing 5,000 pages is 0.13s;
communities 0.03s). Intents are computed lazily, so nothing but `bridges` ever pays
for it. It is cached in `.graph-cache.json`, **keyed on the graph topology rather
than file mtimes** — so a stale hit is impossible by construction, and editing prose
without changing links keeps the cache warm. Running `graph-analyse` warms the same
cache, so a nightly `daily-update` removes the cold cost entirely.

Verified rather than assumed: exact on hit; link change invalidates; prose-only edit
does not; corrupt file → recompute and self-repair; read-only vault → no crash;
4 concurrent cold queries → valid file, no torn writes, no temp leaks; capped at
3 keys (110KB at 5,000 pages); **no cache file written below ~500 pages**.

Sampled betweenness (k pivots) was measured and rejected: 25–50x faster but only
60–90% top-10 overlap and wrong ordering even on a 38-page vault.

## Two things found along the way

- Iterating pages in sorted order (rather than filesystem order) makes results
  reproducible across machines, but exposed a latent flaw: a sequential
  label-propagation sweep collapsed a barbell graph into one community. Nodes are
  now visited in a seeded shuffle — deterministic over 20 runs, clusters survive.
- New vaults get `.graph-cache.json` in `.gitignore`. An existing `.gitignore` is
  the user's file and is left byte-identical — the command prints a tip instead,
  preserving the contract in `test_does_not_overwrite_existing_gitignore`.

## Risk

- **Zero regressions**: the same 17 pre-existing failures before and after; 629 pass.
- **+45 tests** covering page selection, fingerprinting, cache behaviour and every
  failure mode above, community determinism, intent routing, and structural answers.
- Each of the 4 commits passes tests independently.
- Behaviour change to be aware of: root `index.md` / `log.md` / `hot.md` /
  `_insights.md` are no longer indexed or returned as candidates. A nested
  `concepts/index.md` is still an ordinary page.

## Known limitations

- One benchmark run (path, rep 1) the model ignored the CLI, hand-grepped, and
  wrongly declared a page isolated; the tool had the correct answer. Mitigated by
  the `wiki-query` skill now telling the agent to trust the `graph` payload.
- "What breaks if I delete X" is genuinely ambiguous — 19 knowledge pages link in,
  20 if you count `index.md`, which really would have a broken link. This is the one
  question where the tool showed no time gain.
- Benchmark is n=2 per cell on one 38-page vault; scaling figures are from synthetic
  vaults.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea1633a8d418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.