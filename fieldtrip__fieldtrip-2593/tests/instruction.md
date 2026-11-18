# Issue

**Title:** Exact TFCE (eTFCE) in tfcestat: remove the nsteps discretisation

## Description

## Summary

This evaluates the TFCE integral in `private/tfcestat.m` **exactly** instead of approximating it with a fixed number of height thresholds (`cfg.tfce_nsteps`). The cluster extent `e(h)` is piecewise constant in the height `h` (it changes only when `h` crosses a data value), so the integral

```
TFCE(v) = ∫_{h0}^{h_v} e(h)^E · h^H dh
```

has a closed form on each interval and is obtained in a single pass with a disjoint-set (union-find) cluster-retrieval forest, over the **same spatial connectivity that `findcluster` uses**. This removes the discretisation (and its bias), is typically much faster than the threshold loop, and removes the SPM dependency (it no longer calls `findcluster`/`spm_bwlabel`).

This was suggested as a follow-up to an exact-TFCE PR for the LIMO toolbox.

### Attribution

The exact-TFCE (eTFCE) algorithm is **not my work** — it is the method of:

> Chen, X., Weeda, W. D., Nichols, T. E., & Goeman, J. J. (2026). *eTFCE: Exact Threshold-Free Cluster Enhancement via Fast Cluster Retrieval.* arXiv:2603.03004 — https://arxiv.org/abs/2603.03004

This PR is only a MATLAB implementation of that published method for FieldTrip. The function header credits it.

## What changed

Only `private/tfcestat.m`. The signature, `cfg` fields (`tfce_H`, `tfce_E`, `tfce_h0`, `tail`, `inside`, `dim`, `connectivity`) and the positive/negative handling are unchanged; `cfg.height` is still computed and returned so the cfg round-trip across randomisations is unchanged. `cfg.tfce_nsteps` is accepted but no longer used (there is no step size in the exact method). Both the sensor layout (channel × freq × time with `connmat`) and the `spacereshapeable` source layout (3-D grid) are handled.

## Validation

- **Exactness** — against an independent `graph`/`conncomp` integrator: ~1e-15 for the sensor case (tails −1/0/+1) and the source 3-D grid case.
- **Connectivity diffed against the real `findcluster`** — the per-voxel cluster **extent** from FieldTrip's actual `findcluster` equals the extent from this implementation's edge list at **every** threshold tested (max|err| = 0), for both sensor and source layouts.
- **Convergence** — the existing discretised `tfcestat` (calling the real `findcluster`) converges to this exact result as `nsteps`→∞ (O(1/nsteps)), confirming eTFCE is the exact limit of the current method.

## Notes / things to decide

- **Removes the SPM/`findcluster` dependency** for TFCE (the exact method builds its own adjacency from `connmat` + the non-spatial grid, matching `findcluster`).
- eTFCE computes the **mathematically-correct connected components**, equal to `combineClusters2`. The default mex `combineClusters` has a documented isolated-pixel quirk (it "occasionally labels isolated pixels as separate clusters"); on those rare cases results may differ — arguably a fix.
- Pure MATLAB; for very large source grids the union-find loop is interpreted, but it replaces `nsteps` full `findcluster` passes with a single sweep.
- It's a `private/` function, so happy to discuss the approach. If preferred, the original discretised path can be retained behind a `cfg` option rather than replaced.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `398700aee52e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.