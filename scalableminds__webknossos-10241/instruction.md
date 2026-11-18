# Issue

**Title:** Refresh the help panel UI

## Description

### Summary
Refreshes the help panel (AI assistant chat and email form), built from the design handoff. It uses antd components and theme tokens throughout, so dark mode works without extra code.

- Chat welcome screen greets the user by first name and offers suggested questions
- Multi-line input that grows with the text: Enter sends, Shift+Enter adds a line
- Clearer loading state ("Searching the documentation…" plus a skeleton); replies are rendered in an antd `Typography` container
- "Email the team" / "Send this conversation to the team" switch to the email form, optionally attaching the chat transcript
- The email draft is kept in sessionStorage until it is sent
- Instances without the AI agent show only the email form, with a link to the docs
- Panel width now uses antd's default (compact) and `ModalWidth.Large` (expanded)

### Steps to test:
- Open the help panel from the "Ask" button in the navbar
- Click a suggested question, check the loading state and the reply, then ask a follow-up (Enter sends, Shift+Enter inserts a line break)
- Click "New chat" to reset the conversation
- Click "Send this conversation to the team": the email form opens with "Include my assistant conversation" checked. Send it; the email should contain the transcript
- Type an email draft, close and reopen the panel: the draft is still there
- Check light and dark theme, and an instance without `supportAiAgentUrl`

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0008a751062f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.