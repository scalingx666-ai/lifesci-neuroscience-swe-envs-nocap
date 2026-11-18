# Issue

**Title:** feat(graphrag): graph-index query pre-pass eliminates speculative page reads

## Description

## Summary

- `obsidian-wiki graph-query <vault> "<question>"` — queries a compiled index of vault frontmatter + wikilinks before opening any page bodies
- **Ranking**: title/tag/summary match + degree bonus + tier weight (`core` > `supporting` > `peripheral`)
- **`should_read`**: 1–3 pages that are actually worth opening, instead of speculative 5–10 page reads
- **`index_only: true`**: when the top candidate has an exact title match + non-empty summary, the answer is in the index — zero page reads needed
- **Multi-hop path**: for "how is X connected to Y?" queries, BFS finds the shortest wikilink path
- **Query classification**: routes `direct`, `path`, `gap`, and `list` queries differently
- `wiki-query` SKILL.md updated with Step 0: run `graph-query` first, use `should_read` shortlist, skip page reads when `index_only: true`

## Test plan

- [ ] `python3 -m pytest tests/ -q` → 144 tests pass
- [ ] `obsidian-wiki graph-query <vault> "what do I know about X" --pretty` returns ranked candidates and should_read
- [ ] `obsidian-wiki graph-query <vault> "how is X connected to Y" --pretty` returns a path
- [ ] Exact title match with summary → `index_only: true`, `should_read: []`
- [ ] Test on st3ve

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0221e0db9aaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.