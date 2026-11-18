# Issue

**Title:** Webgl racecondition fix

## Description

In somewhat related things, there's an annoying Heisen-bug in how the tornado websocket communication works. If it tries to send too many queries too quickly, tornado just barfs. This fix is based on: 

I _believe_ this fix works well — I haven't been able to replicate the problem since applying this fix — but the problem was random before, so I'm not 100% certain.

I also believe that this fix should make a lot of `time.sleep` calls unnecessary (removing them seemed to have no effect), but, again, the effect of those pauses is inconsistent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74e92f191a8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.