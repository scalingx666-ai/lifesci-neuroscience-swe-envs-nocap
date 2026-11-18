# Issue

**Title:** PERF: Share node factory between scenes instead of creating prototypes

## Description

Registered node classes are now stored in a new `vtkMRMLNodeFactory` that can be shared between scenes. `vtkMRMLScene` keeps its registration API (`RegisterNodeClass`, `CreateNodeByClass`, `GetClassNameByTag`, etc.) and delegates to the factory, which is created with the core node classes on first use. `NodeClassRegisteredEvent` of the factory is forwarded by every scene that uses it. Default nodes stay per scene.

Previously every `vtkMRMLScene` instantiated a prototype of each core node class in its constructor (about 4 ms). Each sequence node has an internal scene, so reading a scene with many sequence nodes (for example scene views, which store each node in a separate sequence) spent most of its time constructing prototypes. The internal scene of a sequence node now shares the factory of the main scene. `CopyRegisteredNodesToScene` shares the factory if the target scene has none yet, otherwise it copies the registered classes as before.

Note: classes registered in a scene that shares a factory become available in all scenes sharing it.

For a brain atlas with 564 sequence nodes, reading a sequence node file takes 2.6 ms instead of 7.1 ms; the node update loop of the import takes 3.6 s instead of 5.5 s.

Test: `vtkMRMLNodeFactoryTest1`.

Split from #9450.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f31083a960d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.