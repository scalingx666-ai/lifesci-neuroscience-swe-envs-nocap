# Issue

**Title:** Choose the mapping when precomputing meshes and guide users when the mesh file doesn't match the mapping

## Description

### Summary
- The "Precompute Meshes" popover has a new mapping select. It defaults to "None", so mesh files are computed without a mapping unless a mapping is chosen explicitly. Previously, the mapping active in the left sidebar was used implicitly.
- When a precomputed mesh is loaded and the active mesh file doesn't match the active mapping, a new modal gives a call to action:
  - If a compatible mesh file exists, the user can switch to it and the mesh is loaded.
  - Otherwise, the modal explains how to precompute a mesh file without a mapping. In annotations with volume layers, it links to the dataset's view mode, since meshes can't be precomputed there.
  - If no mesh file is active (e.g., because none exists), the "Load Mesh(es) (precomputed)" entries are no longer disabled. Instead, the same modal suggests a mesh file or explains how to precompute one.
  - The modal no longer offers to activate the mesh file's mapping. Users choose the mapping for what they want to see, and the mesh file has to follow that choice.
- When a mesh file is activated automatically, the one that fits the active mapping is preferred: during proofreading or without an active mapping, one computed without a mapping; otherwise, one computed for the active mapping (then one without a mapping). Previously, the first mesh file was used.
- Clearer tooltip for proofreading actions on a mesh from a mesh file computed for a mapping.
- The configurable mesh file name from the issue is not part of this PR. It needs a worker change first.

### Steps to test:
- Open a dataset with an agglomerate mapping in view mode. Open the "+" popover in the Segments tab: the mapping select defaults to "None" and lists the agglomerate mappings. Start a job with and without a mapping and check the job arguments.
- Activate mesh file A (computed for mapping M) while another or no mapping is active, and load a precomputed mesh via the context menu (viewport, segment list row, segment mesh button):
  - Without another compatible mesh file: the modal explains how to precompute one.
  - With a compatible mesh file (without a mapping): the modal offers to switch to it, and the mesh is loaded from that file.
- On a dataset without mesh files, click "Load Mesh (precomputed)" in the viewport and segment list context menus: the modal explains how to precompute a mesh file.
- On a dataset with mesh files for mapping M and without a mapping: open it without a mapping and in a proofreading annotation (the file without a mapping should be active), and with M activated via the URL (the file for M should be active).
- In a proofreading annotation (editable mapping) with a mesh file computed for a mapping: the modal offers to switch to a mesh file without a mapping or links to the dataset's view mode.

### TODOs:
- [x] Double-check whether meshes should still be impossible to precompute inside an annotation with volume layers (the modal currently links to the dataset's view mode for that).

### Issues:
- contributes to #10381

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `931e08a31950`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.