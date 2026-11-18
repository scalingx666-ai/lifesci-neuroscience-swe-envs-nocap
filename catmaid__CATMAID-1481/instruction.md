# Issue

**Title:** Improve performance of spatial queries

## Description

For each of the following tables two new indices are created: `treenode_edge`, `treenode_connector_edge` and `connector_geom`. The fist index is a Z min/max range index, which makes it fast to filter on Z ranges. This is an expression index, so no actual min/max computations have to be made. The second index is a 2D GIST index, which allows for fast XY bounding box queries. Thanks to the help of @Remi-C on the PostGIS mailing list, I now know that both work very well together in our node query scenario. While I also try other discussed performance improvements, this one seemed very promising and easy to do.

This makes node queries more than a magnitude faster: A test query with 6799 treenodes went down from 600ms to 34ms and query returning 309 connectors went down from 50ms to 4ms. The returned query results are exactly the same.

So far I didn't test insertion performance, but I don't think this will be big problem. The ND index is also still required for the ST_3DWithin() false positive removal. But as soon this is replaced, we
shouldn't need the ND index anymore (which could help insertion performance, if it really would be a problem). I will do some tests with large scale operations like reroot or joins.

I haven't done enough testing yet, but everything seems working to me. However, I would appreciate if you could try this migration and patch and see if it works for you as well. Maybe you also see a problem I missed with the update queries.

This works also surprisingly well on orthogonal views and they experience about the same speed-up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2ccc567f8f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.