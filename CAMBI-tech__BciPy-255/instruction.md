# Issue

**Title:** #180155337 ; Params form Save As

## Description

# Overview

Added Save As behavior to the Parameters form.

## Ticket

https://www.pivotaltracker.com/story/show/180155337

## Contributions

- Added new button to the parameters form to enable users to save the current configuration as a different file.
- Changed the Load button to Open. Modified its behavior so that a new file is opened and loaded for modification. The previous Load implementation had unexpected behavior for most users. The loaded file was used to set the values in the GUI, but still required the user to Save these changes to overwrite them in the existing file. The changes in this PR make the behavior more consistent with conventional Mac and Windows GUIs.
- Updated code so that search is still enabled when another file is open and the search filter is correctly applied.

## Test

- Ran all unit tests.
- Save As test: Ran the params_form in default mode (using the standard parameters.json file). Made changes and saved them as another file. Confirmed that the changes were persisted and the default file was unmodified.
- Open test: Ran params_form in default mode. Opened a different parameters file. Made changes in the GUI and Saved results. Confirmed that the changes were persisted in the opened file and not in the default.
- Search tests: In the params GUI, searched for a term to filter the inputs. Opened a different parameters file which contained legacy inputs and confirmed that the filter was still correctly applied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb44fda89955`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.