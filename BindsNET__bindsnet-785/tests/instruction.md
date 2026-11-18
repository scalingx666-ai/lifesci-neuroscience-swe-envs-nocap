# Issue

**Title:** chore: enable weekly Dependabot version updates

## Description

Only Dependabot **security** updates ran on this repository until now. That is why `poetry.lock` drifted far enough to accumulate 12 open alerts before anyone looked, six of them a single GitPython advisory that stayed unfixed because PR #779 failed to deliver the bump ().

This adds weekly version updates for two ecosystems:

| Ecosystem | Behaviour |
|---|---|
| `pip` | Minor and patch bumps arrive as **one grouped pull request**, so routine maintenance is a single review rather than twenty. Major bumps stay separate. |
| `github-actions` | Action versions are their own supply chain surface. A compromised or abandoned action runs with access to the workflow. |

`open-pull-requests-limit` is 5 per ecosystem.

### torch and torchvision are excluded from version updates

They are pinned to exact versions served from the custom CUDA wheel index declared in `pyproject.toml`, and the two have to move together. Routine bumps would either break that pairing or silently pull the plain PyPI build instead of the cu130 one, so they are upgraded by hand.

The exclusions are scoped to `version-update:semver-*` types only, which means **Dependabot security alerts for torch and torchvision still come through**. That matters: one of the 12 alerts just closed was a torch advisory.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f7cb6409514`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.