# Issue

**Title:** FIX(pool): padding parsing, -p same with odd padding; rename ssq to rms

## Description

Part of #171.

1. **A padding type after a padding size was always rejected.** `last_size` was reset just before the check, so the test could never pass. `-p [BOUND] PAD [BOUND] PAD ...` now works:
   - a leading `BOUND` applies to all axes;
   - a `BOUND` after a size applies to that axis only;
   - missing per-axis values repeat the last one.

   A type that doesn't follow a size raises a clean `ParseError`.
2. **`-p same` with odd padding** failed with `ValueError: Padding length too large`. `spatial.pool` flattened the (low, high) pairs and then padded with `side='both'`. Padding is now passed as (low, high) pairs. `affine_conv` accepts per-dimension (low, high) padding for non-transposed convolutions and offsets the affine by the low side.
3. **`ssq` was renamed `rms`**, following review. It computes a root mean square, as before. `ssq` is still accepted as a deprecated alias that emits a `FutureWarning`, in both the CLI and `spatial.pool`.

**Docs:** a separate writer subagent updated `pool.md`:
- per-axis padding types;
- odd `same` padding;
- the obsolete warning removed;
- `rms`, with `ssq` noted as a deprecated alias.

**Tests:** the new `nitorch/tests/test_cli_pool.py` has 13 tests, and all pass.
- They cover the parser cases, the padding types (checked against `np.pad`), `-p same` with windows 2, 3 and 4 (shape and affine), and `rms` (checked against numpy).
- `ssq` gives the same result as `rms` and warns.
- The related tests also pass: `test_local_mean.py`, `test_cli_smooth.py` and `test_cli_inpaint.py`, 32 passed.

**Behaviour changes, including the Python API**
- `spatial.pool` now pads asymmetrically when the `same` padding is odd.
- `spatial.affine_conv` accepts (low, high) padding pairs.
- The pooling method is called `rms`. Using `ssq` warns.

**New issues noticed, not fixed** (added to #171):
- `affine_conv`'s offset `(K-1)/2 - P` ignores dilation.
- `bound='zeros'`/`'constant'` take the slower explicit-pad path; the results are the same.
- The generic `except` handler in `pool/cli.py` is commented out.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa6vBGMPWQMVRQtfkuf

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08a6b58c507f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.