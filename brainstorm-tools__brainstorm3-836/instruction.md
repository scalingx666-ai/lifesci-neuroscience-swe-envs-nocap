# Issue

**Title:** Use Lambert azimuthal equal-area projection for 2D projection of  3D sensor locations

## Description

This PR implements the agreed projection ([Lambert azimuthal equal-area projection](https://en.wikipedia.org/wiki/Lambert_azimuthal_equal-area_projection)) change for the 2D projection of 3D sensor locations. 
These changes apply for `2D sensor cap` and `2D Layout`

# Introduction

Previously, the 2D projections of the sensor locations were placed inside a circle defined by the sensors that were the farther from the top of the head. This approach worked quite well IFF the sensors  where placed all over the head, and those sensors that defined the circle where placed close to the `(SCS) z=0` i.e., "horizon" defined by the `NAS`, `RPA` and `LPA` fiducials). 

MEG 274 sensors CTF
<img width="1920" height="388" alt="bef_meg_274" src="https://github.com/user-attachments/assets/a167779a-9f18-4a8d-b692-2179e0b67303" />
(3D sensors left, 3D sensors top, 2D sensor cap, 2D Layout)

# Issues

But this projection did not work that well for cases where there are sensors below the `(SCS) z=0`, as these sensors are now used to compute the horizon circle. 

EEG 256 sensors, GSN HydroCel 256
<img width="1920" height="388" alt="bef_eeg_256" src="https://github.com/user-attachments/assets/a9cf36d4-1b56-48c0-996a-66c7381fb262" />
(3D sensors left, 3D sensors top, 2D sensor cap, 2D Layout)

---

Nor in cases where the sensor do not cover the entire head. In this case, the circle is made using the available sensors

EEG 5 sensors, Cz, FC1, CP1, FC5, CP5
<img width="1920" height="388" alt="bef_eeg_5" src="https://github.com/user-attachments/assets/8bdb2c4e-5e0b-461a-9896-d3109c053b86" />
(3D sensors left, 3D sensors top, 2D sensor cap, 2D Layout)

# Solution
The idea to solve such issues is to change how the 2D projection is performed. Mainly:
1. Do not use sensors to define the circle border. Instead use the `z=0` given by the SCS.
2. Use the ([Lambert azimuthal equal-area projection](https://en.wikipedia.org/wiki/Lambert_azimuthal_equal-area_projection)).
<img width="1115" height="337" alt="image" src="https://github.com/user-attachments/assets/4cc80fbd-3f96-4ce6-9e0e-41b88b79dfa0" />

Here a comparison of the plots, before (top) and after (bottom) for the same examples as in the previous sections. Noticeable changes can be appreciated in the 2D sensor cap (3rd figure in each row) and minimal changes in 2D Layout figure (4rd figure of each row).

MEG 274 sensors CTF
<img width="1920" height="388" alt="bef_meg_274" src="https://github.com/user-attachments/assets/a167779a-9f18-4a8d-b692-2179e0b67303" />
<img width="1920" height="388" alt="aft_meg_274" src="https://github.com/user-attachments/assets/c2efff22-ceea-4103-8cc6-30c8e1295478" />


EEG 256 sensors, GSN HydroCel 256
<img width="1920" height="388" alt="bef_eeg_256" src="https://github.com/user-attachments/assets/a9cf36d4-1b56-48c0-996a-66c7381fb262" />
<img width="1920" height="388" alt="aft_eeg_256" src="https://github.com/user-attachments/assets/1e3f5105-24ef-4ef7-9327-6e724162bab4" />

EEG 5 sensors, Cz, FC1, CP1, FC5, CP5
<img width="1920" height="388" alt="bef_eeg_5" src="https://github.com/user-attachments/assets/8bdb2c4e-5e0b-461a-9896-d3109c053b86" />
<img width="1920" height="388" alt="aft_eeg_5" src="https://github.com/user-attachments/assets/a54d2c67-706a-4ad0-ba96-b6ddea11d4d0" />


## Head lines for 2D Layout
This is a bonus feature in this PR. 
For 2D Layout figures, the times series (or spectrum) for each sensors are placed the location that corresponds the 2D projection of the sensor, and the size of the plots is optimized to use the available space. 

This PR introduces the context menu "Show head lines", as in name indicates, it shows the head lines (head circle, nose and ears) in the plot. These lines are useful as provide context on the sensors location on the head. This is more relevant to for the case where the sensors do not cover the entire head. Examples:

EEG 5 sensors, Cz, FC1, CP1, FC5, CP5
<img width="1443" height="389" alt="image" src="https://github.com/user-attachments/assets/5ee05bcd-e446-4a34-8642-fd4ed3ab5479" />
(2D sensor cap, 2D Layout without head lines, 2D Layout with head lines)

NIRS 49 channels, over right motor cortex
<img width="1462" height="387" alt="nirs_headlines" src="https://github.com/user-attachments/assets/40f145d2-f47e-4214-945f-77ddf2875577" />
(3D channels, 2D Layout without head lines, 2D Layout with head lines)

# What to do with "2D Disk"
With the PR, the function of 2D Disk is now obsolete, it would be good to remove it.
@tmedani, any thoughts in removing "2D Disk"?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b80f9e54f92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.