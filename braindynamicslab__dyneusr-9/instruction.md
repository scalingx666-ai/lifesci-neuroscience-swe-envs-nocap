# Issue

**Title:** resolving issues with networkx + matplotlib

## Description

minor changes to resolve `matplotlib` runtime errors () and ensure compatibility with `networkx`

- removing calls to `matplotlib.use` 
- make sure `nx.Graph` instances hav `.node` attribute (before trying to access it)
- few other minor changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9b6131ffa57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.