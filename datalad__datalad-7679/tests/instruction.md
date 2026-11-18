# Issue

**Title:** fix: do load extension interfaces if early parsing errors out

## Description

Apparently we have not been loading them upon error in early parsing. Debian has python 3.12 patched with some patches from what came after 3.14 (!) and that broke that interface.  We silently just did not even try to get those parsers in place.  With this change we would

TODOs
- ~~add a fix to actually use that new `intermixed` flag~~ -- we seems just need to drop 3.8 and stop using the protected method there -- will do separate PR!  That would also unblock testing datalad-neuroimaging which dropped 3.8 already

- In effect

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3dc49f2b980e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.