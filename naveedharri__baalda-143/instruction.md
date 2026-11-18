# Issue

**Title:** Log the Coolify deploy path in the changelog and fix its env example

## Description

## Why

, which added `deploy/coolify/` but landed without a `CHANGELOG.md` entry, and whose `.env.example` header named `SERVICE_PASSWORD_POSTGRES` while the compose file it documents uses `SERVICE_PASSWORD_64_POSTGRES` — the symbol-free variant, chosen deliberately because the bare one can emit `@ : /`, which are unsafe unescaped inside `DATABASE_URL`'s `postgres://` string.

Both are comment-level, so neither could break a deploy; the env example one would just send a self-hoster looking for the wrong variable in Coolify's UI.

## What changed

- `CHANGELOG.md` Unreleased → Added: the Coolify path, credited to @JotaSXBR, with the three Coolify-specific traps recorded so the next person to touch that file does not rediscover them.
- `deploy/coolify/.env.example`: the magic var name now matches `docker-compose.yml`.

## Scope

Docs and a comment. No compose/YAML values change, no application code. `docs/RELEASE_NOTES.md` is unchanged — a self-host deploy option is not an in-app user-visible change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ab3f55bf86a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.