# Issue

**Title:** [snirf] Improve support to SNIRF

## Description

This PR adds support for the new measurement list (added in v1.1) and overall provides better support to the SNIRF specifications

The snirf specification can be found here: https://github.com/fNIRS/snirf/blob/master/snirf_specification.md 

Todo: 

Reading SNIRF : 
- [x] read snirf data with dOD / dHb data
- [x] Read dataUnit (https://github.com/fNIRS/snirf/blob/master/snirf_specification.md#nirsidatajmeasurementlistsdataunit)
- [x] Support time vector as Start + sample spacing (https://github.com/fNIRS/snirf/blob/master/snirf_specification.md#nirsidatajtime)
- [x] Round wavelength
- [x] Add error for unsupported data format
- [x] Apply dataOffset (https://github.com/fNIRS/snirf/blob/master/snirf_specification.md#nirsidatajdataoffset)
- [x] Add support for MeasurmentLists
- [x]  Read MeasurementDate / MeasurementTime 
- [x] Read ManufacturerName / Model


Writting snirf : 
- [x] write snirf data with dOD / dHb data ( 100 % done)
(note: the file is kind of messy and should be improved but i think its ok for now)



Future update: 
- [ ] Read coordinate system 
- [ ] Suport 2D array in AUX (need  to be solved)

Once all the todo are done; we should be fairly complient with the snirf standard.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0aac8311fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.