# Issue

**Title:** Restore sync-tracks functionality dropped during PR #1054 rebase

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

#1054 went through a rebase before merging, and it looks like the rebase went wrong: a chunk of follow-up commits never made it into the version that got merged into `main`. This was noticed by @anna-teruel (thanks for catching this!) when she was working on #1063, which depends on the missing functionality.

I dug through the reflog of my local remote-tracking branch and (I *think*) I managed to recover the pre-rebase state (preserved on `sync-tracks-recovered`, in case we ever need to double check anything). Comparing that to what's on `main` confirms two bits of functionality are missing.

**What does this PR do?**

Restores the missing functionality from #1054:

- Syncs point deletions from the points layer to the tracks layer (previously only additions/edits were synced).
- Disables point editing when the viewer axes are not in their default order (editing with reordered axes was producing incorrect results).

Also brings back the associated tests, a new napari test fixture, and a small docs tidy-up in the GUI user guide that got dropped along with the rest.

## References

.

## How has this PR been tested?

Applied the recovered diff on top of current `main` (see `sync-tracks-recovered` for the full pre-rebase history) and ran the full napari plugin test suite locally; all tests pass, `loader_widgets.py` back to 100% coverage. I also ran pre-commit on the changed files.

@anna-teruel could you double check nothing here was intentionally dropped rather than lost in the rebase?
It would also be prudent to test the GUI as a user, to make sure all expected behaviours actually happen.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Restores a small deletion in `docs/source/user_guide/gui.md` that was part of the original PR.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5acb5e69c426`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.