# Issue

**Title:** Add resumable checkpoints, parallel translation, and verification to translate_book.py

## Description

### Motivation
- Make long translation runs robust to interruptions by adding per-file resume checkpoints and avoid re-translating work already completed.
- Improve observability of translations with chunk-level progress, ETA, rate, and counts for resumed/fallback chunks to monitor long jobs.
- Ensure coverage by detecting likely-untranslated paragraphs and reporting verification summaries per file.

### Description
- Refactored `scripts/translate_book.py` to store per-file JSON checkpoints with a `source_hash` and per-chunk cache so runs can resume; added helper functions `file_checkpoint_path`, `load_checkpoint`, and `save_checkpoint` and a `--checkpoint-dir` CLI option.
- Added parallel translation support with `--workers` using `ThreadPoolExecutor` and retained a sequential path (`workers <= 1`) that uses per-chunk timeout/retry logic (alarm-based) to be robust in single-threaded environments.
- Implemented chunking/resume logic and chunk translation workers, and added `translate_chunk`, a translated-map rebuild step, and checkpoint updates so each chunk is resumable and has metadata (hash, success, attempts, error).
- Added paragraph-level verification helpers `paragraph_blocks`, `looks_untranslated`, and `verify_translation` to count likely-untranslated paragraphs and print a verification summary after each file.
- Enhanced progress output via `--log-every-chunk` to print percentage complete, rate, ETA, and counts for ok/fallback/resumed chunks, and added per-file chunk summaries at the end.
- Exposed CLI options for `--workers`, `--checkpoint-dir`, `--chunk-timeout-seconds`, and kept `--log-every-chunk` to support monitoring; consolidated function signatures to accept `source_lang`/`target_lang` and checkpoint state.

### Testing
- Ran `python3 -m py_compile scripts/translate_book.py` to validate syntax and the check passed successfully.
- Checked CLI help with `python3 scripts/translate_book.py --help` and it printed usage (succeeded).
- Performed a sample translation run with `python3 scripts/translate_book.py --source-lang en --target-lang vi --files index.qmd --workers 1 --chunk-size 500 --log-every-chunk` which completed and printed verification and chunk summary (succeeded).
- Exercised both parallel and sequential modes (`--workers 4` / `--workers 1`) during longer runs and observed checkpoint files created and resumed-chunk behavior; the runs produced chunk/verification reports (succeeded).

------
[Codex Task](https://chatgpt.com/codex/tasks/task_e_699bcfdca2008320aeee9e993b9bba4f)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bde3c92c39a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.