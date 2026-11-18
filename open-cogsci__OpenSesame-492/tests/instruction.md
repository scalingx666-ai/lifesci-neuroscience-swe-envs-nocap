# Issue

**Title:** Improved system and architecture info

## Description

Tested by replacing the *system_information.py* file in the installed version of OS3.1.4 on:
(so without )
* Win7 x64
was:
System: Windows
Architecture: 32bit
becomes:
System: Windows-**7-6.1.7601-SP1**
Architecture: **64bit**

* Win7 x32
was:
System: Windows
Architecture: 32bit
becomes:
System: Windows-**7-6.1.7600-SP0**
Architecture: 32bit

* Ubuntu16.04 x64
was:
System: Linux
Architecture: 64bit
becomes:
System: Linux-**4.4.0-21-generic-x86_64-with-Ubuntu-16.04-xenial**
Architecture: 64bit

* Win10 x64
was:
System: Windows
Architecture: 32bit
becomes:
System: Windows-**10-10.0.14393**
Architecture: **64bit**

* macOS Sierra
was:
System: Darwin
Architecture: 64bit
becomes:
System: Darwin-**16.1.0-x86_64-i386-64bit**
Architecture: 64bit

Note "Darwin translations" can be found here:
https://en.wikipedia.org/wiki/Darwin_%28operating_system%29#Release_history

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60d5940a35b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.