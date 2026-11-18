# Issue

**Title:** Adding communities

## Description

When adding/editing a collection one can pick a community
![screenshot_7](https://user-images.githubusercontent.com/238759/42142519-ba3fb642-7d64-11e8-9482-f5594f3fcbf1.png)

A new set of URLs is also available (/communities/<community_label> which upon deployment will be turned into <community_label>.neurovault.org for example nutritional.neurovault.org). Those URLs point to landing pages tailored to a specific community and displaying only collections of maps from that community:

![screenshot_8](https://user-images.githubusercontent.com/238759/42142565-f2241ef4-7d64-11e8-9831-6720fefc558e.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5939eeb264f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.