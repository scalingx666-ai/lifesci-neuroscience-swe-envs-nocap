# Issue

**Title:** Return readable error for unauthenticated requests instead of raw silhouette JSON

## Description

### Summary
When a session became invalid (e.g. after logging out in another tab), the "Your session has expired" toast was shown together with a raw `{"success":false,"message":"Authentication required"}` toast.

The root cause: silhouette's own `SecuredErrorHandlerModule` was active, so our `ErrorHandler.onNotAuthenticated`/`onNotAuthorized` were never used and silhouette's default JSON body was returned.

- Backend: disable silhouette's `SecuredErrorHandlerModule` and bind our `ErrorHandler` instead. 401/403 responses of secured actions now use the standard `{"messages":[{"error": …}]}` format.
- Frontend: if the session expired toast is shown for a 401, the server message is no longer toasted in addition.
- Frontend: 401 responses of `/api/auth/` routes (e.g. a failed passkey login) no longer show the misleading session expired toast, but the server message instead.

### Steps to test:
- Log in and open the dashboard in two tabs.
- Log out in one tab, then interact with the dashboard in the other tab (e.g. switch tabs/folders to trigger a request).
- Only the "Your session has expired. Please refresh the page" toast should appear, without the raw JSON toast.
- `curl -i -H "Accept: application/json" localhost:9000/api/user` returns 401 with `{"messages":[{"error":"You are not authorized to view this resource. Please log in."}]}`.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9898679f3f04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.