# Issue

**Title:** fix(runtime): inject task notifications into active agents

## Description

## Summary
- inject durable task notifications with Pi follow-up when the target Agent is already running, while retaining normal wake-up prompts for idle Agents
- wait for the owning run to settle before acknowledging injected notifications, preventing concurrent prompt errors and duplicate wake-ups
- strengthen English Auditor plugin verdict guidance and prevent PI from treating REVISE/BLOCK as completion
- discourage PI sleep/poll loops for Agent coordination without removing bash or sleep

## Scope
- no new audit tools
- no causal-audit changes
- no GoT changes
- PI Auditor guidance remains entirely in the Auditor plugin

## Verification
- root typecheck passed
- focused notification, task delegation, concurrent-send, persona, and plugin tests passed (42/42)
- full runtime suite passed after the repository postinstall patch (569/569 total; 566 non-patch tests plus all 4 Azure patch tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e8ec3c3a576`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.