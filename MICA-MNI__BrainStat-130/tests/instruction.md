# Issue

**Title:** move from fork to main repo for further testing of binder

## Description

This `PR` moves the implementation and testing of [binder](https://mybinder.readthedocs.io/en/latest/) support/integration for the tutorials from @PeerHerholz 's [fork](https://github.com/PeerHerholz/BrainStat/tree/binder_support) back to the main repository. The reason/motivation for that is the way `binder` support works, that is an interaction between `forks`/`branches` and `hosting`. This PR includes a `merge` from the main `master branch` to the `master branch` on @PeerHerholz 's [fork](https://github.com/PeerHerholz/BrainStat/tree/binder_support), a subsequent merge from the `master` to the `binder_support branch` within this fork, as well as some commits for an initial draft on how the `binder support` could be added to the `docs`. All subsequent `binder` things will happen in the `binder_support branch` of the main repository as discussed with @ReinderVosDeWael.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d333af04ed37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.