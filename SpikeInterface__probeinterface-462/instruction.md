# Issue

**Title:** Let plot_probe accept xlims, ylims and zlims independently

## Description

.

The guard that fills in missing axis limits is an OR, but its body rebound all three names at once:

```python
if xlims is None or ylims is None or (zlims is None and probe.ndim == 3):
    xlims, ylims, zlims = get_auto_lims(probe)
```

So a caller passing only `xlims` tripped the guard on `ylims` being `None`, and had its own `xlims` silently overwritten with the auto value. In 3D, omitting `zlims` discarded both `xlims` and `ylims`. Either limit only took effect if every limit was supplied, which is what the issue reports.

The fix fills in only the limits that are `None` and leaves supplied ones alone. `plot_probegroup` passes all three explicitly, so it is unaffected.

Tests: `test_plot_probe_partial_lims` covers x only, y only, both and neither, and `test_plot_probe_partial_lims_3d` covers xy without z and z without xy. Both assert against the real axis limits rather than the arguments.

Restoring `src/probeinterface/plotting.py` from the base ref makes both fail, with the auto limits appearing where the caller's values should be. Both pass after. Full suite is green at 190 passed and 1 skipped.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87410e103ca8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.