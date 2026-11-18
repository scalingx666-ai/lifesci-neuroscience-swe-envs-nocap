# Issue

**Title:** (New) JS Desktop detection and OpenGL changes

## Description

MathWorks has released the New Desktop (in beta) that can be enabled with an [Add-On](https://nl.mathworks.com/matlabcentral/fileexchange/119593-new-desktop-for-matlab-beta) in MATLAB R2023a and R2023b. Since this impacts the way OpenGL and Java are being handled, I made some changes in `panel_options` to account for that.

In communication with MathWorks Support they also referred to it as JSD (JavaScript Desktop?). I prefer such a name over "New Desktop", since "New" will turn old at some point...

1. Because of the "Beta" status of the JS Desktop there is currently no documented API for checking if MATLAB is running it or the classic Java Desktop. I found an undocumented `feature` command that does the job properly (in my testing) and with a try-catch, we can cater for older MATLAB versions. This may need changes in the future if that `feature` command no longer provides the right info. I would expect at some point we can rely on the MATLAB version / release, once the Java Classic Desktop will then no longer be available. This detection is in a `isJSDesktop` sub-function for `panel_options`, since I couldn't yet see a need for other functions to query this info. Refactoring to a separate function is of course a possibility.
2. The Preferences panel will have the OpenGL options disabled, since there is no need or way to control OpenGL behavior in the JS Desktop.
3. We can still query the OpenGL implementation that is being used (through the new `rendererinfo` function) when using JS Desktop and this info is used to provide a warning message in Command Window in case Hardware OpenGL is in Basic mode or if OpenGL is in software mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfd0d0723260`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.