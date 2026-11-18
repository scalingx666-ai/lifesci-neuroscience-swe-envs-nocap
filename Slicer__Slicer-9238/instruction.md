# Issue

**Title:** BUG: Fix crash loading table with unsupported schema column type

## Description

## Fix crash and unsavable schema for variant (and other non-data-array) table columns

### Problem
A table column whose schema `type` has no `vtkDataArray` representation
(e.g. `variant`, `object`) was mishandled on both load and save:

- **Loading crashed Slicer.** Dropping a `.csv` next to a matching
  `*.schema.csv` that declares such a type crashed the application.
  Without the sidecar the columns default to string, so the crash only
  appeared when both files coexisted — making it look like a
  "two files in the same folder" problem.
- **Saving produced an unloadable file.** A `variant` array was written
  to the schema as type `variant`, which then crashed on reload.

 

### Root cause
`vtkMRMLTableStorageNode` auto-detects the schema and applies the
declared column types.

- On read, `AddColumnToTable()` did:

  ```cpp
  vtkSmartPointer<vtkDataArray> typedColumn =
      vtkSmartPointer<vtkDataArray>::Take(vtkDataArray::CreateDataArray(valueTypeId));
  typedColumn->SetName(columnName.c_str());   // null deref → crash

`vtkDataArray::CreateDataArray(VTK_VARIANT)` returns `nullptr` because
a variant array is not a `vtkDataArray`, and the return value was
never null-checked.

- On write, `WriteSchema()` saved each column's type verbatim via `GetValueTypeAsString(column->GetDataType())`, emitting `variant` — a type Slicer cannot reconstruct because it has no per-cell data type.

### Fix
- Read ([`AddColumnToTable`](vscode-webview://12o6fpet9apja57d6ijnfmdf31of9s46l9kkkkiaq0alnh2djgof/Libs/MRML/Core/vtkMRMLTableStorageNode.cxx)): probe whether the value type can create a `vtkDataArray`; if not, read the column as string and warn instead of crashing. Guards both the column and per-component array creation.
- Write ([`WriteSchema`](vscode-webview://12o6fpet9apja57d6ijnfmdf31of9s46l9kkkkiaq0alnh2djgof/Libs/MRML/Core/vtkMRMLTableStorageNode.cxx)): if a column is a variant array, save it as `string` and warn, since the cell values are written as text anyway and a per-cell type cannot be preserved.

### Testing
- `MRMLCore` builds and links cleanly.
- Loading `stats.csv` + `stats.schema.csv` (with `type` = `variant`) no longer crashes; the column loads as string with a warning.
- Saving a table containing a variant column writes string in the schema and round-trips without crashing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f30a6bde125`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.