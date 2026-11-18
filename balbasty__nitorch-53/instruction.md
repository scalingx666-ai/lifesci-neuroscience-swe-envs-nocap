# Issue

**Title:** feat: Dropout layer

## Description

@balbasty could you  please tell me if you think this integration of Dropout into nitorch is okay?

I have added a dropout module, that is integrated into the conv class (see Line 833 in conv.py and Line 7 in dropout.py). I have a flag in the forward call of Dropout to ensure it is only applied during training. The only thing that is a bit messed up is the model printing:

![image](https://user-images.githubusercontent.com/6413806/129744039-fe70c2cc-dcc3-465c-891b-5f3c4a160569.png)

because how I merge Dropout and the activation function.

The only model where I have included the dropout option is the regular CNN.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eff44ff2c843`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.