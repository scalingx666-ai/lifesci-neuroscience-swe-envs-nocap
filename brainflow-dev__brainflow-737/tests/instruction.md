# Issue

**Title:** Fix interpretation of IMU data for Galea beta

## Description

Issue:

- IMU data was being interpreted incorrectly: byte order was wrong, and scale factor was wrong. 
- Assuming ±4g for accelerometer, ±500° for gyroscope and ±1300μT (x,y-axis), ±2500μT (z-axis) for magnetometer

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38c0bc878027`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.