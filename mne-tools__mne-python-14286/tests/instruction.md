# Issue

**Title:** Fix tfce

## Description

#### Reference issue

.


#### What does this implement/fix?

This PR fixes two bugs in the TFCE score computation inside `_find_clusters` (`mne/stats/cluster_level.py`), and clarifies a third point raised in the issue that is actually by design.

**Bug 1 — Cluster extent counted as 1 for 1D data**  
For 1D data without adjacency, `ndimage.find_objects` returns clusters as `(slice,)` tuples. In `_find_clusters`, the branch `elif isinstance(c, tuple): len_c = len(c)` always yields an extent of 1, regardless of the actual number of samples. The `isinstance(c, slice)` branch is currently dead code in all paths.  
*Fix:* Compute the extent from the slice bounds: `len_c = c[0].stop - c[0].start`.

**Bug 2 — Per-threshold height uses the wrong formula**  
The code accumulated `Δh^H · e^E` per threshold, mixing cumulative and incremental forms incorrectly. This does not match the reference TFCE integral `TFCE = Σ e(h)^E · h^H · dh` (Smith & Nichols, 2009), whose Riemann-sum discretization requires `|t_i|^H · Δt · e_i^E` per threshold step.  
*Fix:* Set `dh = abs(thresh)` for the first threshold, then `dh = abs(thresh - thresholds[ti-1])`, making the per-threshold contribution `abs(thresh)**h_power * dh * len_c**e_power`.

**Point 3 from the issue — By design, unchanged**  
The per-point cluster list and TFCE-valued `t_obs` returned by `_permutation_cluster_test` are intentional. For TFCE, each point is evaluated independently based on its local neighborhood, and `t_obs` contains the enhanced statistic, not the raw t-values. This is documented in the code and consistent with the background stats tutorial.

**Reproducible ground truth**  
A bump of height 2 over 3 samples (`tail=1`):
| Scenario | Old value | Correct value |
|---|---|---|
| 1D, `step=1` | 1.000 | √3 ≈ 1.732 |
| 1D, `step=0.5` | 0.750 | (0.5²+1²+1.5²)·0.5·√3 ≈ 3.031 |
| 2D `(1,6)`, `step=0.5` | 0.750 | 3.031 |

*(The bug was previously hidden because the 2D extent mask branch was already correct, and with `step=1`, `Δh^H` coincidentally equals `|t|^H · Δh` when `Δh = t = 1`.)*

**Changes**  
- `mne/stats/cluster_level.py`: 9 insertions, 6 deletions. Only the TFCE block in `_find_clusters`. No API changes, no new dependencies.
- `mne/stats/tests/test_cluster_level.py`: Regression test added to `test_tfce_thresholds` with analytic 1D (tuple-slice) and 2D (boolean-mask) ground-truth assertions.
- `doc/changes/dev/14224.bugfix.rst`: Changelog entry added.
- `doc/changes/names.inc`: Contributor name added.

**Verification**  
- `pytest mne/stats/tests/test_cluster_level.py` — all tests passed (including the new regression test).
- `pre-commit run -a` — all hooks green.


#### Additional information

**AI Assistance Disclosure:**  
I used an AI coding assistant (**OpenCode** with the **Big Pickle** model) to help structure this PR description and refine the mathematical explanation of the bug. However, I personally identified the root cause in the codebase, wrote and verified the ~9-line fix in `_find_clusters`, and manually validated the analytical ground truth tests. I take full responsibility for the correctness and scope of this contribution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bab0f18ebcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.