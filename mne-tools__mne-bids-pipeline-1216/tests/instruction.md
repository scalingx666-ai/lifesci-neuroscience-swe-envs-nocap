# Issue

**Title:** ENH: Speed up caching checks

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

| Orig | xlsx shortcut | sidecar shortcut |
| -- | -- | -- |
| 1:26 | 1:07 | 0:45 |
| <img width="767" height="530" alt="image" src="https://github.com/user-attachments/assets/f3a063c0-b8ee-4eff-ba91-134911ad7076" /> | <img width="810" height="579" alt="image" src="https://github.com/user-attachments/assets/a9dfbce2-ee3c-458d-a0f7-ab6b29dbceb9" /> | <img width="955" height="614" alt="image" src="https://github.com/user-attachments/assets/ded572a3-3840-4fae-b917-462456b55920" /> |

I expect the sidecar update to help but testing is still in progress.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `943535f8dce3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.