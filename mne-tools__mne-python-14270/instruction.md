# Issue

**Title:** Brain GUI modernization (Phase 7)

## Description

#### Reference issue (if any)

Phase 7 of  and following 

#### What does this implement/fix?

Adds possibility to see brain activations in brain `labels` with different possible `modes` (e.g. mean-flip)

#### Additional information

following script is helpful for testing:

```
import numpy as np
import mne
from mne.datasets import sample

data_path = sample.data_path()
subjects_dir = data_path / "subjects"

# without src, only mean/max are valid
src = mne.setup_source_space(
    "sample", spacing="oct6", subjects_dir=subjects_dir, add_dist=False
)
src_vertices = src[0]["vertno"]

brain = mne.viz.Brain(
    "sample", subjects_dir=subjects_dir, hemi="lh", background="black", show=False
)
coords = brain.geo["lh"].coords


def gaussian_patch(coords, center, sigma=15.0):
    d = np.linalg.norm(coords - center, axis=1)
    return np.exp(-(d**2) / (2 * sigma**2))


times = np.linspace(0, 1, 20)
temporal = gaussian_patch(coords, center=np.array([-52.0, -18.0, -8.0]))[src_vertices]
temporal_t = temporal[:, np.newaxis] * np.exp(3 * times)[np.newaxis, :]
brain.add_data(
    temporal_t,
    hemi="lh",
    vertices=src_vertices,
    src=src,
    fmin=0.1,
    fmax=1.0,
    colormap="hot",
    key="temporal",
    smoothing_steps=5,
    time=times,
    transparent=True,
)

frontal = gaussian_patch(coords, center=np.array([-38.0, 28.0, 46.0]))[src_vertices]
frontal_t = frontal[:, np.newaxis] * (1 - np.exp(-3 * times))[np.newaxis, :]
brain.add_data(
    frontal_t,
    hemi="lh",
    vertices=src_vertices,
    src=src,
    fmin=0.1,
    fmax=0.6,
    colormap="Blues",
    alpha=0.5,
    key="frontal",
    remove_existing=False,
    smoothing_steps=5,
    time=times,
    transparent=True,
)
brain.setup_time_viewer(show_traces=True)
brain.show()


```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `166e95903eee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.