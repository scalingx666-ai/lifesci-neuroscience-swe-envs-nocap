# Issue

**Title:** Allow configuration of checkpointing. Can be changed via:

## Description

Allow configuration of checkpointing. Can be changed via:
- `checkpoint_every_steps` (default, no change from before)
- `checkpoint_every_minutes` - As above, but time-based
- `keep_checkpoint_every_minutes` - Allows fine-grained checkpointing during training, and coarser setting for checkpoint selection (off by default)
- `max_checkpoints_to_keep` - Alternative to above, where it keeps N checkpoints in training directory (off by default)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0716af19eb2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.