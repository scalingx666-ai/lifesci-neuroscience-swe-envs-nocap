# Issue

**Title:** Bump docker/login-action from 3.7.0 to 4.0.0

## Description

Bumps [docker/login-action](https://github.com/docker/login-action) from 3.7.0 to 4.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#929</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#927</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/login-action#919</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> from 3.890.0 to 3.1000.0 in <a href="">docker/login-action#909</a> <a href="">docker/login-action#920</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> from 3.890.0 to 3.1000.0 in <a href="">docker/login-action#909</a> <a href="">docker/login-action#920</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.63.0 to 0.77.0 in <a href="">docker/login-action#910</a> <a href="">docker/login-action#928</a></li>
<li>Bump <code>@​isaacs/brace-expansion</code> from 5.0.0 to 5.0.1 in <a href="">docker/login-action#921</a></li>
<li>Bump js-yaml from 4.1.0 to 4.1.1 in <a href="">docker/login-action#901</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.7.0...v4.0.0">https://github.com/docker/login-action/compare/v3.7.0...v4.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b45d80f</code></a> Merge pull request <a href="">#929</a> from crazy-max/node24</li>
<li><a href=""><code>176cb9c</code></a> node 24 as default runtime</li>
<li><a href=""><code>cad8984</code></a> Merge pull request <a href="">#920</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependenc...</li>
<li><a href=""><code>92cbcb2</code></a> chore: update generated content</li>
<li><a href=""><code>5a2d6a7</code></a> build(deps): bump the aws-sdk-dependencies group with 2 updates</li>
<li><a href=""><code>44512b6</code></a> Merge pull request <a href="">#928</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>28737a5</code></a> chore: update generated content</li>
<li><a href=""><code>dac0793</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.76.0 to 0.77.0</li>
<li><a href=""><code>62029f3</code></a> Merge pull request <a href="">#919</a> from docker/dependabot/npm_and_yarn/actions/core-3.0.0</li>
<li><a href=""><code>08c8f06</code></a> chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/c94ce9fb468520275223c153574b00df6fe4bcc9...b45d80f862d83dbcd57f89517bcf500b2ab88fb2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=3.7.0&new-version=4.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5eccc280cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.