# Issue

**Title:** Scale only the waveforms amplitude_scalings reads

## Description

### Description

`AmplitudeScalingNode.compute` scales every trace sample in a chunk before reading only the short, sparse windows around each spike. This PR moves the same scaling expression after each cut-out, including the collision path, so the temporary now scales with the samples and channels used by the regression instead of the whole chunk. The new `fit_collision` arguments are appended to keep existing positional calls compatible.

### Benchmarks

Binary-backed generated recordings, 384 channels at 30 kHz, GCP `c3-standard-22`, BLAS threads pinned to 1, fresh processes and interleaved arms. Times are median (range), with five runs per arm except the 11-extension pipeline, which uses three.

| pipeline | before | after | change | peak RSS |
|---|---:|---:|---:|---:|
| `valid_unit_periods`, 100 units | 13.946 s (13.916–13.985) | 12.476 s (12.413–12.550) | −10.5% | 522 → 389 MiB |
| `valid_unit_periods`, 200 units | 99.453 s (98.571–100.084) | 91.841 s (91.159–92.288) | −7.7% | 569 → 436 MiB |
| 11 postprocessing extensions, 200 units | 128.353 s (127.821–130.792) | 120.195 s (119.215–120.645) | −6.4% | 1,713 → 1,713 MiB |

The memory saving disappears in the wider pipeline because `waveforms` sets its high-water mark.

### Validation

The `amplitude_scalings` bytes have the same SHA-256 before and after in 128 comparisons covering float32/int16/float64/uint16 recordings, absent/uniform/per-channel gains, collisions on/off, `n_jobs=1/4`, two NumPy/SciPy combinations and a two-segment recording.

- `pytest src/spikeinterface/postprocessing/tests -q`: 97 passed, 40 skipped
- `bin/spikeinterface_lint.sh --check`: clean

Tested on Linux with generated data written to binary first; no real capture was used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2edda41755`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.