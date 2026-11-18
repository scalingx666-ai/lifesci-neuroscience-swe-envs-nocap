# Issue

**Title:** Bump docker/setup-buildx-action from 3.11.1 to 3.12.0

## Description

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 3.11.1 to 3.12.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v3.12.0</h2>
<ul>
<li>Deprecate <code>install</code> input by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#455</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.62.1 to 0.63.0 in <a href="">docker/setup-buildx-action#434</a></li>
<li>Bump brace-expansion from 1.1.11 to 1.1.12 in <a href="">docker/setup-buildx-action#436</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/setup-buildx-action#432</a></li>
<li>Bump undici from 5.28.4 to 5.29.0 in <a href="">docker/setup-buildx-action#435</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.11.1...v3.12.0">https://github.com/docker/setup-buildx-action/compare/v3.11.1...v3.12.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8d2750c</code></a> Merge pull request <a href="">#455</a> from crazy-max/install-deprecated</li>
<li><a href=""><code>e81846b</code></a> deprecate install input</li>
<li><a href=""><code>65d18f8</code></a> Merge pull request <a href="">#454</a> from docker/dependabot/github_actions/actions/checkout-6</li>
<li><a href=""><code>000d75d</code></a> build(deps): bump actions/checkout from 5 to 6</li>
<li><a href=""><code>1583c0f</code></a> Merge pull request <a href="">#443</a> from nicolasleger/patch-1</li>
<li><a href=""><code>ed158e7</code></a> doc: bump actions/checkout from 4 to 5</li>
<li><a href=""><code>4cc794f</code></a> Merge pull request <a href="">#441</a> from docker/dependabot/github_actions/actions/checkout-5</li>
<li><a href=""><code>4dfc3d6</code></a> build(deps): bump actions/checkout from 4 to 5</li>
<li><a href=""><code>af1b253</code></a> Merge pull request <a href="">#440</a> from crazy-max/k3s-build</li>
<li><a href=""><code>3c6ab92</code></a> ci: k3s test with latest buildx</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/e468171a9de216ec08956ac3ada2f0791b6bd435...8d2750c68a42422c14e847fe6c8ac0403b4cbd6f">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=3.11.1&new-version=3.12.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a32e728d4d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.