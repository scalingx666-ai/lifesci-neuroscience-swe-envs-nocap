# Issue

**Title:** ENH: Add unique Slicerrc file for custom apps with ability to turn off

## Description

This addresses the items discussed in https://discourse.slicer.org/t/cmake-flag-to-customapp-not-to-read-slicerrc-py-or-define-other-file/39046.

1. Per [comment](https://discourse.slicer.org/t/cmake-flag-to-customapp-not-to-read-slicerrc-py-or-define-other-file/39046/6?u=jamesobutler) the default location when no existing rc files exists is now the slicerHome location rather than in the user directory root.
2. Per [comment](https://discourse.slicer.org/t/cmake-flag-to-customapp-not-to-read-slicerrc-py-or-define-other-file/39046/2?u=jamesobutler) .slicerrc.py is no longer used by Slicer custom applications, but instead use their own application named rc file `.<mainApplicationName>rc.py`. 
3. Per suggestion in [comment](https://discourse.slicer.org/t/cmake-flag-to-customapp-not-to-read-slicerrc-py-or-define-other-file/39046?u=jamesobutler) Slicer custom applications can also configure to turn off application RC startup script usage entirely with a new build option `Slicer_USE_SLICERRC`. This is by default on, but can be configured to be turned off. When the app configures it off, the settings dialog entry for specifying the startup path location is hidden as well as the command line flag `ignore-slicerrc` not being added as it would be irrelevant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f55e4248b38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.