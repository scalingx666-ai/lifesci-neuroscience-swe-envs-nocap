# Issue

**Title:** NIRS: Allow finding channels using Source, Detector and/or Wavelenth info

## Description

Hello, 

In NIRS, sometimes can be useful to mark a detector, or a source as bad as we know from the acquisition that this detector or source was not well placed.  Currently, to all channels that involve `S1`, for example, we have to write `S1D1WL680`, `S1D1WL830`, `S1D2WL680`, `S1D2WL830`, ... to list all the channels containing S1 which is awful :) 

This PR allows findings all NIRS channels using an specific Source, Detector or Wavelength.

Examples: 
* Searching `S1`: Find NIRS channels using: Source `S1`, any Detectors, any Wavelengths
* Searching `D1`: Find NIRS channels using: any Sources, Detector `D1`, any Wavelengths
* Searching `S1D1`: Find NIRS channels using: Source `S1`, Detector `D1`, any Wavelengths
* Searching `WL830`: Find NIRS channels using: any Source, any Detector, Wavelength `WL830`
* Searching `S1D1WL830`: Find NIRS channel using: Source `S1`, Detector `D1`, Wavelength `WL830`

EDIT: @rcassani

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74ee4e43b1cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.