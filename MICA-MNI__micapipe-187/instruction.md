# Issue

**Title:** Bump FSL to 6.0.7.23 so the container ships eddy_cuda

## Description

Raúl asked for an FSL version that ships `eddy_cuda`, since we will be using it. 6.0.7.8 does not give us one.

## Why 6.0.7.23

| release | CUDA eddy package | binary |
|---|---|---|
| 6.0.7.8 (current) | `fsl-eddy-cuda-10.2 2401.2` | `eddy_cuda10.2`, CUDA 10.2 only |
| 6.0.7.20 | none | — |
| 6.0.7.22 | `fsl-eddy-cuda 2602.0` | `eddy_cuda` |
| 6.0.7.23 | `fsl-eddy-cuda 2602.0` | `eddy_cuda` |

FSL dropped the CUDA eddy in 6.0.7.20 and brought it back unsuffixed in 6.0.7.22, so 6.0.7.23 is the latest release that gives us plain `eddy_cuda`. The CUDA 10.2 build we ship today will not run on current drivers.

The unsuffixed package cannot simply be added to 6.0.7.8: it requires `fsl-newimage >= 2601.0`, `fsl-miscmaths >= 2412.6` and `fsl-utils >= 2412.6`, all newer than that release ships.

## What changed

- New lock `environments/locks/fsl-6.0.7.23-linux-64.txt`, solved from FSL's own `fsl-6.0.7.23_linux-64.yml`. 732 packages, up from 693. The old 6.0.7.8 lock is removed.
- `/opt/fsl-6.0.7.8` → `/opt/fsl-6.0.7.23` in `containers/install_runtime.sh`, `containers/runtime_env.sh`, `containers/fix_wrapper.sh`, `functions/init.sh` and `tests/beta_smoke.sh`.
- `containers/versions.json` records the new version, the lock path, and now also `eddy_cuda`, `pyfix` and `setuptools`.

Carried along by the release: `fsl-pyfix` 0.6.0 → 0.10.0 and `setuptools` 80.9.0 → 84.2.1.

## Not changed, on purpose

- **The legacy R/Octave FIX stays the default** and is untouched. Raúl confirmed the R-trained model and Octave are compatible with newer FSL, so converting the model is off the table.
- `docs/validation/v1-beta.md` still says 6.0.7.8, because it records what the 20261028 image was actually validated with.
- The three `scripts/*fix*.sh` comparison scripts still point at `environments/fsl-6.0.7.8`, which is a real directory on the server from that experiment.

## Before merging

Both container variants need rebuilding against this lock and revalidating; only then should the validation doc move to 6.0.7.23. Nothing here has been run inside a rebuilt image yet.

Based on `enning/v1-beta-alt-fs`, which carries the `containers/` and `environments/` tree this change edits.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e0ecfce6d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.