# Issue

**Title:** Macos Qt6 packaging and arm64 building

## Description

https://projectweek.na-mic.org/PW45_2026_Boston/Projects/Qt6AndArm64SlicerBuildsOnTheFactoryMachines/
cc: @sjh26 @lassoan @pieper 

This is a collection of commits that I needed as I worked on successfully building and packaging a Qt6 based native arm64 version of 3D Slicer on macOS.

Build Environment: 
Mac Mini (M2 Pro)
macOS Tahoe 26.5.1
Xcode 26.5 Build 17F42
CMake 4.3.3
Qt 6.11.1

First, I built Qt 6.11.1 from source for arm64. I currently have my Build-Qt6.sh recipe script committed here for reference. This could also be done through an CMake external project of the superbuild since Qt6 uses CMake.
Then I built 3D Slicer from source for arm64 with the updates to pass macOS architecture to a few additional external projects where the process was getting tripped up. The LZMA process kept getting tripped up a pulling in some x86_64 reference so I ended up disabling entirely just to try and observe if the rest of the build would succeed which it did. 
**^UPDATE the LZMA issue has been addressed and restored.**

I used a Qt6 framework bundling commit from @Sunderlandkyl and further expanded upon it to resolve similar issues for Qt Designer that I observed while packaging the application. 

Ultimately with these changes I was able to build successfully, package successfully and install on a different macOS machine and run successfully. I confirmed that the app was showing as an "Apple" process instead of "Intel" using the macOS activity monitor.

xref #6811, #5944. Notably I did not need the commits from

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28ef15df2165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.