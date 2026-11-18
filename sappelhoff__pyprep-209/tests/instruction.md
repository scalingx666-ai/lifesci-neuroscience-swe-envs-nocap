# Issue

**Title:** Log through pyprep's own logger namespace

## Description

`pyprep` used three logging mechanisms at once: `find_noisy_channels` and `ransac` logged
through MNE's logger (`from mne.utils import logger`), `reference` through a handler-less
`pyprep.reference` logger, and `removeTrend` straight to the **root** logger. So pyprep's
records were attributed to `mne`, could only be silenced through `mne.set_log_level`, and two
of them surfaced as `WARNING:root:...`.

pyprep now owns a `pyprep` logger, configured when the package is imported: `INFO`, its own
handler on `sys.stdout`, `propagate = False`. That is the model MNE uses for its own logger,
and the root logger stays untouched. `setup_logging` is the knob:

```python
pyprep.setup_logging("WARNING")       # warnings and errors only
pyprep.setup_logging(propagate=True)  # let the application's handlers print them
```

## Behaviour change

`mne.set_log_level()` no longer affects pyprep. Downstream code that relied on it — including
the two examples and the test fixtures in this repo — needs `pyprep.setup_logging()` instead.
The changelog says so.

## Notes

- The four `logger.info` calls in `reference` become visible for the first time.
- `removeTrend`'s message said "detreding"; fixed while touching the line.
- `tests/conftest.py` gains an autouse fixture that quiets pyprep for the suite and restores
  propagation, without which `caplog` cannot see pyprep records at all: they no longer reach
  the root-level handler pytest installs.

## Verification

`pytest`: 53 passed. In a fresh interpreter with no logging configuration, `import pyprep` is
now enough to get formatted `[INFO] pyprep.<module>: ...` on stdout, while
`logging.getLogger().handlers` is still `[]`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0e2fae2ddc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.