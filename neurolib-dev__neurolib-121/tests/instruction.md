# Issue

**Title:** Support filtering from MultiModel parameters

## Description

Star notation was always part of the MultiModel (getting all keys based on "*" in parameter dict). Now, filtering also works. Example:
```python
model.params["*tau"]
# returns
{'WCnode_0.WCmassEXC_0.tau': 2.5,
 'WCnode_0.WCmassEXC_0.noise_0.tau': 5.0,
 'WCnode_0.WCmassINH_1.tau': 3.75,
 'WCnode_0.WCmassINH_1.noise_0.tau': 5.0}
```
so we obtained all `tau` parameters - time scales for both masses in Wilson-Cowan model, but also time scales of Ornstein-Uhlenbeck noise... but:
```python
model.params["*tau|noise"]
# returns
{'WCnode_0.WCmassEXC_0.tau': 2.5, 'WCnode_0.WCmassINH_1.tau': 3.75}
```

Note: draft for now, I need to add some small things to `Evolution` due to this

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1120f206bcfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.