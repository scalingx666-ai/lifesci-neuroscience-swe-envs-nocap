# Issue

**Title:** ENH: Do not override volume rendering lighting when synced with Volumes

## Description

This PR replaces the unintentionally closed 

When "Synchronize with Volumes module" was enabled, SetWindowLevelToVolumeProp and SetLabelMapToVolumeProp forced shading on and overwrote the ambient, diffuse, specular, and specular power values of the volume property.

Synchronization is only meant to link the slice view lookup table with the volume rendering transfer functions, so these unrelated lighting parameters are no longer hardcoded. Users can now enable or disable shading and adjust lighting independently of the synchronization option.

Add a regression test that verifies the lighting settings are preserved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46bd761e56bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.