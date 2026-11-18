# Issue

**Title:** Check public annotation visibility in SecuredRoute via react-query

## Description

### Summary
Extracted from #10313. `secured_route.tsx` now checks whether an annotation is public via `useApi` instead of `useEffect` + `useState`.

- Fails silently like before: a missing annotation counts as not public.
- Uses its own query key (`["unversionedAnnotation", id, "visibilityCheck"]`) with `meta.persist: false`, so it isn't written to localStorage and doesn't share the merge modal's persisted cache.
- Only a response fetched after mount counts, so stale cached visibility never grants access.

### Steps to test:
- Open a public annotation link while logged out: the annotation opens.
- Open a private annotation link while logged out: the login view shows.

------
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e855b2a8652e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.