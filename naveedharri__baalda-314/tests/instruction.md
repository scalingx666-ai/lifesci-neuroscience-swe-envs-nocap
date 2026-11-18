# Issue

**Title:** Release 0.1.82 (silent)

## Description

Promotes staging to main and ships desktop 0.1.82 as a silent release.

## Legacy subscriptions read as a legacy plan

An active subscription without a seat count is now treated as a legacy plan.

- The server refuses seat changes and the seat preview for a legacy subscription with a plain message, and flags it on the account.
- Plan & Billing shows the real price with "unlimited people at your original price" and hides seat management.
- The Members tab says unlimited people.
- Every live legacy subscription on the account is summed into one plan line.
- The people table drops the Seat column for legacy and complimentary plans.

## Legacy move script

- Moves use immediate proration and reuse existing discounts.
- The result is verified exactly after each move.
- An account that already holds a Team subscription is refused.
- The script exits non-zero when anything is refused.

## Rollout

- Merge with a merge commit, then fast-forward staging to main.
- The server deploys with no new migrations. The migrations folder is identical to main.
- Desktop release 0.1.82 ships silently, with an empty release notes section.
- Nothing to flip.

## Tests

On 636eb55, both type checks are clean.

| Suite | Files | Tests |
|---|---|---|
| Desktop | 300 | 3335 |
| Server | 151 | 1424 |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7c26c42cc2d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.