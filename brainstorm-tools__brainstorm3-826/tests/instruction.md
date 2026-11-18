# Issue

**Title:** [Matlab2024b] Fix some deprectiation since matlab2024b

## Description

Hello, 

This PR is here to fix some of the warning appearing since matlab2024b, in prevision of matlab2025b


**Legends:** 

Starting from Matlab2024b, Matlab is issuing a warning when using the function legend with 2 outputs, as this will be removed in future Matlab releases. 

Since the outputs were not used, it was easy to remove them from the code. 

see https://www.mathworks.com/help/matlab/ref/legend.html


**Rederer info:** 

opengl('data') is now deprecated. This is replaced by rendererinfo();
Note; i was only able to test on linux either with software opengl or hardware opengl. 

some info can be found here: https://www.mathworks.com/help/matlab/ref/opengl.html#buwqhi1-8


**Matlab without java**

Since matlab2025a, it's possible to pen matlab graphical interface without java. This PR return an error if brainstorm is started without java available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e6e0baf504b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.