# Issue

**Title:** feat: L2 GrapheneMeshTask

## Description

This PR implements meshing against Graphene volumes at the lowest agglomerated level of the chunk graph (L2) and stores the meshes in `meshes/initial/2/$chunkpositionnumber-$shardnumber.shard` using draco compression for each mesh.

Future work will stitch those meshes together to create higher levels of agglomeration.

https://github.com/seung-lab/cloud-volume/wiki/Graphene#meshing

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `477b47111aa6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.