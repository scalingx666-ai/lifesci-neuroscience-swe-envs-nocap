# Issue

**Title:** Allen internal pipeline

## Description

Lots of bug fixes and enhancements:
found the bug that was preventing ANY checking of space on the backup drive. Small typo meant it was only checking SD8 and D drive
Added a feature so that it doubles the size estimated needed for both D and backups if the "sharing_backups" parameter is true. 
this is on for WED, THURS, FRI and off for everythign else 
everything else should still check just not double
added a force flag to "resort from module" 
if you pass it -f (the same way you would -ctx) then it will ignore any errors found when checking for space and try to sort anyway
changed the params from the default so robocopy only tries 3x over the course of 30seconds instead of trying 1 MILLION TIMES
changed it so that robocopy does not cache the files in memory (might make it a bit faster)
removed the unnecessary pings at the end - it should end by printing whether sorting was successful, and checking if there is space on the ACQ
added features for compatibility with short sorts (probe depth tries to use fewer iterations if it failes and concatenates data to itself thats shorter than 20 minutes so kilosrt doesn't fail)
added what I think will be better error handling if probe_depth fails and probe_info.json doesn't get created
changed cleanup so it doesn't print a bunch of extra stuff, and so the processing script can actually print files that need attention
I removed an unecessary check that caused it to wait 14 hours to cleanup (to avoid deleting data that might not have gone to lims yet)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9cf9b16c976`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.