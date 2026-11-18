# Issue

**Title:** [examiner] Missing certification status options translations

## Description

## Brief summary of changes

This PR translates the certification status options in the Edit Examiner form to French and updates the change log to display user-facing labels instead of backend enum values.

#### Testing instructions (if applicable)

Prerequisite: In your config.xml, set EnableCertification to 1 and configure at least one valid certification instrument.

e.g. 

```xml
<EnableCertification>1</EnableCertification>
...
<CertificationInstruments>
                <test value="bmi">BMI</test>
                <test value="radiology_review">Radiology Review</test>
</CertificationInstruments>
```            

1. Go to 'Clinical' -> 'Examiner'
2. Click on an examiner’s name to open the Edit Examiner page
3. Switch the language to French
4. Verify that the certification status dropdowns are displayed in French
5. Verify that the Old Value and New Value columns in the Change Log (table) display the translated certification statuses
6. Confirm that the Old Value and New Value columns display user-facing labels (e.g., 'Not Certified' in English or 'Non certifié' in French) instead of the backend enum values (e.g., not_certified)

<img width="854" height="434" alt="image" src="https://github.com/user-attachments/assets/5b5245e2-6ef7-46db-b0ac-9012377202de" />

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6023fddf3d8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.