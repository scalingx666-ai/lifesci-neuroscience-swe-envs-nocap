# Issue

**Title:** FIX(cli): shared pop_values helper for hand-written parsers (vopt, affopt, autoreg, crop, pad, extract_patches)

## Description

Part of #171. This PR now follows your review: one general fix instead of command-specific ones.
- Commands that use `CommandParser` get the fix for unknown options and invalid choices from #233.
- This PR covers the hand-written `args.pop(0)` parsers, through one shared helper.

**Helper (`nitorch/core/cli.py`):** `pop_values(args, opt, n=1, convert=None, names=None, nmin=None, istag=istag)`.
- **Popping:** it pops values from the front of `args`, in place. `opt` is a tag or a tuple of tags, joined as `-o/--output`.
- **Missing values:** if fewer than `n` values remain, or the next argument is a tag, it raises a `ParseError`:
  - `-o/--output expects 1 value: <path>`;
  - `-i/--input expects 3 values: <fix> <mov> <path>`.
- **Conversion:** if `convert` fails, it raises `-a/--absolute expects <float>, got 'abc'`.
- **Value names:** `names` names each value in the message. When it is omitted, the name is `<float>`, `<int>` or `<value>`, depending on `convert`.
- **Optional extras:** `nmin` makes the values beyond `nmin` optional. No migrated parser needs it yet.
- **Tag rule:** `istag` can be replaced; autoreg passes its own rule.
- **Values:** with the core `istag` rule, `-`, `-1`, `-.5` and `-inf` are values.
- **Placement:** the helper sits away from `CommandParser`, so it does not conflict with #233.

**Commands migrated.** For each, the accepted arguments are unchanged. Only cases that used to crash change: an `IndexError` "pop from empty list", a `ValueError` from `float()`/`int()`, or the next option silently taken as a value.
- **vopt:** the local `_pop` from the first version of this PR is replaced by the helper. `-l` still takes one value and an optional second.
- **affopt:** `-i` and `-o` use the helper. Before, a missing value crashed with "pop from empty list".
- **autoreg:** 22 call sites use the helper with autoreg's own tag rule, which still treats a lone `-` as a tag:
  - the required values: `-inter`, `-bnd`, `-f`, `-b`, `-t`, `-n`, `-init`, `-lr`, `-wd`, `-stop`, `-nit`, `-pad`, and LBFGS `-h`;
  - for the optional values (`-ls`, `-v`, `-gpu`), only the conversion goes through the helper;
  - `-n` still accepts `inf`;
  - autoreg's local `ParseError` is now an alias of the core one, so its handler still catches the helper's errors.
- **crop:** `-k`, and the optional float of `-b`.
- **pad:** `-k` and `-b`. The `_isfloat` workaround is gone, because the core `istag` already treats `-.5` and `-inf` as values.
- **extract_patches:** the positional `<file>`, and the integer values of `-n`/`-s`.
- **topup:** no change was needed. Its hand-written part calls `Option.parse`, which already raises a `ParseError`; its error wording is covered by #233.

**optinorm:** the `_OptinormParser` subclass and the custom `--affine` message are removed, and `optinorm/parser.py` matches master again. #233 fixes the same bugs in the shared parser, with `optinorm` tests. The tests that relied on the subclass are removed. `test_optinorm_valid_options_still_parse` is kept.

**Tests**
- The new `nitorch/tests/test_core_cli_pop_values.py` has 51 tests:
  - unit tests of the helper;
  - for each migrated command, error tests that run the command through `commands[x](...)` and check exit 1 plus a message naming the option;
  - tests that each command's accepted arguments are unchanged.
- All 24 per-command error tests fail on master's code, and the grammar tests pass there too.
- `pytest -k cli` gives 666 passed and 5 skipped on this branch, and nothing that passed before fails.

**Behaviour changes**
- A missing or garbled value now gives a `ParseError` that names the option, instead of an `IndexError`, a `ValueError`, or "Expected a value for tag X but found nothing."
- In `affopt` and `vopt`, a `<fix>`/`<mov>`/`<path>`/`<output>` value that starts with a dash and is not a number is now rejected as a tag.

**Docs:** none needed, because no command's arguments or help text changed.

**New bugs noticed, not fixed (added to #171):**
- Garbled values in variable-length loops still raise a `ValueError`: crop `-s`/`-c`, and autoreg `-p`, `-w`, `-l`, `-g`, the regularisation factors and `-pyr`.
- The leading factor of autoreg loss and transform groups (`float(opt.factor)`) also still crashes on a bad value.
- autoreg's `-exc`, `-sd`, `-z` and `-prg` use `bool(int(x))`, which crashes on words other than 0/1.
- autoreg's `check_next_isvalue` is now unused.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa6vBGMPWQMVRQtfkuf

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2141ad1178f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.