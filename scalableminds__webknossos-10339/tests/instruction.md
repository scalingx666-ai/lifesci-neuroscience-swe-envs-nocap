# Issue

**Title:** Fit the dashboard's empty annotations and datasets states on phones

## Description

### Summary

The empty-state placeholders of the Annotations and Datasets tabs overflowed on phones. The annotations card now has a max width (400px, like the tasks empty state) instead of a fixed grid column. The dataset cards shrink with a flex basis. The drawings scale via `aspect-ratio` + `background-size: contain`. Also drops a stray `,` after the dataset upload button.

**Annotations, phone (390px)**: no overflow. 
<img width="780" height="1688" alt="image" src="https://github.com/user-attachments/assets/6dcbeac0-c539-44ca-9d0b-4f05a331c41c" />

**Datasets, phone**: both cards are 306px wide, and the comma is gone.
<img width="780" height="1688" alt="image" src="https://github.com/user-attachments/assets/565ef7aa-203e-48fe-9dcc-1b9584508b28" />
<img width="780" height="1688" alt="image" src="https://github.com/user-attachments/assets/4ed02dd5-abc8-4852-a86f-327641a7c21f" />

**Datasets, desktop (1440px)**: unchanged, with the two 340px cards side by side.
<img width="1280" height="800" alt="image" src="https://github.com/user-attachments/assets/9cf4b3cc-38e0-41f2-a373-5c07f077d2c2" />


### Steps to test:
- With a user without annotations / an org without datasets, open the Annotations and Datasets tabs at phone width (e.g. 390px): no horizontal overflow, drawings scale down.
- On desktop, both empty states look unchanged.

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1b79cd54891`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.