# Issue

**Title:** Apis 1071 we want to work on explore desktop without having to connect to a physical device

## Description

How to use:

- Make sure the file_name varible  in _CsvClient_ class of _csv_client.py_ file matches the name of correct file in tests/data folder.
- Make sure the correct yaml setting file exists for the device name.
- DXXX is recognized as a 32 channel device, AXXX as 8 channel device.
- Changing device settings or impedance measurement is not allowed at the moment.

To use a real device, comment out the line settings csv interface is start_streaming method in parser.py

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb296245fe8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.