# Issue

**Title:** NF: Add JSON Lines support to addurls

## Description

## Overview

This PR adds support for JSON Lines (JSONL) format to the `addurls` command. JSON Lines is a format where each line contains a single JSON object, commonly used when piping output from other commands. Users can now specify `--input-type jsonl` or use `.jsonl` file extensions to process this format directly without needing to transform it first.

## Changes

- **New input type**: Added `"jsonl"` to `INPUT_TYPES` list
- **JSONL parsing**: Implemented `jsonl` handling in `_read()` function that:
  - Reads one JSON object per line
  - Skips blank lines
  - Provides clear error messages with line numbers on parse failures
- **Auto-detection**: Extended `_read_from_file()` to automatically detect `.jsonl` files
- **Documentation**: Updated docstrings and examples to reflect JSONL support, including a practical example of piping JSON Lines directly to `addurls` instead of requiring `jq` transformation
- **Tests**: Added comprehensive test coverage for JSONL input including:
  - Parity test comparing JSONL output with CSV/TSV/JSON
  - Blank line handling
  - Error reporting with line numbers
  - stdin input support

## Fixes

## Test Plan

The PR includes automated tests covering:
- `test_extract_csv_json_equal`: Verifies JSONL produces identical output to other formats
- `test_addurls_invalid_input`: Confirms error handling with line number reporting
- `test_addurls_no_rows`: Tests empty JSONL files
- `test_addurls_stdin_input`: Validates piping JSONL from stdin

All existing tests continue to pass.

https://claude.ai/code/session_01PKkMNbYDF527fdiKRakTgT

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd8273d0b08a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.