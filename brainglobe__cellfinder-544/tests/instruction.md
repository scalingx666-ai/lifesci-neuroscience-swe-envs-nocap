# Issue

**Title:** Visualize 2d and 3d filtering steps

## Description

## Description

This PR depends on 

Added a file under benchmarks (`filter_debug.py`) that given an input folder containing a list of tiff, it loads it using dask and does full 2d and 3d filtering, cell detection and cluster splitting. For each filtering step it outputs the filtered image so you can see what the step produces and tune parameters. 

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Because it's hard to tune all these parameters when you only have the final output (candidate cells), which takes a bit to run and you have to guess at how these input parameters actually affect the outcome. There's already something like this for saving the output of the 3d filtering step, but having the 2d step output in particular is helpful. 

This should also be helpful for generating images of the output for docs to show what each of the algorithm steps are doing.

You can see how I used this in  and in 

**What does this PR do?**

Add the `filter_debug.py` file under `benchmarks`. If we had an `examples` folder I would have used that.

I also had to add copying settings during splitting because we change the input settings during splitting. Previously it wasn't a problem because it's each cluster was split in its own process so each settings was copied anyway. But now I was doing it all in one thread so the original settings instance was modified for future clusters.

It would be nice to be able to visualize all these debug outputs directly in napari, but that would require a lot more work and possibly not worth the complexity. Although I do wonder how most users would approach this tuning stage without being able to see how the parameters change the output. And I suspect something like this would be invaluable when tuning parameters for new samples.

## References

 and in 

## How has this PR been tested?

I tested it with data.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4224d72a38e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.