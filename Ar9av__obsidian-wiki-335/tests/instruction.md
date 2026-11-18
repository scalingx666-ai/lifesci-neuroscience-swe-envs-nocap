# Issue

**Title:** feat(ingest): meeting and voice-note branch, plus a transcript normaliser

## Description

Calls and voice notes hold most of what a company knows: what customers said, what was decided and why, who owes what. `wiki-ingest` only mentioned "meeting transcripts" in passing, and a raw transcript is mostly timing cues, filler and small talk.

**What changes**
- **`obsidian-wiki transcript FILE|-`** (read-only, offline): reads WebVTT (`<v Name>` voices), SRT, `Speaker: text` lines with or without `[hh:mm:ss]` stamps, bold-name markdown exports with a `## Transcript` section, Otter's name-and-time headers, and unlabelled dictation. It produces one record: title, date, speakers ordered by words spoken, duration, word count, a stable `meeting_id` (taken from frontmatter, else a content hash), and turns. The default output is condensed markdown with same-speaker turns merged and filler (`um`, `uh`, `you know`, a filler `like,`) removed. `--json` and `--keep-fillers` are available.
  - A one-off unbolded `Label:` that never recurs is treated as text, so dictated "Idea: ..." lines aren't mistaken for speakers.
  - Recorder-MCP envelope lines (`<<<...>>>`) and `(...truncated...)` pagination markers are dropped.
- **`skills/wiki-ingest/references/meeting-sources.md`**, a new branch linked from `wiki-ingest` the same way URL sources are:
  - Fetch only what was asked for (Wispr Flow MCP, Granola, recorder exports) into `_raw/meetings/`, and dedup on `meeting:<provider>/<id>`.
  - Distil from the condensed output. Extract five things only: decisions, commitments, what customers said (attributed quotes), company numbers, and open questions. Relative dates resolve against the meeting date, and identities are never guessed.
  - Write one meeting page under `journal/meetings/`, then spread the substance to entity, project and playbook pages (supersession, not deletion).
  - The owner's own commitments go to `memory todo add`. Customer content is tagged `visibility/internal`, and personal details get `visibility/pii` or are left out.
  - Company numbers become **candidate** facts, printed as `facts add` commands for the owner to approve. Nothing is added automatically. This pairs with #333 and is skipped when `facts` isn't installed.
  - A voice note with no speakers is treated as the owner's own draft and distilled by topic.
- Routing row in `AGENTS.md`, plus `docs/skills.md` and `docs/cli.md`.

**Tests**
- `tests/test_transcript.py`: 16 tests covering every input shape, merging, continuation lines, parenthesised speaker labels, dictation false positives, BOM/CRLF, meeting_id stability, filler stripping (including "I like it" being left alone), the condensed rendering, the CLI, and the fetch-tool envelope.
- `tests/test_meeting_ingest_docs.py`: the skill links the reference, and the reference uses the CLI, the pseudo-key, `ingest-guard`, `memory todo`, the trust boundary and the no-auto-approve rule.
- I also checked the parser by hand against a real Wispr Flow `get_meeting` transcript. That's what surfaced the envelope/truncation bug fixed here. No real data is in the repo; the test uses a synthetic transcript of the same shape.
- I confirmed `cache-update --key meeting:wispr/<id>` stores the pseudo-key for a file inside the vault.
- Full suite: 1341 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.