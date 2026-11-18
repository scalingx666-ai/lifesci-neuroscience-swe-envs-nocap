# Issue

**Title:** feat(simulator): put load_haxby_example on the 3 mm MNI grid

## Description

.

`load_haxby_example(n_runs=1, *, space="mni", random_state=42)` now simulates on the package's 3 mm MNI152 mask (71,020 voxels, 72 TRs) so every plotting method, `apply_mask`, `extract_roi` and the parcellations work on it, with no download beyond the cached templates. Eight disjoint 8 mm spheres at ventral-stream coordinates carry the eight conditions at a 3% peak response on 1% noise, with category crosstalk that gives the patterns an animate / object / scene / control similarity structure. Blocks are 15 s on and 7.5 s rest, which removes nilearn's singular-design warning, and the returned `DesignMatrix` carries its intercept. `space="grid"` keeps the old 500-voxel volume for the fastest tests. Each `BrainData` arrives with `.Y` holding `condition` and `run`.

Measured: construction 1 to 2 s; the face contrast peaks at 3.05, 6.5 mm from the face sphere centre, with the largest outside value 1.86, so it is visible unthresholded; face-versus-house decoding inside the face and house spheres scores 0.83. Whole-brain decoding from one run is at chance by construction (12 labelled TRs against 71k voxels), so the docstring, note and test decode inside ventral-temporal regions, as the real Haxby analysis does.

`random_state` is keyword-only now; every call site passes it by name, and v0.5.1 had no such function.

Checks: `uv run poe ok` (1005 passed), `uv run poe docs-build` (strict), the touched test file with slow tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1bd4ae4d52c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.