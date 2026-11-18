# Issue

**Title:** fix(roofline): use the generic target_eff priors for R9700, as for every product

## Description

## Summary

- R9700 now uses GEAK's generic op-class `target_eff` priors, the same way every Instinct product does. For MoE and elementwise kernels on R9700 the prior goes from 0.76 to the generic 0.90 and 0.875.
- `PRODUCT_TARGET_EFF` and its accessor `target_eff_for` are removed from `roofline_tools.py`. R9700 was the only entry and nothing else calls the accessor; `TARGET_EFF` remains the single source of these priors.
- `SKILL.md` §7 and the `peaks.md` header now state that the priors are the same for every product, and `test_roofline_skill.py` follows.

## Why

- The roofline tables then follow one convention for every product: datasheet peaks in `peaks.md`, generic op-class priors in `SKILL.md`. RDNA4 products now follow the same convention as the Instinct parts.
- GEAK accepts a kernel on its measured A/B result, so `target_eff` only shapes the headroom estimate. Using the generic prior does not change what gets accepted.
- New products can be added from published datasheet figures alone, without a per-board measurement to maintain alongside them.
- R9700 peaks, ISA isolation and serving policy, which came in with #488, are unchanged.

## Observable effect

On R9700 the roofline skill reports more headroom for memory-bound MoE and elementwise kernels. For example, a kernel at 70% of the 640 GB/s pin rate now reads "moderate" rather than "saturated", consistent with how the same kernel reads on Instinct parts. Nothing else changes.

## Test plan

- `e2e_workflow/scripts/tests/test_roofline_skill.py`: all 40 tests pass.
- `roofline_tools.py --selftest`: pass.
- No references to `target_eff_for` or `PRODUCT_TARGET_EFF` remain in the repository.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f020270d66e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.