# Issue

**Title:** fix(ci): Restore green Validation CI under ruff 0.16 + add ruff to pre-commit

## Description

**Disclaimer**: done with claude code and diff eyeballed by me.  Among alternatives we had just to pin ruff to prior version with less checks but I decided that we better address them while at it!

<!-- markdownlint-disable MD001 MD041 -->
## Summary

The [`Validation` workflow](https://github.com/bids-standard/bids-specification/actions/workflows/validation.yml) has been red on **every push, PR, and merge since 2026-07-23**. The failure is in the `python-style` job's `uvx ruff format --diff` step, and it's a rot introduced by **ruff 0.16.0 breaking changes**, not by any BIDS PR.

- Last green master run: 2026-07-20 (4523097).
- First red master run: 2026-07-28 (5b2cf70, PR #2479 was merged with `python-style` red).
- Root cause: [ruff 0.16.0 release, 2026-07-23](https://github.com/astral-sh/ruff/releases/tag/0.16.0).

Two independent breaking changes in ruff 0.16:

1. **`ruff format` now formats Python code blocks inside Markdown files by default.** `macros_doc.md` documents Jinja2 macro syntax inside <code>```python</code> fenced blocks, which ruff tries to re-indent as Python. This is the visible failure.
2. **`ruff check`'s default rule set expanded from 59 to 413 rules.** Twenty-two additional lint violations surface across `tools/` and `pdf_build_src/`. They were hidden until now because `ruff format` fails first and short-circuits the job.

<details><summary>Which PRs are affected (they are not the cause; ruff is)</summary>

All open PRs since 2026-07-23 have a red `python-style` check for this reason. Confirmed rerunning against several PRs picks up the same ruff 0.16.x and fails identically. Once this lands on master, rebases / retriggers of those PRs should go green.

</details>

## Changes

- Retag the four Jinja2 examples in `macros_doc.md` as <code>```jinja</code> rather than <code>```python</code> — they are macro calls, not Python. This addresses issue (1) properly rather than pinning ruff or excluding `*.md` from the formatter.
- Apply `ruff check --fix` + `--unsafe-fixes` for the 34 auto-fixable violations across `tools/` and `pdf_build_src/` (import ordering, f-strings, `OSError` alias for `IOError`, unused `noqa`, `set()`/`dict()` literals, `sorted()` redundant `list()`, implicit `Optional` → `X | None`, `_`-prefix for unused unpacks, `datetime.fromisoformat` handles `Z` natively in 3.11+, assert-with-print, dict `.items()`, mutable default argument).
- Manual fixes for the 9 residual violations with no auto-fix:

<details><summary>Detail of manual fixes</summary>

| File                                | Rule       | Change                                                                                    |
| ----------------------------------- | ---------- | ----------------------------------------------------------------------------------------- |
| `tools/add_contributors.py:156`     | `B015`     | `contributions is None` → `contributions = None` (was a no-op — real bug, meant assignment) |
| `pdf_build_src/pandoc_script.py:80` | `PLW1510`  | Add explicit `check=False` to `subprocess.run(cmd)`                                       |
| `pdf_build_src/process_markdowns.py:89` | `DTZ002` | `datetime.today()` → `datetime.now().astimezone()`                                       |
| `tools/add_contributors.py:264`     | `PLR1704`  | Rename inner context manager var to avoid shadowing `tributors_file` parameter            |
| `tools/add_contributors.py:288`     | `PLC0206`  | `for key in d:` + `d[key]` → `for key, value in d.items():`                               |
| `tools/add_contributors.py:590`     | `SIM102`   | Combine nested `if` + walrus into a single `if` with `and`                                |
| `tools/make_changelog.py:165`       | `ASYNC230` | `# noqa: ASYNC230` on the one-shot sync `open()` at end of async `main()` — not a hot path |
| `tools/no-bad-latin.py:132`         | `B008`     | Move `os.path.join(ABSOLUTE_HERE, "src")` into module-level `DEFAULT_SRC_DIR`             |
| `tools/no-bad-latin.py:165`         | `TRY002`   | `raise Exception(...)` → `raise RuntimeError(...)`                                        |

</details>

Test-touching change worth flagging: the `ISC004` fix in `tools/schemacode/src/bidsschematools/tests/test_validator.py` adds parens around an implicit string concatenation (was likely a missing-comma-looks-like-a-bug pattern — the strings were meant to be one long path, and now that intent is explicit).

## Test plan

- [x] `uvx ruff format --diff` locally on the resulting tree → clean (122 files already formatted).
- [x] `uvx ruff check` locally on the resulting tree → clean.
- [x] `pytest tools/schemacode/src/bidsschematools/tests/test_validator.py` → 22 passed.
- [x] CI on this PR — `python-style` job to go green.
- [x] Review rendered site around those spots where we changed spec from python to jinja for macros invocations etc
- [ ] After merge, other open PRs' `python-style` should also go green once rebased.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b2cf70bac4a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.