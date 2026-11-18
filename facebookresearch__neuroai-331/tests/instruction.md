# Issue

**Title:** neuralbench: SLURM_ACCOUNT / SLURM_QOS config keys for training jobs

## Description

Lets NeuralBench training jobs run under a chosen Slurm account and QoS, which `SBATCH_*` exports cannot do since submitit drops them.

- New optional config keys `SLURM_ACCOUNT` and `SLURM_QOS`, wired into the training infra only (feature-extraction infras keep Slurm's defaults). Empty or missing values resolve to `None`, leaving Slurm's per-user default instead of an explicit empty option.
- `SBATCH_ACCOUNT` / `SBATCH_QOS` exports cannot replace them: submitit strips `SBATCH_*` variables before calling `sbatch`.

```json
"SLURM_ACCOUNT": "my_account",
"SLURM_QOS": "my_qos"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb19d1e4d9e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.