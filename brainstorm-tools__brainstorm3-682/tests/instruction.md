# Issue

**Title:** New Digitize panel

## Description

This adds a new version of the Digitize panel, in parallel to the current version.
Main changes:
- Added settings: 
  - set of fiducials to digitize, allowing e.g. a 4th MEG head coil.
  - Polhemus device configuration commands, e.g. "hemisphere of operation"
  - Distance threshold for warning message
- Large display of next point to digitize, to be visible away from the desk
- Added "beep" and more visible error message when repeated measures > 5mm (default distance threshold)
- New button to add a set of fiducials to be digitized at any moment, e.g. at end to confirm receiver didn't move and points are good
- Uses `serialport` instead of `serial` (no more warnings), but requires R2019 or newer.
 Note: R2021a: serial object interface will be removed
- Help menu linking to Digitize tutorial
- New menu item to switch versions of the panel: `legacy` or `2024`. The panel closes and must be reopened after switching.
- Now always uses anatomical fiducials to convert coordinates to SCS. Original version saved them in system defined by MEG coils when present, and Brainstorm would convert to anatomically defined SCS when importing.
- "Delete last point" button replaced by "Start over" until all initial fiducials are digitized.

<img src="https://github.com/brainstorm-tools/brainstorm3/assets/31040756/aa9651ff-8745-4ccc-a715-cc55a4c74ac1" height="280" alt="digitize_2024"> <img src="https://github.com/brainstorm-tools/brainstorm3/assets/31040756/cac8c82a-409e-4240-92db-d9438236f415" height="280" alt="digitize_2024_warning"> 
<img src="https://github.com/brainstorm-tools/brainstorm3/assets/31040756/4ddf2ae3-2fef-4092-a47c-92123aaab5f3" height="400" alt="digitize_2024_settings">

The tutorial is not yet updated. 
This version is now installed in our lab to use for a while before merging.  Others may want to test it also. (@tmedani?)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5faabfd6734c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.