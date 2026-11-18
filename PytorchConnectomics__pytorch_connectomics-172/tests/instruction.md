# Issue

**Title:** Claude/remove backward compatibility 01 yxa hv h6eb tvv y lmfr18r zy

## Description

Summary of Changes
Phase 1: Backward Compatibility Code Removal (92 lines removed)
7 files modified:

callbacks.py - Removed old config style support

❌ Old: cfg.checkpoint.* and cfg.early_stopping.*
✅ New: cfg.monitor.checkpoint.* and cfg.monitor.early_stopping.*
lit_model.py - Removed legacy parameter conversions

❌ Legacy parameter conversion for decode_binary_contour_distance_watershed
❌ Fallback for output_scale/output_dtype → Only intensity_scale/intensity_dtype
build.py - Cleaned transform builders

❌ Removed backward compatibility comments
❌ Removed image_transform.resize fallback → Only data_transform.resize
regularization.py - Removed aliases

❌ BinaryReg, FgDTConsistency, ContourDTConsistency, etc.
visualizer.py - Removed legacy factory

❌ create_visualizer() factory function
hydra_config.py & hydra_utils.py - Removed deprecated comments

❌ "deprecated", "legacy", "backward compatibility" mentions
Phase 2: Legacy Config Field Removal (24 lines removed)
3 files modified:

hydra_config.py - Removed deprecated fields

❌ DataConfig.test_transpose → Use inference.data.test_transpose
❌ TestTimeAugmentationConfig.act → Use channel_activations
build.py - Removed fallback logic

❌ cfg.data.test_transpose fallback removed
✅ Only uses cfg.inference.data.test_transpose
lit_model.py - Removed single activation fallback

❌ Single act field fallback (18 lines)
✅ Requires modern channel_activations for TTA
Total Impact
116 lines removed (92 + 24)
10 files modified
3 commits pushed to claude/remove-backward-compatibility-01YXAHvH6ebTvvYLmfr18rZY
Breaking Changes
Users must now use the modern config structure:

✅ cfg.monitor.checkpoint.* for checkpointing
✅ cfg.monitor.early_stopping.* for early stopping
✅ cfg.data_transform.resize for resizing
✅ inference.data.test_transpose for test transpose
✅ channel_activations for TTA activations
✅ intensity_scale/intensity_dtype for postprocessing

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96e2acacf625`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.