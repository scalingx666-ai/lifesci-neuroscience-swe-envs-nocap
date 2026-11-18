# Issue

**Title:** Fix table pagination touching the edge of admin page cards

## Description

### Summary
On admin list pages (jobs, users, tasks, projects, …), the table pagination sat flush against the right edge of the content card, so the "50 / page" selector looked cut off. The card has no padding and clips its content, and antd only gives the pagination a vertical margin. The pagination now gets a horizontal inset inside the `AdminPage` content card.

Problem:
<img width="1120" height="293" alt="image" src="https://github.com/user-attachments/assets/74992f3a-75f2-4538-8027-e5cf95b4554d" />


### Steps to test:
- Have more than 50 jobs, e.g. by inserting test rows into `webknossos.jobs`.
- Open `/jobs`: the page-size selector and the pager have spacing to the card's right edge.
- Spot-check another admin list, e.g. `/users`.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7843ccf839d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.