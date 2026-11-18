# Issue

**Title:** Add maximum expected displacement (Emax) as a path metric

## Description

Adds `compute_maximum_expected_displacement` (Cheung 2007's E_max) to `movement.kinematics.path`.

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
E_max is a straightness measure that quantifies how far an animal is expected to travel given its observed distribution of turning angles and step lengths; assuming it navigates without an external directional reference (e.g. no compass, no landmark)



**What does this PR do?**

  - `E_max⁽ᵃ⁾ = c̄ / (1 − c̄)` with `c̄ = nanmean(cos θ)` over turning angles (dimensionless), and `E_max⁽ᵇ⁾ = p̄ ·
  E_max⁽ᵃ⁾` scaled by mean step length (spatial units).
  - `in_spatial_units=True` (default) → spatial variant; `False` → dimensionless. Default follows your steer in #905
  (most users stay within one species/setup).
  - Light-touch per the 2026-06-12 community call: no `min_step_length`, `nan_warn_threshold`, or `nan_policy`.
  `in_degrees` is deliberately **not** exposed — `cos θ` requires radians.

## References
- 
- Related to #406 
- Link to [Zulip](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/Potential.20trajectory.20complexity.20metrics/with/596429211)

Cheung, A., Zhang, S., Stricker, C. & Srinivasan, M. V. (2007). Animal navigation: the difficulty of moving in a straight line. *Biological Cybernetics* 97(1), 47-61. https://doi.org/10.1007/s00422-007-0158-0

## How has this PR been tested?
Created new parametrized test functions in `tests/test_unit/test_kinematics/test_path.py`:

## Is this a breaking change?
No

## Does this PR require an update to the documentation?

Added a self contained docstring

### Naming — question + my suggestion
Following #1021 (`directional_change` → `turning_angle_rate`, moving off opaque paper labels), I've named the function
**`compute_maximum_expected_displacement`** rather than `compute_path_emax`. It's self-documenting, matches
`long_name="Maximum Expected Displacement"`, and sits in the same vocabulary as `compute_*_displacement`; `E_max` / 
trajr's `TrajEmax` stay in the docstring first line + Notes for discoverability. The scale toggle is **`in_spatial_units`** (mirrors `in_degrees`), replacing the `emax_b` name you flagged.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9f3032bcf68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.