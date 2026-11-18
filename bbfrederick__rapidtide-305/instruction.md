# Issue

**Title:** Bump docker/login-action from 4.7.0 to 4.8.0

## Description

Bumps [docker/login-action](https://github.com/docker/login-action) from 4.7.0 to 4.8.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v4.8.0</h2>
<ul>
<li>Set Docker Hub OIDC token lifetime default to 1 hour by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1070</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> and <code>@​aws-sdk/client-ecr-public</code> to 3.1161.0 in <a href="">docker/login-action#1103</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.107.0 to 0.109.0 in <a href="">docker/login-action#1105</a></li>
<li>Bump vite from 7.3.6 to 7.3.7 in <a href="">docker/login-action#1101</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.7.0...v4.8.0">https://github.com/docker/login-action/compare/v4.7.0...v4.8.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8aa5831</code></a> Merge pull request <a href="">#1105</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>043f81d</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>3ff6998</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.107.0 to 0.109.0</li>
<li><a href=""><code>694ef6a</code></a> Merge pull request <a href="">#1103</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependen...</li>
<li><a href=""><code>7c6e412</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>aa2441f</code></a> build(deps): bump the aws-sdk-dependencies group across 1 directory with 2 up...</li>
<li><a href=""><code>d6c10b0</code></a> Merge pull request <a href="">#1106</a> from docker/dependabot/github_actions/codeql-actions...</li>
<li><a href=""><code>319f1ee</code></a> Merge pull request <a href="">#1104</a> from docker/dependabot/github_actions/actions/setup-...</li>
<li><a href=""><code>b483b7f</code></a> Merge pull request <a href="">#1101</a> from docker/dependabot/npm_and_yarn/vite-7.3.7</li>
<li><a href=""><code>dc7d67c</code></a> Merge pull request <a href="">#1070</a> from crazy-max/increase-oidc-default-expiry</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/v4.7.0...v4.8.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=4.7.0&new-version=4.8.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46f57f4f1e7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.