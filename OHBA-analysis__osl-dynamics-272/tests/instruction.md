# Issue

**Title:** Feat: Save model with checkpoints.

## Description

Added the option to save checkpoints during training. This includes both model and optimizer weights to allow further training.

Create checkpoints during training with:
```
model.fit(data, checkpoint_freq=5, save_filepath=model_dir)
```
and load model from the latest checkpoint with:
```
model = Model.load(model_dir, from_checkpoint=True)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33e761d4022d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.