# Issue

**Title:** feat(skills): add vault-skill-factory — generate Agent Skills from mature wiki pages

## Description

Implements the proposal from issue #96 by @cnndabbler.

## What

A new `vault-skill-factory` skill that turns a cluster of mature, curated Obsidian wiki pages into a portable Agent Skill (`SKILL.md` + `references/`) — the inverse of `wiki-capture`.

## Changes

- **`.skills/vault-skill-factory/SKILL.md`** — new skill with hard guardrails (never writes to `.skills/`, never auto-installs), QMD-based cluster discovery, maturity filtering (respects `lifecycle: reviewed|verified` and `tier: core`), `references/sources.md` provenance trace, and `SKILL_FACTORY.md` manifest.
- **`.env.example`** — `SKILL_FACTORY_OUTPUT_DIR` and `SKILL_FACTORY_MATURITY` config keys, documented alongside the other optional sections.
- **`AGENTS.md`** — routing row for `/vault-skill-factory` and related phrasings.

The implementation follows the diff shared in the issue closely, with minor wording cleanup for consistency with existing skills in the repo.

## Guardrails preserved

- Generated skills land in `$OBSIDIAN_VAULT_PATH/_generated-skills/` (a vault-level excluded dir), never in `.skills/` or any global skill dir.
- Installation is an explicit, project-local-only human decision — the skill explicitly tells the agent not to do it.
- `^[inferred]`/`^[ambiguous]` markers are preserved through synthesis so no vault content is laundered into fact.

---

@cnndabbler — does this match what you had in mind? Happy to tweak anything before merging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8235e6fb99eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.