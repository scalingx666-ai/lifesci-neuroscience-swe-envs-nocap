# Issue

**Title:** docs(readme): a terminal demo GIF under the hero image

## Description

## Why

From the competitive survey: every repo above us opens with motion. claude-obsidian (15k) has two GIFs and a YouTube link before Quick Start; projectmem and pi-llm-wiki both have a demo GIF. Our README had only static images.

## What

`assets/demo.gif` (41 s, 960 px, 2.8 MB) sits just below `hero.png` in README.md and README_TW.md. It shows the real CLI against the demo vault from #258:

1. `ls`: the vault is plain folders of markdown
2. `obsidian-wiki query "how should I retry a failing tool call"`: ranked pages plus `should_read`
3. `obsidian-wiki lint`: the whole vault is checked, and the only warning is the missing trust ledger
4. `obsidian-wiki context-pack "agent memory" --budget 300 --metadata-only`: a bounded slice for another agent
5. a closing `# plain markdown you own. open it in Obsidian.`

## How it was made

- Every character on screen is real output from a real PTY (termmirror). Only the camera zooms were added afterwards.
- It ran under a sandboxed `HOME` (`obsidian-wiki setup --no-hooks` off camera), so no real config, vault, or home path appears.
- **Heads-up:** it was recorded with the #260 fix installed. Without #260, `context-pack` renders `## >-` headings for template-style pages, so **merge #260 before or with this one**.

## Checks

- I tiled frames from each render and reviewed them. Earlier takes had output dropped and screens cropped; both are fixed in this one.
- The densest screen (context-pack at 1× zoom) is readable at GIF size.
- `pytest`: 1092 passed, 4 skipped.

An MP4 master (1080p, 30 fps) exists. To use it instead, drag it into the GitHub editor, since GitHub only plays video from user attachments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e1c401dc23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.