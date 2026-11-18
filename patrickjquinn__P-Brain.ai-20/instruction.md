# Issue

**Title:** Remove yarn.lock and refactor to better suit msg: {text: 'text'} format

## Description

A relatively small PR for you.

- Removed yarn.lock
- Changed the return format of many skills to better use objects rather than text parsing.
- Changed display_response to either accept raw messages or just text, and moved usage to this from push_response.
- Changed the Youtube skill to return the title of the video it found.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a561dca730f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.