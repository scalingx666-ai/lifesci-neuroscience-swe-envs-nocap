# Issue

**Title:** implemented closed-loop fieldnulling application

## Description

This is designed for a National Instruments NI-9262 6-channel DAC that drives 6 coils, mounted pairwise on the walls of the MSR at the Donders. The field is measured with a Sensys FGM3D TD fluxgate magnetometer. 

A relevant extension that is planned for the future is to use reference OPMs for field nulling, rather than the fluxgate sensor.  

Tagging @mirandanaaktgeboren, @namrolyat and @emidpag: please note that this PR makes it part of the fieldtrip master branch (and thereby also the release version).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a888df824b69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.