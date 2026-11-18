# Issue

**Title:** Allow resuming training by passing full path to pretrained_model

## Description

This commit enables loading a pretrained model from a full model path specified in config.yaml, instead of needing to specify only the model name and not the full path. This makes the syntax more consistent with DeepLabCut, where model weights are restored by passing a full path to a snapshot. This commit first tries to load the model based on the specified pretrained_model argument in the project_path/model/best_model directory (as the code does before this commit), and if it can't find that (i.e. the user put something other than the model_name to load), then it tries to load a full file path. If it can't find that, it errors. 

Ending in a FileNotFound error is preferred because with the current state of the repo, if the user puts in an invalid path, it will not load the pretrained_model, but doesn't make it totally clear that it is starting fresh. By resulting in an error the user is forced to put a valid model_name, file path, or None.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `842cb57ca6cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.