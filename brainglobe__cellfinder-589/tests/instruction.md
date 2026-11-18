# Issue

**Title:** Adds support for varying learning rate during training

## Description

## Description

This PR depends on  Only the last commit in this PR is unique to this PR.

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

It's pretty common to adjust the learning rate as training progresses. A common pattern is to start with a higher rate and then as it starts converging, you drop the learning rate so it can find the best minima around the global minima until it's fully stable. There are many [approaches](https://docs.pytorch.org/docs/stable/optim.html#how-to-adjust-learning-rate). A very basic one is to drop the learning rate by a set amount at specific epochs. You would then run a few training sessions to find which epochs are good choices to reduce the learning rate.

E.g. when I originally trained my _final_model I used to classify our data I got the following curves for train/test accuracy/loss. The labels indicate if the training data was raw or normalized (as in ). The number following that indicates the epoch when the learning rate was dropped. E.g. `Norm 45` means the training data was normalized and that the learning rate was dropped from 1e-3 to 1e-4 at epoch 45. No decay means the learning rate stayed the same (although I typically stopped those early)

The following is the plotted data from that training (data augmentation was `25%` using `resnet50_tv` using a batch size of `32` and with `--continue-training`). Based on that I chose the model that used normalized data and with learning rate decay at epoch 45 - that had the best results while minimizing over-fitting:

![ours_train_accuracy](https://github.com/user-attachments/assets/c45bdcc4-4604-4dce-a3ef-1f0b68d6e82b)
![ours_test_accuracy](https://github.com/user-attachments/assets/7cdef20b-18b8-4b81-8c5c-85ede226e06d)
![ours_train_loss](https://github.com/user-attachments/assets/f146ceb1-fcb6-4901-b2da-0331cb04c63a)
![ours_test_loss](https://github.com/user-attachments/assets/6651d27c-63b0-400a-9c10-f3468338cb09)

**What does this PR do?**

This adds the following two parameters to the training code (copied from the docs):

- `lr_schedule : list of ints`: If not empty, the list of epochs when to multiply the current learning rate by the `lr_multiplier`. E.g. if it's `[10, 25]`, we start with a learning rate of `0.001`, and `lr_multiplier` is `0.1`, then the LR will be `0.001` for epochs 0-9, `0.0001` for 10-24, and `0.00001` for epoch 25 and beyond.
- `lr_multiplier : float`: The multiplier by which to multiply the previous learning rate at the epochs listed in `lr_schedule`.


I ran a few replicates to see how replicable modifying the learning rate is and here are the plots. Raw/Norm refer to whether the training data was normalized, `f=n` refers to the percent data used for testing so 50% simulates low training data, and `N=n` refers to the number of lines in the plot indicating the replicates.

![train_accuracy](https://github.com/user-attachments/assets/33b80579-75e1-4f5f-af52-b9c807fbf611)
![test_accuracy](https://github.com/user-attachments/assets/a2210dd7-285b-402f-8c59-d1ffeea47464)
![train_loss](https://github.com/user-attachments/assets/ee50c21b-0216-4778-86c6-a077edfd1e4e)
![test_loss](https://github.com/user-attachments/assets/596cb1c4-b294-4440-a834-f024b30fcb3d)

## References



## How has this PR been tested?

I added tests and tested it on my own models.

## Is this a breaking change?

No. By default the options are off.

## Does this PR require an update to the documentation?

There are new parameters.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `378560aa2239`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.