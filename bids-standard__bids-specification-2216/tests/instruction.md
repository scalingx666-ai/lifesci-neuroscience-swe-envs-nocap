# Issue

**Title:** [INFRA] Use full page width

## Description

In many cases, our content is naturally wider than our theme (mkdocs-material) handles comfortably. Filename templates and metadata tables are frequently a bit squashed feeling.

This PR sets the max-width of the content pane to `fit-content` instead of `61rem`. I believe this will always be the same as using the full screen width, but at least allows the possibility that a page with narrow contents would be better centered.

Relates somewhat to #1784, which addressed the impact of the narrow content frame on the entity tables.

References:

* https://github.com/squidfunk/mkdocs-material/discussions/6404
* https://developer.mozilla.org/en-US/docs/Web/CSS/max-width

## Before

<img width="1920" height="1165" alt="image" src="https://github.com/user-attachments/assets/190d2fab-204c-450b-a992-1f7ef02be0db" />

<img width="1920" height="1165" alt="image" src="https://github.com/user-attachments/assets/2e500604-b36d-47e0-a15a-4263eae21600" />

## After

<img width="1920" height="1165" alt="image" src="https://github.com/user-attachments/assets/ed6a14c8-2f4d-407b-bc4d-8b386b64f540" />

<img width="1920" height="1165" alt="image" src="https://github.com/user-attachments/assets/4d39881d-373c-4623-a1f6-1e4b8903e154" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9a66732e67d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.