# Issue

**Title:** refactor: shared vault walker, frontmatter splitter, and SKIP_DIRS base

## Description

Part of #238.

## What
New `obsidian_wiki/vault.py`: `split_frontmatter`, `FRONTMATTER_RE` (CRLF-tolerant), base `SKIP_DIRS`, `okignore_patterns` / `okignored` (moved from `graph_analysis`, which still re-exports them), and `iter_md(vault, skip_dirs)`.

Migrated: `lint`, `trust`, `context_pack`, `memory`, `graph_analysis`, `server.status`. Each module keeps its own extras on top of the base set (`_bootstrap` for lint/trust, `_readouts` for context-pack, `_meta`/`_readouts` for memory and graph), because those differences are intentional.

## Behaviour change
`context-pack`, `memory` and `server status` now honor `.okignore`. Before, they were the only walkers that ignored it. `tests/test_vault.py` pins that all five walkers see the same page set, and it fails on `main`.

## Deliberately not in this PR
- **Frontmatter value parsers.** They return different shapes (tuple / list / str) and handle comments and block scalars differently, so merging them is a behaviour change for every caller. Better as a follow-up.
- **`ast_extractor` / `batch` SKIP_DIRS.** These walk source-code trees, not vault pages, so they are a separate domain.
- **`staging.py`.** It walks the staging root, not the vault.
- **CRLF.** The divergence was latent: every reader uses `read_text()`, which already translates newlines. Everything now shares one regex anyway.

Test suite matches `main`. The only failure is the pre-existing `test_documented_env_vars_are_the_ones_the_code_reads` (`WIKI_RECAP_DEBUG`), which also fails on `main`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c76bc67162dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.