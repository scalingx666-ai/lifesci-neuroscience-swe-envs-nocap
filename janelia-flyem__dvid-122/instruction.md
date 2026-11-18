# Issue

**Title:** Creates a bufferable interface that is a subset of keyvalue

## Description

For DB backends that have much greater access latency than something like an embedded leveldb, it is important to group many get/put operations into batches.  To this end, this pull request creates an interface which defines a subset of the key value interface that allows various DB actions to be added to a buffer than can then be flushed in one transaction.

Currently, the gbucket plugin is the only one that exploits this new interface.  It implements the batch interface using this new buffer interface and also changes the access patter in the uint8blk and labelblk range gets slightly (only when the DB implements the buffer interface which is only the gbucket for now).

This commit should not impact the performance for the production settings.  I performed minimal tests but a full regression should be run to make sure everything still works.  Using the new gbucket implementation, I can achieve a significant speedup (probably around 5x-10x).  A grayscale 512 x 512 x 512 can be fetched in 3-4 seconds which is not too far off the performance of fetching such a cube using embedded leveldb over a network.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c69809ea1330`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.