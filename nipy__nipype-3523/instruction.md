# Issue

**Title:** FIX: Check for non-mandatory output in DWIBiasCorrect

## Description

The function `_list_outputs` in `DWIBiasCorrect` doesn't take into account the fact that `output_file` is not a mandatory input, thus making any pipeline using this interface without specifying the output crash. It crashes with the following error:

![Screenshot 2022-09-27 at 14 55 19](https://user-images.githubusercontent.com/85217698/192714182-6e28a36a-c272-4f33-bf27-cb252dcb2d7a.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf264ac3502c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.