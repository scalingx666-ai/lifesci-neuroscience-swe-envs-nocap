# Issue

**Title:** Paralellise mesh creation

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Each mesh is created independently of other meshes and is therefore very amenable to parallelisation. Previous parallelisation ran out of memory leading to instability.

**What does this PR do?**
Updates the `construct_meshes_from_annotation` fuction which takes an annotated volume and creates meshes, in parallel or serially. 

Optimisations for parallel processing:
Passing the annotated volume to each thread in the pool was leading to increasing memory usage throughout the mesh creation process. Each thread had the potential to create its own copy of the annotated volume, and the garbage collector wasn't always cleaning up in time. To get around this problem, if parallel processing is requested, the annotated volume is written to a zarr file and the path is passed to each thread. Each thread then opens it's own read only copy of the array to create masks.

The nodes are passed to the thread pool using a pre-order depth first search. The node is yielded when first encountered and the tree is traversed in a depth first manner. I compared this to using `tree.nodes.values()`, a pre-order breadth first search, and a post-order depth first search. The pre-order depth first search always showed a ~10-15% improvement in performance when compared to other methods.

Memory usage per thread depends on the atlas being generated:

`kim_dev_mouse_e13-5_lsfm_20um_v1.3`, 549x319x379, 150 meshes:

| # of threads | Peak Memory | Time |
|--------|--------|--------|
| 1 | 1GB | 6.3 min |
| 5 | 2.3 GB | 1.1 min |
| 10 | 4.8 GB | 0.73 min |
| 20 | 8.6 GB | 0.78 min |
| 31 | 13.7 GB | 0.81 min | 

`kim_dev_mouse_p04_lsfm_20um_v1.3`, 800x560x640, 300 meshes:
| # of threads | Peak Memory | Time |
|--------|--------|--------|
| 10 | 17 GB | 10 min |
| 20 | 40 GB | 8 min |
| 31 | 60 GB | 8 min |

There seems to be a sweet spot for memory usage and wall time. All testing was done on an i9-13900K (32 threads, 8 P-Cores, and 16 E-Cores) with 64GB of RAM on Ubuntu 24.04.

Things that didn't make a difference:
I tried loading the annotations into a dask Array instead of a zarr Array and using distributed dask functions for `max, isin, sum` etc... This seemed to make things slower. I'm guessing each annotation array is small enough that the overhead of orchestrating chunked operations outweighed any benefits from parallelising those functions. When testing `dask` functionality I would compare the code using fewer threads to give `dask` opportunity to scale.

I also tried constructing the meshes in a bottom up manner, and saving the intermediate masks in a zarr group. This would remove the need to use the `isin` function (which can scale poorly for memory usage) and instead load the mask for each child of a node and `or` it with the `annotated_volume == current_node_id` mask. This had a slight benefit in terms of memory usage, however it had detrimental impacts on wall time performance. Threads would sometimes need to pause and wait for the masks of the children to be written to the zarr group. This led to a ~30% increase in wall time. 

## References
Hopefully?
 

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?
Multiple atlases were generated locally to test performance and correctness. The meshes are generated correctly and pass the validation functions.

## Is this a breaking change?
No, existing functions can be used as before.

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff7e675a2cb2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.