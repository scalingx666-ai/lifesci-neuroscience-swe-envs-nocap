# Issue

**Title:** [dashboard] Display last login timestamp in local timezone

## Description

## Brief summary of changes

This PR updates the Dashboard welcome widget to display the last login timestamp in the user’s local timezone.

The timestamp is now passed to the frontend and formatted in JavaScript, since PHP runs on the server and does not know the browser’s local timezone.

Since this change already involved the frontend date formatting, `loris.user.langpref` was also replaced with the active `i18n.language` at the same time, consistent with the date multilingual fix in other modules (e.g. brainbrowser).

#### Testing instructions (if applicable)

1. Log in into your account
2. Verify that the Last login timestamp is displayed in your local timezone

<img width="256" height="54" alt="image" src="https://github.com/user-attachments/assets/6d859757-99f8-44ad-a1d1-9d4a364f325a" />

<img width="853" height="497" alt="Untitled 57" src="https://github.com/user-attachments/assets/8fe51dba-9cdb-4725-be30-b02df4623983" />


#### Link(s) to related issue(s)

* 
*  for context

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1b4aae45f13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.