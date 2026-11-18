# Issue

**Title:** Rebuild dashboard welcome banner with antd and make it fit on phones

## Description

### Summary
Rebuilds the dashboard "Welcome to WEBKNOSSOS" banner (`WhatsNextHeader`) with antd primitives and makes it usable on phones.

- Layout is now `Flex` + `Typography` + `Row`/`Col` + `Card`/`Card.Meta`, colors come from theme tokens. ~110 lines of LESS removed; only the neuron background (`var(--background-blue-neurons)`) stays.
- Below the `md` breakpoint (single-column cards) the banner switches to a compact variant: title-only cards with 40px icons, no subtitle, level-3 title, smaller gutter.
- Fixes the title wrapping mid-word ("WEBKNOSSO / S") and the cards sitting off-center (fixed `margin-right: 40px`).
- Same actions, permission checks, links and Close/"Don't show this again" behavior as before.

| Viewport | Banner height before | after |
|---|---|---|
| iPhone 12 Pro (390) | 1096px, title 3 lines | **394px**, title 1 line |
| iPad mini (768) | 848px | **496px** |
| Desktop (1280) | 544px | **465px** |

#### Screenshots

| | Before | After |
|---|---|---|
| **390px** | ![Before, 390px](https://github.com/user-attachments/assets/13efc33f-8438-4eeb-afcb-8765489c4995) | ![After, 390px](https://github.com/user-attachments/assets/80c076a3-238a-402b-8605-db2c0a95bd4b) |
| **768px** | ![Before, 768px](https://github.com/user-attachments/assets/6fba81ce-6fa2-4199-bf26-5bb9acb9091d) | ![After, 768px](https://github.com/user-attachments/assets/4d5dfb3c-c6b8-418f-965f-45cbc9f3ad5f) |
| **1280px** | ![Before, 1280px](https://github.com/user-attachments/assets/13496056-8f70-4d9f-ad16-e80180604e7a) | ![After, 1280px](https://github.com/user-attachments/assets/c8398a37-5c4c-411b-bc79-f1a4d6266fb5) |

Not addressed here: the rest of the datasets tab still overflows horizontally on phones (tab toolbar ~612px, top nav ~620px, 3-pane grid in `dataset_folder_view.tsx`).

### Steps to test:
- Make the banner show again: on the dashboard, run this in the browser console and reload
  ```js
  fetch("/api/user").then((r) => r.json()).then((u) =>
    fetch("/api/users/" + u.id + "/novelUserExperienceInfos", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ ...u.novelUserExperienceInfos, hasSeenDashboardWelcomeBanner: false }),
    }),
  );
  ```
- Check the banner at desktop, tablet (768) and phone (390) widths, in light and dark theme
- Click each action: demo dataset and video open in a new tab, "Import Your Own Data" goes to the upload page, "Invite Your Colleagues" opens the invite modal
- Hover Close to see the "Don't show this again" tooltip; click it and the banner stays hidden after reload

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dda19435bc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.