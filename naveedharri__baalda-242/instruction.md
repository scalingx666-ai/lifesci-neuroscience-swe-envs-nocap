# Issue

**Title:** Text size setting and image zoom

## Description

- Text size slider (12–24px, default 16px) under Content width in Appearance; affects note text only, persisted.
- Working image previews get Open externally and Reveal in Finder.
- Click an image (in a note or a file preview) to open a lightbox: scroll/pinch zoom, drag to pan, Esc or backdrop to close.
- Cmd+= / Cmd+- / Cmd+0 zoom a focused image file preview.
- Resizable inline images (`![alt|400](src)`) left for a separate issue.

Tests: desktop suite 2617 passed, 0 failed; typecheck clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f27871a21bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.