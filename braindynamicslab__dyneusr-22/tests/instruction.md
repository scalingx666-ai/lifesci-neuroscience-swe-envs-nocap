# Issue

**Title:** vizualize mapper stages

## Description

this addresses the "unexpected keyword argument" runtime error reported by 

only pass relevant keyword arguments to `networkx` draw functions

- [x] get keyword arguments for the relevant function using `inspect` module
- [x] before calling `func(**kwargs)`, filter `kwargs` by `getfullargspec(func).args`
- [x] do this for `nx.draw_networkx_edges` and `nx.draw_networkx_nodes`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e03b78040147`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.