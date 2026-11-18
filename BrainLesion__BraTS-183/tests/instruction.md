# Issue

**Title:** fix: make adult glioma treatment timepoint declarative

## Description

## Summary

. The adult glioma pre & post treatment input name schema hardcoded a `-100` (post-treatment) suffix, so the BraTS25 supplies always ran their post-op pipeline and could emit spurious resection cavity labels (label 4) for pre-operative exams.

The timepoint suffix is now single-sourced in the track metadata and overridable through the public API.

## Changes

- **Metadata** (`brats/utils/algorithm_config.py`): add `RunArgs.suffix_by_timepoint: Optional[dict[str, str]]`.
- **YAML** (`adult_glioma_pre_and_post_treatment.yml`): declare `suffix_by_timepoint: {pre: "000", post: "100"}` via anchor; schema uses the `{timepoint_suffix}` placeholder.
- **Base class** (`brats_algorithm.py`): `timepoint_suffix` attribute; `_format_input_name` substitutes it into `{timepoint_suffix}` and raises `AlgorithmConfigException` when unset.
- **`AdultGliomaPreAndPostTreatmentSegmenter`**: `treatment_timepoint` argument (`"pre"` → `-000`, `"post"` → `-100`, default `"post"`) resolved against the metadata mapping — no hardcoded suffix values in code.
- **Consistency**: `MissingMRI` and `Inpainter` subject IDs now route through `_format_input_name`.
- **Tests/docs**: coverage for default/pre/post/invalid/missing-suffix and metadata integrity; segmentation guide documents the behavior.

## Testing

- `uv run pytest` — 99 passed
- `uv run ruff check .` / `uv run ruff format --check .` — clean
- `uv run pre-commit run --all-files` — all hooks pass
- `uv run --group docs mkdocs build --strict` — builds

## Notes

The container's **output** naming for the pre-op pipeline still needs a manual verification: the orchestrator globs outputs on the internal identifier (`...-000`), and it is assumed the container preserves the input suffix. This was verified separately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58594309a311`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.