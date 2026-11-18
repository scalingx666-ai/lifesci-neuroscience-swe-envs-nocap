# Issue

**Title:** TVB-3038 Correction of JR sigmoidal coupling to match paper and documentation

## Description

A small PR correcting the JR sigmoidal coupling to match the model's simgoidal activation function, as well, as the original Sanz-Leon et al paper on TVB models.

In particular, there was a confusion between parameter "a" being the scaling inside the sigmoidal for all other sigmoidal coupling models, but not for the JR one, for which it is the parameter "r".

So, I have:

- set default r = 0.56,
- default a = 1.0 like in the rest of the sigmoidal couplings,
- and changed the docstring to use r instead of a.

Moreover, I added the cmin (with default 0.0) in the pre() equation method in order to match the docstring. It was missing before.

Finally, in the JR model there is an unnecessary repetition of the multiplication 2 * nu_max parameter. We should consider to absorb this either in the parameter or as a derived parameter to be initialized once during the model.configure(), in a future PR. Please comment on this prospect.

See in the attached image the difference r = 0.56 against r=1.0 makes. Not big, but it is something to consider, especially how many people use the model without noticing it.

![image](https://user-images.githubusercontent.com/8103781/198247453-6fe2ae5b-9461-4e3e-8453-37fc425df827.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4af30af4146`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.