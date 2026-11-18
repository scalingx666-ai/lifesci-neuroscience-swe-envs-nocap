# Issue

**Title:** fix(hooks): harden the read-only classifier; re-arm the nudge for long sessions

## Description

, two commits:

1. **19 read-only-classifier escapes closed** — this commit was pushed to the #158 branch about an hour after the merge, so it missed the train.
2. **Re-arm for long-running sessions** — fixes the starvation the once-per-session sentinel introduced.

## Commit 1 — classifier escapes

An adversarial review pass hunted for commands and tool calls the read-only classifier would misclassify as safe, and found 19 concrete escapes. All are closed, each pinned by a transcript-level test.

**Tool-call layer**
- **Task/Agent are no longer blanket-neutral** — a spawned subagent can edit files or call write APIs. The classifier now reads `subagent_type`: only read-only agent types (Explore, Plan) keep the exemption.
- **EnterWorktree/ExitWorktree** removed from the neutral set (they create/remove branches and worktrees).
- **Read-verb SQL tools scan their payload**: `EXPLAIN ANALYZE` executes the statement, so DML keywords or `"analyze": true` in the input disable the exemption; plain `SELECT` explains stay neutral.
- Verb lists: `prepare` moved to write verbs (`prepare_query_tuning` provisions a branch); `resolve` dropped from read verbs (resolving a review thread mutates it).

**Quote scanner**
- Double-quote escaping now uses **backslash parity**: `"a\\"` closes the quote (the backslashes escape each other), so a command hidden after `;` is seen. Previously any backslash before the quote kept the scanner in-quote and swallowed the rest of the command.

**Command classifiers**
- **python -c**: `.execute()/.executemany()`, `Path.open('w')`, aliased os imports (`import os as x`, `from os import …`); matching is now case-insensitive so lowercase `delete from` in a sqlite call is caught.
- **curl**: `--config`/`-K` (a config file can carry any request), `-Q`/`--quote` (FTP protocol commands like `DELE`), with Q/K detected inside short-flag clusters.
- **git**: `--upload-pack`/`--receive-pack`/`--exec` inject remotely-executed commands even under read-only subcommands (`git ls-remote --upload-pack='…'`).
- **date**: a positional operand sets the clock on BSD/macOS (`sudo date 010100002025`); `+format`, `-u`, `-j` forms stay read-only.
- **awk**: redirects/pipes to *variables* (`print > f`, `print | c`), `close()`, `getline` — numeric comparisons (`$3 > 100`) stay clean.
- **sed**: the `w` script command is caught with any substitution delimiter (`s#a#b#w out`), not just `/`.
- **xxd/uniq**: a bare `-` stdin marker now counts as a positional, so the *output file* argument is no longer missed (`xxd -r -p - out.bin`).
- **less/more**: `-o`/`-O`/`--log-file` copy input into a file.

## Commit 2 — re-arm for long sessions

"Once per session" starves multi-day sessions: the single nudge fires early (usually after the first few edits), and all later work is never captured automatically.

The sentinel now **expires** when BOTH hold:

- it is older than `WIKI_STOP_REARM_SECONDS` (default **6h**), and
- at least `WIKI_STOP_REARM_EDITS` (default **10**) new file edits happened since the nudge that claimed it.

| Session shape | Behavior |
|---|---|
| Short session | one nudge, exactly as before |
| Long, busy session | roughly one nudge per work stretch |
| Long, idle session | one nudge, then silence |

Mechanics: the edit count at nudge time is stored inside the sentinel directory; the young-sentinel path stays the cheap pre-parse short-circuit; an expired sentinel is retired with an atomic `mv`, so duplicate hook registrations still produce exactly one re-nudge. Sentinels predating the feature have no stored count and re-arm from zero. Both thresholds are env-overridable.

## Tests

Suite grows to **73** (20 for the classifier escapes, 6 for re-arm — age gate, delta gate, count storage and reset, pre-feature sentinels, env knobs). All passing; hook stays bash-3.2 compatible.

Design rule unchanged: every classifier fix errs toward *mutating* — unknown or ambiguous means the nudge fires.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb6488ce8430`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.