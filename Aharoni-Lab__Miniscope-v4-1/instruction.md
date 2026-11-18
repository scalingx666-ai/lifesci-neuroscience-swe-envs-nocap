# Issue

**Title:** First Upload

## Description

Major changes:

- Flex connector
- Updated schematics with the fabrication footprints
- Added 3.3k resistors to SDA and SCL pins

To do:

- Change serializer footprint (to match to the actual BOM)
- Add pads for 3.3V, GND, PLCK, D10,D11 and I2C (SDA/SCL)
- Add both the connector and pads for the cable

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2003ee88fbb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.