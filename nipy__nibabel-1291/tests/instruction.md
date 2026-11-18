# Issue

**Title:** Update data_per_streamline capabilities

## Description

The goal of this PR is to allow inhomogeneous array for `data_per_streamlines` in a Tractogram. 

I encounter this case when I wanted to save the labels of a cluster using Quickbundles from DIPY. 

All saved centroids have a different number of streamlines, which make the array inhomogeneous. 

```
data_per_streamline = {}
data_per_streamline['clusters_labels'] = np.array([c.indices
                                                   for c in clusters],
                                                  dtype=object)
data_per_streamline['clusters_sizes'] = clusters.clusters_sizes()
```

See the following tutorial: https://docs.dipy.org/stable/examples_built/segmentation/segment_quickbundles.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e925abb15e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.