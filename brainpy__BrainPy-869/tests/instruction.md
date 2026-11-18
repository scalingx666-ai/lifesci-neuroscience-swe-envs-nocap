# Issue

**Title:** chore(release): 2.8.1

## Description

Release **2.8.1**.

- Bumps `brainpy/_version.py` to `2.8.1`.
- Adds the 2.8.1 `changelog.md` entry.

### Included since 2.8.0
- **#868** — audited 18-bug, library-wide correctness sweep (dnn, integrators, encoders, initializers, connectivity, optimizers, dynold STP, offline/online training, object transforms, runners), each with a regression test.
- **#867** — adaptive-pooling `ZeroDivisionError` on up-sampling + numpy typing stubs.
- **#866 / #865** — static/relocated version metadata in `brainpy._version`.
- **#863** — docs-notebook refresh, `clear_buffer`/`pmap` fixes, package-wide mypy to zero.
- **#862** — `PoissonGroup` spiking regression.
- **#861** — codecov action bump.

Cuts the `v2.8.1` GitHub release.

## Summary by Sourcery

Prepare the 2.8.1 patch release with updated version metadata and detailed changelog entry focused on correctness improvements and tooling updates.

Bug Fixes:
- Document audited, library-wide correctness fixes across dnn, integrators, encoders, initializers, connectivity, optimizers, synaptic plasticity, training algorithms, object transforms, and runners.
- Document fixes for adaptive pooling ZeroDivisionError, PoissonGroup spiking regression, STDP update keyword typo, DSRunner deprecation warning, and clear_buffer/pmap runtime bugs.

Enhancements:
- Summarize the introduction of numpy typing stubs and refreshed documentation notebooks in the changelog.

Build:
- Document static version metadata in brainpy._version and build-time version reading, plus the bump of codecov/codecov-action.

Documentation:
- Add a detailed changelog section for version 2.8.1 including release date, scope of correctness sweep, and categorized bug fixes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `622075501c8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.