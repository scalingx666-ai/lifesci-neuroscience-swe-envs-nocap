# Issue

**Title:** fix(runtime): block skills-router when skill_search is off

## Description

## Summary

- When `skill_search` is disabled, agents could still discover and load long-tail skills under `bp_template/skills-router` via generic file tools (`read` / `find` / `ls` / etc.), bypassing the settings toggle.
- Strip router / `skill_search` teaching from personas (keep always-on Meta-Skills guidance).
- Register a Pi `tool_call` extension that hard-denies paths under the router skill directory; best-effort bash guard as defense-in-depth.
- Always-on skills under `bp_template/skills` remain readable; disk materialization is unchanged (human-editable, re-enable works).
- Clarify Settings copy (zh/en): off means inaccessible including file tools; applies to new sessions.

## Test plan

- [x] `vitest` for `router-skill-access`, `router-skill-guard`, `domain-resources`, `two-skill-paths`, `tool-access`, `tool-toggles-hot`, `personas`
- [x] Toggle off `skill_search` in Settings → open a **new** session → confirm no `skill_search` tool and no Router skill library prompt text
- [ ] In that session, attempt `read` of a path under `bp_template/skills-router/**/SKILL.md` → blocked with clear reason
- [ ] `read` of always-on Meta-Skill under `bp_template/skills/**` still works
- [ ] Principal and expert (e.g. librarian) both enforce the block
- [ ] Re-enable `skill_search` → new session regains tool + router prompt + no path block

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41d5b3914610`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.