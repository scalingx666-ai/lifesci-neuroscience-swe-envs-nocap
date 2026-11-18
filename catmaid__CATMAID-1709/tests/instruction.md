# Issue

**Title:** Skeleton summary table

## Description

The new table `catmaid_skeleton_summary` keeps track of each skeleton's original creation time, last edition time, cable length and node count. Basic tests are included in this branch.

This table is kept up-to-date by statement level triggers in the database. **This requires Postgres 10+**! The reason for using statement level triggers is performance. For large skeletons, calling a trigger function for each node is a big overhead. In contrast, statement level triggers are only executed once per statement.

The summary update is performed together with the edge table update, because similar information is needed. Therefore, the current edge computation trigger is replaced.

A downside of statement level triggers is that they are not executed for child tables when inheritance is used. Therefore, the node location update had to be changed to explicitly refer to `treenode` or `connector` updates, in order to update the respective summary and edge tables correctly. It would be best if we have some mechanism in place that prevents direct writes to `location` or add a wrapper trigger function to `location`, which would call the summary update trigger function on all updated treenodes---to not let the summary table get out of sync.

Additionally, this implementation fixes a bug of the former edge table update. In the past only the edge from a changed node to its parent was update. Now child edges are updated as well, both for the edge table and the summary.

Performance is pretty much as before. This is in fact an improvement, because more work is now done (summary update, child edges). Here is a small benchmark (n=10), including the timings when all summary and edge update triggers were removed:

![catmaid-skeleton-summary-benchmark](https://user-images.githubusercontent.com/112226/37501183-874b7e94-28a3-11e8-8709-2749f763145a.png)

Before this can be merged, I need to fix a Django warning, which seems like a simple change in the Summary Table model.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb63bd3d54c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.