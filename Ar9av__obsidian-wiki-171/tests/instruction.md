# Issue

**Title:** fix(cli): complete code-understanding config resolution and doctor hardening

## Description

## Summary

 (code-graph-assisted understanding). Three correctness/polish gaps from the merge review, plus a hint unification:

1. **Doctor warns when `.codegraph/` is not gitignored** — new `code-understanding.codegraph-gitignore` check (warn-only, as designed; no auto-edit). The sidecar stays a local disposable cache, not wiki knowledge.
2. **`code-understand` + doctor honor resolved config** (the main correctness fix) — `CODE_UNDERSTANDING_BACKEND` / `CODE_UNDERSTANDING_CODEGRAPH_BIN` now resolve through the same chain as `OBSIDIAN_VAULT_PATH`: `os.environ` (empty = unset) → nearest walk-up project `.env` → the global config → defaults (`auto`, none). Previously only `os.environ` was read, so a config-file backend or bin path was silently ignored; the bin path had no config fallback at all. `obsidian_wiki/code_understanding.py` is unchanged — the resolution layer lives in the CLI.
3. **`doctor --strict` no longer fails on optional missing CodeGraph** — under `auto`/unset backend, the missing binary is `info` (not `warn`), so strict stays green; an explicitly requested `codegraph` backend with a missing binary still fails.
4. **Unified doctor hints** — `codegraph-index` / `codegraph-fresh` hints now say `obsidian-wiki code-understand --project <project>` instead of leaking `codegraph index` internals (the provider itself decides init vs sync).

## Changes

| Commit | Change |
|---|---|
| `test(cli)` | RED anchors for all four changes (TDD contract) |
| `fix(cli)` | `doctor --strict` + optional CodeGraph → `info` |
| `feat(cli)` | `code-understanding.codegraph-gitignore` check |
| `fix(cli)` | config resolution chain in CLI + doctor |
| `refactor(cli)` | unified `obsidian-wiki code-understand` hints |
| `docs(configuration)` | document the resolution order |
| `docs(skills)` | list the `codegraph-gitignore` capability; document `CODE_UNDERSTANDING_*` resolution in `llm-wiki` |

## Rebase onto latest main

Rebased onto `upstream/main` (`8a7f6af`). Resolved the `.skills/llm-wiki/SKILL.md` conflict with #172/#173 (XDG-style global config dir) by keeping both sides and aligning the newly added resolution wording with the global-config-dir convention — no hardcoded `~/.obsidian-wiki/config` remains in the skill text, `docs/`, or the resolver docstring. The global config itself still honors the legacy `~/.obsidian-wiki` location via `_resolve_global_config_dir()`, so existing installs are unaffected.

## Verification

- Full suite: **662 passed, 4 skipped, 19 subtests passed** — fresh venv inside an isolated worktree whose ancestor chain contains no `.env`; CI pytest 3.9 / 3.12 both green after the rebase
- TDD RED→GREEN captured per change
- Manual QA on the real CLI: strict-green exit 0 with `info`; gitignore warn→pass flip; bin resolved from project `.env`; `--backend` flag beats `.env`; hint strings; `ℹ️` icon renders
- `code_understanding.py` byte-identical to base

### Note on repo-root `.env`

Running the suite from a checkout whose ancestor chain contains an untracked, gitignored `.env` left by local setup (it sets a real `OBSIDIAN_VAULT_PATH`) shows pre-existing failures (`test_context_pack_cli.py`, `test_lint.py`) — the context-pack/lint walk-up finds that `.env`. Reproduced identically on pristine `fcd9101` with the same `.env` present; the tests pass on this branch from any CWD without a `.env` ancestor. Unrelated to this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a7f6af8104a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.