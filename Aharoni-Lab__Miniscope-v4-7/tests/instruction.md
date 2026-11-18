# Issue

**Title:** Corrections

## Description

Fixed errors:

* Overlapping courtyards
* Traces very close to pads
* Bypass capacitors closer to pads
* Some courtyards (resistors/capacitors) had an error with the crosshairs. While not an important error it was fixed for easier debugging.
* Changed the symbol in the schematics for more consistency
To do

* Check the position of the LEDs relative to the miniscope
* Pour polygons planes in the LED ground pads
* Change the 3V3 and GND layer order

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f46c6fd396e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.