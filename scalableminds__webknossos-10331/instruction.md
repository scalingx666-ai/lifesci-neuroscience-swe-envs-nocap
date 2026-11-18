# Issue

**Title:** Make the dashboard Tasks tab fit on phones

## Description

### Summary
Makes the dashboard's Tasks tab usable on phones (iPhone 12 Pro, 390px).

- **Empty state:** moved into `DashboardEmptyTasksPlaceholder`. Before, it sat in a fixed `<Col span="7">` that is about 100px wide on a phone, so the text broke one word per line. The card is now full width up to 400px and centered, and the drawing scales with it (the `translate: 15%` hack is gone). The empty pagination ("‹ 1 ›") is hidden.
- **Open tasks:** three columns from `md` on: description, details (`Descriptions`) and actions. Below `md` they stack, and the actions become a wrapping row instead of a tall vertical list. Cards on a phone went from 344px to 303px tall.
- **Card title:** two rows, the project name and date first, then the tags. Both wrap, so long project names no longer get cut off.
- **Finished tasks:** a `Descriptions` with 1/2/3 columns (`xs`/`sm`/`lg`) instead of four fixed `Col`s that overlapped on phones. I dropped the redundant "✓ Finished" text, because everything in that list is finished.
- **Small fixes:**
  - 16px gap between task cards (there was none).
  - "Load more Tasks" is a centered button in `List`'s `loadMore` slot instead of a right-aligned `<Link to="#">`.
  - The heading shows in both modes ("My Open Tasks" / "My Finished Tasks").
  - No more `<div>` inside `<p>` warning from `FormattedId`.

Not addressed here: the toolbar above the tabs (handled by #10327) and large Markdown headings in task descriptions.

| Phone (390px) | Before | After |
|---|---|---|
| **No tasks** | ![Empty tasks tab before](https://github.com/user-attachments/assets/8de0c770-7ea1-4993-9496-21fecf485855) | ![Empty tasks tab after](https://github.com/user-attachments/assets/dd3e8226-bf70-48b2-a0c4-e85a37ebe99f) |
| **Open tasks** | ![Open tasks before](https://github.com/user-attachments/assets/d9a0c392-261d-42b7-9e23-6b4cfc297d7c) | ![Open tasks after](https://github.com/user-attachments/assets/f2432751-ea9b-476d-90e8-b2508aa8cd67) |
| **Finished tasks** | ![Finished tasks before](https://github.com/user-attachments/assets/cd3a61cc-7279-4cf6-b7e4-2b970980edbf) | ![Finished tasks after](https://github.com/user-attachments/assets/4f2f475e-3f43-490c-9119-20c65ef8413e) |

Desktop (1280px), after:
![Open tasks at 1280px with three columns](https://github.com/user-attachments/assets/39b51751-e47b-4813-89d3-336ac4c7c704)

### Steps to test:
- Create a task type (ideally with a longer Markdown description), a project with a long name and a few tasks, then request them on the dashboard's Tasks tab. Finish one of them.
- Check the Tasks tab at desktop, tablet (768) and phone (390) widths, for both "Show Finished Tasks Only" states.
- With no tasks assigned, check the empty state at the same widths.
- The actions (Open, Transfer, Download, Reset, Reset and Cancel, Finish) still work.
- Open another user's dashboard as an admin (`/users/<id>/details`): the task list shows "View" instead of "Open" and no "Finish".

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `296a8e070b11`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.