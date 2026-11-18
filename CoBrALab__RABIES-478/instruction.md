# Issue

**Title:** Convert issue template to form and disable blank issues

## Description

Users were ignoring the markdown issue template. Converting to a YAML issue form enforces required fields and prevents blank submissions.

## Changes

- **`.github/ISSUE_TEMPLATE/config.yml`**: Disable blank issues, add troubleshooting guide link
- **`.github/ISSUE_TEMPLATE/bug-report.yml`**: Structured form with required fields:
  - Image orientation verification (checkbox, required)
  - Bug description, RABIES version, OS, command, log file (all required)
  - Execution method and reproducibility (dropdowns, required)
  - System specs, QC report, additional context (optional)
- **`.github/ISSUE_TEMPLATE/standard-bug-report.md`**: Removed

All content from the original template preserved, now with enforcement via form validation.

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>Disable blank issue template and convert template into a form</issue_title>
> <issue_description>The issue template is being ignored. Convert to an issue form to ensure users fill it in.</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes CoBrALab/RABIES#477

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16b965b2a938`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.