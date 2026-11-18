# Issue

**Title:** Fix Add all to restrict existing items without changing vault defaults

## Description

The access board's Add all action previously changed the person's vault-wide permission. Moving existing items to No access consequently denied newly created root notes and folders too.

Add all now writes permissions to existing item roots and their folder subtrees, preserving the vault default. Empty boards are a no-op. The confirmation and menu hint describe this scope; explicit vault-wide controls retain their behavior.

Validation:
- 55 desktop access-board/profile regression tests passed. Both new regressions fail on the previous implementation.
- Two HTTP/database regressions passed in an isolated disposable database: owners and members can create editable root notes/folders after existing-item denial, while creation inside restricted folders remains denied.
- Desktop TypeScript check and Windows-target frontend build passed.
- macOS and Windows browser simulations verified the action; narrow Windows layout checked. Native Windows was unavailable.

Existing saved vault-wide restrictions are not automatically rewritten because they may have been intentional.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0bd71feb9c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.