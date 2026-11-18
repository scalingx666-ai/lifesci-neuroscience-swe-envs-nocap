# Issue

**Title:** feat(eval): answer-level evals that compare model runs

## Description

`obsidian-wiki eval` scores **retrieval**: did the index return the right pages. That number doesn't change when a new model comes out, but the answer does. This adds the missing half: keep a set of real questions with the right answer, put them to each new model, and switch to whichever wins.

**What changes**
- **`obsidian-wiki eval-answers`** (offline and deterministic).
  - The gold set lives in `_meta/answers.jsonl` (or `--gold`): `{"q", "must_include", "must_not_include", "cite"}`. Include items can be alternatives (`["2026-03-31", "march 2026"]`) or `re:` patterns. `cite` needs a wikilink or Markdown link to the page; a bare word in the prose doesn't count.
  - Matching ignores case, emphasis and whitespace. Questions match answers ignoring punctuation.
  - Pass one or more runs with `--answers [MODEL=]FILE` (JSONL `{q, answer, model}`). It reports `pass_rate`, `include_recall`, `violation_rate` and `citation_recall` per model, ranks the runs, and names the winner. `--verbose` says why each case failed. `--min-pass` gates CI on the best run, and a missing answer counts as a failure.
  - `--questions` prints the gold questions for a runner.
- `tests/fixtures/bench/answers.jsonl`: a six-case example against the bundled bench vault, including a stale-claim trap (`must_not_include` "we run nginx").
- `docs/cli.md`: an *Answer evals* section with a runner loop. The loop uses `< /dev/null` so the agent doesn't read the remaining questions off stdin; I hit that while testing the loop.

Running the models is deliberately out of scope. The command only scores, so it costs nothing and gives the same result every time.

**Tests**
- `tests/test_answer_eval.py`: 17 tests covering the bundled gold set, a perfect run, explained failures (missing, forbidden, uncited, unanswered), normalisation, bare words not counting as citations, loose question matching, ranking and gating, seven gold-validation errors, answers validation, and the CLI (compare, verbose reasons, JSON gate, `--questions`, errors).
- I ran the documented loop end to end with a stub in place of the agent. All six questions were answered and scored.
- Full suite: 1339 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.