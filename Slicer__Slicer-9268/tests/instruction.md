# Issue

**Title:** ENH: Name macOS application bundle with the full application name

## Description

Previously the macOS package always contained "Slicer.app", so after dragging it to the Applications folder it appeared simply as "Slicer" in Finder and had to be renamed manually to tell versions apart.

As a final packaging step, rename the bundle to the full application name (display name and version, e.g. "3D Slicer 5.10.0"), matching the naming already used by the Windows installer. The executable and all embedded paths keep the internal application name, so only the top-level bundle directory is renamed and the bundle stays relocatable.

For preview releases the version carries a build-date suffix (e.g. "5.13.0-2026-07-04"). This results in a long .app file name, which
Finder elides in the middle, hiding the version number:

<img width="1610" height="1004" alt="image" src="https://github.com/user-attachments/assets/4ebc86d4-5984-4e96-bc9b-057f6a78c8b4" />

To avoid this, the implementation in this pull request replaces the separator before the date by a space ("5.13.0-2026-07-04" -> "5.13.0 2026-07-04"):

<img width="1394" height="885" alt="image" src="https://github.com/user-attachments/assets/fff95eed-0203-4213-ae5c-7d069b96aef6" />

We might consider backporting this to Slicer-5.12.1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92ffd178ef44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.