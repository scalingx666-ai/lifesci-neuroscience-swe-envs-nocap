# Issue

**Title:** Fix duplicate `probe_id` field in `ProbeGroup.to_numpy(complete=True)`

## Description

### Problem

`ProbeGroup.to_numpy(complete=True)` crashes with

    ValueError: field 'probe_id' occurs more than once

when a probe has a contact annotation named `probe_id`. Since 0.4.0, `to_numpy` always adds its own `probe_id` field and then also adds every contact annotation (with `complete=True`), so `probe_id` appears twice.

### How such annotations appear: version mismatch

These annotations come from files written and read by different probeinterface versions:

1. **Written with probeinterface >= 0.4.0**: a recording's `contact_vector` property (`probegroup.to_numpy(complete=True)`) includes a `probe_id` column.
2. **Read with probeinterface < 0.4.0**: `Probe.from_numpy` doesn't know `probe_id` as a structural field, so it turns the column into a **contact annotation**. A `SortingAnalyzer` saved at this point stores the probe with that annotation.
3. **Loaded with probeinterface >= 0.4.0**: `to_numpy(complete=True)`, called for example by `SortingAnalyzer.get_channel_locations()`, crashes.

We hit this with Open Ephys data that was compressed with spikeinterface/probeinterface 0.4.x and sorted with spikeinterface 0.104.7/probeinterface 0.3.x. The resulting analyzers can't be loaded with probeinterface 0.4.x.

### Fix

`to_numpy` now skips any probe fields named `probe_index` or `probe_id`, so the probegroup's own values are used. Stale annotations stay on the probe but are no longer exported.

### Minimal reproducer

    import probeinterface as pi
    from probeinterface import generate_linear_probe

    probe = generate_linear_probe(num_elec=4)
    probe.set_device_channel_indices(range(4))
    probe.annotate_contacts(probe_id=["0"] * 4)
    probegroup = pi.ProbeGroup()
    probegroup.add_probe(probe)
    probegroup.to_numpy(complete=True)  # ValueError on main

### Tests

Added `test_to_numpy_with_probe_id_contact_annotation`. It fails on main and passes with this fix.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c95778cd7c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.