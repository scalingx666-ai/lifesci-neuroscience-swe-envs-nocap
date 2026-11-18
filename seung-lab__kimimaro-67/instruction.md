# Issue

**Title:** perf: use the "railroad" technique

## Description

A "rail road" (a term defined by us) is the shortest last-mile path (the "road") from a target point to a "rail network" that includes the source point. A "rail" is a zero weighted path that acts as a strong attractor for the search algorithm. In the context of the 
skeletonization problem, such networks are assembled as a matter of course. It becomes more and more efficient to search for the rail network than for the target point.

For example, consider a glia. As the number of paths increases, the size of the rail network grows to the point that a source->target algorithm will perform extraneous work searching the network even though it is already a restricted domain compared to a naive search. Instead, it makes more sense to find the first rail, which generates a shorter path and avoids the extraneous work.

The shorter path also reduces redundancy in the invalidation algorithm as otherwise the same voxels need to be invalidated over and over (though there is already a provision for preventing that issue).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64a9bdaaeeff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.