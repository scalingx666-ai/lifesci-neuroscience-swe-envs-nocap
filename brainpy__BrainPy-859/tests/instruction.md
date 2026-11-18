# Issue

**Title:** chore(release): 2.8.0

## Description

## Release 2.8.0

Bumps `brainpy.__version__` to **2.8.0** and adds the 2.8.0 changelog section.

Version 2.8.0 is a broad correctness, quality, and maintainability release
covering the 37 commits since `V2.7.8`:

- **Audited correctness sweep** across neuron/synapse dynamics, integrators,
  the math/object-transform layer, `dnn` layers, optimizers & losses, analysis,
  and the runners — each backed by regression tests.
- **Static typing**: core utility annotations, PEP 561, and a new `mypy` CI gate (#834).
- **Test-suite overhaul**: coverage ~84% → 92%+ (#836); tests co-located as
  `<module>_test.py` (#832).
- **Reduced duplication**: reuse `braintools` (init/metric/surrogate) and
  `brainstate` transforms (#835, #833, #831).
- **Docs & examples** repaired and refreshed (#856, #857, #858).

Full details in `changelog.md` (`## Version 2.8.0`).

## Summary by Sourcery

Prepare the 2.8.0 release by updating the changelog and version metadata.

Bug Fixes:
- Document a wide-ranging correctness sweep across neuron and synapse dynamics, numerical integrators, math and object transforms, neural-network layers, optimizers and losses, analysis tooling, and simulation runners.

Enhancements:
- Note quality and tooling improvements including expanded static typing, higher test coverage with co-located tests, reuse of shared braintools/brainstate implementations, and CI robustness updates.

Build:
- Record dependency updates for Sphinx, sphinx-book-theme, and jupyter-sphinx used in the documentation build.

Documentation:
- Add a detailed 2.8.0 changelog section summarizing library-wide fixes, quality improvements, and documentation refreshes, including updated notebooks, examples, and project links.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc9e23cd7750`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.