# Issue

**Title:** Optimal kmeans clustering

## Description

Optimal K-Means clustering makes the choice of cluster numbers more objective by providing the option to give a range for the number of clusters in the clustering process.

The optimal K-means algorithm then tries all cluster numbers in the range and quantifies the clustering quality metric using MALTAB's `evalcluster` method (requires Statistics and ML toolbox) and the `silhouette` metric to find the optimal cluster count.

The algorithm works both from the GUI and the command line, but the user must pass a vector for the number of clusters to compute. The vector acts as [min max] number to determine the optimal cluster count:
![Screenshot 2024-07-10 at 3 36 20 PM](https://github.com/sccn/eeglab/assets/44906843/65e29d09-841e-44e1-981a-997be1ec1bfd)

The algorithm also works with the `robust_kmeas` algorithm, so the user can specify the threshold to determine the outliers: 
![Screenshot 2024-07-10 at 3 38 05 PM](https://github.com/sccn/eeglab/assets/44906843/ff527587-d1e7-4b1b-9a87-4549a25fa64e)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `970804ebe803`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.