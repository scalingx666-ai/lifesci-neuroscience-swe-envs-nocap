# Issue

**Title:** Keep OpenNeuro download destinations within the data root

## Description

fetch_data joins an OpenNeuro dataset name directly to the download root before creating directories and cloning. Require the resolved destination to be a strict descendant of the resolved root before either operation. This rejects parent and sibling escapes, root aliases, existing symlink escapes, and incomparable paths while retaining the existing lexical return path and valid clone arguments.

Validation: reused the supplied focused boundary evidence for a normal nested destination, traversal, sibling-prefix escape, root aliases, symlink escapes, and commonpath errors. Inspected the actual checkout diff and passed git diff --check. No dataset downloads or full package suite were run.

Scope: this hardens caller-provided paths in the OpenNeuro branch; it does not add a dataset-name schema or protect against concurrent filesystem changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecd3547c7964`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.