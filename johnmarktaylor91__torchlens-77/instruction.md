# Issue

**Title:** test(aesthetic): add aesthetic testing infrastructure

## Description

## Summary

- Adds comprehensive aesthetic testing infrastructure for visually inspecting all user-facing outputs
- Run `pytest tests/test_output_aesthetics.py -v` → inspect `tests/test_outputs/` to review the entire user-facing experience at a glance
- Restructures test output directory from `visualization_outputs/` to `test_outputs/`

## What's included

**Text report** (`aesthetic_report.txt`): Captures every user-facing repr, accessor, DataFrame, error message, and field dump across 8 models covering:
- ModelLog str/repr, to_pandas(), module system (ModuleLog, ModulePassLog, ModuleAccessor)
- Parameter system (ParamLog, ParamAccessor, frozen vs trainable params)
- TensorLog/RolledTensorLog access patterns (index, label, substring, module address)
- Convenience error messages (out-of-range, invalid names, multi-pass hints)
- Full field dumps for every major data structure
- Gradient system: TensorLog/ParamLog gradient fields after save_gradients=True + backward(), frozen param contrast

**LaTeX PDF report** (`aesthetic_report.pdf`): Single document combining all text outputs + embedded visualization PDFs with sections, captions, and tcolorbox formatting. Requires `pdflatex` (skipped gracefully if unavailable).

**Visualization gallery** (28 standard + 5 gradient PDFs in `aesthetic_test_models/`):
- Standard: exercises depth levels, rolled/unrolled, buffer visibility, graph directions, nesting, shared modules, loop detection
- Gradient: backward-pass blue arrows via `log_forward_pass(save_gradients=True)` + `.backward()` + `render_graph()`, including frozen param contrast and nested/branching models

**6 new purpose-built models** in `example_models.py`: AestheticDeepNested, AestheticSharedModule, AestheticBufferBranch, AestheticKitchenSink, AestheticFrozenMix, plus helpers.

## Test plan

- [x] All 9 tests pass (`pytest tests/test_output_aesthetics.py -v`)
- [x] No regressions in existing tests (101 toy model, 214 metadata/module/param tests)
- [x] Text report generates with complete, real output including gradient section
- [x] Visualization PDFs render correctly (standard + gradient)
- [x] Gradient PDFs visually confirmed to contain blue backward arrows
- [x] LaTeX PDF compiles with all visualizations embedded (when pdflatex available)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ff77fdc3dc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.