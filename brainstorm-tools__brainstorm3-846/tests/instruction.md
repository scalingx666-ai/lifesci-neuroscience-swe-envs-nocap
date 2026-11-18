# Issue

**Title:** Supress  `javacomponent` warnings >=R2025a

## Description

Based on the issue described in  this PR aims to suppress those messages.

<img width="2372" height="394" alt="Screenshot 2025-09-29 174455" src="https://github.com/user-attachments/assets/5d3f4d25-fd8c-41b7-ac39-a819af07aa75" />


MATLAB 2025a onwards the MATLAB desktop and graphics system uses JavaScript and HTML instead of Java (check blog https://blogs.mathworks.com/matlab/2025/05/16/whats-with-all-the-big-changes-in-r2025a/). The warning now falls under the category `MATLAB:ui:javacomponent:BridgeForWebFigures` as compared to `MATLAB:ui:javacomponent:FunctionToBeRemoved` prior to R2025a.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82ef63099ef3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.