# Issue

**Title:** Vault key sharing fix, invitation signals, Plan & Billing cards, encryption card, invite page button

## Description

Four changes for staging testing. Production untouched.

## 1. Share vault keys with new members (bug)
A teammate who joins an encrypted vault never got its key: folder stuck "local", Turn on sync said "Couldn't connect to this vault". `GET /vaults/:id/keys/requests` answers `{ requests: [...] }` and `GET /me/devices/pending` answers `{ devices: [...] }`, but `listVaultKeyRequests` / `listPendingDevices` read only a bare array, so both lists were always empty (no key ever shared; no new computer ever approvable). Both now read the envelope. `listShapes.test.ts` pins the shape; `joinKeyShare.it.test.ts` (`KEYS_IT=<server>`) reproduces owner + joining teammate against a live server: failed before, passes after.

## 2. Invitations you can see with the menu closed
Avatar count + "N invitations" on the identity bar while any are pending; a one-time arrival card (Accept, View all, dismiss); one "Invitations" row in the account menu whose side panel opens beside it. Replaces the one-line rows that clipped "Decline" under the redesign. Neutral ink, light and dark.

## 3. Plan & Billing as two cards; encryption status card
Team with seats: plan card (total per interval, renewal, discount, Manage billing, Cancel/Resume) + seats card (Add seats, claimed/invited ring, invited-vaults popover kept). Free/legacy/complimentary unchanged. Vault Settings → General now leads with an encryption card: what is and is not encrypted, the conversion line, and the owner's vault key row (Save to file / Show / Restore). Admins see the status without the key row.

## 4. Invite / sign-in / verified pages
The "Open in Baalda" label sat at the top of the button: inline `display:block` overrode `.btn`'s flex centring. Now `display:flex`.

Checks: desktop `tsc --noEmit` clean; vault key + related suites 106 passed (one red team stress test is load-sensitive and passes alone).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0db6c4930ebc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.