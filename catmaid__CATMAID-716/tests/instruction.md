# Issue

**Title:** Connect postsynaptic treenodes with existing connectors via alt-shift click

## Description

When a treenode is activated, alt-shift clicking on an existing
connector creates a link with the node postsynaptic to the connector.
This allows interface parity with creating a new connector to which
the activated node is postsynaptic by alt-shift clicking in empty
areas. Closes acardona/CATMAID#712.

I am a new contributor, so please let me know if there are any PR workflows or style guidelines to be aware of, since none are mentioned on catmaid.org. This is a minor patch but I imitated the style in existing code where appropriate.

Editing permissions enforcement is unclear w.r.t. link creation. At some places in `mc_click` in `overlay_node.js`, global permissions are checked, while in other cases granular per-node permissions are checked. However synaptic linking in `connector_mc_check` checks no permissions, whether global, for either node, or for either skeleton.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae97e45136df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.