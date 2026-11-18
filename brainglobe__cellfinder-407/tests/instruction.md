# Issue

**Title:** Optimize cell detection

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
All credit to #398 and @matham, just needed these changes to take a little detour via this branch so I could test them more in-depth.

**What does this PR do?**
Merges in the changes from #398 after some more testing.

## References
-

## How has this PR been tested?

For some practical triple-checking, I ran cell detection (no registration or classification) via brainmapper on our local HPC cluster with 16 cores and a GPU, with and without the changes proposed in #398, on a CFOS stained whole brain.

* Overall cell candidate detection took ~5 h 30 mins with the changes, compared to ~8 h 30 mins before
* Both runs found ~3.5 millions cells, with 98% matching coordinates
* I compared coordinates on the 38'000 cell candidates found in 20 slices in the middle of the sample brain.
* ~800 cells didn't match
* ~200 out of the 800 cells were more than 2 um away from their closest neighbour
* visual inspection in napari looked very reasonable

I'd say this is close enough.  

## Is this a breaking change?
No

## Does this PR require an update to the documentation?

Yes, we should update https://brainglobe.info/community/developers/repositories/cellfinder-core/index.html#id1
## Checklist:

- [x] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes. To be addressed by 
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6a887f1721b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.