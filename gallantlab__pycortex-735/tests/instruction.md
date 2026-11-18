# Issue

**Title:** ENH automatically flatten surfaces with autoflatten in import_subj

## Description

.

## What

`cortex.freesurfer.import_subj` now finishes by cutting and flattening the subject's surfaces with [autoflatten](https://gallantlab.org/autoflatten) and importing the resulting flatmaps, so a freshly imported subject is immediately usable for flatmaps without a manual cutting session.

Two new keyword arguments control it:

```python
cortex.freesurfer.import_subj(subject)                      # flattens (default)
cortex.freesurfer.import_subj(subject, autoflatten=False)   # skips it
cortex.freesurfer.import_subj(subject, autoflatten_args=["--backend", "freesurfer"])
```

The step is also available on its own, for subjects imported earlier or with `autoflatten=False`:

```python
cortex.freesurfer.autoflatten_subject(subject)
```

## Why these choices

**It warns before starting.** A full run takes 15-30 minutes for both hemispheres, so a `UserWarning` says so up front. It is suppressed when both flat patches already exist, since autoflatten skips patches it has already produced — matching the issue's "if it's not already present". Pass `autoflatten_args=["--overwrite"]` to force a redo.

**It runs last.** After the database re-init, once everything else has been imported successfully, so a flattening failure does not leave a half-imported subject. It also has to run after `make_fiducial`, since `?h.fiducial` is the base surface autoflatten picks up.

**A missing autoflatten warns rather than raises.** autoflatten is an optional dependency (added as the `autoflatten` extra, so `pip install "pycortex[autoflatten]"`). Raising would turn a previously-working `import_subj` call into a hard failure on upgrade, so instead it warns and skips. That check happens *before any conversion work*, not after several minutes of importing, so you find out immediately. Calling `autoflatten_subject` directly does raise `ImportError`.

**It shells out rather than importing.** autoflatten exposes a CLI, not a Python API, so this runs `python -m autoflatten.cli run <subject dir>` via `sys.executable` — the interpreter running pycortex, so it does not depend on the CLI being on `$PATH`. Output is streamed straight to stdout/stderr, since you will want to watch a 30-minute job.

## Layout

The implementation lives in the private `cortex/_autoflatten.py`. It imports `cortex.freesurfer` lazily inside its functions, since `freesurfer` imports it at module level. `autoflatten_subject` is re-exported as `cortex.freesurfer.autoflatten_subject`, which is the public name and where the docs point.

## Tests

`cortex/tests/test_autoflatten.py` covers the command construction and argument pass-through, the `import_flat` wiring, the missing-package and missing-output failure paths, and the warning behaviour; `test_freesurfer.py` covers the plumbing of both keyword arguments through `import_subj`. These run in about a second and need neither FreeSurfer nor autoflatten, so they work in CI.

There is also a `slow` end-to-end test that really runs the pipeline:

```bash
PYCORTEX_TEST_FS_SUBJECT=sub-01 pytest -m slow cortex/tests/test_autoflatten.py
```

It is deselected by default (`pytest.ini` already sets `-m "not slow"`) and self-skips unless FreeSurfer is sourced with `fsaverage` in `$SUBJECTS_DIR`, autoflatten is installed, and `$PYCORTEX_TEST_FS_SUBJECT` names a recon-all'd subject. It cannot use the bundled S1: that is a pycortex filestore entry (gifti surfaces), not a FreeSurfer subject directory, and autoflatten needs `?h.sphere.reg` plus `mri_label2label` to map the fsaverage template cuts onto the subject. The test mirrors the named subject into a throwaway `$SUBJECTS_DIR` with symlinks (with `surf/` a real directory of symlinked files, so the patches land in the copy) and passes `import_flatmaps=False`, so it touches neither the real FreeSurfer subject nor your filestore.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e9cd745fc8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.