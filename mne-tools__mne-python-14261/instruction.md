# Issue

**Title:** Add Report.save(only_if_changed=True)

## Description

Sometimes in my scripts reports are opened with a context manager *in case I need to add anything*, but then in the context manager I don't change anything. It would be nice if MNE-Python was smart enough in that case not to actually write anything out. This PR adds that! Changes drafted with Claude Opus 5 and reviewed by me.

Wasn't 100% sure if `report.unsaved_changes` should be public or private, but the cost to making it public is low and it seems like it could be useful sometimes. And I figure an explicit `only_if_changed=True` was a reasonable way to allow people to force a write by passing `False` if they really want to for some reason.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d005940f91ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.