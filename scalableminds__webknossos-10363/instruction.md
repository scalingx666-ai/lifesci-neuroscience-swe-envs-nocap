# Issue

**Title:** Fix dataset upload in onboarding flow

## Description

### Summary
The dataset upload in the onboarding flow didn't work:
- **Upload button did nothing:** onboarding fetched the datastores on mount, before the account existed. `/api/datastores` returns `[]` for anonymous users, so the hidden but required datastore field failed validation silently. The upload view now fetches the datastores itself, once a user is logged in.
- **No feedback without a datastore:** if no datastore accepts uploads, the upload view now shows an error and disables the Upload button instead of failing silently.
- **No folder preselected:** the upload view only took the folder from the `?to=` URL parameter. It now preselects the organization's root folder if no folder is given and the user can edit it. This also applies to `/datasets/upload` opened without `?to=` (e.g. from the navbar). If the cached folder tree was outdated, the preselection is replaced once the tree is refreshed.
- **Stale data after login:** the react-query cache is persisted to localStorage and could still hold data of a previous user. It is now reset on every login (password, passkey, and both signup forms).

### Steps to test:
- Start with an empty database (no organizations) and go through the onboarding: create an organization and an admin account.
- In the "Add Dataset" step, open the upload. The root folder should be preselected.
- Upload a dataset. The upload should start and finish.
- Open `/datasets/upload` without `?to=` as a regular user: the root folder should be preselected.
- Open `/datasets/upload?to=<some folder id>`: that folder should stay selected.

### FAQ

<details>
<summary><b>Doesn't resetting the cache on login throw away the persisted cache between sessions?</b></summary>

No. The reset only runs on an explicit login, i.e. when the active user changes. Reloading the page with an existing session doesn't log in again, so the cache persisted to localStorage is restored as before. Whatever is cached at login time was fetched anonymously or for another user, e.g. when a session expired without a logout.
</details>

<details>
<summary><b>Why <code>resetQueries()</code> on login but <code>clear()</code> on logout?</b></summary>

`clear()` removes the query objects. Components that stay mounted after a login (onboarding page, navbar, the login modal in the viewer) would keep pointing at the removed queries and miss later updates. `resetQueries()` drops the data but keeps the queries and refetches the active ones. Logout navigates away right after, so `clear()` is fine there.
</details>

<details>
<summary><b>Why not let the backend return datastores to anonymous users?</b></summary>

Returning `[]` to anonymous users is intended. The onboarding only needs the datastores after the account was created, so the query is keyed by the user id and only enabled once a user is logged in.
</details>

<details>
<summary><b>Why does the upload view fetch the datastores itself now?</b></summary>

The onboarding had its own datastore query just to pass them as a prop. It fetched them while the user was still anonymous, which caused this bug. `useDatastoresQuery()` is keyed by the active user's id and only runs once a user is logged in, so the upload view always gets the current user's datastores. Its loading state also disables the Upload button until they arrive, without flashing the "no datastore" error. The other tabs of the "Add Dataset" view still get them as a prop. They could move to the hook in a follow-up.
</details>

<details>
<summary><b>What if the user can't edit the root folder?</b></summary>

Then nothing is preselected and the required folder field shows its usual validation message on submit.
</details>

<details>
<summary><b>Why does the preselection still keep a ref instead of only checking whether the folder exists?</b></summary>

A folder passed via `?to=` (or of an unfinished upload) may be missing from an outdated, cached folder tree, e.g. if it was just created. Replacing every unknown folder would swap it for the root. The ref limits the replacement to the hook's own preselection. Once the user touched the field, the hook doesn't change it anymore.
</details>

<details>
<summary><b>Is <code>hierarchy.tree[0]</code> guaranteed to be the root folder?</b></summary>

Yes. Each organization has exactly one root folder, which is the only folder without a parent, so `tree` has exactly one item.
</details>

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e666152b1069`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.