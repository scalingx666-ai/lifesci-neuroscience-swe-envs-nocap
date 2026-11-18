# Issue

**Title:** [media] Translate file visibility options and translation files cleanup

## Description

## Brief summary of changes

This PR translate the file visibility dropdown options 'Hidden only' and 'Visible only' in French.

It also includes a cleanup of the Media translation files by removing unused strings that are no longer referenced in the code.

Finally, it fixes a multilingual bug where the namespace for 'Invalid file name!' was missing.

#### Testing instructions (if applicable)

1. Go to 'Clinical' -> 'Media'
2. Switch the language to French
3. Verify that the dropdown options are translated
<img width="1708" height="869" alt="image" src="https://github.com/user-attachments/assets/b6650293-632e-4d4e-8170-0fa57e0b2afd" />


Note: run `sudo systemctl restart apache2` if the French translations do not appear.
Reason: 

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7e198349459`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.