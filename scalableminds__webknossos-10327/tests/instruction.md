# Issue

**Title:** Make the dashboard toolbar and navbar fit on phones

## Description

### Summary
Makes the dashboard's toolbar and the navbar usable on phones (iPhone 12 Pro, 390px). Before, the toolbar (~612px) and navbar (~620px) overflowed, the page opened scrolled sideways because the search box was autofocused, and the Datasets/Annotations/Tasks tabs were pushed off-screen.

- **Toolbar:** below antd's `lg` breakpoint it gets its own row under the tabs (via `renderTabBar`) instead of sitting in `tabBarExtraContent`. CSS wrapping can't fix it there, because antd subtracts the extra content's width when deciding which tabs fit. The button groups now wrap, and the search box is no longer autofocused on touch-only devices (new `hasFinePointer()` helper).
- **Navbar:** below antd's `md` breakpoint it uses the existing icon-only mode from the annotation view. The `hide-on-small-screen` class is now added only in the annotation view, so phones keep the menus as icons. Below `xl` the Ask button is icon-only (32×32, and 24×24 on phones) instead of a 46×32 pill with hidden text. There's an 8px gap before the right-hand group, and the header padding on phones is 12px instead of 20px. Everything fits down to 320px.
- **Breakpoints:** `_variables.less` now has antd's breakpoints as LESS variables (CSS variables don't work in `@media`). `hide-on-small-screen` uses `@screen-lg-max`, which also fixes an off-by-one at exactly 1200px. A unit test checks the variables against `theme.getDesignToken()`.

Desktop is unchanged. The datasets list itself (the 3-pane folder/list/details grid) still doesn't fit on phones; that's for a follow-up. The welcome banner is handled separately.

| Phone, before | Phone, after |
|---|---|
| ![Datasets tab on a 390px phone before: navbar, toolbar and tabs overflow, page scrolled sideways](https://github.com/user-attachments/assets/fb935e45-27e0-4d1f-acaa-988129c8249a) | ![Datasets tab on a 390px phone after: icon-only navbar, tabs visible, toolbar wrapped below them](https://github.com/user-attachments/assets/2787718b-abf4-435c-a7e4-620a8647fd01) |

Desktop (1280px), unchanged:
![Dashboard at 1280px with the toolbar next to the tabs](https://github.com/user-attachments/assets/15b419e3-4107-473c-b91d-fccadf23d6d3)

### Steps to test:
- Open the dashboard in the browser's device emulation (e.g. iPhone 12 Pro). The navbar shows icons only, nothing scrolls sideways, and the tabs and toolbar are visible on all three tabs.
- Resize across 992px. The toolbar moves between the tab row and its own row below.
- On desktop, the dashboard and navbar look as before. In the annotation view below 1200px, the navbar submenus are still hidden.

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a37b8efff8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.