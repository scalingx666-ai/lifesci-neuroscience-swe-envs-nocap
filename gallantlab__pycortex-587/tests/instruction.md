# Issue

**Title:** MNT Automate version management with setuptools-scm and simplify release workflow

## Description

Eliminates manual version file editing and reduces release process from 5 steps to 1. Follows implementation pattern from gallantlab/autoflatten.

## Changes

**Version Management**
- Version numbers now automatically derived from git tags via setuptools-scm
- `cortex/version.py` imports from auto-generated `_version.py` with fallback for dev environments
- Removed manual version parsing logic from `setup.py`
- Development versions auto-increment as `X.Y.Z.devN` between releases

**Release Workflow**
- Replaced tag-based workflow with release event trigger
- Builds artifacts in isolated job, publishes to both PyPI and TestPyPI
- Uses trusted publishing (OIDC) instead of API tokens
- Added `workflow_dispatch` for manual TestPyPI testing
- `fetch-depth: 0` ensures setuptools-scm can access full git history

**Release Process** (see updated RELEASE.md)
```bash
# Before: Edit version.py, commit, tag, push, create release, revert version
# After: Create GitHub release with version tag (e.g., v1.3.0)
```

## Prerequisites for Deployment
Repository admins must configure PyPI/TestPyPI environments with trusted publishing before workflow can publish packages.

<!-- START COPILOT ORIGINAL PROMPT -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>Simplify release workflow</issue_title>
> <issue_description>The current release workflow requires too many steps.
> Follow what I implemented in https://github.com/gallantlab/autoflatten:
>
> 1. Use `setuptools-scm` to automatically derive version numbers from git tags
> 2. Set up a workflow to release to pypi and testpypi upon new github releases.
>
> </issue_description>
>
> <agent_instructions>Make sure to check how I implemented this in https://github.com/gallantlab/autoflatten. I will need to enable environments in pypi/testpypi. But you can assume that they will be available. </agent_instructions>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

<!-- START COPILOT CODING AGENT SUFFIX -->

- Fixes gallantlab/pycortex#586

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3a397ba0e4a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.