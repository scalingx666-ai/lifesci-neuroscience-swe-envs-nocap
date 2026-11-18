# Issue

**Title:** Settings polish: consistent section rhythm, readable labels and toggles, roomier Subscriptions list

## Description

(#109 #110 #111), from testing the Billing tab in the running app.

- One vertical rhythm for every settings tab: section eyebrows get a clear gap above and a tight gap below, separators sit centered between sections, the "Free vaults" footer row is detached from the list with its own hairline.
- Settings list rows get real height and hairline dividers (matching the checkpoint and appearance lists) instead of a 4px gap.
- Subscriptions list: display-size vault names, a "Current" pill, one fact line per row (renewal · price · seats · billed-to), taller rows with pills and actions centered; the unsynced hint renders in a card.
- Contrast: section labels, row hints, Access labels and Import/Export footnotes move from the "unavailable" grey to secondary text; the off-state Switch gets a visible fill and rim (checked against dark tokens). Locked nav items and placeholders stay tertiary on purpose.

Desktop: tsc clean, 860 tests pass. CSS scoped under the settings surfaces; no change outside settings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a36e3cc12b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.