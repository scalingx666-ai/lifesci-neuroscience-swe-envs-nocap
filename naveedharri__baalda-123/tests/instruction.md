# Issue

**Title:** Leave a vault you don't own

## Description

Implements #121. Stacked on #122 (merge that one first; this branch already contains it, so it merges cleanly afterwards).

## Server

- New `POST /api/orgs/:orgId/leave`. Any `admin` or `member` may leave at any time. The owner gets `409 owner_cannot_leave` with a message pointing at Delete. Non-member → 404, no session → 401.
- The teardown is factored into `revokeMembership()` and shared with the existing admin-removal route so the two cannot drift: delete the `member` row, purge shares granted **to** that user in the org (shares they created for others stay), clear `session.activeOrganizationId` for that user where it pointed at the vault, then `disconnectDoc` every doc and `onAclChanged` per collection, after the commit.
- Emails (only when `emailEnabled()`, fire-and-forget via `dispatchMail`): `memberLeftEmail` to the owner ("<name> left <vault>", notes that direct shares were un-shared) and `youLeftVaultEmail` to the leaver (removed from your devices; how to rejoin; change your password if this wasn't you). The email `layout()` now renders the button and the paste-this-link fallback only when there is a URL, since these are notifications with nothing to click.
- Tests: `tests/orgs-leave.test.ts` (8 cases): member leaves with shares purged / bystander untouched / readable set empty / sockets kicked / ACL broadcast; admin may leave; owner 409 with no side effects; 404/401; session unpinned for the leaver only; both emails with the expected subjects and copy; nothing sent without a mailer; re-joining by code afterwards works.

## Desktop

- `api.leaveVault()` and a `leaveVault` store action: server first (an owner's 409 or being offline leaves the device untouched), then the same detach as "Remove from device", then the session is re-read, then the vault's folder is moved to the OS Trash via the existing `delete_vault` command (never the folder that is currently open). The vault disappears from the switcher and recents.
- Vault Settings → Vaults: a **Leave** action next to Delete. On the active row it shows for non-owners only (the only row whose role we know); on other rows both are offered and the server decides, the same pattern Delete already uses. The confirm dialog names the folder that goes to the Trash, says the owner is told, and how to come back.

## Not in this PR

- Other signed-in devices of the leaver are not auto-cleaned. They lose access immediately (sockets closed, token mint 403s, session unpinned) but their folder stays until the user removes it. Auto-trashing a folder from a remote signal risked deleting the wrong account's folder on a shared machine, so it's left as a follow-up.
- Ownership transfer / owner leaving.

## Docs

Guide references (features + FAQ), `docs/INTERACTIONS.md`, `CHANGELOG.md` (Unreleased → Added) and `docs/RELEASE_NOTES.md` updated.

## Verification

- Server: `tsc` clean; 83/83 across the orgs, authz, invitations, email and billing suites on the scratch DB.
- Desktop: `tsc` clean; full vitest suite 870 passed.
- Not exercised in a running build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfe30f11b288`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.