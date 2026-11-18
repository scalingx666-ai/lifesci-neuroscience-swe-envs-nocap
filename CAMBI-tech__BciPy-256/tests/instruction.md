# Issue

**Title:** #179846837 ; user editable parameters

## Description

# Overview

Params GUI change so that only parameters with a value in the 'section' attribute are user-editable.

## Ticket

https://www.pivotaltracker.com/story/show/179846837

## Contributions

- Updated params_form to only allow user to edit parameters with a section.

## Test

- Tested editing a copy of parameters.json where the section was set to blank for a number of fields. Confirmed that those fields did not appear in the GUI, but were retained when the file was saved or saved as another file.
- Confirmed that editing a normal, unmodified parameters file was unchanged and that the user could view and edit all parameters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7b0997fbbbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.