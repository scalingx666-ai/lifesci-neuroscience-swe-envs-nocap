# Issue

**Title:** Billing: replace the Transfer popover with a destination-picker dialog

## Description

## What

The **Transfer** control in Vault Settings → Billing was a `MenuSelect` popover that listed bare vault names (usually one) with no context. It is now a dialog:

- Title names the vault the subscription is leaving ("Move Pro from BenAI OS").
- Every eligible destination is a selectable card (reusing the upgrade dialog's card style) showing the vault name and `N of M members · Free`. With exactly one candidate it is pre-selected.
- The copy explains that the target keeps the same billing period and price and that the source drops to Free with members and notes intact.
- The confirm reads "Move Pro to <vault>" and stays disabled until a vault is picked; a footnote explains that only vaults you own that aren't already on Pro are listed when some were excluded.
- Rows with no eligible destination keep the disabled Transfer control and its tooltip.

## Supporting changes

- `ConfirmDialog` gained an optional `confirmDisabled` prop.
- Removed the now-unused `MenuSelect` import and the transfer-menu CSS; added `.transfer-target*` styles.
- Guide references, `CHANGELOG.md` (Unreleased → Changed) and `docs/RELEASE_NOTES.md` updated.

## Verification

- `tsc --noEmit` clean; desktop vitest suite passes (`lib/billing` 27/27).
- Not visually verified in a running build — please eyeball Billing → Transfer on staging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfe30f11b288`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.