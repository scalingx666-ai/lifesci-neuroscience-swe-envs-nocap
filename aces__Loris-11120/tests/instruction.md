# Issue

**Title:** [dataquery] Fix multilingual date formatting bug

## Description

## Brief summary of changes

This PR replaces `loris.user.langpref` by `i18n.language` to determine the language when formatting the recent query timestamp. This ensures the date/time format updates immediately after an in-module language change, rather than requiring a page refresh.

#### Testing instructions (if applicable)

1. Go to 'Reports' -> 'Data Query Tool (Beta)'
2. Accept the Terms of Use if prompted

<img width="855" height="432" alt="Image" src="https://github.com/user-attachments/assets/6a80c64f-c166-4aba-921b-89d4cf357f81" />

3. Please refer to the instructions in the corresponding issue.
4. After switching the language within the module, the date/time format is now displayed in the selected language without requiring a hard refresh.


https://github.com/user-attachments/assets/7194450d-aba4-49c0-b880-c24fb5da8f58



#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d21162e3da68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.