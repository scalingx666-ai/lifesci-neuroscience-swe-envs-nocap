# Issue

**Title:** fix(web): require explicit confirmation for ask_user choices

## Description

## Summary
- standardize ask_user on selection plus explicit confirmation: pointer/touch, number keys, and arrows only change the selected row; Enter or the Submit button commits it
- stop free-text Enter from bubbling into the listbox handler, preventing duplicate submissions
- focus the free-text field automatically when it is the only answer path and expose the active option/question/hint through ARIA
- align pending and keyboard instructions with whether free text is actually allowed

## Verification
- production Web build passed
- targeted interaction/event/markup tests: 47 passed
- Web suite: 68 files, 554 tests passed
- repository suite: 95 files, 1063 tests passed
- Safari + real Runtime ask_user flows: pointer selection stayed pending until Submit; free text + Enter produced exactly one response; number key selected without submitting, then Enter confirmed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `751c8afcaa68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.