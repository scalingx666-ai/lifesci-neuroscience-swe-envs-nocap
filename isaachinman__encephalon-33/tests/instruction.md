# Issue

**Title:** [MAR-2536] Replace the CLI parser

## Description

## Human summary

The CLI now uses Node's argument parser, handles `--` correctly, and is tested through the built and packed binary.

## Summary

- Replace the bespoke command parser with a thin `node:util` `parseArgs` layer for command-specific options.
- Preserve `--root` before or after commands while respecting `--` so hyphen-leading search queries remain positional text.
- Scope help/version output to global usage only, so `--help` and `--version` after `--` can be searched normally.
- Add stable validation for unknown options, duplicate singleton options, empty option values, flag values, and ambiguous option values.
- Expand help output to include supported limits, subject filters, gather options, repeated add options, and defaults.
- Run the CLI unit suite against `dist/cli.mjs` instead of source TypeScript.
- Extend the packed tarball check so the installed Node CLI exercises help, version, init, validate, add, prepare, hydrate, list, show, search, and gather.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f43f4412dfed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.