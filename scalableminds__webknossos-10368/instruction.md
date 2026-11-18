# Issue

**Title:** Add divider between WEBKNOSSOS and partner logo in the navbar

## Description

### Summary
, aligning the co-branded navbar header with the design mockup: a thin divider (not full height) now separates the WEBKNOSSOS wordmark from the partner logo, and the partner logo has more space on its right. The collapsed navbar (annotation view) gets a shorter divider with tighter spacing. On phones, the divider is hidden together with the logo.

The screenshot below is a mock that uses the new CSS values and the real Panluminate logos.

### Steps to test:
- Run `node tools/postgres/dbtool.js enable-partner` to assign the sample organization to the test partner.
- The navbar shows a divider between the WEBKNOSSOS wordmark and the partner logo, with more space before "Dashboard".
- Open an annotation: the collapsed navbar shows a shorter divider between the WEBKNOSSOS mark and the compact partner logo.

------
- [x] Removed dev-only changes like prints and application.conf edits

![Navbar before and after (mock with the new CSS values)](https://github.com/user-attachments/assets/4738e53b-7a60-4b28-a92f-101d6a2d9242)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fb5e2d5c567`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.