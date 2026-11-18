# Issue

**Title:** Images Render

## Description

To display the images in the render, the images need to be the textures of a plane.
Changes made :
- Added a Checkbox to add the possibility to have the images in the render
- Checking it create the planes with the textures and materials associated
- Unchecking delete the planes & al.
- The texture is changed when the frame change, and correspond to the current image displayed.
- Bool option for setting some properties to True; Images shadeless and Env. lightning
- Bug fix. Changing the directories of the stacks is now safe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0311a4aa819`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.