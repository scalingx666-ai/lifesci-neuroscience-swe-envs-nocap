# Issue

**Title:** DPointNet: unify automatic policy and final execution audit

## Description

## Why
Under `acceleration_profile="auto"`, omitting `use_pair_projection` followed current eligibility, while explicitly setting it to `"auto"` retained a historical batch32/four-basis heuristic. At batch5 this silently disabled pairing and, through dependencies, fused recurrent accumulation and Javier recurrent VJP. Resolver logs could still present the unresolved string as a selection.

## Changes
- Normalize profile-managed per-option `"auto"` to the same policy as omission. Explicit Boolean overrides and strict unsupported-request validation remain intact.
- Add the named `compatibility_v1` profile for historical constructor heuristics. Null profiles retain that behavior and warn when supplied per-option automatic requests. This is not an exact pin of an older hybrid profile or a substitute for frozen source/environment provenance.
- Finalize the acceleration report after cell/connectivity checks: requested values, provenance, resolved Boolean/named path, failed predicates, dependencies, source-specific input paths, and an optimization audit distinguishing scientific incompatibilities from avoidable execution overrides.
- Record last-traced rollout selection separately; reports are selection/preflight diagnostics, not execution counters or profiling proof.
- Extend `preserve_previous_defaults(..., execution_policy="current")` to deliberately remove inherited execution overlays without retuning explicit scientific settings, device-Poisson choice or RNG. Existing default migration behavior remains available.
- Document semantics, compatibility/migration, and audit limitations.

### Reviewer considerations
- Cell-stage reports now exist for null/compatibility profiles instead of returning `None`. Compatibility-sensitive downstream gates retain their prior behavior.
- Compatibility pair-auto remains restricted to batch32/four bases; its batch5 audit identifies the restriction and blocked accumulator/VJP dependencies, with the current-policy alternative.
- Legacy dynamics remain ineligible for NEST-only joint sweep/CSR-master paths. No dynamics, reset, batch, precision, loss, or scientific recipe is changed to obtain eligibility.
- No CUDA source, custom-op ABI, or dependency changes.

## Validation
All results below were obtained on the exact source committed here, verified against the retained candidate SHA256 manifest. Full suites were completed before PR publication, not rerun merely to publish it.

| Check | Result |
|---|---|
| Full DPointNet suite, Keras3 CPU | 2,790 passed / 1,752 skipped / 0 failures or errors |
| Full DPointNet suite, actual Python3.8 / TF2.13 Keras2 CPU | 2,678 passed / 1,874 skipped / 0 failures or errors |
| Complete RTX3090 native DPointNet suite | 4,513 passed / 66 skipped / 0 failures or errors |
| Native omitted/auto matrix | 24 cases: B1/5/7/8/16/32, legacy/NEST and precision modes; exact outputs/nonzero VJPs and checkpoint restore |
| Separate original-like B5 FP16 compute-state smoke | Exact omitted/auto outputs and nonzero VJPs with legacy, triangular/attached credit and Poisson inputs |
| PR preparation | Python `compileall`, whitespace check, complete staged-diff review and candidate hash verification passed |
| Lint | Critical and changed-line checks passed; repository-wide pre-existing non-gating diagnostics remain |
| Sphinx | Rendered successfully with the same 12 diagnostics as baseline; existing unrelated RST errors retained |

Retained pre-fix regression evidence: 25 failed / 48 passed. Mocked-capability policy tests are distinct from actual RTX3090 native execution. Matching previously qualified fat binaries were reused because CUDA/ABI was unchanged.

## Limits and safety
No fresh A100 execution, performance speedup/fastest-setting claim, full-V1 scientific acceptance, or convergence claim. Live/frozen scientific work, shared source checkout, installed environments and environment links were not modified. This PR publishes the isolated engineering repair; it does not deploy it. GitHub CI and maintainer review remain separate from the local qualification above.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb0b87dadbb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.