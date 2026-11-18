# Issue

**Title:** fix(web): tighten visual hierarchy, responsive layout, and terminology

## Description

## Summary

-  (UX hierarchy / responsive / terminology).
- **Settings**: adaptive `max-height` (no fixed 16:9 canvas); content scroll with edge fade.
- **New conversation heading**: shorter zh copy + `text-wrap: balance` / max-width for 390px.
- **Live Demo**: `preferredDemoWidths` compacts right rail when Trace & files empty.
- **Files**: not-running empty state with hint + “Close Files” CTA.
- **Contrast**: muted/subtle tokens improved for light/dark AA secondary text.
- **Terminology (zh-CN)**: Agent→智能体, Principal→主智能体, Trace→轨迹; Live Demo / Sandbox stay English product names.

## Test plan

- [x] `uxHierarchy321.test.ts`, `demoLayout.test.ts`, `settingsLayoutCss.test.ts`
- [x] `tsc -b`
- [ ] Manual: Settings short vs long tabs; Files with no sandbox; Demo empty Trace; 390px heading

**Note:** GitHub Actions may fail to start jobs if org billing/spending limits block runners (seen on #344). Local tests green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c67c8dcec8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.