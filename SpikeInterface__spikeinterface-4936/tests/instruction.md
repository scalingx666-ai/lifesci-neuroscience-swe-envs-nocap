# Issue

**Title:** Topological distribution widget (#3142 followup)

## Description

This PR finishes #3142, a nice widget that shows distribution of units on the probe with a histogram along the depth. It's not possible to work directly on that fork, so the PR is complete here with original commits retained for attribution.

This PR makes some small fixes, and one extension, adding the plot label to the histogram (this can be turned off). See below for code to test the PR.

<img width="604" height="449" alt="image" src="https://github.com/user-attachments/assets/adb0d7b5-bd2a-4919-b84c-4b50b5a75fa7" />

<details> <summary>MRE </summary>

```
import numpy as np
import matplotlib.pyplot as plt
from probeinterface import generate_multi_columns_probe

import spikeinterface as si
import spikeinterface.full as si_full
from spikeinterface.core.generate import generate_templates
from spikeinterface.widgets.unit_spatial import (
    UnitSpatialDistributionsWidget,
)

print("Using SpikeInterface from:", si.__file__)
si.set_global_job_kwargs(n_jobs=1)
rng = np.random.default_rng(42)

# Simplified Neuropixels-style probe: 384 contacts, about 3.8 mm.
probe = generate_multi_columns_probe(
    num_columns=2,
    num_contact_per_column=192,
    xpitch=32,
    ypitch=20,
    contact_shapes="square",
    contact_shape_params={"width": 12},
)
probe.set_device_channel_indices(np.arange(384))
probe.set_planar_contour(
    np.array([
        [-19, 3840],
        [51, 3840],
        [51, -20],
        [16, -100],
        [-19, -20],
    ])
)

# Dense depth bands separated by sparse regions.
depths = np.concatenate([
    rng.normal(450, 160, 170),
    rng.normal(1550, 100, 90),
    rng.normal(2350, 220, 110),
    rng.uniform(100, 3200, 30),
])
depths = np.clip(depths, 30, 3700)
num_units = depths.size

unit_locations = np.column_stack([
    rng.uniform(-2, 34, num_units),
    depths,
    rng.uniform(10, 45, num_units),
])

# Generate waveforms from those specific neuron locations.
sampling_frequency = 25000.0
templates = generate_templates(
    channel_locations=probe.contact_positions,
    units_locations=unit_locations,
    sampling_frequency=sampling_frequency,
    ms_before=1.0,
    ms_after=3.0,
    seed=42,
)

recording, sorting = si_full.generate_ground_truth_recording(
    durations=[10.0],
    sampling_frequency=sampling_frequency,
    probe=probe,
    num_units=num_units,
    templates=templates,
    ms_before=1.0,
    ms_after=3.0,
    generate_sorting_kwargs={
        "firing_rates": 8.0,
        "refractory_period_ms": 4.0,
    },
    seed=42,
)
sorting.set_property("gt_unit_locations", unit_locations)

analyzer = si_full.create_sorting_analyzer(
    sorting=sorting,
    recording=recording,
    format="memory",
    sparse=False,
)
analyzer.compute("random_spikes", max_spikes_per_unit=20)
analyzer.compute("waveforms")
analyzer.compute("templates")
analyzer.compute("unit_locations", method="center_of_mass")

cases = {
    "Depth distribution": {},
    "2D histogram": {"bins": (12, 80)},
    "KDE": {
        "kde": True,
        "kde_kwargs": {"bw_adjust": 0.3},
    },
}

# Use the widget's default figure size and axes layout.
for title, kwargs in cases.items():
    UnitSpatialDistributionsWidget(
        analyzer,
        backend="matplotlib",
        figtitle=title,
        depth_axis=1,
        **kwargs,
    )

plt.show()
```

</summary>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80a9f49edc87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.