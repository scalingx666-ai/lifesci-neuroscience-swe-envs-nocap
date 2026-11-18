# Issue

**Title:** Add QMD CLI transport support

## Description

## Summary
- add `QMD_TRANSPORT`, `QMD_CLI_SEARCH_MODE`, and `QMD_CLI` config options
- document MCP vs CLI QMD usage in `.env.example`, README, and setup guidance
- teach `wiki-ingest` and `wiki-query` how to use the local `qmd` CLI when MCP is unavailable
- make `wiki-query` load QMD settings from the resolved config and prefer QMD before grep when configured
- document keeping operator-like terms in `lex:` and using natural language for `vec:` queries

## Why CLI mode
- lower agent token usage: the agent can call `qmd` directly and consume compact ranked results instead of loading broader wiki content first
- simpler setup for agents without MCP support: no MCP server wiring is required when `qmd` is already installed locally
- fewer runtime dependencies: CLI mode relies on the existing `qmd` binary and configured collections rather than an agent-specific MCP integration

## Test
- ran a local `qmd query` smoke test from outside the vault using `QMD_TRANSPORT=cli`-style settings
- verified the lex+vec query returned ranked wiki files before any page-body grep was needed
- confirmed a hyphenated `vec:` term can be parsed as negation and that rewriting the vector query in plain language succeeds

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4297874178aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.