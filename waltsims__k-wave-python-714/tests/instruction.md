# Issue

**Title:** Pin sphinx<9 in docs extras to fix Read the Docs build

## Description

## Why

Read the Docs builds started failing because `sphinx-toolbox==3.8.0` imports an internal Sphinx symbol that Sphinx 9.0 removed:

\`\`\`
ImportError: cannot import name 'logger' from 'sphinx.ext.autodoc'
sphinx.errors.ExtensionError: Could not import extension sphinx_toolbox.code
\`\`\`

RTD's pip install pulls the latest Sphinx (currently 9.0.4) since none of the docs extras pin it.

## What

One-line fix: add \`"sphinx<9"\` to the \`docs\` extras in \`pyproject.toml\`. RTD ignores \`uv.lock\` (uses pip), so no lockfile change is needed for the fix.

## Why not upgrade sphinx-toolbox

\`sphinx-toolbox==4.1.2\` supports Sphinx 9 but requires \`sphinx-tabs<3.4.7\`, which would also force a downgrade of the existing \`sphinx-tabs==3.4.7\` pin. That's a bigger change; deferring to a follow-up if a Sphinx 9 upgrade is desired.

## Test plan

- [ ] CI green
- [ ] RTD build succeeds on this branch (will be visible in the docs/readthedocs.org check)

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

This PR adds `"sphinx<9"` to the `docs` optional dependencies in `pyproject.toml` to fix Read the Docs build failures caused by `sphinx-toolbox==3.8.0` importing an internal Sphinx symbol removed in Sphinx 9.0. The fix is minimal and targeted, preserving the existing pinned `sphinx-toolbox` version rather than attempting a larger upgrade chain.

<h3>Confidence Score: 5/5</h3>

Safe to merge — one-line targeted fix with no logic changes and clear justification.

The change is a single dependency upper-bound addition that directly addresses the documented RTD build failure. No code logic is touched, the constraint is correct (`sphinx<9` keeps `sphinx-toolbox==3.8.0` compatible), and the PR description thoroughly explains why a broader upgrade was deferred.

No files require special attention.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| pyproject.toml | Adds `sphinx<9` upper-bound constraint to docs extras, preventing Sphinx 9.x from being pulled in and breaking sphinx-toolbox 3.8.0 on RTD. |

</details>

</details>

<sub>Reviews (1): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=30636387)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6097ca99dca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.