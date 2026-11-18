# Issue

**Title:** fix(tests): isolate CLI subprocess tests, and actually run the suite in CI

## Description

. The 12 test failures I flagged there turned out to be **two test-harness isolation bugs**, not product bugs — and the reason they went unnoticed is that **the test suite has never run in CI**.

## 1. Tests were exercising the wrong package

18 test files spawn `python -m obsidian_wiki.cli` as a subprocess. Each builds its env from `os.environ.copy()` and none set `PYTHONPATH`, so `sys.path[0]` was the subprocess cwd. Any test running from a temp dir imported whatever `obsidian_wiki` happened to be **pip-installed globally**, not the working tree.

On my machine that's a stale build predating the `code-understand` subcommand:

```console
$ cd /tmp && python3 -c "import obsidian_wiki; print(obsidian_wiki.__file__)"
/opt/homebrew/lib/python3.14/site-packages/obsidian_wiki/__init__.py

$ cd /tmp && python3 -m obsidian_wiki.cli code-understand --help
obsidian-wiki: error: argument command: invalid choice: 'code-understand'
  (choose from 'setup', 'list', 'info')
```

That killed all 8 `test_code_understand_cli` tests at argparse (exit 2) plus 4 in `test_context_pack_cli`.

Fixed with one autouse session fixture in `tests/conftest.py`, which covers every helper at once since they all copy `os.environ`. (`test_lint._run_at` already pinned `PYTHONPATH` by hand — someone hit this before and patched a single call site.)

This is the more dangerous half: today it fails loudly, but a *subtly* stale install would fail quietly or pass falsely.

## 2. A developer's `.env` was leaking into config resolution

`test_lint._run` and `test_context_pack.run_cli` inherited pytest's cwd (the repo). Config resolution walks up from cwd looking for `.env`, found the developer's own untracked one at the repo root, and pointed the run at their **real vault** instead of the fixture:

```console
E  AssertionError: assert 'auth.md' in '...Included 3 of 10 candidate pages; dropped 7 for budget.'
```

Ten candidate pages, from a fixture vault containing exactly one file. Both helpers now run from the fake `HOME`.

This is why the failure count differed between my machine (12) and a clean clone (4).

## 3. Root cause of the drift: no pytest in CI

The three workflows run `setup.sh`, the wheel publish, and the README-sync checker. Nothing ran `tests/`, and there's no pytest config in `pyproject.toml`. CI was "green" because the suite was never executed.

Adds `.github/workflows/tests.yml` running pytest on PRs and pushes to main, matrixed over 3.9 (the `requires-python` floor) and 3.12.

## Verification

```console
$ python3 -m pytest tests/ -q
566 passed, 1 skipped, 19 subtests passed
```

Was 554 passed / 12 failed. Confirmed the fix isn't just masking failures:

- **Sabotage check** — reverting the config resolver's legacy branch to `if False:` makes `test_xdg_config_location` fail as expected, so the tests genuinely exercise repo code now.
- **Clean-interpreter check** — the full suite passes in a fresh 3.13 venv with `obsidian_wiki` *not installed at all*, proving `PYTHONPATH` is doing the work rather than a happens-to-be-current global install.

## Also

Drops the stale `"""...RED by design: the command does not exist yet..."""` docstring in `test_code_understand_cli.py` — that wiring landed in fd30720, in the same commit that added the tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77d74e026172`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.