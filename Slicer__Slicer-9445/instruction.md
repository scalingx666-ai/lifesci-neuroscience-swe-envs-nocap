# Issue

**Title:** BUG: Ignore the subject hierarchy node in vtkSlicerSceneReaderTest1

## Description

`vtkSlicerSceneReaderTest1` (added in #9442) fails: when it imports a scene file with two nodes, the reader reports three - the two nodes and a `SubjectHierarchy` node.

The scene creates its subject hierarchy node when it loads a scene and has none (`vtkMRMLScene::Import` resolves the subject hierarchy): the test's scene does not have one yet when importing, and clearing the scene removes it. The reader rightly reports it as added. In the application the scene always has its subject hierarchy node, so only the test is affected.

The test now leaves the subject hierarchy node out of the comparison. The reader is unchanged.

Tested on Windows (Visual Studio 2022): `vtkSlicerSceneReaderTest1` and the other tests of the Data module pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4f23516eb10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.