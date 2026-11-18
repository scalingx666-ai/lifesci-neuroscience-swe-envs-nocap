# Issue

**Title:** consistently use uint32 in candidate detection

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Structure detection currently fails silently/crashes when there are more than `2**16-1` temporary connected components.

**What does this PR do?**

Ensures cell candidate detection uses unsigned 32-bit integers (note this may cause an minor increase in memory usage, but will avoid `cellfinder` hanging/crashing when there are more than `2**16-1` cells). I've documented some additional bits along the way.

## References

 and https://forum.image.sc/t/append-error-with-cellfinder/88634/9
Related to #389 
There are a few improvements that could be made,  and #386 but it's more critical that we fix this bug quickly now.

## How has this PR been tested?

Tested on user data provided by https://forum.image.sc/t/append-error-with-cellfinder/88634/9 and an internal MSc student, on the internal HPC system. `cellfinder` times out with old code, and completes successfully with reasonably looking cell candidates when using new code.

Two external users not associated with the core BrainGlobe team have tested this development branch and have confirmed this fixes their problems.

I have compared the "old" (pre-numba) code and this development branch on the internal MSc student data, and found the below

| - | pre-numba | this dev branch |
| ---- |---- |---- |
| total candidates found | 52502 | 52649 |
| candidates not present in other | 5977 | 6124 |
| candidates with nearest candidate in other > 2 microns away | 147 |  7 |

In summary, for real-life data, this development branch basically preserves all but 7 cell candidates (out of 50000+) found pre-numba, and finds 147 additional ones. I would say this is good enough.

I have added a test for the key function in #385 .

## Is this a breaking change?

No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally (manually)
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `749af84de1c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.