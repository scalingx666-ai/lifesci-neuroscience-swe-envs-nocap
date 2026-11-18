# Issue

**Title:** Install CUDA toolkit headers with the gpu extra

## Description

. No issue filed.

`pip install tedana[gpu]` installs without errors on a machine with only the NVIDIA driver (no system CUDA toolkit), but the first CUDA fit fails:

```
RuntimeError: Failed to find CUDA headers. Please install CUDA toolkit headers (e.g., pip install cupy-cuda12x[ctk]) or specify CUDA_PATH environment variable.
```

CuPy 14 compiles its kernels on first use and needs the toolkit headers to do so. `_resolve_backend` only checks the device count, so `--backend auto` also picks CUDA on these machines and then crashes instead of falling back to the CPU.

Changes proposed in this pull request:

- Change the `gpu` extra to `cupy-cuda12x[ctk]>=14.2,<15`, which installs the CUDA toolkit from PyPI, and regenerate `uv.lock`. The lock change only adds packages (`cuda-toolkit` and the `nvidia-*-cu12` packages).
- Have `_resolve_backend` run a one-element kernel after the device check. `auto` then falls back to the CPU with a warning, and `cuda` raises an error that mentions the toolkit headers.
- Add a test with a stub CuPy module whose device check passes but whose kernel compilation fails.

Verified on WSL2 with an RTX 4070 and only the driver installed (no `nvcc`, `/usr/local/cuda`, or `CUDA_PATH`), using fresh environments and a CUDA curvefit fit through `decay.fit_decay`:

| Environment | `--backend cuda` | `--backend auto` |
|---|---|---|
| `main`, `tedana[gpu]` | `Failed to find CUDA headers` | picks CUDA, then same error |
| this PR, `tedana[gpu]` | fit runs on GPU | fit runs on GPU |
| this PR's code, CuPy without `[ctk]` | clear `RuntimeError` naming the toolkit headers | falls back to CPU |

Note: `[ctk]` adds a few hundred MB of CUDA packages, which is redundant on systems that already have a toolkit but harmless.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c3c8abc6ec8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.