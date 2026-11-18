# Issue

**Title:** ENH: Allow passing precomputed interpolation data for EEG and MEG

## Description

#### what does this implement/fix?

addresses #4651 (precompute bad channel interpolation data for eeg and meg).

when preprocessing multi-condition `Evoked` erp datasets, batches of `Epochs`, or running automated artifact pipelines like `autoreject`, calling `.interpolate_bads()` repeatedly on data with identical sensor configurations recomputes:
- the spherical legendre polynomial expansion and gram matrix inversion for eeg.
- the forward field self-dot-products (`_do_self_dots`) for meg.

this pr implements precomputation for both modalities:
1. adds `mne.channels.compute_interpolation_data(info, *, origin="auto", mode="accurate")`, returning an `InterpolationData` (subclass of `dict`) containing precomputed spline/field matrices and sensor selection metadata.
2. adds a keyword-only parameter `interpolation=None` to `.interpolate_bads()` across `Raw`, `Epochs`, and `Evoked`.
3. reuses cached matrices when channel order and `bads` match, cleanly falling back to normal recomputation if sensors change.
4. yields identical numerical results (`atol=1e-15` for eeg, `atol=1e-12` for meg) compared to the uncached path.

#### example usage

```python
import mne
from mne.channels import compute_interpolation_data

# Precompute interpolation data once
interp = compute_interpolation_data(raw.info)

# Apply across multiple epochs or evoked conditions in microseconds
for evoked in evokeds:
    evoked.interpolate_bads(interpolation=interp)
```

#### benchmark results

| modality / configuration | uncached (recompute) | cached data | speedup | parity |
| :--- | :--- | :--- | :--- | :--- |
| EEG (32 ch, 2 bads) | 7.36 ms | 0.36 ms | 20.3x | exact (`atol=1e-15`) |
| EEG (64 ch, 2 bads) | 8.06 ms | 0.45 ms | 17.9x | exact (`atol=1e-15`) |
| EEG (128 ch, 4 bads) | 20.26 ms | 0.79 ms | 25.7x | exact (`atol=1e-15`) |
| EEG (256 ch, 8 bads) | 47.67 ms | 1.35 ms | 35.2x | exact (`atol=1e-15`) |
| MEG Neuromag (306 ch, 2 bads) | 1,343.6 ms | 59.8 ms | 22.5x | exact (`atol=1e-12`) |
| MEG Neuromag (306 ch, 8 bads) | 1,347.0 ms | 59.3 ms | 22.7x | exact (`atol=1e-12`) |
| Combined EEG + MEG (366 ch) | 1,340.2 ms | 60.5 ms | 22.1x | exact (`atol=1e-12`) |

#### verification

- `pytest mne/channels/tests/test_interpolation.py` passes cleanly for both eeg and meg.
- `ruff check`, `ruff format --check`, and `codespell` pass with no warnings.

#### additional information

assisted by google antigravity / claude for drafting and benchmark script scaffolding; code and numerical parity were manually reviewed, verified, and profiled locally against the uncached baseline.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bcd6f222bb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.