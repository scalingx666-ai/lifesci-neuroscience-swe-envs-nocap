# Issue

**Title:** [FIX] Replace statsmodels.robust.scale.mad with scipy.stats.median_abs_deviation to avoid enabling the GIL

## Description

Hi! Since this is a small diff and I couldn't find a `CONTRIBUTING.md`, I went ahead and opened a PR. I hope you don't mind!

I wanted to use `meegkit` in a project that uses a [free-threaded Python interpreter](https://docs.python.org/3/howto/free-threading-python.html), but I ran into the following warning:

```bash
<frozen importlib._bootstrap>:491: RuntimeWarning: 
The global interpreter lock (GIL) has been enabled to load module 'statsmodels.robust._qn', 
which has not declared that it can run safely without the GIL. 
To override this behavior and keep the GIL disabled (at your own risk), run with PYTHON_GIL=0 or -Xgil=0.
```

You can replicate this warning (using [uv](https://docs.astral.sh/uv/)) with this command:

```bash
uv run --no-project --python 3.14t --with statsmodels python -c "import statsmodels.robust.scale"
```

I checked where/how `statsmodels` is used and found only one occurrence: [`statsmodels.robust.scale.mad`](https://www.statsmodels.org/stable/generated/statsmodels.robust.scale.mad.html#statsmodels-robust-scale-mad). This PR replaces it with the equivalent [`scipy.stats.median_abs_deviation`](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.median_abs_deviation.html#median-abs-deviation). This makes the package usable in free-threaded contexts while also dropping the `statsmodels` dependency entirely.

Additionally, I added a test using the [built-in `sys._is_gil_enabled` check](https://docs.python.org/3/library/sys.html#sys._is_gil_enabled) to confirm the GIL stays disabled, and added `3.14` and `3.14t` to the CI python matrix. Let me know if you want to keep this or if I should drop this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b6c1d7f5bb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.