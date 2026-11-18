# Issue

**Title:** docs: fix 02_studies walkthrough for removed infra_timelines API

## Description

The `neuralset` `Study` base class removed the `infra_timelines` field (now migrated to `timelines={'infra': ...}`). The custom `FaceStudy` example in `docs/neuralset/walkthrough/02_studies.py` still set `self.infra_timelines.cluster = None` in `model_post_init`, which raises `AttributeError` and breaks the sphinx-gallery docs build on `main`.

## Fix
- Replace the `model_post_init` override with the supported idiom `timelines: tp.Any = {'infra': None}` (inline, uncached — matches `neuralset/events/test_study.py`).
- Refresh two stale doc-comment references (`infra_timelines={'cluster': None}` -> `timelines={'infra': None}`, `infra.folder` propagation -> `timelines.infra.folder`).

Pre-existing docs-CI breakage, independent of dataset onboarding.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1bf64edadc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.