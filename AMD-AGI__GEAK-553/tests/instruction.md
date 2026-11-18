# Issue

**Title:** Refuse identified ISAs with no GEAK image policy

## Description

### What changes

`detect_gpu_arch` in `geak/ci/lib.sh` maps the structured `rocminfo` identity to the
image bucket that `resolve_image` looks up in `docker_setup/docker_default.json`.
Today, any ISA without its own `case` arm falls through to `$GEAK_GPU_ARCH_DEFAULT`,
which is `MI355` on this cluster. A Strix Halo (gfx1151), a Radeon Pro W7700
(gfx1101) or a Radeon PRO W6800 (gfx1030) therefore gets the MI355 (gfx950) image.

With this change:

| Identity on the host | Before | After |
| --- | --- | --- |
| No `rocminfo` identity (probe missing or empty) | `MI355` default | `MI355` default (unchanged) |
| gfx950, gfx942/gfx90a, gfx1201, gfx1200 | own arm | own arm (unchanged) |
| Any other identified ISA, e.g. gfx1151 | `MI355` default | `E_ARCH_UNSUPPORTED`, return 1 |

Three files change (+19/−2):

- `geak/ci/lib.sh`: an explicit `""` arm keeps the default for a host with no
  identity probe, and the `*)` arm refuses with `E_ARCH_UNSUPPORTED`. The header
  comment says so.
- `geak/kernel_workflow/scripts/test_detect_gpu_arch.sh`: gfx1151, gfx1101 and
  gfx1030 stubs must fail with `E_ARCH_UNSUPPORTED`.
- `geak/ci/ONBOARDING.md`: one sentence on the refusal.

### Who is affected

Only `ci/node/run_local.sh` calls `resolve_image`, and only when `IMAGE` is unset.
On an affected host, either of these keeps working:

- `IMAGE=<image>`: `resolve_image` returns it without detection.
- `GEAK_GPU_ARCH=MI355` (or another allowlisted bucket): the override is used as today.

`geak/docs/compatibility.md` lists the Radeon 8060S (Strix Halo, gfx1151) as a
supported platform. Owners of gfx1151 boards: please confirm whether any of your
runs go through `run_local.sh` without `IMAGE` or `GEAK_GPU_ARCH`, and whether
those runs need a gfx1151 entry in `docker_default.json` instead of the refusal.

### Verification

- The patch applies to `origin/main` `31506ae4`. `test_detect_gpu_arch.sh` passes
  on an `origin/main` export, before and after the patch.
- Mutation: with only the test hunk applied, the test fails with
  `gfx1151 must not resolve to an image bucket (got MI355)`.
- On a stubbed gfx1151 host, `resolve_image vllm` returns `E_ARCH_UNSUPPORTED`;
  with `GEAK_GPU_ARCH=MI355` it returns the MI355 vLLM image, and with `IMAGE` set
  it returns that image.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0a05d95a920`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.