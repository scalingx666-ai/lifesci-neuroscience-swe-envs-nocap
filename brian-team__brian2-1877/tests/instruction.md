# Issue

**Title:** Bump docker/setup-buildx-action from 4.3.0 to 4.4.1

## Description

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 4.3.0 to 4.4.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v4.4.1</h2>
<ul>
<li>Skip BuildKit image pre-pulls for explicit endpoints by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#624</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v4.4.0...v4.4.1">https://github.com/docker/setup-buildx-action/compare/v4.4.0...v4.4.1</a></p>
<h2>v4.4.0</h2>
<ul>
<li>Use official Buildx releases for cloud driver by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#606</a></li>
<li>Pull BuildKit image before builder creation by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#609</a></li>
<li>Use shared error helpers for Buildx and Docker commands by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#620</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.95.0 to 0.100.0 in <a href="">docker/setup-buildx-action#610</a> <a href="">docker/setup-buildx-action#618</a> <a href="">docker/setup-buildx-action#619</a></li>
<li>Bump <code>@​humanfs/node</code> from 0.16.7 to 0.16.8 in <a href="">docker/setup-buildx-action#614</a></li>
<li>Bump js-yaml from 5.3.0 to 5.4.2 in <a href="">docker/setup-buildx-action#608</a> <a href="">docker/setup-buildx-action#617</a></li>
<li>Bump postcss-selector-parser from 7.1.1 to 7.1.5 in <a href="">docker/setup-buildx-action#611</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v4.3.0...v4.4.0">https://github.com/docker/setup-buildx-action/compare/v4.3.0...v4.4.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f87e599</code></a> Merge pull request <a href="">#624</a> from crazy-max/skip-pull-with-endpoint</li>
<li><a href=""><code>e700274</code></a> chore: update generated content</li>
<li><a href=""><code>3061c91</code></a> skip BuildKit image pre-pulls for explicit endpoints</li>
<li><a href=""><code>594f3bf</code></a> Merge pull request <a href="">#609</a> from crazy-max/pull-buildkit-image-before-create</li>
<li><a href=""><code>bd6e702</code></a> chore: update generated content</li>
<li><a href=""><code>6268c9d</code></a> pull BuildKit image before builder creation</li>
<li><a href=""><code>e823525</code></a> Merge pull request <a href="">#621</a> from docker/dependabot/github_actions/codeql-actions-...</li>
<li><a href=""><code>533ed8e</code></a> build(deps): bump the codeql-actions group with 2 updates</li>
<li><a href=""><code>bedaf13</code></a> Merge pull request <a href="">#620</a> from crazy-max/shared-error-helpers</li>
<li><a href=""><code>d5079fb</code></a> chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/37fe631027851001ddb9b187196cc803df7f5f0e...f87e5991a6d7451dcb8d9637bfbc97413f497069">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=4.3.0&new-version=4.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecd72a361f54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.