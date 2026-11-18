# Issue

**Title:** [MNT] - Update docstring handling to do more copying around / reduce copied text

## Description

This is an update adding more functionality to programmatically managing docstrings, with the overall goal of being able to copy around docstrings sections automatically instead of copy / pasting in the source code. 

This is a somewhat forward looking update (will be more useful / important as we add more objects that may share parameters, etc), but here already gets used with the FOOOFGroup object to copy over sections. 

In terms of reviewing, it's mostly annoying string manipulation, and any thoughts are more than welcome - but in terms of evaluating functionality, I checked that this works when building the docsite, which is what I'm largely using to check that this ultimately work:

This is the built docsite page for FOOOFGroup:
<img width="927" alt="Screen Shot 2023-07-05 at 7 18 16 PM" src="https://github.com/fooof-tools/fooof/assets/7727566/1f55680d-77a3-46ab-9057-8a8d96925906">

This show what the source code page shows (showing the changes are enacted):
<img width="642" alt="Screen Shot 2023-07-05 at 7 18 38 PM" src="https://github.com/fooof-tools/fooof/assets/7727566/cac6cf17-949d-4648-b5b8-9556a44ac703">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcb5d6f017c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.