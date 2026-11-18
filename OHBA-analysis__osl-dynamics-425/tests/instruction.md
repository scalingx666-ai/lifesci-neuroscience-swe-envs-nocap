# Issue

**Title:** Fixed model initialisation, resetting, checkpointing and loading.

## Description

## Changes 

Checkpoints and saving:
- CheckpointCallback used tf.train.Checkpoint, which doesn't find the weights of layers held in a self.layers list, so checkpoints contained no model weights and load(from_checkpoint=True) silently returned an untrained model. Use Keras' save_weights/load_weights instead.
- save_best_after == n_epochs crashed at the end of training. Also, only reload the best weights if SaveBestCallback saved them during this fit.
- Use a uuid for the default best-model path and don't reuse save_filepath as both a file and a directory when save_best_after and checkpoint_freq are both passed.
    
Resetting weights:
- Pass keep into the recursive call in reinitialize_model_weights.
- Skip '*_initializer' attributes that aren't initializers instead of reusing the previous initializer.
- Reset the Gumbel-Softmax temperature in DyNeStE.
- Fix the layer-name check for the means/covs_dev_mag annealing factors (HIVE, DIVE and KLAnnealingCallback).
- Raise an error in train() if the free energy is NaN for every run.
- Document that parameters set with update_initializer=True are reset to the value that was set.
    
Layers and observation model:
- Add compute_output_shape to DummyLayer (models with *_normalization=None failed to build).
- Non-learnable diagonal and correlation matrices now default to the identity (wrong shape/values before).
- Raise an error instead of silently writing NaNs for non-positive definite matrices.
    
Compiling:
- compile() wrapped compute_metrics again every time it was called and added new loss metrics to the model, slowing down training after many resets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be508dca51b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.