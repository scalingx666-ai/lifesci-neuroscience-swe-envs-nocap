# Issue

**Title:** feat: add wiki-narrate skill

## Description

## Summary
- Adds `wiki-narrate`, the output/render layer proposed in #104: renders a selected vault slice into a readout in a chosen voice, under a closed-set citation rule (every factual sentence next to a `[[vault page]]`, connective tissue marked `^[inferred]`, conflicts marked `^[ambiguous]`)
- First-release voice set is `briefing` (default), `plain-language`, `lecturer` — defined in `.skills/wiki-narrate/references/voices.md`; unsupported voice names return a validation error without searching or writing
- Readouts save to `_readouts/` (excluded from `cross-linker`, `wiki-export`, and `wiki-lint` scans, same convention as `_raw`/`_archives`) — derived views stay out of the knowledge graph and `index.md`
- Routes through the skill table in `AGENTS.md` / `README.md`; no edits to existing skill behavior beyond the `_readouts/` exclusion

## Test plan
- [x] `tests/test_wiki_narrate_docs.py` enforces the closed voice set and doc contract
- [x] Manual smoke test against a real 30+ page vault: ran the `briefing` voice on a real topic, verified every factual sentence carried an adjacent `[[wikilink]]`, the one connective sentence was marked `^[inferred]`, `--save` wrote `_readouts/<slug>.md` with the documented frontmatter, and the `WIKI_NARRATE` event + `hot.md` refresh matched the logging contract (`index.md`/`.manifest.json` untouched)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2cc64265e521`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.