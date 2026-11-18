# Issue

**Title:** [instrument_builder] Translate 'Browse' button in French

## Description

## Brief summary of changes

This PR updates the custom file upload component to use the localized “Browse” label instead of hardcoded string 'Browse ...', allowing the button text to be translated based on the current language.

#### Testing instructions (if applicable)

1. Go to 'Tools' -> 'Instrument Builder'
2. Navigate to the 'Load' tab
3. Switch the language to French
4. The button label should now be translated
5. Rename a file on your computer with the .linst extension and verify that it can be uploaded using the translated Browse button.

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d45e90c76f60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.