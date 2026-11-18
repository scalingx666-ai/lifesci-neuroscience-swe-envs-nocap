# Issue

**Title:** fix(lint): skip tool-owned directories in every vault page walker

## Description

## Problem

The setup that surfaced this: **my vault that is itself a uv project.** The vault's `pyproject.toml` pins the toolchain used to maintain it — `obsidian-wiki` itself, plus the PDF and OCR libraries the ingest path needs — so that a single `uv sync` puts every conversion step on the same versions instead of whatever happens to be on `PATH`. `uv` installs that tree into `<vault>/.venv/`.

Keeping the vault's own toolchain next to the vault is a supported way to run a project-vault, and it is exactly what broke lint: **the tool's dependency tree was reported as the vault's content.** A first `lint` run after `uv sync` failed on missing frontmatter, and a meaningful share of the "pages" it complained about were license and README markdown files shipped inside installed dependencies.

The root cause is that four vault page walkers — `lint._iter_pages`, `graph_analysis.is_wiki_page`, `trust.iter_trust_pages`, and `context_pack.load_pages` — decided what counts as a page by testing each path component against an explicit `SKIP_DIRS` list. None of the four lists contained `.venv`, and none applied any dot-directory rule.

The same repository already solved this correctly in two other walkers — `batch.py:153` and `ast_extractor.py:342` both filter with `d not in SKIP_DIRS and not d.startswith(".")`. These four were the outliers.

Any vault that is a uv project reproduces it, because the resulting `.venv/` turns every dependency that ships a `LICENSE.md` or `README.md` into a "page", and:

- `missing_frontmatter` fails the run on files nobody wrote
- `duplicate_stems`, `duplicate_titles`, and `orphan_pages` gain fake entries — a dependency's `LICENSE.md` collides with its own vendored copy
- because CI diffs findings as a baseline, this is not a transient blip but a stable failure that reappears on every run until someone deletes their venv

The failure mode is worse than the noise suggests: an author who cannot get a green lint without deleting their venv will stop reading the check, and the same pages also reach the trust ledger and context packs (`trust-record`, `context-pack`).

## Change

All four vault page walkers now skip any path component that starts with `.`, and the explicit lists gain the non-hidden dependency trees.

| File | Walker | What |
|---|---|---|
| `obsidian_wiki/lint.py` | `_iter_pages` | `SKIP_DIRS` gains `venv node_modules __pycache__`; dot-prefixed components skipped |
| `obsidian_wiki/graph_analysis.py` | `is_wiki_page` | shared `SKIP_DIRS` gains `.git venv node_modules __pycache__`; dot-prefixed components skipped |
| `obsidian_wiki/trust.py` | `iter_trust_pages` | `TRUST_SKIP_DIRS` gains `venv node_modules __pycache__`; dot-prefixed components skipped |
| `obsidian_wiki/context_pack.py` | `load_pages` | `SKIP_DIRS` gains `venv node_modules __pycache__`; dot-prefixed components skipped |

`trust` and `context_pack` are the same bug in the same shape, just reachable from `obsidian-wiki trust-record` and `obsidian-wiki context-pack` rather than from lint: the trust ledger would record reviews for dependency READMEs (and churn its entries on every dependency upgrade), and a context pack would spend a token budget on them.

Two deliberate calls:

- **The dot rule covers every component, including the filename.** A page literally named `.foo.md` is skipped too. Dot-named entries in a vault are tool-owned — `.obsidian`, `.git`, `.venv`, `.trash`, `.stversions`, `.smart-env` — so treating the whole namespace as non-knowledge is the consistent reading, and it is what `batch.py`/`ast_extractor.py` already do.
- **`.git` is added to `graph_analysis`'s shared list.** It was the one copy missing it, while `lint.py`, `trust.py`, and `context_pack.py` all had it, so the walkers disagreed about the same vault.

No docs change: the skipped-directory list is not documented anywhere in `docs/` (checked), and nothing user-facing in `README.md` moves — so the `README_TW.md` translation-parity check is unaffected.

## Verification

Measured on the vault from the Problem section, before (this commit's parent, checked out in a throwaway worktree) and after (this commit), with the same `obsidian-wiki lint <vault> --json`. Pages went from 195 to 184 — exactly the 11 markdown files under `.venv` — and 57 finding entries disappeared with none added, all of them under `.venv`. `link_count`, `broken_links`, and `typed_relationship_issues` are unchanged, so no real page or link left the graph. The vault still fails lint on its own pre-existing backlog, which this change does not touch.

Tests: 843 passed, 4 skipped. One regression test per walker, each confirmed to fail against the pre-fix source.

Also minor: the explicit `.obsidian`/`.git` entries in these lists are now redundant, since the dot rule covers them. Kept, because they document intent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca850937f52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.