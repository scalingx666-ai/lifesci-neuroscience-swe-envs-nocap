# Issue

**Title:** feat(hooks): opt-in per-prompt recall that stays silent unless a note clearly matches

## Description

## Problem
The SessionStart recap injects memory once per session. Once a session is under way, nothing brings in the vault note that's relevant to the prompt you just typed unless the agent thinks to run `wiki-query`.

## Change
- New `obsidian-wiki recall [prompt]`: prints up to 4 `[[link]] — summary` lines (900-character cap), or **nothing**. A note counts only on whole-word hits in its title, aliases, tags, or summary (never the body), from at least two distinct prompt words, with a minimum score. `--hook` reads a Claude Code UserPromptSubmit payload from stdin.
- New hook `wiki-prompt-recall.sh` (UserPromptSubmit). Like the recap hook, it exits 0 silently on every failure, has a 5s timeout (`WIKI_RECALL_TIMEOUT`), and can be turned off with `WIKI_PROMPT_RECALL=false`. Its output is labelled as notes, not instructions.
- **Opt-in.** A plain `hooks install` and `setup` never add it. You register it with `hooks install --only UserPromptSubmit`. `hooks status` shows it as "NOT registered (opt-in)" without exiting 1, and `doctor` doesn't flag it.
- The script is packaged in the wheel and sdist. `docs/cli.md`, `docs/memory.md`, and `docs/configuration.md` are updated.

Idea adapted from obsidian-second-brain's bounded recall hook (abstaining beats noise), minus its per-decision audit log.

## Tests
- New `tests/test_prompt_recall.py`: a clear match returns a linked summary; generic prompts and single-word overlaps abstain; the note and character caps hold; `--hook` reads the payload and ignores malformed JSON; the hook script injects on a match and stays silent on a miss and when disabled.
- `tests/test_hooks.py`: default install leaves the opt-in hook out, `--only UserPromptSubmit` adds it, uninstall removes all three, status no longer fails because of it.
- Full suite: 1210 passed, 5 skipped.
- Manual: registered in a scratch HOME and run against a real 187-page vault. A packaging prompt returned 4 relevant notes in about 0.2s. "rename this variable" injected nothing. Built wheel contains `_data/hooks/wiki-prompt-recall.sh`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc30fecf5432`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.