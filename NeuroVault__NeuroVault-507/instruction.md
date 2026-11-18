# Issue

**Title:** Changed tagcleaning to ImageForm and added in NIDMform

## Description

Changed clean_tag() to ImageForm and added into NIDMResultsForm. With this PR, we can avoid errors; probably the last migration has to be executed again, since there will be some duplicated tags due to the pair of errors generated...

While doing this, I've realized that  NIDM tags don't appear in the NIDM view and neither are being indexed by the tag_search (NIDM tags do exist, but they are not being used at all). Maybe this is due to a bad use from my side: I am uploading a " \* .nidm.zip" file. This file generates a statistical map and a NIDM zip file (just this last one can be edited). Neurovault viewer complains about the "*.nidm.zip" of being a not recognized format, but if I try to open it, the NIDM viewer appears and I can edit the info (tags...) if I am the owner.

:bulb: ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3ba9c67ccd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.