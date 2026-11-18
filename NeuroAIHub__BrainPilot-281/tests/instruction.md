# Issue

**Title:** feat(web): fold non-fatal agent errors + Agents-tab red dot

## Description

.

## What

Non-fatal `system_message` events (`level: error` / `warning`) are folded out
of the main chat stream by a new **default-on** message-filter rule
(`hide-non-fatal-agent-errors`). The Agents tab grows a quiet red dot
whenever the filter has hidden something on the active session, mirroring
the existing `traceUnread` dot on the Trace tab.

`fatal` messages are always shown — a fatal event means the run died and the
user MUST see it inline. The legacy `kind: "error"` RUN_ERROR path is also
left untouched for the same reason.

## Why

Expert agents surface a lot of noise during retryable-tool loops (see PR
#125 / [[expert-error-path]]). Most of it is self-healing — the agent
retries, succeeds, and the run continues — but the errors sit in the chat
stream and drown out the actual conversation. Users have complained.

## How

- **New rule** in `packages/web/src/contexts/messageFilters.ts` — id
  `hide-non-fatal-agent-errors`, enabled by default. Predicate is exported
  as `isNonFatalAgentErrorMessage()` so SessionContext can reuse it for
  hidden-error counting without duplicating the level checks.
- **User opt-out** lives in the Agents panel: every agent's detail pane now
  has a "Global message filters" section (`GlobalFilterList` in
  `AgentNetwork.tsx`) listing every registered rule with a checkbox and
  description. Toggles persist per-id to `localStorage["message-filters"]`
  as `MessageFilterConfig[]` so adding future rules doesn't clobber
  user-set opt-outs of existing ones.
- **Red dot** on the Agents tab: `SessionContext` counts hidden errors
  per-session during the SSE queue drain (id-diff against the previous
  message list, so coalesced updates don't double-count) and exposes
  `hiddenErrorsCount` / `hiddenErrorsUnread`. Opening the Agents view or
  disabling the rule marks the current session's badge as seen.
- **Testability** — the tab strip is extracted to `WorkspaceViewTabs` so
  the badge visibility is unit-testable without wiring the full DesktopShell
  + Auth/Sandbox/SSE context tree.

## Tests

Two new files, 11 cases:

- `messageFilters.test.ts` (6 cases) — rule ships enabled by default,
  matches error+warning but not fatal/info, legacy `kind:"error"` and
  `ask_user` are untouched, `applyMessageFilters` end-to-end, disable
  restores visibility, spurious-dot regression guard.
- `workspaceViewTabsBadge.test.tsx` (5 cases) — badge shows on chat/trace
  view with unread errors, hides on agents view even before the parent
  effect clears state, doesn't render when no errors, coexists with the
  `traceUnread` dot (#134 regression guard).

All 183 web tests + 673 non-web tests pass locally; `npm run typecheck`
and `packages/web && npm run build` are clean.

## No npm release with this PR

Per author's decision, this merge is code-only — do NOT run
`npm run release`. The version stays at the current release; the next
`development → main` merge is where publishing gets picked up.

## Screenshots

<details>
<summary>Where the toggle lives</summary>

Agents panel → click any agent → detail pane → "Global message filters"
section (new). Checkbox is checked by default; unchecking restores inline
errors. Count pill next to the label shows how many are folded on the
current session.

</details>

<details>
<summary>Where the red dot lives</summary>

Top-right tab strip → Agents icon → small red dot at the top-right corner,
same size and color as the existing Trace-updated dot (`#134`). Dot clears
when the user clicks the Agents tab.

</details>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8aacfa8f6a03`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.