# Issue

**Title:** fix(running): jit-dict mutation, dict string monitors, multi-device parallel concat

## Description

Fresh review of `brainpy/train` + `brainpy/running`.

- **High** — `Runner.__init__` popped `'predict'` from the caller's `jit` dict, mutating it and corrupting subclass jit config (`predict` JIT-on even when disabled); now copies.
- **High** — dict-form string monitors (`monitors={'a': 'V'}`) were never resolved (stored the literal string) and invalid names weren't validated; fixed resolution + validation + result key.
- **High** — `jax_parallelize_map` crashed concatenating a trailing partial chunk sharded on a device subset; now gathers to host before concat.
- **Medium** — `process_pool_lock` mutated caller param dicts via `.update()`; now submits a copy.

(Recorded for follow-up: BPTT `i0` pinning under `reset_state=False` continuation — cross-cutting, left unfixed. RLS/ridge/GD math lives in `algorithms/`, handled by P16.) In-scope: 108 passed. Findings: `docs/issues-found-20260619-train-running.md`.

## Summary by Sourcery

Fix multiple correctness issues in training/running utilities around JIT configuration, monitor resolution, and JAX multi-device parallelism, and document the audit findings.

Bug Fixes:
- Prevent Runner from mutating caller-provided JIT configuration dicts and ensure the original predict-phase setting remains visible to subclasses.
- Resolve dict-form string monitors to their target variables (including dotted names and indexed forms), validate invalid names, and keep monitor results keyed by the user-specified name.
- Avoid device-placement errors in jax_parallelize_map by gathering per-chunk outputs to host before concatenation, including for trailing partial chunks on a subset of devices.
- Stop process_pool_lock from mutating caller parameter dicts when injecting the multiprocessing lock.

Enhancements:
- Refine dict-monitor target resolution so name-based tuples are correctly resolved while already-resolved values pass through unchanged.
- Standardize jax_parallelize_map outputs to concatenate on NumPy arrays and convert back to BrainPy arrays when buffers are not cleared.
- Add regression and coverage tests for Runner JIT dict handling, dict-form monitors, JAX vmap/pmap chunking (including multi-device partial chunks), and native multiprocessing lock handling.

Documentation:
- Add an audit report documenting identified issues and their status for brainpy/train and brainpy/running modules.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `320431172d25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.