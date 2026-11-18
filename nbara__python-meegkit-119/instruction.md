# Issue

**Title:** [DOC] ASR: fix numpydoc docstring rendering

## Description

Three malformed numpydoc constructs in `meegkit/asr.py` rendered incorrectly in the Sphinx API docs.

### 1. `clean_windows` parameter list mangled
A free-text paragraph sat *inside* the `Parameters` block. numpydoc parsed each line as a `name (type)` entry, producing four garbage "parameters" and disrupting the real ones:

```
tuned. (The following are detail parameters that usually do not have to be)
want (If you can't get the function to do what you)
consider (you might)
data. (adapting these to your)
```

Moved that guidance to a `Notes` section; all documented parameters now render correctly.

### 2. `ASR` attribute names showed literal backticks
`Attributes` wrapped names in double backticks (```` ``zi_`` ````, ```` ``ab_`` ````, ```` ``cov_`` ````, ```` ``state_`` ````), so the backticks appeared verbatim in the rendered headings. Changed to plain `zi_ : array, ...`.

### 3. `cutoff:` missing space before colon
`cutoff:` (in `ASR` and `asr_calibrate`) is not valid numpydoc `name : type` syntax. Changed to `cutoff : float`.

### Verification
- Built the API docs before/after: all parameters and attributes render correctly, no build warnings.
- Added a regression test (`test_docstring_parameters`, `test_docstring_attributes`) that parses the docstrings with numpydoc; it fails on the original docstrings and passes after the fix.
- Full `tests/test_asr.py` passes; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `752f7b25107d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.