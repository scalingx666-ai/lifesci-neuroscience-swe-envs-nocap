# Issue

**Title:** BUG: Make storage node ignore earlier errors

## Description

The user messages of a storage node were kept after an operation is completed, unless something cleared them. This caused three problems:

**Operations failed because of earlier errors.** Some checks treat any error in the collection as a failure of the current operation:

- `vtkMRMLModelStorageNode::ReadDataInternal` returns failure, without any specific message, even though the file is read correctly.
- `vtkMRMLStorageNode::WriteData` returns failure even though the write was successful.
- `vtkMRMLModelStorageNode::WriteDataInternal` skips the check that the output file has been created.

Example: saving a scene to a full disk leaves an error in the storage node of each model. After disk space is freed up, CLI modules still cannot get their output model, because the output is read back using the storage node of the model. The CLI is reported as completed and only this is logged:

```
vtkMRMLStorageNode::ReadData: Failed to read node Flow metrics model (vtkMRMLModelNode4) from filename='...vtk'
```

This was found in the SlicerHeart Analyze 4D Flow module, where each later analysis failed after a failed scene save.

**Earlier errors were reported as errors of the current save.** `vtkMRMLNodeWriter` and `vtkSlicerModelsLogic::SaveModel` use the existing storage node of the node and report its messages after writing, without clearing them before writing. A successful save reported an error, and a failed save reported additional errors.

**Errors of loading the output of a CLI were not reported in the CLI.** The result of reading the output was ignored, so the only trace of the error was in the application log.

## Fix

- Storage nodes do not assume that the message list is empty: these checks only consider errors that are added during the current operation, similarly to `vtkMRMLScene::Import` (`errorsBefore`).
- `vtkMRMLNodeWriter`, `SaveModel` and the CLI output read request clear the messages before the operation, as `vtkMRMLStorableNode::UpdateScene`, `vtkMRMLScene` and `qSlicerSaveDataDialog` already do.
- If an output of a CLI cannot be read then the error is added to the error text of the CLI node. `vtkSlicerApplicationLogic::RequestReadFile` has a new optional argument for this, the ID of the CLI node.

**The status of the CLI remains `Completed` when its output cannot be read.** It could be set to `CompletedWithErrors`, as the output is not loaded. It is left unchanged only to preserve backward compatibility.

**The details section of the CLI status is now expanded automatically if a completed CLI has error text**, not only if it completed with errors, so errors of loading an output are visible although the status is `Completed`. This also applies to anything else that a CLI writes to the standard error output, such as warnings, and the text is displayed in red even if it is only a warning. The section is not expanded while the CLI is running.

An output file that the CLI did not write is still not reported, and the status remains `Completed` in this case, too. Outputs can be optional and the CLI description does not tell if a selected output is required, so a missing file cannot be distinguished from an optional output that was not written. The error is only reported if the file exists and reading it fails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a68359e86d16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.