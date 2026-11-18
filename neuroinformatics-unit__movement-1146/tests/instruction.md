# Issue

**Title:** Add functions to compute angular velocity and acceleration

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Collaborators have repeatedly asked for angular head velocity. Computing it naively, by differentiating head-direction angles, produces large spurious spikes wherever angles wrap around at ±π.

**What does this PR do?**

Adds three functions to `movement.kinematics` (in `orientation.py`) for 2D orientations given as vectors (e.g. the output of `compute_forward_vector`):

- `compute_angular_time_derivative(data, order, window=None)`: the general function.
- `compute_angular_velocity(data, window=None, in_degrees=False)`: wrapper for `order=1`.
- `compute_angular_acceleration(data, window=None, in_degrees=False)`: wrapper for `order=2`.

The input must have `time` and `space` dimensions, with `space` coordinates exactly `["x", "y"]`. The vectors need not be of unit length.

There are two options for how to estimate the derivative:

- **Raw (`window=None`)**: first order derivative is the signed angle from the previous to the next frame, divided by the actual time between them (equivalent to central differences approach, but one-sided at the first and last frames). Irregular time steps also work. Higher orders differentiate this estimate further with `compute_time_derivative`.
- **Windowed (`window`)**: a least-squares polynomial fit to the angles relative to each window's centre frame. For velocity, this is the slope of a straight line; for acceleration, the second derivative of a quadratic. `window` must be an odd integer greater than `order`, and `time` must be uniformly sampled. The first and last `window // 2` outputs are NaN, as is any output whose window contains a NaN. A trailing window (as used in some studies) can be derived `shift(time=window // 2)` away, which is documented as a recipe in the docstring and the sphinx-gallery example. Note: this estimate calls `scipy.signal.savgol_coeffs` directly rather than our `savgol_filter`, because it applies the coefficients to angles measured relative to each window's centre, which a filter over a single series can't do.

The windowed estimate was motivated by the frequent need for deriving a 'smoother' estimate of angular head velocity, and was directly inspired by approaches taken in the literature (see *References*). 

Note that both estimates use the signed angles between nearby orientations. This makes the computation robust to errors and missing values (consequences stay localised).

While working on this PR I discovered that xarray.attrs handling across kinematics is inconsistent and I opened issue #1158. For now, angular derivatives carry no attrs (only the `name`) for consistency with `compute_time_derivative` (and hence `compute_velocity` and `compute_acceleration`). 

The PR also adds a gallery example, **Compute angular velocity and acceleration**, linked from the head direction example. Using the angular head velocity of a mouse, it covers the sign convention, two ways of smoothing (pre-smoothing the vectors and the windowed least-squares estimate) and their combination, the trailing-window recipe, and angular acceleration.

**Open question for review:** should these functions live in `orientation.py` (current) or `kinematics.py`? I've put them in orientation for now, but would fit in either.

## References



The windowed estimate is inspired by the angular head velocity (AHV) analysis in [this *Neuron* (2022) paper](https://doi.org/10.1016/j.neuron.2021.10.031) and its implementation in [opendirection](https://github.com/adamltyson/opendirection/blob/ca5383f100d8901e4b4b717e7e632a54c22311d6/opendirection/behaviour/behaviour.py#L100-L144), where AHV was computed as the first derivative of the head-direction angle over a 200 ms window. Unlike opendirection, which unwraps the angle with `np.unwrap` and fits a line over a trailing window, `movement` avoids a global unwrap, so NaN gaps and keypoint swaps don't corrupt the rest of the series. It also uses centred windows by default.

## How has this PR been tested?

New unit tests in `tests/test_unit/test_kinematics/test_orientation.py` cover:

- constant rotations and accelerations crossing ±π, in radians and degrees
- the sign convention, for rotations in both directions
- frames vs seconds, irregular time steps
- the windowed estimate: NaN edges, equivalence with `np.polyfit` over centred and trailing windows, and lower noise than the raw estimate
- NaNs (including at the start and end of the series) and zero-length vectors
- extra dimensions, with `time` in any position
- input validation (including rejecting angles without a `space` dimension) and output names/attrs

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Yes. Docstrings and a new sphinx-gallery example are included.

## Checklist:

Note that I've consciously chosen to ignore the *issues* SonarCloud flagged.

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

> [!note]
> I've deliberately chosen to ignore SonalCloud's complaints in this case. Let me know if you think they are worth dealing with.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39ee15e29706`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.