# Issue

**Title:** [survey_accounts] Fix visit label validation failing in non-English languages

## Description

[survey_accounts] Fix visit label validation failing in non-English languages
survey account can't send email failing in non-English
 #11088

_validateAddSurvey() is checking against the translated labels using in_array(). Because "V1" is the stored value (not the translated label), the lookup always fails, causing the validation to fail every time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16908438c82d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.