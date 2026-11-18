# Issue

**Title:** chore(deps): Bump actions/setup-node from 5 to 6 in the actions-infrastructure group

## Description

Bumps the actions-infrastructure group with 1 update: [actions/setup-node](https://github.com/actions/setup-node).

Updates `actions/setup-node` from 5 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-node/releases">actions/setup-node's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<p><strong>Breaking Changes</strong></p>
<ul>
<li>Limit automatic caching to npm, update workflows and documentation by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-node#1374</a></li>
</ul>
<p><strong>Dependency Upgrades</strong></p>
<ul>
<li>Upgrade ts-jest from 29.1.2 to 29.4.1 and document breaking changes in v5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1336</a></li>
<li>Upgrade prettier from 2.8.8 to 3.6.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1334</a></li>
<li>Upgrade actions/publish-action from 0.3.0 to 0.4.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1362</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-node/compare/v5...v6.0.0">https://github.com/actions/setup-node/compare/v5...v6.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2028fbc</code></a> Limit automatic caching to npm, update workflows and documentation (<a href="">#1374</a>)</li>
<li><a href=""><code>1342781</code></a> Bump actions/publish-action from 0.3.0 to 0.4.0 (<a href="">#1362</a>)</li>
<li><a href=""><code>89d709d</code></a> Bump prettier from 2.8.8 to 3.6.2 (<a href="">#1334</a>)</li>
<li><a href=""><code>cd2651c</code></a> Bump ts-jest from 29.1.2 to 29.4.1 (<a href="">#1336</a>)</li>
<li>See full diff in <a href="https://github.com/actions/setup-node/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/setup-node&package-manager=github_actions&previous-version=5&new-version=6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd8a95100a66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.