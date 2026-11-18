# Issue

**Title:** Migrate dashboard and viewer data fetching to react-query

## Description

### Summary
Stacked on #10311. The `secured_route.tsx` change moved to #10337. This migrates the remaining dashboard and viewer components from `useEffect` + `useState` fetching to react-query.

- `team_selection_component.tsx`: teams via the shared `["teams"]`/`["editableTeams"]` keys. `afterFetchedTeams` is still called whenever the teams load, and newly created teams are added to the cache.
- `share_modal_view.tsx`: shared teams via a query. Edits update the cache optimistically and roll back on failure.
- Polling via `refetchInterval` instead of `usePolling`/`setInterval`: `precompute_meshes_popover.tsx` (jobs, while a mesh job is running) and `dataset_view.tsx` (conversion jobs). Both use plain `useQuery` so a failing poll doesn't toast every few seconds. Polling now pauses while the browser tab is hidden.

`command_palette.tsx` was left as is: its fetches run on demand when a command is selected, not in an effect.

### Steps to test:
- Dataset settings / upload: the team selection loads; create a new team from the dropdown.
- Share modal in the viewer: shared teams show; change them and reload to check they were saved.
- Viewer → segments tab → precompute meshes: start a job, and the button resets when the job finishes.
- Dashboard with a running conversion job: the "new jobs" alert shows and updates.

------
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5fcbe3db92e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.