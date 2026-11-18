# Issue

**Title:** Do not configure logging when pyprep is imported

## Description

Reverts pyprep's loud-by-default logging, which shipped in 0.8.0, and aligns the
`_logging` module with the design used by a few sibling projects.

**This is a breaking change.** Anyone who got `"INFO"` output for free by
importing pyprep 0.8.0 will now see only warnings and errors until they ask for
more.

### Why

0.8.0 called `setup_logging()` at import time, attaching a handler on
`sys.stdout` to the `pyprep` logger. That is a decision a library cannot make on
the application's behalf: it does not know whether the application wants stdout,
a file, JSON to an aggregator, or a Rich console. MNE does this, but MNE is the
exception people copy rather than the model.

No `NullHandler` goes in its place, deliberately, and this is *not* the old
"libraries should add a NullHandler" advice. A `NullHandler` satisfies the
handler search in `logging.Logger.callHandlers`, which stops
`logging.lastResort` from firing and would silently drop warnings and errors
instead of merely hiding `"INFO"`. So pyprep is now **quiet, but not silent**:
with no configuration at all, warnings and errors still reach `stderr`.
`tests/test_logging.py` enforces both properties from a clean interpreter.

### What changed

- Importing `pyprep` configures nothing. The `pyprep` logger sits at `NOTSET`
  with no handlers and `propagate = True`.
- New `pyprep.set_log_level(level, return_old_level=False)`, mirroring
  `mne.set_log_level`. It changes only the level, so an application that already
  routes pyprep's records through its own handlers can turn the package up
  without losing the stream, format and propagation it chose.
- `setup_logging(level="info", *, stream=None, fmt=DEFAULT_FORMAT)`: level names
  are accepted in any case, `stream` and the new `fmt` are keyword-only, the
  handler is always installed fresh on the given stream rather than reusing a
  previously installed one, and the configured logger is returned.
- The `propagate` argument is **removed**. It existed to undo the import-time
  configuration and hand the records to the application's handlers; with nothing
  configured on import, propagation is simply what happens when `setup_logging`
  is never called.
- The autouse test fixture that flipped `propagate` for the session is gone with
  the import-time call it worked around. `caplog` now works out of the box.

### Examples and RANSAC output

Examples execute on every docs build here, so their log output is published. All
three now call `pyprep.setup_logging("info")` themselves — `run_ransac.py`
configured nothing at all before — and keep `mne.set_log_level("warning")`.

That made two print-era artifacts in `pyprep/ransac.py` visible. Channel-wise
RANSAC emitted `logger.info(current)` once per chunk: a bare integer on its own
timestamped line, 94 of them in `run_ransac.py` alone, under a `"Current
chunk:"` header that only read as `print` output. It now reports the chunk size
and the number of chunks once, after the first chunk has proved the size fits in
memory. Two other messages carried embedded newlines that split each of them
across two log lines with an empty prefix.

In `run_ransac.py` the second RANSAC call alone published 94 bare-integer log
lines; the whole example now publishes 6 log lines in total.

### Also in here

- `removeTrend` logged an error for a `'local detrend'` step size larger than
  the window or smaller than one sample, then detrended with it anyway. It now
  raises.
- `get_bads`' docstring said the summary is "printed" and typed `verbose` as
  `bool | None` when only its truthiness is used.
- Folds in #210, whose `level.upper()` fix is a strict subset of the new
  `_as_level` helper. That PR is superseded and closed; its changelog entry is
  reworked here.

### Docs

The `Logging` section of `docs/api.rst` is the one place this is explained:
quiet-by-default, the `lastResort` fallback, the two ways to ask for `"INFO"`,
and the fact that the progress bar drawn during window-wise RANSAC comes from
MNE and writes to its own stream, so neither function silences it — otherwise
that looks like a bug.

`README.rst` orients the reader in three sentences and links there.
`CONTRIBUTING.md` carries only what library code has to do to keep that
behavior true — one module logger, no `print`, no configuring anyone else's
logger, do not add a `NullHandler`, keep `_logging.py` in sync with the sibling
copies — which is not user documentation and is not written down anywhere else.

### Verification

- `pytest`: 61 passed (the new ValueError gets a test of its own)
- `pre-commit run --all-files`: clean
- `cd docs && make html`: clean, all three examples executed
- Fresh-interpreter checks: importing pyprep leaves both the `pyprep` and the
  root logger with no handlers; a warning from `pyprep.x` reaches `stderr` with
  no configuration; `INFO` is hidden until either `set_log_level("info")` with
  an application root handler or `setup_logging("info")`, and appears exactly
  once in both cases.
- Python 3.10 and mne 1.3.0 compatibility holds by inspection: the new code uses
  only long-stable `logging` API and adds no MNE call.

### Open questions

- **No release is cut here** and no `pyproject` pin is touched, even though
  `docs/changelog.rst` describes 0.9.0 as unreleased. Cutting it is yours to
  decide.
- The changelog entries cite `:gh:`211``, assuming this PR takes that number. If
  it does not, they need a one-line correction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e252bf4a70ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.