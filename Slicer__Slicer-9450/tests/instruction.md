# Issue

**Title:** BUG: Fix views not refreshed after scene view restore and empty scene view menu

## Description

Two user-visible bugs around scene views. This PR was originally a larger change set; the other parts were split into separate PRs (listed below).

## Views not updated after restoring a scene view

After restoring a scene view (for example with the Restore button in the Scene Views module), the 3D view kept showing the previous content until the user rotated the camera.

- Slice and 3D views disable rendering while the scene is batch processing, and render requests made in that period were dropped. The views now schedule a render when batch processing ends.
- Restoring a scene view modifies the layout node, and `qMRMLLayoutManager` rebuilt the whole layout on every layout node modification, even if the layout did not change (`ctkLayoutManager::setLayout()` compares document objects, not content). The rebuild hides and shows the views, and the render requested at the end of the restore was dropped if its timer fired while the view was hidden. The layout is now rebuilt only if its description changed, and slice and 3D views schedule a render when they are shown.

## Scene views missing from the capture toolbar menu

The "Restore view" menu of the capture toolbar looked up the Scene Views module logic when the menu was created, before the module logic existed, so the menu was always empty. The logic is now looked up on first use, and the menu is rebuilt when it is about to be shown. It is not rebuilt while hidden: during scene loading every scene view sequence node is modified, which rebuilt the menu hundreds of times (about 6 seconds for the SPL/NAC brain atlas).

## Related PRs (split from this one)

- #9451: Sequence content modified event
- #9452: Faster subject hierarchy and scene model widgets
- #9453: Scene import progress and unsupported node types
- #9454: Legacy scene compatibility (SPL atlases)
- #9455: Shared node factory

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a59e57558d70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.