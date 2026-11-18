# Issue

**Title:** Bump actions/checkout from 4.1.1 to 4.1.2

## Description

Bumps [actions/checkout](https://github.com/actions/checkout) from 4.1.1 to 4.1.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v4.1.2</h2>
<p>We are investigating the following issue with this release and have rolled-back the <code>v4</code> tag to point to <code>v4.1.1</code></p>
<ul>
<li><code>sparse-checkout</code> is not available on git versions prior to 2.27.0 (see <a href="">actions/checkout#1651</a>)</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>Fix: Disable sparse checkout whenever <code>sparse-checkout</code> option is not present <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1598</a></li>
<li>Bump tough-cookie from 4.0.0 to 4.1.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1406</a></li>
<li>Bump <code>@​babel/traverse</code> from 7.20.5 to 7.24.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1642</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/jww3"><code>@​jww3</code></a> made their first contribution in <a href="">actions/checkout#1616</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v4.1.1...v4.1.2">https://github.com/actions/checkout/compare/v4.1.1...v4.1.2</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h2>v4.1.2</h2>
<ul>
<li>Fix: Disable sparse checkout whenever <code>sparse-checkout</code> option is not present <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1598</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9bb5618</code></a> Prep for release of  v4.1.2  (<a href="">#1649</a>)</li>
<li><a href=""><code>8eb1f6a</code></a> Bump <code>@​babel/traverse</code> from 7.20.5 to 7.24.0 (<a href="">#1642</a>)</li>
<li><a href=""><code>556e4c3</code></a> Bump tough-cookie from 4.0.0 to 4.1.3 (<a href="">#1406</a>)</li>
<li><a href=""><code>b32f140</code></a> Warn on attempts to publish <code>test-ubuntu-git</code> from non-main branch. (<a href="">#1623</a>)</li>
<li><a href=""><code>2650dbd</code></a> Give <code>test-ubuntu-git</code> its own <code>README</code> (<a href="">#1620</a>)</li>
<li><a href=""><code>aadec89</code></a> Explicitly disable sparse checkout unless asked for (<a href="">#1598</a>)</li>
<li><a href=""><code>df0bcdd</code></a> Refine workflow for generating <code>test-ubuntu-git</code> (<a href="">#1617</a>)</li>
<li><a href=""><code>473055b</code></a> Create <code>test-ubuntu-git</code> Docker Container for Proxy Tests (<a href="">#1616</a>)</li>
<li>See full diff in <a href="https://github.com/actions/checkout/compare/v4.1.1...v4.1.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/checkout&package-manager=github_actions&previous-version=4.1.1&new-version=4.1.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4555c3472a63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.