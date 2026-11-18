# Issue

**Title:** Database improvements, better HTTP API's, settings page

## Description

This PR doesn't change any existing API's in a major way. It improves on some but retains backwards compatibility. If you don't raise any objections I'll likely merge this in myself after I've created a web page to manage users. The current settings.html page is aesthetically incredibly basic and could certainly be improved if you're feeling in the mood @patrickjquinn.

Changelist:
- Added warnings on server boot when in promiscuous mode.
- Modified the settings calls to return the settings ordered.
- Added a settings.html which uses the HTTP calls to add/delete/update the various types of settings with support for admin and non-admin users.
- Re-factored the database wrapper to reduce boilerplate code and increase error checking.
- Modified the getUser call in the database to allow finding by username, username and password or user_id.
- Added HTTP API's for adding/updating/deleting users.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c65fdc214b95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.