# Issue

**Title:** BUG: Do not update proxy nodes on non-content modification of sequence nodes

## Description

Sequence browser nodes update their proxy nodes from the selected item whenever a synchronized sequence node invokes its content-modified event. `vtkMRMLSequenceNode` used the generic `ModifiedEvent` for this, which is also invoked when the node is renamed, an attribute is set, or its storage node is changed or removed. Any of these re-applied the selected item to the proxy nodes and overwrote changes made to them since the item was selected.

For scene views, whose proxy nodes are the nodes of the scene, this silently replaced the scene content with the last scene view. For example, loading a scene through the SampleData module removes the storage nodes of loaded nodes, including the storage node of the scene view screenshot sequence.

`vtkMRMLSequenceNode` now invokes `SequenceContentModifiedEvent` when its content changes (data node added, replaced, or removed; index value, name, unit, type, or tolerance changed; content copied) and registers it as its content-modified event. `ModifiedEvent` is still invoked for all changes.

**Behavior change for scripts:** editing a data node inside a sequence in place and then calling `Modified()` on the sequence node no longer refreshes the proxy node. Use `SetDataNodeAtValue()`, or invoke `SequenceContentModifiedEvent`.

Test: `vtkSlicerSequencesLogicTest1` (non-content modifications keep proxy changes; content changes update the proxy; one event per copy).

Required by #9454. Split from #9450.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94bb8629ccb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.