# Issue

**Title:** fix(cli): read and write text with an explicit UTF-8 encoding

## Description

.

`pathlib.read_text()`, `write_text()` and `open()` without `encoding=` use the locale default. On a Chinese Windows install that is GBK, so a UTF-8 global config holding a non-ASCII comment crashed every command that resolves the vault path.

## Scope

The report names four lines in `cli.py`. The same fallback sits at 13 call sites, and two more of them are reachable on that platform:

- `cli.py` — the reported config read/write paths, plus `scaffold_vault()`, whose `hot.md` template carries an em dash. Setup crashes on a fresh vault before the user gets as far as `info`.
- `scripts/manifest.py` — `load_manifest()` and the normalize write. A manifest with a non-ASCII source key, which #216 shows is ordinary, fails to load.
- `sync.py` — the `.gitignore` write. ASCII content today, fixed for consistency.

Left alone: the multi-line `write_text(` calls in `cache.py` and `session_graph.py` already pass `encoding="utf-8"` on a continuation line.

## Test

`tests/test_text_io_encoding.py` walks the AST of `obsidian_wiki/`, `scripts/` and `tools/` and fails on any `read_text`/`write_text`/non-binary `open` that omits `encoding=`. Static rather than behavioural because the crash needs a non-UTF-8 locale, which CI does not have — a runtime test would pass with or without the fix. Reverting the three source files makes it list all 13 sites.

## Verified

Reproduced on a Linux box under `PYTHONCOERCECLOCALE=0 PYTHONUTF8=0 LC_ALL=C`, which gives an ASCII locale encoding and the same failure:

```console
$ obsidian-wiki info            # before
UnicodeDecodeError: 'ascii' codec can't decode byte 0xe6 in position 2

$ obsidian-wiki info            # after
✅ (prints normally)
```

Also under that locale, after the fix:

- `setup` rewrote the config and left the Chinese comment and an unmanaged `OBSIDIAN_LINK_FORMAT` key byte-for-byte intact.
- `hot.md` came out with its em dash: `- [...] INIT — vault created at ...`
- `manifest.py normalize` loaded and rewrote a manifest keyed `Raw/DUCKDB数据库（上）.md`.

Suite: 728 passed, 4 skipped.

## Not in this PR

`✅`, `⚠️` and `🔥` have no GBK encoding, so redirecting a command's output to a file on Chinese Windows will still raise `UnicodeEncodeError` — a different surface (stdout, not file I/O) with a different fix. Filed separately. `PYTHONUTF8=1` covers both, as @sxwuleilei found.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a9232f82dc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.