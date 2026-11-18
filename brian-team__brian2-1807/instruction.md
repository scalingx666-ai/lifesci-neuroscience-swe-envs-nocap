# Issue

**Title:** Bump docker/setup-buildx-action from 3.12.0 to 4.0.0

## Description

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 3.12.0 to 4.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#483</a></li>
<li>Remove deprecated inputs/outputs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#464</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#481</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/setup-buildx-action#475</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.63.0 to 0.79.0 in <a href="">docker/setup-buildx-action#482</a> <a href="">docker/setup-buildx-action#485</a></li>
<li>Bump js-yaml from 4.1.0 to 4.1.1 in <a href="">docker/setup-buildx-action#452</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/setup-buildx-action#472</a></li>
<li>Bump minimatch from 3.1.2 to 3.1.5 in <a href="">docker/setup-buildx-action#480</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.12.0...v4.0.0">https://github.com/docker/setup-buildx-action/compare/v3.12.0...v4.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4d04d5d</code></a> Merge pull request <a href="">#485</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>cd74e05</code></a> chore: update generated content</li>
<li><a href=""><code>eee38ec</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.77.0 to 0.79.0</li>
<li><a href=""><code>7a83f65</code></a> Merge pull request <a href="">#484</a> from docker/dependabot/github_actions/docker/setup-qe...</li>
<li><a href=""><code>a5aa967</code></a> Merge pull request <a href="">#464</a> from crazy-max/rm-deprecated</li>
<li><a href=""><code>e73d53f</code></a> build(deps): bump docker/setup-qemu-action from 3 to 4</li>
<li><a href=""><code>28a438e</code></a> Merge pull request <a href="">#483</a> from crazy-max/node24</li>
<li><a href=""><code>034e9d3</code></a> chore: update generated content</li>
<li><a href=""><code>b4664d8</code></a> remove deprecated inputs/outputs</li>
<li><a href=""><code>a8257de</code></a> node 24 as default runtime</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/8d2750c68a42422c14e847fe6c8ac0403b4cbd6f...4d04d5d9486b7bd6fa91e7baf45bbb4f8b9deedd">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=3.12.0&new-version=4.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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