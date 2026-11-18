# Issue

**Title:** Rename `revert_array()` to`reverse_array()`

## Description

Without comments I'm not totally sure as to the reasons it's being used at the callsites, but, I think `revert_array()` is reversing an array of doubles - i.e. it's flipping it round in-place so that the order is now backwards. I think renaming it `reverse_array()` makes its purpose clearer. Reverting to me implies that the array is being returned to some previous state (like `brz revert` on a file), which is different to reversing the order. 

However feel free to correct me if I have misunderstood! Longer-term I think it would make sense to use a [reverse range](https://en.cppreference.com/w/cpp/algorithm/ranges/reverse) if possible. We shouldn't make copies unless we have to, although I understand many libraries used by brainflow may not yet be aware of ranges, iterator adaptors, etc..

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f0d43c5ca5c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.