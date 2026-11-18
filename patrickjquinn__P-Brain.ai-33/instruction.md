# Issue

**Title:** Added Remind Me And Recognition Changes

## Description

Hi Patrick a few little things.

- Added 'remind me to' hard skill. This can be used in queries such as 'In 10 minutes remind me to push to github.'
- Improved stripping punctuation from queries (useful for hard skills mostly).
- Moved Brain name setting and users name setting to hard queries and made it quite limited. The server would get confused between these two all the damned time.
- With fewer learned skills, the fact skill had a confidence greater than 0.25, upped this to 0.5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `353985e31303`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.