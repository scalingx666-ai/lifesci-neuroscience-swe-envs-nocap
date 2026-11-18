# Issue

**Title:** extractors: add CiftiRoiProjector for cortical Glasser + subcortical …

## Description

…ROIs

Add a CIFTI-only projector that subsets a CIFTI's grayordinates to any mix of Glasser cortical ROIs (via hcp.mmp) and subcortical structures (via hcp.struct), using hcp_utils. Cortical and subcortical names never collide, so one selected_rois set can request both (e.g. {"V1", "thalamus_left"}).

- Subcortical names may be bare ("thalamus" = both hemispheres) or hemisphere-suffixed ("thalamus_left"); "brainstem" has no hemisphere.
- "dynamic" is accepted (same 41 visual ROIs as GlasserProjector) but is not the default -- selected_rois stays required. The "dynamic" resolution is shared via _RoiSubsetProjector._resolve_dynamic.
- All grayordinates are kept (no per-structure averaging).
- Non-CIFTI input raises a clear error; FmriExtractor from_space="auto" picks the CIFTI (fsLR) space for this projector.

GlasserProjector and CiftiRoiProjector share their masking machinery (mode, mask building, drop/zero application, unknown-name errors, dynamic resolution) via a common _RoiSubsetProjector base; each subclass only defines its region-name -> node mapping and its selected_rois field.

FmriExtractor._get_timed_arrays now crops each recording to the requested window before apply_after_cache, so row-masking (and the memmap load it triggers) only touches the requested TRs -- a large speedup for the row-masking projectors. Discussed with @jrapin.

Both projectors are exported from neuralset.extractors, with mocked and hcp_utils-backed tests.

Test plan:
- `../.venv/bin/python -m pytest neuralset/extractors/test_neuro.py`

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `487220d93184`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.