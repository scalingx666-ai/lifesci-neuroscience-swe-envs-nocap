# Issue

**Title:** chore(release): v0.0.12

## Description

Release **v0.0.12** — bumps every workspace package `0.0.11 → 0.0.12` (via `npm run version:sync`).

### Features
- **files:** differentiate the three file tiers — attachments / workspace / data (#263)
- **runtime:** agent-accessible cross-session persistent root (#257, #259)
- **upload:** raw streaming upload + configurable size cap (#256, #258)
- **skills:** rework catalog — add science / network-neuro skills, drop NeuroClaw + EthoClaw (#260)
- **kb:** OCR provider abstraction, live-progress SSE, spawn-log secret hygiene (#251)
- **kb:** panel completeness probes, per-stage warnings, inventory card, mirror/token controls (#249)

### Fixes
- **runtime:** broaden auditor to open-ended scientific-reliability review (#270)
- **skill-router:** accept only comma-string keywords + array fallback (#260)
- **mcp:** raise per-call timeout to 5 min + reset on progress
- **web:** grow GoT trace "Next tasks" bubbles to fit wrapped titles (#268)
- **web:** return-home entry in sidebar for hosted subpath deploys (#250, #254)
- **web:** clear `hasPanned` on mouseup so trace-graph node clicks survive a pan (#253)

### Docs
- **web:** document disk-quota UI as a hosted trust-front hook (#262, #267)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e485f667253d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.