# Issue

**Title:** Add  2D Layout option for Spectrum nodes

## Description

This new feature allow plotting frequency-resolve data from sensors in a 2DLayout.

Description:
* Supported files PSD, FFT, FOOOF results
* Available for all sensor modalities (EEG, MEG, SEEG, etc)
* Support for one or more files
* Current frequency is linked with frequency selector (main window) and selected frequency in Spectrum plots
* For multiple files only channels that are not bad in all files are displayed

Popup menu
![menu](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/c11ff3f7-fa50-43a8-ab63-ec6eee4be7f9)
---

One PSD file
![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/bf6a5183-9109-4610-94fb-b144ab3013d3)

---
Two PSD files
![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/0d010b13-2085-41c6-a353-06e5c795d1ec)

## TODO
- [x] Use the same amplitude scale for all files (this is not done neither for the time series)
- [x] Popup menus in Spectrum 2DLayout figures
- [x] Amplitude units for Spectrum 2DLayout figures

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5778a5e8281b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.