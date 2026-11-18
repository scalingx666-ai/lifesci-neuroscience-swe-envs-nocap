# Issue

**Title:** Rebuild the v1 beta container, and make the CUDA eddy actually reachable

## Description

Rebuilds the beta container for `v1` and fixes the three things the rebuild's
pilots found. `v1` had no matching image: beta.2 (20261023) predates both the
experimental `-alt_fs` surfaces and the FSL 6.0.7.23 bump that gives us an
unsuffixed `eddy_cuda`, so nobody could test either of them from a container.

Two of the three are real pipeline defects rather than packaging problems, and
one of them means the CUDA eddy that #187 raised FSL for had never run.

### The CUDA eddy could not run on any host

The second beta.3 build passed everything and its GPU pilot completed, but the
eddy command it recorded was `eddy_cpu` and `proc_dwi` had taken 183 minutes.
`eddy_cuda` is fine in the image — it is on `PATH`, every library including
`libcuda.so.1` resolves under `--nv`, and `mrtrix3.fsl.eddy_binary(True)`
returns it — and `dwifslpreproc` does try it first. It failed at
`cudaGetDevice` with `cudaErrorNoDevice: no CUDA-capable device is detected`,
and MRtrix quietly re-ran `eddy_cpu`.

The cause is ours. `functions/utilities.sh` sets `CUDA_VISIBLE_DEVICES=''` for
the whole pipeline (5cfc7d2, for a BIC-SGE failure in `proc_dwi`) and only
`restore_gpus` undoes it; `01_proc-surf.sh` calls it for FastSurfer and
FastScrubber, `02_proc-dwi.sh` never did. Nothing in the logs said so either:
`dwifslpreproc` writes its reason to `eddy_cuda_failure_output.txt` in a
scratch directory the run then deletes, so reproducing it needed `-nocleanup`.

`proc_dwi` now hands the GPUs back around the `dwifslpreproc` call, and only
where the host really has one, so a node without a GPU keeps the quiet CPU path
5cfc7d2 was protecting. `has_gpu` answers that question in one place. On the
pilot this took `proc_dwi` from 183 minutes to 15.

`tests/beta_smoke.sh` now checks the mechanism instead of just the binary: that
the pipeline still hides the GPUs, that `restore_gpus` hands them back, and
that `eddy_cuda` then stops reporting `cudaErrorNoDevice`. An image whose
headline feature is unreachable should fail its own smoke test.

### FastSurfer gets one GPU

The first beta.3 build died in its GPU pilot. With all eight A6000s visible,
FastSurfer wraps its model in `torch.nn.DataParallel`
(`FastSurferCNN/inference.py`: `torch.cuda.device_count() > 1 and
device.index is None`), which sat in the first batch of coronal inference for
77 minutes and then failed with `NCCL Error 6: remote process exited or there
was a network error`. The GPUs were otherwise idle, so this was not
contention — re-running the same image with `CUDA_VISIBLE_DEVICES=0` got all
three predictions and the surface reconstruction.

`run_fastsurfer()` now keeps the first GPU the caller offered. One GPU segments
a scan in about a minute, so nothing is lost, and `CUDA_VISIBLE_DEVICES` still
chooses which one. On the rebuilt image, with every GPU on the host visible,
coronal inference takes 6.2 seconds.

### proc_surf stops where it fails

The same pilot showed `proc_surf` carrying on after FastSurfer failed: it ran
FastScrubber, `clean_brain_mask.py` crashed on the `aseg.auto.mgz` FastSurfer
never wrote, and the module only reported `INCOMPLETE` at the end. Both
FastSurfer passes and the mask cleanup now fail the module where they fail.

### Smaller things

- FastSurfer's version is cached in `BUILD.info` at build time.
  `run_fastsurfer.sh` prefers that over git, and `/opt/FastSurfer` belongs to
  the build user rather than the caller, so at run time git refused it: every
  FastSurfer call printed four `detected dubious ownership` errors and logged
  an empty version. This is what FastSurfer's own images do. The pilots now log
  `Version: 2.6.0+1dc0247` and zero ownership errors.
- `tests/test.sh` and `tests/sample_test.sh` pointed `-dwi_rpe` at files
  BIDS_CI does not have. The 3T reverse-phase b0 is
  `dwi/..._acq-b0_dir-PA_dwi.nii.gz` and the 7T one is
  `fmap/..._acq-b0_dir-PA_epi.nii.gz`. Dormant since the self-hosted runner
  went offline in July, so this is not what broke CI, but both paths were
  wrong.
- `containers/versions.json` records the beta.3 rebuild.

### Validation

[`docs/validation/v1-beta-3.md`](docs/validation/v1-beta-3.md) has the full
record: what was built, the static/FSL/smoke results for both variants, both
pilots, all three builds and why only the third is the candidate, and what is
explicitly not established. The images are in
`/data_/mica1/01_programs/singularity/` with `.sha256` files and a README.

### One gap left alone

`micapipe` runs every module as `$COMMAND | tee`, so the pipeline's exit status
is `tee`'s: a module that cannot even start still leaves micapipe reporting
success and `0.000 minutes`. I hit this while debugging and left it, because
changing it touches every module and every qsub path and would alter what
callers see. Worth its own change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aa9eb2d1d84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.