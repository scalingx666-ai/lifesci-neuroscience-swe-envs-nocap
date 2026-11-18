# Issue

**Title:** Custom entity labels

## Description

You can now pass custom entity labels (node/edge) to the Neo4j and neuPrint executors. Passing the empty string will let DotMotif match ALL node/edge types.

```python
Neo4jExecutor(
    "my-existing-graph-database.com", 
    entity_labels={
        "node": "",
        "edge": {"DEFAULT": "", "SYN": ""}
    }
)
```

The above configuration will match ALL edge/node types.

if you are not using the neo4j-family executors, this doesn't change anything for your dotmotif experience.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1517811daa13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.