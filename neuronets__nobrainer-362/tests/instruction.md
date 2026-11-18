# Issue

**Title:** feat: nobrainer.gpu + nobrainer.slurm, multi-GPU batch optimization

## Description

## Summary

- New `nobrainer.gpu` module: device detection, GPU memory profiling, automatic batch size optimization
- New `nobrainer.slurm` module: preemption signal handling, checkpoint/resume (moved from kwyk scripts)
- Training scripts auto-detect GPUs and optimize batch size per GPU
- Updated sbatch script for multi-GPU support

## New API

```python
from nobrainer.gpu import auto_batch_size, gpu_info, scale_for_multi_gpu

# Profile a model to find optimal batch size
batch = auto_batch_size(model, block_shape=(32,32,32), target_memory_fraction=0.85)

# Scale for multi-GPU
effective, per_gpu, n_gpus = scale_for_multi_gpu(base_batch_size=32, model=model, block_shape=(32,32,32))

from nobrainer.slurm import SlurmPreemptionHandler, save_checkpoint, load_checkpoint

handler = SlurmPreemptionHandler()  # catches SIGUSR1
save_checkpoint(ckpt_dir, model, optimizer, epoch, metrics)
start_epoch, metrics = load_checkpoint(ckpt_dir, model, optimizer)
```

## Test plan

- [x] 11 new unit tests (gpu + slurm)
- [x] 249 total unit tests pass
- [x] Local smoke test verified
- [ ] CI pipeline

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23ad5c8d526f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.