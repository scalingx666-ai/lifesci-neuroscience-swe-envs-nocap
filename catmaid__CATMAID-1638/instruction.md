# Issue

**Title:** Pipeline files: Each app manages its own static

## Description

Previously, any extension apps would require a significant change to the
project's pipelinefiles.py. Now, extension apps can define their own
pipelinefiles, and the project merely collates these entries. CATMAID's
entries are loaded first and are not overloaded.

The only requirement is that the project's pipelinefiles has a list of
all extension apps which could possibly be installed.

Because the appconfigs aren't loaded at the time of pipelinefiles being imported, we can't rely on INSTALLED_APPS to figure out the installed extensions. I don't see a way around this which doesn't involve hard coding the names of possible extensions into this. It could, of course, be split off into a different file, and include links to github repos and so on.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fee1e385145b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.