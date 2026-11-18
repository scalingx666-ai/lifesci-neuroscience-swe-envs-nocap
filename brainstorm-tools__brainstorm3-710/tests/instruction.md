# Issue

**Title:** Refactor updated IEEG features (1/2)

## Description

# Refactor updated IEEG features
This PR aims to refactor the IEEG new features introduced in the main PR: #689.

Through the in-house testing, tutorials and the forum, we have become aware of some issues with the new IEEG features. Some of these issues have been hot-fixed in subsequent already merged PRs: #696, #697, #698, #699, #700, and additional hot-fixes were under development in #701 (closed without merging). 

## Solved issues
- [x] Error for electrodes with less than 3 contacts. Solved at 30146a4 and 52898a5
 https://neuroimage.usc.edu/forums/t/46550
- [x] Implantation started from anatomy view should be located at the ~~`@intra`~~ "Implantation" folder. If it exist, allow the user to either 'continue', or to 'replace' it.
  Implemented in 20d3c34 and 96bb08c
- [x] Behaviour of double-click on channel file cannot be achieved with any option in the popup menu
 It corresponds to "SEEG/ECOG implantation" on the Channel file popupmenu: 3543fff
- [x] Coordinate radio button for contact coordinates is not kept when selecting different electrodes. Solved in 837ea1a
- [x] Incorrect behaviour selecting contacts. If multiple selection with keyboard (shift+arrows, or Ctrl+A), selected contacts are not highlighted in 3DFig. Solved at d39d556
- [x] Incorrect behaviour selecting contacts. Selected contact remains: (1) select one contact for one electrode (contact get highlighted in 3DFig), (2) change electrode (contact remain highlighted), (3) return to first electrode (no contact is selected, but the contact for step (1) remains highlighted). Solved in 63370a5
- [x] ~~Display sensors in MRI viewer. Load isosurface although it is not used~~ 
  Used by `ieeg('CreateGeometry3DElectrode')` Loads surface (innerskull), to obtain normals, to orient ECOG cylinders, visible as cylinders only when MIP: Functional
- [x] ~~Display sensors in MRI 3D slices, Load isosurface, but not added to display~~ 
  Used by `ieeg('CreateGeometry3DElectrode')` Loads surface (innerskull), to obtain normals, to orient ECOG cylinders, visible as cylinders when display contacts (instead of spheres) is selected in IEEG panel


## Pending issues (for other PR)

- [ ] Display menu (for channel file with SEEG) does something different to the stated
 https://neuroimage.usc.edu/forums/t/46083
- [ ] Avoid closing all figures when starting a new implantation. If figures need to be closed, this must be selective:
 (Issue 1 in )
- [ ] Some Java exception issues
 https://neuroimage.usc.edu/forums/t/46585
 https://neuroimage.usc.edu/forums/t/46178
- [ ] Thresholding of isosurface without creating a new one
 Creating of a new file was supposed to be temporary (added in )
 **Discussion:** Do we need this file in the DB? It will used only on localizing contacts.
- [x] Printing contact locations in GUI, better text alignment 
 **Discussion:** Do we really need to print up to one-hundredth of millimeter? 
- [ ] Display sensors in MRI 3D slices, add isosurface to figure (surface tab), add new SEEG electrode (in IEEG tab), enable Select tool (in EEG tab), click on isosurface. Result: MRI viewer opens (why?), all electrodes disappear of GUI and Electrode configuration is disabled. Electrodes are visible in 3D figure.
- [x] Wrong CT volume can be selected thresholding CT with slider. 
  See code: https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/gui/panel_surface.m#L422-L426
- [x] Slider in panel surface for thresholding CT is set only at panel creation (`CreatePanel`), thus it's hardcoded to `1` to `4500`
  See code: https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/gui/panel_surface.m#L113 


@tmedani, @chinmaychinara91

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5faabfd6734c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.