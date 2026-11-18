# Issue

**Title:** chore(deps): bump actions/setup-node from 4 to 6

## Description

Bumps [actions/setup-node](https://github.com/actions/setup-node) from 4 to 6.
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
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<h3>Breaking Changes</h3>
<ul>
<li>Enhance caching in setup-node with automatic package manager detection by <a href="https://github.com/priya-kinthali"><code>@​priya-kinthali</code></a> in <a href="">actions/setup-node#1348</a></li>
</ul>
<p>This update, introduces automatic caching when a valid <code>packageManager</code> field is present in your <code>package.json</code>. This aims to improve workflow performance and make dependency management more seamless.
To disable this automatic caching, set <code>package-manager-cache: false</code></p>
<pre lang="yaml"><code>steps:
- uses: actions/checkout@v5
- uses: actions/setup-node@v5
  with:
    package-manager-cache: false
</code></pre>
<ul>
<li>Upgrade action to use node24 by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/setup-node#1325</a></li>
</ul>
<p>Make sure your runner is on version v2.327.1 or later to ensure compatibility with this release. <a href="https://github.com/actions/runner/releases/tag/v2.327.1">See Release Notes</a></p>
<h3>Dependency Upgrades</h3>
<ul>
<li>Upgrade <code>@​octokit/request-error</code> and <code>@​actions/github</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/setup-node#1227</a></li>
<li>Upgrade uuid from 9.0.1 to 11.1.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/setup-node#1273</a></li>
<li>Upgrade undici from 5.28.5 to 5.29.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/setup-node#1295</a></li>
<li>Upgrade form-data to bring in fix for critical vulnerability by <a href="https://github.com/gowridurgad"><code>@​gowridurgad</code></a> in <a href="">actions/setup-node#1332</a></li>
<li>Upgrade actions/checkout from 4 to 5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/setup-node#1345</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/priya-kinthali"><code>@​priya-kinthali</code></a> made their first contribution in <a href="">actions/setup-node#1348</a></li>
<li><a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> made their first contribution in <a href="">actions/setup-node#1325</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-node/compare/v4...v5.0.0">https://github.com/actions/setup-node/compare/v4...v5.0.0</a></p>
<h2>v4.4.0</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6044e13</code></a> Docs: bump actions/checkout from v5 to v6 (<a href="">#1468</a>)</li>
<li><a href=""><code>8e49463</code></a> Fix README typo (<a href="">#1226</a>)</li>
<li><a href=""><code>621ac41</code></a> README.md: bump to latest released checkout version v6 (<a href="">#1446</a>)</li>
<li><a href=""><code>2951748</code></a> Bump <code>@​actions/cache</code> to v5.0.1 (<a href="">#1449</a>)</li>
<li><a href=""><code>21ddc7b</code></a> Correct mirror option typos (<a href="">#1442</a>)</li>
<li><a href=""><code>65d868f</code></a> Update Documentation for Lockfile (<a href="">#1454</a>)</li>
<li><a href=""><code>395ad32</code></a> Bump js-yaml from 3.14.1 to 3.14.2 (<a href="">#1435</a>)</li>
<li><a href=""><code>a4d2e2b</code></a> Bump actions/checkout from 5 to 6 (<a href="">#1439</a>)</li>
<li><a href=""><code>b9b25d4</code></a> Remove always-auth configuration handling from action (<a href="">#1436</a>)</li>
<li><a href=""><code>633bb92</code></a> Bump <code>@​actions/cache</code> from 4.0.3 to 4.1.0 (<a href="">#1384</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/setup-node/compare/v4...v6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/setup-node&package-manager=github_actions&previous-version=4&new-version=6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71c155645e6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.