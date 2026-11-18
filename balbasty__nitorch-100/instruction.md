# Issue

**Title:** CI: run workflows on current runners, TorchScript backend only

## Description

## Summary

All workflows requested `ubuntu-18.04` runners, which GitHub retired, so jobs stayed **queued forever**. For example, the checks of #92 have been queued since they were created. Python 3.6 and PyTorch ≤ 1.10 aren't available on current runners either, so the matrix had to change too.

- **Runners & versions**: `ubuntu-24.04` with two explicit combinations:
  - python 3.9 + torch 1.13.1 + numpy<2: the oldest versions available there (torch 1.x does not support numpy 2);
  - python 3.12 + torch 2.5.1.
  The matrices are include-only, so each entry becomes its own job.
- **TorchScript backend only**: `test` now installs with `NI_COMPILED_BACKEND=TS`, because compiling the C++ backend takes too long (about 13 min locally). `build` and `test_pushpull_C`, which only exist to compile it, are now `workflow_dispatch` only. `build` is CPU-only: CUDA builds need a rewritten `install_cuda_ubuntu.sh`, because the CUDA 10.x packages and the NVIDIA apt key it uses are no longer available.
- **Install**: `pip install --no-build-isolation -e .` instead of `setup.py develop`. Recent setuptools delegate `develop` to pip with build isolation, which would download another torch (per `pyproject.toml`) to build against.
- **`install_pytorch_ubuntu.sh`**: CPU builds of torch ≥ 1.13 now come from the dedicated CPU index, with an explicit `+cpu` version so that the multi-GB CUDA build from PyPI is never selected. Older versions keep the `torch_stable.html` path.
- `actions/checkout@v4`, `actions/setup-python@v5`; setuptools and wheel are installed explicitly (not preinstalled with python ≥ 3.12).
- `manual-build`: defaults updated (`ubuntu-24.04`, 3.12, 2.5.1, `cpu`). CUDA install steps are skipped when `cuda-version` is `cpu`.

## Testing
- I replayed the `test.yml` steps locally (python 3.11 + torch 2.15, because this sandbox could not reach the PyTorch index for the exact CI versions). TS install took 2.4 s, then 208 passed, 2 failed. The two failures are `test_babel::test_nifti`/`test_mgh`, which fail on master too and are fixed by #92 + #97. **So this PR's own checks are expected to show those 2 failures until #92/#97 are merged.**
- Install script commands checked by dry run for torch 1.10 (legacy path), 1.13.1 and 2.5.1.
- Note: on pull requests, GitHub runs the workflow files from the merge with the base branch. The other open PRs will pick up these workflows once this is merged and their branches are updated.

Related: #101 makes the C++ extension compile with recent setuptools/PyTorch, which the manual `build`/`test_pushpull_C` workflows need.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaSE7XNeP7n5m7KZsaM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77d805c37d00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.