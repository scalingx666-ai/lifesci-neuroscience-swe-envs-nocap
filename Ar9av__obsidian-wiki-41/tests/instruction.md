# Issue

**Title:** feat: add wiki-digest skill — periodic knowledge newsletter

## Description

## What & Why

The wiki had a gap: no way to answer "what did I learn this week?" in a human-readable form. Existing skills cover adjacent territory but not this:

| Skill | Answers |
|---|---|
| `wiki-status` | What *sources* are pending ingestion? |
| `hot.md` | What happened in the last session? (machine-readable) |
| `log.md` | Raw audit trail of all operations |
| **`wiki-digest` (new)** | What *knowledge* was gained/updated in a period? |

## What the skill does

Triggered by `/wiki-digest`, "what did I learn this week", "weekly summary", "knowledge report", etc.

1. **Collects active pages** — scans all vault pages for `created`/`updated` within the period (day/week/month, default 7 days)
2. **Identifies themes** — top tags from active pages, flags new vocabulary not yet in `_meta/taxonomy.md`
3. **Surfaces new connections** — cross-category wikilinks formed this period, scored by interestingness (hub proximity, inferred markers, cross-domain bridges)
4. **Reports open threads** — draft pages, `^[ambiguous]` claim counts, `_raw/` files, taxonomy gaps
5. **Recommends re-reads** — pre-period pages worth revisiting because new content extends them
6. **Generates a digest** with Headlines, New Knowledge table, Themes, Key Connections, Open Threads, Recommended Re-reads
7. **Optionally saves** to `journal/digest-YYYY-MM-DD.md` + logs to `log.md`
8. **Respects `visibility/`** — `pii` pages omitted from output unless user explicitly asks

## Sample output structure

```markdown
# Wiki Digest — Week of 2026-05-05
> 8 new pages · 3 updated pages · 2026-04-28 to 2026-05-05

## Headlines
- [Synthesized insight, not just a page list]
- ...

## New Knowledge
### New pages (8) | table |
### Notable updates (3) | table |

## Emerging Themes
- #transformers (5 pages) — ...
- #[NEW TAG] (2 pages) ⭐ New vocabulary

## Key Connections Made
- [[concepts/A]] → [[entities/B]] — plain-English reason

## Open Threads
- Drafts to compile: 2 pages
- 4 ^[ambiguous] markers across 3 pages

## Recommended Re-reads
- [[concepts/X]] — 3 new pages this week all extend it
```

## Changes
- `.skills/wiki-digest/SKILL.md` — full skill spec (211 lines)
- Symlinks in all 5 mirror dirs (`.agents`, `.claude`, `.cursor`, `.windsurf`, `.kiro`)
- `AGENTS.md` routing table updated with trigger phrases

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e8461668c39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.