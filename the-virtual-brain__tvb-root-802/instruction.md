# Issue

**Title:** EBR-211. Update BCT analyzers in TVB web

## Description

Changes agreed with Lia, Paula and Teo while testing the BCT widget (the-virtual-brain/tvb-widgets#103). The same changes are made in the widget.

**Undirected analyzers**
ModularityOpCSMU, ParticipationCoefficientSign, Degree, Strength, StrengthWeights and DensityUndirected need undirected input in bctpy, so they now use BaseUndirected and only undirected connectivities can be selected.
- DegreeIOD, MatchingIndex and StrengthISOS used to inherit from Degree or Strength, so they now inherit from BaseBCT directly to stay available for directed connectivities.
- The Strength UI name said "Directed", corrected to "Undirected".

**DistanceDWEI removed**
distance_wei expects a connection-length matrix (some inverse of the weights), but got the weights directly. Existing results can still be opened, but not reloaded.

**Network walks**
Removed the walk length distribution result. It has one value per walk length, not per region, so it was shown with region labels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d37a429b6977`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.