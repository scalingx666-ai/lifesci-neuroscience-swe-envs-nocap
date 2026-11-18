# Issue

**Title:** #182406904 ; Session Summary Bug

## Description

# Overview

Fixed bug when generating a spreadsheet at the end of a spelling task. 

The code worked correctly when generating the spreadsheet using the `demo_session_tools.py` due to the way it was parsing the `session.json` file. The active `Session` object used in the Copy Phrase task had a slightly different value for each Inquiry's stimuli property, which was causing the issue.

## Ticket

https://www.pivotaltracker.com/story/show/182406904

## Contributions

- Fix bug when converting a Session Object to a list of EvidenceRecords used in generating the spreadsheet.

## Test

- Ran Copy Phrase task and inspected the generated spreadsheet to confirm the correct numbers. Also generated the spreadsheet using the demo code (helpers/demo/demo_session_tools.py) to confirm the same values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71a35947782b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.