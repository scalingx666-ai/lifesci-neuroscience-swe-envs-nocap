# Issue

**Title:** COMP: Update DCMTKcs to fix OpenJPEG over-linking on macOS

## Description

Update DCMTKcs revision from fbfd933 to da8821c, which links OpenJPEG privately to the dcmjp2kcs module for shared builds instead of exposing it through the public link interface.

Previously dcmjp2kcs published the openjp2 target as part of its INTERFACE_LINK_LIBRARIES and the DCMTK umbrella target re-exported it, so every consumer of DCMTK transitively linked libopenjp2 - even when it never used JPEG 2000. On macOS this broke extension packaging: an extension unrelated to JPEG 2000 (e.g. MarkupsToModel) ended up referencing libopenjp2 and failed to load, since OpenJPEG is bundled centrally by the application rather than within each extension.

With this update, OpenJPEG is a private dependency of the shared dcmjp2kcs library: its symbols are fully resolved into libdcmjp2kcs and consumers no longer reference libopenjp2. Verified by building a full macOS package: libopenjp2 is still bundled and resolved for dcmjp2kcs, the number of bundled binaries referencing it dropped from 207 to 3 (libopenjp2 itself, libdcmjp2kcs, libITKIODCMTK), and an extension that does not use JPEG 2000 no longer references it at all.

DCMTKcs:
$ git shortlog fbfd933..da8821c --no-merges
Andras Lasso (1):
      Link OpenJPEG privately to dcmjp2kcs for shared builds

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bd436cd9f8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.