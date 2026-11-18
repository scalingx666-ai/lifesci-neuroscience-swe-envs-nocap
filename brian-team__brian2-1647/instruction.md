# Issue

**Title:** Bump docker/setup-buildx-action from 3.10.0 to 3.11.1

## Description

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 3.10.0 to 3.11.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v3.11.1</h2>
<ul>
<li>Fix <code>keep-state</code> not being respected by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#429</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.11.0...v3.11.1">https://github.com/docker/setup-buildx-action/compare/v3.11.0...v3.11.1</a></p>
<h2>v3.11.0</h2>
<ul>
<li>Keep BuildKit state support by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#427</a></li>
<li>Remove aliases created when installing by default by <a href="https://github.com/hashhar"><code>@​hashhar</code></a> in <a href="">docker/setup-buildx-action#139</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.56.0 to 0.62.1 in <a href="">docker/setup-buildx-action#422</a> <a href="">docker/setup-buildx-action#425</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.10.0...v3.11.0">https://github.com/docker/setup-buildx-action/compare/v3.10.0...v3.11.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e468171</code></a> Merge pull request <a href="">#429</a> from crazy-max/fix-keep-state</li>
<li><a href=""><code>a3e7502</code></a> chore: update generated content</li>
<li><a href=""><code>b145473</code></a> fix keep-state not being respected</li>
<li><a href=""><code>18ce135</code></a> Merge pull request <a href="">#425</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>0e198e9</code></a> chore: update generated content</li>
<li><a href=""><code>05f3f3a</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.61.0 to 0.62.1</li>
<li><a href=""><code>6229134</code></a> Merge pull request <a href="">#427</a> from crazy-max/keep-state</li>
<li><a href=""><code>c6f6a07</code></a> chore: update generated content</li>
<li><a href=""><code>6c5e29d</code></a> skip builder creation if one already exists with the same name</li>
<li><a href=""><code>548b297</code></a> ci: keep-state check</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/b5ca514318bd6ebac0fb2aedd5d36ec1b5c232a2...e468171a9de216ec08956ac3ada2f0791b6bd435">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=3.10.0&new-version=3.11.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a39ec68018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.