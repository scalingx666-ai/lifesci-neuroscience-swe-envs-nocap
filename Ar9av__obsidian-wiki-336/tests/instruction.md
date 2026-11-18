# Issue

**Title:** feat(playbooks): weekly playbook review, staged for approval

## Description

Playbooks (the vault's `skills/` how-to pages) go stale quietly. The meeting that shows step 2 of the sales call no longer lands, or the postmortem that finds a missing check in the runbook, gets filed somewhere else, and the playbook never hears about it. This adds the weekly loop: rewrite the playbooks from the week's results, then a human approves the diff.

**What changes**
- **`obsidian-wiki playbooks [--since 7d|2w|YYYY-MM-DD] [--playbook NAME]`** (read-only). A playbook is any page under a `skills/` folder (top level or inside a project), or any page tagged `playbook` or `runbook`. Playbooks are ranked by the pages changed in the window that connect to them:
  - evidence links to the playbook: 3
  - the playbook links to the evidence: 2
  - a log line in the window names it: 2
  - each shared domain tag: 1

  A page needs a score of 2 to count, so one shared tag isn't evidence. System and generic tags don't count, links in code are ignored, and both wikilinks and Markdown `.md` links count. The window uses the vault's timezone. Each evidence page comes with its reasons.
- **New skill `wiki-playbook-review`**:
  - Takes the top playbooks, reads the evidence, and sorts each observation into *worked*, *failed*, *new case* or *stop doing*. Every observation cites its page. A step is only rewritten on explicit or recurring evidence; one data point becomes an `^[inferred]` note.
  - Drafts the full revised page while keeping its structure, and maintains a dated `## Stop doing` list and a `## Changelog`. Retired steps are moved, not deleted.
  - Writes **only** to `_staging/<same path>`. It refuses to stack a second revision on one that's still unapproved, and logs `PLAYBOOK_REVIEW`. It's meant to run every Friday on a scheduler; a scheduled run still only stages.
- **`wiki-stage-commit`**: if `WIKI_STAGED_WRITES` is off but `_staging/` has files in it, it now reviews them instead of stopping. Playbook revisions are always staged, whatever the setting.
- Mirror symlinks for the new skill in all six agent dirs, the routing row in `AGENTS.md`, `docs/skills.md`, and a new *Playbook evidence* section in `docs/cli.md`.

**Tests**
- `tests/test_playbooks.py`: 13 tests covering playbook detection (folder, project folder, tag), each scoring rule and the reasons, the single-tag and system-tag exclusions, code-span links ignored, Markdown links counted, log mentions inside and outside the window, window cut-off, `--playbook` filtering and errors, ranking, `--since` parsing, and the CLI.
- `tests/test_playbook_review_docs.py`: the skill only stages, calls the CLI, and hands off to stage-commit. Stage-commit accepts staged files without the flag, and the skill is routed and documented.
- Manual end to end: a revision staged at `_staging/skills/x.md` lists as `kind: update` and promotes byte-for-byte with the flag unset.
- Full suite: 1339 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.