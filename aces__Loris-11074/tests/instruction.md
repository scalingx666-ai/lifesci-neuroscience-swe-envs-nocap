# Issue

**Title:** [imaging_uploader] Add missing translations for pop up and error messages

## Description

## Brief summary of changes

This PR adds missing pop up and error messages translations in French in the imaging_uploader module.

Note: This PR also includes the translation of another error message in the same file.

#### Testing instructions (if applicable)

1. Go to 'Imaging' -> 'Imaging Uploader'
2. Go to the 'Upload' tab
3. Switch the language to French
4. Fill the Upload form (an example is shown below)

<img width="853" height="385" alt="image" src="https://github.com/user-attachments/assets/e121a725-270c-4769-a700-7a3f8d8daa60" />

5. Click on 'Soumettre'
6. Observe the translated pop up and error messages in French

<img width="853" height="475" alt="Telliverser un scan d&#39;age" src="https://github.com/user-attachments/assets/ad7216e5-1d96-4568-a23d-ae96e41e29fb" />

Note: run `sudo systemctl restart apache2` if the translation doesn't show up. 
Reason: 

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19b7104a720b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.