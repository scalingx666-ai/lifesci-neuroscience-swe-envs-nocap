# Issue

**Title:** Fix DataJoint query errors with NaN values in probe geometry fields

## Description

## Problem

DataJoint cannot properly format queries when probe geometry fields (`rel_x`, `rel_y`, `rel_z`, `contact_size`) contain NaN values, causing errors during probe insertion and validation. This issue occurs in the `insert_from_nwbfile` method when checking for matching electrode entries:

```python
from spyglass.common import Probe
import numpy as np

# This fails with DataJoint query formatting error
null_val = float('nan')
key = {
    'probe_id': 'nTrode32_probe description',
    'probe_shank': 0,
    'contact_size': null_val,
    'probe_electrode': 194,
    'rel_x': null_val,
    'rel_y': null_val,
    'rel_z': null_val
}
Probe.Electrode() & key  # ❌ DataJoint formatting error
```

## Solution

Replace NaN values with -1.0 during electrode data processing to avoid DataJoint query formatting issues while maintaining the nullable field capability in the database schema.

## Changes Made

1. **Added `_replace_nan_with_default()` helper function** that replaces NaN values in dictionaries with -1.0 (or custom default value)

2. **Applied NaN replacement in all three electrode data processing paths:**
   - `__read_ndx_probe_data()`: When reading probe data from NDX probe objects
   - `_read_config_probe_data()`: When reading probe data from configuration files
   - `create_from_nwbfile()`: When reading electrode data from NWB electrodes table

3. **Added comprehensive unit tests** in `tests/common/test_probe_nan_fix.py` to verify the fix works correctly

## Benefits

- ✅ Fixes the core DataJoint query error that prevented probe insertion
- ✅ Minimal, surgical changes that don't affect existing functionality
- ✅ Maintains existing database schema and nullable field capability
- ✅ Consistent handling across all probe data sources (NDX, config, NWB)
- ✅ Uses -1.0 as a clear "missing data" indicator that works with DataJoint
- ✅ Backward compatible with existing probe data

## After the fix

```python
# NaN values are automatically replaced with -1.0 during processing
key = {
    'probe_id': 'nTrode32_probe description',
    'probe_shank': 0,
    'contact_size': -1.0,  # Was NaN, now -1.0
    'probe_electrode': 194,
    'rel_x': -1.0,         # Was NaN, now -1.0
    'rel_y': -1.0,         # Was NaN, now -1.0
    'rel_z': -1.0          # Was NaN, now -1.0
}
Probe.Electrode() & key  # ✅ Works correctly
```

.

<!-- START COPILOT CODING AGENT TIPS -->
---

💬 Share your feedback on Copilot coding agent for the chance to win a $200 gift card! Click [here](https://survey.alchemer.com/s3/8343779/Copilot-Coding-agent) to start the survey.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1143edac49f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.