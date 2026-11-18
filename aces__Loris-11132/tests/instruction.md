# Issue

**Title:** [Dashboard/Statistics] Fix scans date filter

## Description

## Brief summary of changes
- In Study Progression - Scans, the chart would show for each month, but the date registered would only filter for year. So if you do 2017-01-01 to 2017-11-01, a scan at 2017-10 would not show. This has been fixed
<img width="595" height="672" alt="image" src="https://github.com/user-attachments/assets/1a659c55-07c7-4189-bff3-a76c374396cf" />


#### Testing instructions (if applicable)

1. Scroll down to Study Progression and switch to Scans in the dashboard
2. Open filters and filter to a specific month and see that it works now

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `133118de6890`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.