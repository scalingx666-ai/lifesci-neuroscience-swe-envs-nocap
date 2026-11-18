# Issue

**Title:** Fix write_BIDS_probe crash when device_channel_indices are set

## Description

`write_BIDS_probe` fails on any probe that has wiring with more than one channel:

```python
from probeinterface import generate_linear_probe, write_BIDS_probe, read_BIDS_probe
p = generate_linear_probe(num_elec=4)
p.annotate(type="laminar")
p.set_device_channel_indices([3, 2, 1, 0])
write_BIDS_probe("out", p)
```

Observed:

```
ValueError: The truth value of an array with more than one element is ambiguous. Use a.any() or a.all()
```

Expected: the files are written, and `read_BIDS_probe("out").probes[0].device_channel_indices` returns `[3 2 1 0]`.

Cause: the writer checks `if probe.device_channel_indices:`, but that attribute is a numpy array or None. Only unwired probes and single-contact probes could be written.

Fix: check `is not None` instead. The reader already restores the `device_channel_indices` column through `Probe.from_dataframe`, so the round trip works once the writer stops crashing. Adds a round-trip test with a wired probe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b4917a6a4f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.