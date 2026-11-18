# Issue

**Title:** CI: Bump docker/login-action from 3.6.0 to 3.7.0

## Description

Bumps [docker/login-action](https://github.com/docker/login-action) from 3.6.0 to 3.7.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v3.7.0</h2>
<ul>
<li>Add <code>scope</code> input to set scopes for the authentication token by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#912</a></li>
<li>Add support for AWS European Sovereign Cloud ECR by <a href="https://github.com/dphi"><code>@​dphi</code></a> in <a href="">docker/login-action#914</a></li>
<li>Ensure passwords are redacted with <code>registry-auth</code> input by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#911</a></li>
<li>build(deps): bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/login-action#915</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.6.0...v3.7.0">https://github.com/docker/login-action/compare/v3.6.0...v3.7.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c94ce9f</code></a> Merge pull request <a href="">#915</a> from docker/dependabot/npm_and_yarn/lodash-4.17.23</li>
<li><a href=""><code>8339c95</code></a> Merge pull request <a href="">#912</a> from docker/scope</li>
<li><a href=""><code>c83e932</code></a> build(deps): bump lodash from 4.17.21 to 4.17.23</li>
<li><a href=""><code>b268aa5</code></a> chore: update generated content</li>
<li><a href=""><code>a603229</code></a> documentation for scope input</li>
<li><a href=""><code>7567f92</code></a> Add scope input to set scopes for the authentication token</li>
<li><a href=""><code>0567fa5</code></a> Merge pull request <a href="">#914</a> from dphi/add-support-for-amazonaws.eu</li>
<li><a href=""><code>f6ef577</code></a> feat: add support for AWS European Sovereign Cloud ECR registries</li>
<li><a href=""><code>916386b</code></a> Merge pull request <a href="">#911</a> from crazy-max/ensure-redact</li>
<li><a href=""><code>5b3f94a</code></a> chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/5e57cd118135c172c3672efd75eb46360885c0ef...c94ce9fb468520275223c153574b00df6fe4bcc9">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=3.6.0&new-version=3.7.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `462d98dc3ae6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.