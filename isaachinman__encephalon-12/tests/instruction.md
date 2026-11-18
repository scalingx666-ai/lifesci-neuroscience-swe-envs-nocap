# Issue

**Title:** [MAR-2515] Store package scripts as argv data

## Description

## Human summary

Stops generated baseline records from storing package scripts as shell-like command strings and records portable argv data instead.

## Summary

This PR fixes MAR-2515 by changing generated package-script baseline data:

- replaces the workflow baseline `commands` string array with structured `scriptInvocations`
- stores each invocation as `{ executable, arguments, scriptKey }` argv data rather than a shell program string
- preserves original safe script names in `scriptKeys`
- skips invocation generation for leading-hyphen script keys while keeping them discoverable in `scriptKeys`
- uses `npm run-script <script>` argv semantics for npm
- uses explicit `run <script>` argv semantics for Yarn and the other supported package managers
- updates the implementation plan so baseline script data is documented as structured argv data, not shell commands
- adds regression coverage for spaces, semicolons, quotes, dollar syntax, backticks, control characters, leading hyphens, slashes, colons, Unicode, ordinary npm keys, and Yarn semantics

Local verification passed:

- `bun run lint`
- `bun run typecheck`
- `bun run test`
- `bun run build`
- `bun run check:package`
- `node dist/cli.mjs validate`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `548ac7041992`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.