# Issue

**Title:** feat: shard downsampling

## Description

This feature adds sharded downsampling to Igneous. A highlight is that all sharding calculations are done completely automatically and it is as simple to use as:

```bash
igneous downsample $PATH --queue $QUEUE --sharded --mip 0
```

The default parameters pick shard constructions that easily fit into the memory of commodity hardware, making it simple to deploy.

A downside is that this constraint means only a single downsample level can be computed per run. In the future, it may be desirable to add additional downsample levels, but it will radically increase the amount of memory required. For the following reason:

```
Needed in memory:
1 mip: 1 shard
2 mips: 5 shards
3 mips: 21 shards
```

Perhaps it is possible to construct each shard in a more online fashion, but it seems tricky.

Another artifact of this one-by-one approach is we reaquire the integer truncation problem.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8292b36e1cfc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.