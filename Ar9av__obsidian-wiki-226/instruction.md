# Issue

**Title:** fix(scripts): keep standalone script output ASCII

## Description

Partially addresses #219 — see that issue for why the main premise there was wrong.

`obsidian_wiki.cli.main()` calls `_configure_console_output()`, which sets `errors="replace"` on stdout and stderr, so the status emoji degrade to `?` on a non-UTF-8 console instead of crashing. That guard has been in place since #189.

`scripts/manifest.py` and `tools/check_readme_sync.py` are separate entry points that never reach it. Four printed em dashes are enough to break them:

```console
$ LC_ALL=C PYTHONUTF8=0 PYTHONCOERCECLOCALE=0 python3 scripts/manifest.py migrate <vault>
sources: 1 -> 1 (0 re-keyed, 0 collisions merged, 0 kept non-portable)
UnicodeEncodeError: 'ascii' codec can't encode character '—'
$ echo $?
1
```

The command had already finished its work; it crashed on the closing status line and exited 1. A caller checking the exit code sees a failed migration that in fact succeeded.

Swapped the four em dashes for hyphens. Giving each script its own console guard would work too, but `manifest.py` is a deliberately stdlib-only helper and an ASCII output contract is the smaller thing to maintain.

`tests/test_standalone_script_output_is_ascii.py` walks the AST of `scripts/` and `tools/` and fails on a non-ASCII character in any `print()` literal. Comments, docstrings and data are untouched. It fails on all four sites before the change.

## Verified

Under `LC_ALL=C PYTHONUTF8=0 PYTHONCOERCECLOCALE=0` (ASCII stdout, the same failure class as GBK):

- `manifest.py migrate` and `migrate --dry-run` both exit 0 and print their status lines.
- `check_readme_sync.py` exits 0.
- Suite: 849 passed, 4 skipped.

GBK itself encodes `—` fine, so this was never reachable on the console from #213. It bites an ASCII locale — `LC_ALL=C`, minimal containers, some CI runners.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29b810d2c995`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.