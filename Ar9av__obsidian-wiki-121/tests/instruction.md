# Issue

**Title:** feat(graph-analysis): wikilink graph analysis with community detection and god nodes

## Description

## Summary

- `obsidian-wiki graph-analyse <vault>` — pure-Python graph analysis of the vault's wikilink structure, no LLM, no API calls
- **God nodes**: pages ranked by total degree (in + out) — the load-bearing hubs
- **Community detection**: label-propagation (greedy, O(n·k), pure stdlib default) with optional Leiden upgrade via `obsidian-wiki[graph]` (leidenalg + igraph)
- **Surprising connections**: cross-community edges ranked by `1/sqrt(cross_deg_s × cross_deg_t)` — the most unexpected structural links
- **Dead ends** (0 outgoing) and **isolated** (0 links at all) page lists
- `wiki-status` SKILL.md insights mode updated to call `graph-analyse` first instead of building the link graph manually
- Optional `obsidian-wiki[graph]` extra wires in real Leiden algorithm

## Test plan

- [ ] `python3 -m pytest tests/ -q` → 80 tests pass
- [ ] `obsidian-wiki graph-analyse <vault> --pretty` on real vault outputs god_nodes, communities, surprising_connections
- [ ] Test on st3ve (Ubuntu): install + run on a synthetic vault

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46889cf83f95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.