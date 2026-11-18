# Issue

**Title:** Display correct OpenJPEG library directory

## Description

* Change displayed OpenJPEG directory from hard coded 2.1 to actual

Currently, when -DUSE_OPENJPEG=true is set in cmake, the OpenJPEG_DIR
variable is hard coded to ${OPENJPEG_LIBDIR}/openjpeg-2.1, no matter
the actual OpenJPEG version that is installed. This causes the message
`message("--   Using OpenJPEG library from ${OpenJPEG_DIR}")`
to always display `Using OpenJPEG library from /usr/lib64/openjpeg-2.1`
This message is incorrect because version 2.1 of OpenJPEG may not be
in use, and also the directory `/usr/lib64/openjpeg-2.1` may not exist
at all. In addition, this can be confusing because the message above it
can display `Found libopenjp2, version 2.4.0`, which is the correct
version of OpenJPEG.
As stated in the COMPILE.md, "Some JPEG2000 DICOM images can not be
decoded by the default compilation of OpenJPEG library after version
2.1.0". This suggests that versions after OpenJPEG-2.1 can still be
used, even with limited functionality. Therefore, the cmake message
should display the correct library directory. If the desired behavior
is to warn users who are compiling the library with versions past 2.1
of the limit functionality, then a message should be displayed as a
warning or OpenJPEG version 2.1 should be required. Whatever the case,
a non-hard coded OpenJPEG version should be displayed which takes
advantage of cmake's <YYY>_VERSION special variable [1].
If this commit is not merged, the package will still compile correctly
because this is seemingly only an aesthetic change because the correct
location is ultimately used; however, incorrect and
confusing information will be displayed to the user. If this commit is
merged, then the correct OpenJPEG version is used in the message.
This commit was written, tested, and submitted by Lucas Mitrak.

[1] https://cmake.org/cmake/help/latest/module/FindPkgConfig.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a35b49c734`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.