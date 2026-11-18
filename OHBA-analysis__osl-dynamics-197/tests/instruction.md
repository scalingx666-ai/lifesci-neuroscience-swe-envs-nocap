# Issue

**Title:** Enhance: Updated SE-HMM (and SE-DyNeMo)

## Description

This PR consists of mainly the following changes for better convergence of SE-HMM (and potentially SE-DyNeMo):

- Single decoder for both deviation magnitude and deviation map. This reduces the number of parameters in the model, providing better training stability, while maintaining the expressiveness of the model.
- Method to initialise the parameters of the deviation posterior with training data. This greatly improves the convergence of the model by initialising the model in a "good" spot.
- It is now possible to anneal the sampling process of deviation posterior during reparameterisation. This serves as a exploration vs exploitation process. In the beginning of the process, only the mean is sampled and the gradient will intend to push the mean deviations to the correct spot. This is the exploration phase. As training progresses, we gradually take into account the variance of the deviation posterior and fine tune the posterior parameters. This is the exploitation phase. It is found that it helps the model covergence.
- Finally, the config API wrapper is updated to accommodate the above changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd2a53b0fe1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.