# Issue

**Title:** Brain GUI modernization (Phase 8)

## Description

#### Reference issue (if any)

Phase 8 of  and following 

#### What does this implement/fix?

- `flat` surf option added to the `Brain` GUI (only for subjects that have `?h.cortex.patch.flat` like `fsaverage`)
- couple of bugs related to flat brain fixed on the way such as:

1. `add_label(borders=True)` raised on flat
2. Silhouette option did nothing on flat brain
3. `brain.interaction` was removing 2D rubber-band style with no way back


#### Additional information

1. Opus 5 wrote the tests and helped with finding some of the bugs, I iterated over it and understand the changes.
2. following script helps for code review:

```
import numpy as np

import mne
from mne.datasets import sample

data_path = sample.data_path()
subjects_dir = data_path / "subjects"
subject = "fsaverage"

src = mne.setup_source_space(
    subject, spacing="oct6", subjects_dir=subjects_dir, add_dist=False
)

brain = mne.viz.Brain(
    subject, subjects_dir=subjects_dir, hemi="both", background="black", show=False
)

def patch_at(coords, target_yz, sigma=15.0):
    """Gaussian blob centred on the vertex nearest target_yz.

    The two hemispheres are shifted apart along x when shown together, so the
    centre is matched on y/z only, which that shift does not touch.
    """
    center = coords[np.argmin(np.linalg.norm(coords[:, 1:] - target_yz, axis=1))]
    d = np.linalg.norm(coords - center, axis=1)
    return np.exp(-(d**2) / (2 * sigma**2))


times = np.linspace(0, 1, 20)
overlays = [
    ("temporal", (-18.0, -8.0), "hot", 1.0, 1.0, np.exp(3 * times)),
    ("frontal", (28.0, 46.0), "Blues", 0.6, 0.5, 1 - np.exp(-3 * times)),
]

first = True
for key, target_yz, colormap, fmax, alpha, time_course in overlays:
    for hemi_idx, hemi in enumerate(("lh", "rh")):
        vertices = src[hemi_idx]["vertno"]
        patch = patch_at(brain.geo[hemi].coords, np.array(target_yz))[vertices]
        brain.add_data(
            patch[:, np.newaxis] * time_course[np.newaxis, :],
            hemi=hemi,
            vertices=vertices,
            src=src,
            fmin=0.1,
            fmax=fmax,
            colormap=colormap,
            alpha=alpha,
            key=key,
            smoothing_steps=5,
            time=times,
            transparent=True,
            # only the very first call may clear what came before
            remove_existing=first,
        )
        first = False

brain.setup_time_viewer(show_traces=True)
brain.show()

```

example:

<img width="1496" height="1131" alt="Screenshot 2026-09-14 at 12 32 25" src="https://github.com/user-attachments/assets/5c1a8cab-bf96-4f8e-ab58-2a0f3b757a64" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2e955ea2ec6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.