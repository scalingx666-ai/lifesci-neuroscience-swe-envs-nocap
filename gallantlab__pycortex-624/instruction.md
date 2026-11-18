# Issue

**Title:** FIX Inkscape version detection when diagnostic messages precede version output

## Description

On some Linux systems (e.g. CentOS/RHEL), Inkscape prints a `libgc` workaround message before the version line, causing `INKSCAPE_VERSION` to be set to `_INKSCAPE_GC=disable` instead of the actual version string. This breaks any `LooseVersion` comparison (e.g. in `svgoverlay.get_texture` and `utils.add_roi`), raising a `TypeError`.

## Changes

- **`cortex/testing_utils.py` — `inkscape_version()`**
  - Replace blind `output.split()[1]` with line-by-line parsing of combined stdout+stderr
  - Return the version token only from the line starting with `Inkscape`
  - Switch from `check_output` to `sp.run(..., check=True)` to capture both streams

- **`cortex/tests/test_testing_utils.py`** — new unit tests for `inkscape_version()` covering:
  - Inkscape not installed → `None`
  - Clean stdout → version parsed correctly
  - Newer version string format (e.g. `1.2.2`)
  - Diagnostic noise before version line on stdout (regression test for the bug)
  - Diagnostic noise on stderr, version on stdout
  - No `Inkscape` line in output → `None`
  - Non-zero exit code → `CalledProcessError` propagated

**Before** — breaks when Inkscape emits extra output:
```python
output = sp.check_output(cmd.split(), stderr=sp.PIPE)
version = output.split()[1]  # grabs '_INKSCAPE_GC=disable' instead of '1.2.2'
```

**After** — robust to diagnostic noise on stdout or stderr:
```python
result = sp.run(cmd.split(), stdout=sp.PIPE, stderr=sp.PIPE, check=True)
combined = result.stdout + result.stderr
for line in combined.decode('utf-8').splitlines():
    if line.strip().startswith('Inkscape'):
        return line.split()[1]  # always '1.2.2'
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cebcb27f1bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.