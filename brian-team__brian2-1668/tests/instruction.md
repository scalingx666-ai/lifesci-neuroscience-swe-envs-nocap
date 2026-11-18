# Issue

**Title:** chore(deps): bump docker/login-action from 3.4.0 to 3.5.0

## Description

Bumps [docker/login-action](https://github.com/docker/login-action) from 3.4.0 to 3.5.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v3.5.0</h2>
<ul>
<li>Support dual-stack endpoints for AWS ECR by <a href="https://github.com/Spacefish"><code>@​Spacefish</code></a> <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#874</a> <a href="">docker/login-action#876</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> to 3.859.0 in <a href="">docker/login-action#860</a> <a href="">docker/login-action#878</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> to 3.859.0 in <a href="">docker/login-action#860</a> <a href="">docker/login-action#878</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.57.0 to 0.62.1 in <a href="">docker/login-action#870</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/login-action#875</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.4.0...v3.5.0">https://github.com/docker/login-action/compare/v3.4.0...v3.5.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>184bdaa</code></a> Merge pull request <a href="">#878</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependenc...</li>
<li><a href=""><code>5c6bc94</code></a> chore: update generated content</li>
<li><a href=""><code>caf4058</code></a> build(deps): bump the aws-sdk-dependencies group with 2 updates</li>
<li><a href=""><code>ef38ec3</code></a> Merge pull request <a href="">#860</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependenc...</li>
<li><a href=""><code>d52e8ef</code></a> chore: update generated content</li>
<li><a href=""><code>9644ab7</code></a> build(deps): bump the aws-sdk-dependencies group with 2 updates</li>
<li><a href=""><code>7abd1d5</code></a> Merge pull request <a href="">#875</a> from docker/dependabot/npm_and_yarn/form-data-2.5.5</li>
<li><a href=""><code>1a81202</code></a> Merge pull request <a href="">#876</a> from crazy-max/aws-public-dual-stack</li>
<li><a href=""><code>d1ab30d</code></a> chore: update generated content</li>
<li><a href=""><code>f25ff28</code></a> support dual-stack for aws public ecr</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/74a5d142397b4f367a81961eba4e8cd7edddf772...184bdaa0721073962dff0199f1fb9940f07167d1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=3.4.0&new-version=3.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca83f0b7794`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.