# Issue

**Title:** fix(runtime): avoid duplicate replies for literal-output prompts

## Description

## Root cause
The duplicate was two real provider completions, not a rendering/reducer duplicate. A literal smoke-test response containing `model test` falsely matched the host's substantive scientific-execution classifier, armed the Principal delegation reminder, and caused a second provider call with a distinct message ID.

## What changed
- exempt explicit literal-output requests such as `Reply exactly ...`, `respond only with the phrase ...`, and `只回复一句：...` from the delegation guard
- recognize punctuation-free Safari input (`Reply exactly Safari...`)
- retain the guard for real scientific work; `Reply only after you test this dataset for distribution shift` remains substantive
- add English/Chinese positive and negative regression cases

No Chat or Live Demo content-equality dedupe was added, so legitimate distinct messages with identical text are preserved.

## Verification
- Runtime build passed
- Runtime suite: 64 files, 646 tests passed
- deployed to the 208 Preview with fresh state
- real `deepseek-v4-pro` cloud replay of the exact punctuation-free prompt:
  - 1 assistant `TEXT_MESSAGE_START`
  - 1 matching `TEXT_MESSAGE_END`
  - 1 assistant message ID / one exact response
  - 0 workflow violations
  - 21 total events (failing build produced 34 events and two message IDs)

## Preview note
The cloud image contains the exact product commits in this PR plus a test-only Python package mirror build commit already reviewed in #499; that build-only commit is not part of this PR.

Safari Chat → reload → Live Demo UI verification is pending because the test Mac locked again. Keeping this PR Draft until that final UI pass is appended.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95d74d0b493f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.