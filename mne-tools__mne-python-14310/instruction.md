# Issue

**Title:** Fix spectrum_fit frequency detection and removal

## Description

I've rarely had satisfying results with `spectrum_fit`, and I finally dug into why. When the line freq was exactly on a freq bin (e.g., 1000 Hz data and 60.000 Hz line noise) things were at least okay. but if it was slightly off, like 60.05 line noise, it would fail to detect properly. If it did detect properly, it would fail to remove properly because of bugs in how we removed using adjacent bins. We should have refined the frequency estimate after finding there was a significant peak.

This code adapts some `nitime` code for deciding which components to choose, and refines the frequencies using a chirp z-transform (rather than zero-padding that nitime uses, which is a less clean / complete way to achieve a similar effect).

Updated tutorial image:

<img width="1022" height="449" alt="image" src="https://github.com/user-attachments/assets/88ec70e7-d835-41be-90c9-658b7457ffb9" />

On `main` the 60 Hz harmonics are over-removed:

<img width="1000" height="350" alt="image" src="https://github.com/user-attachments/assets/8cbde2e7-cc94-4151-b2f5-ebed3d40eb22" />

@payamsash I'd suggest running `spectrum_fit` mode on your data to see if it detects frequencies at 25 Hz etc. It would strongly suggest that these are subharmonics of the 50 Hz line noise (could be due to aliasing or something else).

Code changes drafted using Claude Fable 5.1 and reviewed / iterated on by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6b19ee7df35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.