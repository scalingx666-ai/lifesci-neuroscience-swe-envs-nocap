# Issue

**Title:** Add few readers from byte streams in tvb_library

## Description

We want to expose in the main DataTypes API also the possibility to be built from a file stream, similarly with building a DT from a file path (connectivity.zip).
This need arise in tvb-widgets module, when building tvb DataTypes from files stored on EBRAIN Drive, but it is generic enough to worth a place in the DataTypes API, and allows us not to duplicate the building part of a DT someplace else

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `577118ce55c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.