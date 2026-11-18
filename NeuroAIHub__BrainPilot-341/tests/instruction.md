# Issue

**Title:** fix(web): complete Settings and Provider modal a11y and validation

## Description

## Summary

- : Settings and nested Add/Edit Provider (and MCP) dialogs get full modal semantics and keyboard behavior.
- `aria-modal="true"` + labelled titles; siblings marked `inert`/`aria-hidden` while open.
- Escape closes only the topmost layer (MCP → Provider → Settings); Tab is trapped in the top dialog; focus returns to the opener on close.
- Provider form: required markers, `aria-invalid` / `aria-describedby` errors, pure `validateProviderForm` (create requires API key; edit may keep blank key).

## Test plan

- [x] `settingsModalA11y.test.ts` + `settingsTabs.test.ts`
- [x] `tsc -b` for web package
- [ ] Manual: open Settings, Escape closes; open Add Provider, Escape closes only nested form
- [ ] Manual: submit empty provider form — inline field errors, no save

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09975fc45d7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.