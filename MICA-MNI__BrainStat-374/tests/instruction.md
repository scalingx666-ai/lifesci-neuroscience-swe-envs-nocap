# Issue

**Title:** 351 surface genetic expression is broken with current versions of

## Description

## Summary
Fixed the float64 to float32 dtype issue that was causing GIFTI writing to fail.

## Changes
Cast surface [Points](vscode-file://vscode-app/Applications/Visual%20Studio%20Code.app/Contents/Resources/app/out/vs/code/electron-browser/workbench/workbench.html) to [float32](vscode-file://vscode-app/Applications/Visual%20Studio%20Code.app/Contents/Resources/app/out/vs/code/electron-browser/workbench/workbench.html) before writing to GIFTI format
Added dtype check to avoid unnecessary conversions
Make a copy of the surface to avoid modifying the original data
## Why
The [surface_genetic_expression](vscode-file://vscode-app/Applications/Visual%20Studio%20Code.app/Contents/Resources/app/out/vs/code/electron-browser/workbench/workbench.html) function was failing because surface coordinate data was in float64 format, but the GIFTI standard only supports uint8, int32, and float32 datatypes. This caused a ValueError when writing surfaces to GIFTI format.

## Testing
The fix ensures that surface data is properly converted to GIFTI-compatible format before writing. Test case included with the fix

close #351

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffd688909cfd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.