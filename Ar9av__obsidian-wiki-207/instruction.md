# Issue

**Title:** fix(skills): parser-safe title/summary in canonical page template and server write_page

## Description

## Why

The canonical **Page Template** in `llm-wiki/SKILL.md` — the template every write skill follows (`wiki-ingest`: *"Use the page template from the llm-wiki skill"*) — showed `title:` and `summary:` as **bare YAML scalars**. Free-text values containing `": "` (colon + space), `"#"`, or quotes break YAML parsing: Obsidian then reports **"Invalid properties"** and hides the frontmatter.

This is not hypothetical. A real vault ingesting colon-heavy technical documentation ended up with **25 unparseable pages** from a single ingest pass — summaries like:

```yaml
summary: Inventario delle entità DB del WMS documentate nella guida SDM: inventory (Item/Sku/StockUnit/...), storage (locations/positions/operation points), handling (Task/TO), shipping (Shipment/LoadPlan).
```

The second `: ` makes the whole frontmatter block fail to parse.

## Prior art

- **#3** (merged) fixed this exact footgun, but only in `wiki-update/SKILL.md` (folded scalar `>-` + guidance). The canonical template every *other* write skill follows was left unguarded.
- **#2** (quoted variant, same day) was closed unmerged.
- **#103**'s OKF export now auto-repairs "an unquoted colon in `summary:`" at read time — treatment, not prevention.

This PR fixes the source.

## What's in it

- **`.skills/llm-wiki/SKILL.md`** — the Page Template (and the project-overview example) now emit `title`/`summary` as folded scalars (`>-`), with an explicit **Parser-safe scalars** paragraph matching wiki-update's merged guidance: a bare scalar containing `": "`, `"#"`, or quotes breaks YAML parsing, and the value stays indented under `title: >-` / `summary: >-`.
- **`obsidian_wiki/server.py`** — `write_page` emits `title`/`summary` via `json.dumps`. YAML 1.2 is a superset of JSON, so the emitted double-quoted scalar always parses, for any caller-supplied value (colons, `#`, embedded quotes). Empty `summary` still emits the bare `summary:` key.
- **`tests/test_server.py`** — regression test: writes a page whose title/summary contain `": "`, `"#"`, and quotes, then asserts both scalars round-trip through a JSON parse of the emitted value (a JSON parse of a `json.dumps` scalar proves valid YAML escaping and exact value survival). The existing round-trip assertion is updated to the quoted form.

## Validation

- `pytest tests/test_server.py` — **11 passed** (10 existing + 1 new), including the updated round-trip test.
- Full suite on this Windows machine has pre-existing environment failures (config/XDG tests); the failing-test list is **identical to a pristine `origin/main` worktree** — no regressions introduced.
- Hand-checked: a title/summary with `": "`, `"#"`, `"` emits `title: "Kafka: \"Rebalance\" #notes — offsets: 42"` and parses back to the exact original value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f268d437442a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.