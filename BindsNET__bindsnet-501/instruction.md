# Issue

**Title:** Minor changes

## Description

A few suggestions:
- `Nodes:` When `traces_additive` is False, spike trace (self.x) would be filled with 1 at spike points. However, it is not always the case (For example in Izhikevich 2007, this value is set to 0.1). I think the 1 is better to be replaced by the `trace_scale` value, so users can set this value as well.
- `Nodes:` typo: `self.tau`
- `Learning: `the default value for `nu` is set to `None`, which makes the `PostPre` learning rule practically wasteful. I believe it is not a good default value for an argument and it is better to be replaced by some float numbers or get changed to a mandatory argument.
- `Network:` the format of the `inputs` argument of the `run` method is not very common and since the input in most of the deep learning frameworks (mainly TensorFlow and Pytorch) is in the type of tensors, it can be tricky especially for new users. Furthermore, since there is no explicit error to point out this problem, it could be sometimes hard to find and a time-consuming error. Adding an assert to check the type of `inputs` can be helpful in this regard.
- `Network:` A progress bar can be useful in very long runs A custom progress bar (including some information about the run and the network) can be added later.
- `Learning:` replace `torch.ger` with `torch.outer` (https://pytorch.org/docs/stable/generated/torch.ger.html)
- `models:` typo: `inhibitory`

@Hananel-Hazan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9f3e9d6d05e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.