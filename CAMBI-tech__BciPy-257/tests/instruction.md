# Issue

**Title:** #180317983 ; GUI History

## Description

# Overview

Added functionality for storing state / user preferences between sessions. Dialogs which prompt for files and directories now remember the last location that was opened, as well as the directory of the last signal model that was trained or used.

## Ticket

https://www.pivotaltracker.com/story/show/180317983

## Contributions

- Added infrastructure for persisting state between work sessions in a .bcipy_cache file.
- Added pre-defined attributes for storing signal_model_directory and last_directory accessed.
- Updated offline_analysis to store the data_folder after generating a new model.
- Updated file_dialogs to use preferences if no specific locations have been provided in the parameters.
 
## Test

- Ran all unit and integration tests
- Ran an offline analysis and confirmed that the preference was written to the cache file.
- Ran a Copy Phrase and confirmed that it prompted for the model file using the appropriate directory.
- Tested the ask_filename and ask_directory methods from an interactive session.

## Discussion

I ended up using the name Preferences for this, but there were others that could have worked. I'm open to changing this if there are strong opinions. I considered the following:

- Preferences
- Settings
- Configuration - we already have config.py for environment variables
- State - too generic?
- Cache - usually refers to something that has been pre-computed
- History - too specific; we may want to store some other user-selected things like color preference, etc.
- Properties - too ambiguous?
- Session - we already use session to refer to a typing session

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b1c95177054`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.