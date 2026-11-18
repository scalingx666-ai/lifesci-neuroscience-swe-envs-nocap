# Issue

**Title:** Socket.io Support

## Description

Hi Patrick, let me know what you think of this PR. It makes some pretty big changes to API's so let me know if you see issues, especially where things could be simplified. There's no rush to merge this so take your time :+1: 

Change list:
- Moved all queries from /api/ask to socket.io (retaining backwards compatibility for /api/ask).
- Moved name setting to socket.io (backwards compatibility also retained).
- Moved timers to server side (backwards compatibility definitely broken).
- Changed startup routine to use socket.io rather than a http request. (Not showing the issue we discussed in the previous PR).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76a6c401e1fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.