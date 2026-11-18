# Issue

**Title:** Implement `compute_directional_change` for path complexity

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Implements `compute_directional_change` (), one of four trajectory complexity metrics in `movement`'s current scope. DC quantifies how rapidly an animal changes its heading per unit time; useful for distinguishing slow tortuous paths from fast straight ones, which purely geometric metrics like sinuosity can't tell apart.

**What does this PR do?**

- Adds `compute_directional_change` in `movement/kinematics/path.py`.

The directional change at step $i$ is the absolute turning angle divided by the time interval:
 
$$\mathrm{DC}_i = \frac{|\theta_i|}{\Delta t_i}$$

## References

-  
- Related to #406 
- Link to [Zulip](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/Potential.20trajectory.20complexity.20metrics/with/596429211)

## How has this PR been tested?

Two new parametrized test functions in `tests/test_unit/test_kinematics/test_path.py`:
- `test_directional_change_known_values` — DC = 0 on straight-line motion (interior steps), DC = NaN on stationary paths; boundary time steps (t=0, t=1, t=-1) are always NaN.
- `test_directional_change_across_time_ranges`

## Is this a breaking change?

No - purely additive. New public function, no existing API touched.

## Does this PR require an update to the documentation?

The new function has a complete numpydoc docstring with math, reference, Notes section, `See Also`, and `Examples`.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94d8a389ac65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.