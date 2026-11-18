# Issue

**Title:** feat: Implement turning angles for trajectory complexity

## Description

1. Description
What is this PR?
 * [ ] Bug fix
 * [x] Addition of a new feature
 * [ ] Other
2. Why is this PR needed?
 * Implements compute_turning_angles, the first function in the new movement/kinematics/trajectory_complexity.py module.
 * Turning angles are the foundation for several downstream metrics (e.g., sinuosity, direction autocorrelation, and angular speed).
 * Ensures future metrics are built on a composable, dependency-safe, and thoroughly tested foundation.
 * Addresses tracking issue #406.
3. What does this PR do?
 * Adds compute_turning_angles: Calculates the signed angular change between consecutive displacement vectors using compute_displacement. (Positive = left turn, Negative = right turn).
 * Preserves time dimension: Uses shift(time=1) so the output trivially aligns with other kinematic quantities (like speed and acceleration) on the same time axis.
 * Handles edge cases gracefully:
   * Wraps angles to (-π, π] using a modulo identity.
   * Explicitly masks zero-length (stationary) steps with NaN to prevent artificial zero-degree turns.
 * Validates inputs: Enforces 2D spatial data (raises ValueError for 3D) and checks for a time dimension.
 * Adds convenience features: Includes an optional in_degrees=True parameter for easier distribution inspection.
4. How has this PR been tested?
 * Unit tests run locally with pytest (15 passing tests in tests/test_unit/test_trajectory_complexity.py).
 * Test coverage includes:
   * Mathematical sign conventions (right turn \rightarrow -\pi/2, left turn \rightarrow +\pi/2) and angle wrapping.
   * Degenerate cases (zero-length paths, NaN positions).
   * Batched inputs (multiple individuals/keypoints).
   * Explicit rejection of 3D data and missing time dimensions.
5. Is this a breaking change?
No.
This PR adds a new utility function and does not modify existing APIs or behavior.
6. Does this PR require an update to the documentation?
Not strictly required.
 * The function docstring is complete and follows NumPy style.
 * Includes a gallery example (examples/compute_turning_angles.py) demonstrating usage on a real Elevated Plus Maze (EPM) dataset. It visualizes turning magnitude in space and compares turn distributions between open arms and the centre zone.
7. References
 * trajr R package — McLean, D.J. & Skowron Volponi, M.A. (2018). trajr: An R package for characterisation of animal trajectories. Ethology, 124, 440–448.
 * Tortuosity estimation — Benhamou, S. (2004). How to reliably estimate the tortuosity of an animal's path. Journal of Theoretical Biology, 229, 209–220.
8. Checklist
 * [x] Tests pass (pytest tests/test_unit/test_trajectory_complexity.py -v)
 * [x] Pre-commit hooks pass (ruff, mypy, codespell)
 * [x] Function exported from movement/kinematics/_init_.py
 * [x] Gallery example runs on real data without error
 * [x] Docstring follows NumPy style with Parameters/Returns/Raises/Notes/Examples
 * [x] See Also section links to related functions
 * [x] Linked to tracking issue #406

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f6f0030c50d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.