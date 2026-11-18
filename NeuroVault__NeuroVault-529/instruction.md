# Issue

**Title:** Find similar results as json

## Description

/images/{pk]/find_similar/json
returns a pandas dataframe as json as in gene_expression_json -> {"data":[[1.0,3.0],[-0.192888910181686,16.0],[0.147546693160353,13.0],[0.083965640541661,14.0],[-0.0595162102504215,17.0],[-0.0354389236538608,15.0]],"columns":["abs_value","image_id"]}

This PR solves #207

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3d8d5964645`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.