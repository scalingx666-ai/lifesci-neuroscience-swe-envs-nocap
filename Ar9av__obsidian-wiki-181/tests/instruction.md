# Issue

**Title:** docs(env): promoted _raw/ files are archived, not deleted

## Description

## What

`.env.example`'s `OBSIDIAN_RAW_DIR` comment still says:

```
# Promoted files are deleted from _raw/ after processing.
```

That is the pre-#113 behaviour. Three skills now document the opposite:

- `.skills/wiki-ingest/SKILL.md` — "After promoting a file to a proper wiki page, **move the original
  into `_raw/_archived/`** ... instead of deleting it."
- `.skills/wiki-status/SKILL.md` — "excluding the `_archived/` subdirectory (already-promoted drafts
  kept for provenance, not pending work)".
- `.skills/llm-wiki/SKILL.md` — "`wiki-ingest` still moves rather than deletes them on promotion."

`.env.example` is usually the first file someone opens to configure the tool, so it is the worst
place to still promise that a quick-capture draft gets destroyed — which is the outcome #113 was
filed about.

## How

One comment line. Docs only, no behaviour change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5cab5c16c4e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.