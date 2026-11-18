# Issue

**Title:** chore(deps): bump actions/cache from 4.2.4 to 4.3.0

## Description

Bumps [actions/cache](https://github.com/actions/cache) from 4.2.4 to 4.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/releases">actions/cache's releases</a>.</em></p>
<blockquote>
<h2>v4.3.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Add note on runner versions by <a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> in <a href="">actions/cache#1642</a></li>
<li>Prepare <code>v4.3.0</code> release by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1655</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> made their first contribution in <a href="">actions/cache#1642</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v4...v4.3.0">https://github.com/actions/cache/compare/v4...v4.3.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/blob/main/RELEASES.md">actions/cache's changelog</a>.</em></p>
<blockquote>
<h1>Releases</h1>
<h3>4.3.0</h3>
<ul>
<li>Bump <code>@actions/cache</code> to <a href="">v4.1.0</a></li>
</ul>
<h3>4.2.4</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.5</li>
</ul>
<h3>4.2.3</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.3 (obfuscates SAS token in debug logs for cache entries)</li>
</ul>
<h3>4.2.2</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.2</li>
</ul>
<h3>4.2.1</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.1</li>
</ul>
<h3>4.2.0</h3>
<p>TLDR; The cache backend service has been rewritten from the ground up for improved performance and reliability. <a href="https://github.com/actions/cache">actions/cache</a> now integrates with the new cache service (v2) APIs.</p>
<p>The new service will gradually roll out as of <strong>February 1st, 2025</strong>. The legacy service will also be sunset on the same date. Changes in these release are <strong>fully backward compatible</strong>.</p>
<p><strong>We are deprecating some versions of this action</strong>. We recommend upgrading to version <code>v4</code> or <code>v3</code> as soon as possible before <strong>February 1st, 2025.</strong> (Upgrade instructions below).</p>
<p>If you are using pinned SHAs, please use the SHAs of versions <code>v4.2.0</code> or <code>v3.4.0</code></p>
<p>If you do not upgrade, all workflow runs using any of the deprecated <a href="https://github.com/actions/cache">actions/cache</a> will fail.</p>
<p>Upgrading to the recommended versions will not break your workflows.</p>
<h3>4.1.2</h3>
<ul>
<li>Add GitHub Enterprise Cloud instances hostname filters to inform API endpoint choices - <a href="">#1474</a></li>
<li>Security fix: Bump braces from 3.0.2 to 3.0.3 - <a href="">#1475</a></li>
</ul>
<h3>4.1.1</h3>
<ul>
<li>Restore original behavior of <code>cache-hit</code> output - <a href="">#1467</a></li>
</ul>
<h3>4.1.0</h3>
<ul>
<li>Ensure <code>cache-hit</code> output is set when a cache is missed - <a href="">#1404</a></li>
<li>Deprecate <code>save-always</code> input - <a href="">#1452</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0057852</code></a> Merge pull request <a href="">#1655</a> from actions/Link-/prepare-4.3.0</li>
<li><a href=""><code>4f5ea67</code></a> Update licensed cache</li>
<li><a href=""><code>9fcad95</code></a> Upgrade actions/cache to 4.1.0 and prepare 4.3.0 release</li>
<li><a href=""><code>638ed79</code></a> Merge pull request <a href="">#1642</a> from actions/GhadimiR-patch-1</li>
<li><a href=""><code>3862dcc</code></a> Add note on runner versions</li>
<li>See full diff in <a href="https://github.com/actions/cache/compare/0400d5f644dc74513175e3cd8d07132dd4860809...0057852bfaa89a56745cba8c7296529d2fc39830">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/cache&package-manager=github_actions&previous-version=4.2.4&new-version=4.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51f75551e8be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.