# Issue

**Title:** SVG overlay scaling refactor

## Description

This PR primarily contributes three features:
1. Keeping the SVG overlay and all SkeletonElements in project space, rather than a view-relative space. This means that annotations are still in the correct position when zooming, etc., instead of being in incorrect positions until an update completes.
2. Improving the performance of the SVG layer by removing needless elements and reducing attribute manipulation. To this end Raphael has been replaced with D3 for more direct SVG generation, which has enabled:
   - The node and its mouse-catcher to be combined into a single circle element, using a transparent stroke to expand the catch radius
   - Connector edges and arrows to be a single line, with a shared, defined marker shared by all connector edges drawing the arrow
     These and other changes to the SVG have reduced the number of elements by 40% (and a comparable reduction in DOM manipulation), improving framerate while panning (but not updating) by up to 30%.
3. Configurable scaling over the annotations (). The overlay can be set to be scaled to a fixed screen size (current behavior) or to a fixed project size. This size can be adjusted, and both configuration settings are exposed in the settings widget and persisted in the user profile.

Submitted as a PR because this affects all tracing interactions and I'd like for someone else to try and break it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54bdad516a05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.