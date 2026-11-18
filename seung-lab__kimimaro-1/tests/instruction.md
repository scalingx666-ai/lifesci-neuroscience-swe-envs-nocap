# Issue

**Title:** feat: fix branching

## Description

The default TEASAR algorithm is known for early branching. The new branch peels away from the previously existing path in order to cut corners. The later paper by the TEASAR authors [1] proposed a solution whereby the DAF is computed using the existing skeleton vertices as source nodes. This causes the distance field to be generated such that the distance to the target vertex is minimized. 

In Kimimaro, we have minimized the influence of the DAF on the PDRF in order to strengthen the centering influence of the boundary field (we use the DAF for selecting targets). However, we retained the use of the DAF to provide "trickle gradient" defined as a normalized distance field. Under certain conditions, typically in wide open spaces, without the trickle gradient, the PDRF's floating point value collapses and results in unpredictable behavior. The DAF provides structure in those conditions.

```python
PDRF += DAF * (1 / np.max(DAF)) # adding the normalized euclidiean distance field
```

This suggests that it might be possible to ignore the necessity of generating a multi-source DAF, and instead simply zero out the edge weights of the existing skeleton. As the cost of traversing existing skeleton is zero, dijkstra's algorithm will naturally follow it until the point where it is most advantageous to move towards the target through the PDRF field. Initial experiments suggest that this idea has legs.

There is a performance impact to this approach. We had been using `dijkstra3d.parental_field`and `dijkstra3d.path_from_parents`, which enables the computation of highly branched skeletons using a single computation of dijkstra's algorithm followed by highly efficient accesses per path. In order to take advantage of zeroing out the changing edge weights, we need to recompute dijkstra for every new path. Still, this is less impactful than the original approach described by Bitter et al as the DAF computation is eliminated.

1. I. Bitter, A.E. Kaufman, and M. Sato. "Penalized-distance volumetric skeleton algorithm". IEEE Transactions on Visualization and Computer Graphics Vol. 7, Iss. 3, Jul-Sep 2001. doi: 10.1109/2945.942688

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07d702fd0fe4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.