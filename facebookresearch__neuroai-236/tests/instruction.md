# Issue

**Title:** neuralbench: unify torch floor with neuralset/neuraltrain

## Description

`neuralbench` pins `torch==2.6` / `torchaudio==2.6` / `torchvision==0.21` to keep CUDA
capability `sm_60` (Pascal) available. That forces every install of the package onto
exactly that stack, while `neuralset` and `neuraltrain` ask only for `torch>=2.5.1`.

The pin is the wrong lever: arch coverage comes from the wheel's CUDA variant, not the
torch version. From PyTorch's build matrix for 2.14.0 (x86_64):

| CUDA build | Architectures shipped | `sm_60` |
|---|---|---|
| 12.6 | 50, 60, 70, 75, 80, 86, 90 | yes |
| 13.0 / 13.2 | 75, 80, 86, 90, 100, 120 | no |

The `cu126` index publishes builds for every release through 2.14.0, all retaining
`sm_60`. What strands Pascal users is that PyPI's default wheel tracks the newest CUDA
(`CUDA_STABLE` is 13.0), so a plain `pip install torch` quietly gets a Pascal-less
build — as the 2.8.0 release notes put it, "If you need support for these
architectures, please utilize CUDA 12.6 instead."

So the three pins become the same floors as the sibling packages, and
`_warn_unsupported_gpu()` runs at CLI startup beside `_warn_slurm_partition`. It
compares each visible device's compute capability against the installed build's arch
list and names the remedy by direction: the `cu126` index for cards below the range, a
torch upgrade for cards above it. Release wheels are SASS-only, so the check applies
same-major / minor-not-greater compatibility rather than assuming PTX JIT.

Verified on a dual Quadro GP100 host. With the current `2.6.0+cu124` build (arch list
includes `sm_60`) the check is silent — no false positive. Against a simulated CUDA 13
arch list it emits one warning for the pair, deduplicated by capability:

> Quadro GP100 has CUDA capability sm_60, which torch 2.6.0+cu124 was not built for
> (built for sm_75, sm_80, sm_86, sm_90, sm_100, sm_120). GPU runs will fail; to fix,
> reinstall from a CUDA 12.6 build, which still ships sm_50-sm_90:
> `pip install --force-reinstall torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126`

One consequence worth flagging for review: with no ceiling, CI resolves to the newest
torch whenever the monthly venv cache rotates, and the suite has not been run against
2.14. A `<3` bound would hedge that, at the cost of diverging from the siblings again.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11736e56bbd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.