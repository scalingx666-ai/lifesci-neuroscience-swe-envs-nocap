# Issue

**Title:** feat(lint): report pages that share a slugged stem

## Description

A page can disappear from search and nothing reports it.

Two pages whose filenames slug to the same stem are one node to `graph_analysis`, and one entry to
`graphrag`. Measured on a three-page vault holding `concepts/vector-search.md` ("The retrieval
technique") and `entities/vector-search.md` ("Pinecone (the product)"):

```
graphrag.build_index(vault)  ->  slugs ['embeddings', 'vector-search']
   'vector-search'           ->  'Pinecone (the product)'  entities/vector-search.md
```

`concepts/vector-search.md` is absent from the index that `memory_search` and `graph-query` read. The same merge runs through `god_nodes`, `detect_communities`,
`betweenness_centrality` / `bridge_pages`, `shortest_path`, `neighborhood` and `_insights.md`.

`duplicate_titles` does not cover it, because it keys on the `title:` value while identity keys on
the stem — the two pages above have different titles.

## Where the collision comes from

`graph_analysis._page_slug(path, root)` returns `_slug(path.stem)` (`graph_analysis.py:64-65`), so
identity is the slugged filename. `write_page` builds `f"{_slug(category)}/{_slug(title)}.md"`
(`server.py:77`); `category` is a required parameter of `write_page` (`server.py:69`), exposed as the
`memory_write` MCP tool (`server.py:160`) and over HTTP, where `PageWrite` defaults it to `concepts`
(`server.py:141`).

Two `write_page` calls into a fresh vault, nothing else:

```python
write_page("Vector Search", "concepts", "The technique.")
write_page("vector-search", "entities", "The Pinecone product.")
```

```
files written      concepts/vector-search.md   entities/vector-search.md   log.md
graph              2 pages -> 1 node  ['vector-search']       (root log.md is graph-excluded)
duplicate_titles   []
duplicate_stems    [{'stem': 'vector-search',
                     'pages': ['concepts/vector-search.md', 'entities/vector-search.md']}]
```

A hand-authored vault reaches it too: `Vector Search.md` beside `vector-search.md` slugs to one stem,
in one folder or two.

## The change

Build a stem index over `graph_analysis.iter_pages` using `graph_analysis._page_slug`, and report
stems holding more than one page. Both are borrowed from that module rather than reimplemented, so
the report keys as the merge does. It reads pages rather than links, so a collision nothing
references is still reported.

Severity is `warn`, beside `duplicate_titles`. **Migration:** a vault carrying a collision moves
`pass` → `warn`, so `obsidian-wiki lint` stays exit 0 while `obsidian-wiki lint --strict` becomes
exit 1. If you run `--strict` in CI, an existing collision will surface there on upgrade.

Six tests in `tests/test_lint.py`. Suite: **687 passed, 5 skipped (681 before, +6 new)**. Each test
fails against unpatched `lint.py`. Mutants run at the call sites this patch adds, all caught:
dropping either sort; `> 1` → `> 0`; `iter_graph_pages` → a raw `rglob`; the borrowed slug → a raw
`Path.stem`; the borrowed slug → `stem.lower()`; restricting to different folders; and removing the
key from the `warn` tuple.

## Two things worth your call rather than mine

**`_bootstrap/` becomes visible to this one check.** `lint.SKIP_DIRS` (`lint.py:19`) skips
`_bootstrap` and `.git`; `graph_analysis.SKIP_DIRS` skips `_meta` and `_readouts` instead. Borrowing
the graph's selection is what makes the report match the merge, but it does mean a collision *inside*
`_bootstrap/` is now reported, and `test_lint_excludes_bootstrap_scaffolding_from_page_health`
(`tests/test_trust.py:840`) exists because you wanted that directory out of page health. That test
still passes — its one file has a unique stem — so this is a question rather than a breakage: keep
the graph's selection, or intersect it with `lint.SKIP_DIRS` and lose collisions that the graph does
merge. One line either way; I did not want to pick it quietly.

**`lint`'s own `by_slug` is stem-keyed too** (`lint.py:214`), so a collision the graph excludes — two
pages inside `_meta/`, say — can still absorb one page's in-links into the other and affect
`orphan_pages`. This patch does not touch that, and does not report it.

## What I did not change

- **Page identity.** Making `_page_slug` path-aware would change what `[[name]]` resolves to and what
  a stored `_insights.md` snapshot means. This reports the condition instead of deciding it.
- **`.skills/wiki-lint/SKILL.md`**, which enumerates the checks. #177 is open on that file's
  divergence from `lint.py`, so I left it alone — with the consequence that an agent running the
  skill will not surface this finding until the spec catches up.
- **Link collection.** #176 and #177 concern `_parse_page`'s wikilink harvest; this check reads no
  links.

`wiki-dedup` is the neighboring tool and does not overlap: it scores candidates on title similarity,
and it exists to *merge* pages that are the same concept. The case here is two pages that are
legitimately different and should stay separate while the graph merges them anyway. Its own
`node_id` is the vault-relative path, which is the identity this check is pointing at.

## Limits

`write_page` was executed with `fastapi`, `pydantic` and `mcp` stubbed — it imports none of them, but
the server was not run for real. The vaults above were constructed; I have not seen this in a vault
of yours, and it does not need observing: two `memory_write` calls with different categories produce
it mechanically. On Python 3.12 the page-ordering half of one test may be satisfied by the walk order
rather than by the sort; the assertion holds either way, and I ran 3.9, 3.11 and 3.14.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37596cffeef4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.