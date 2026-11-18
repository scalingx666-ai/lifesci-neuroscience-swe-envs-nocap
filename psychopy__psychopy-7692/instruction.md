# Issue

**Title:** Bump zeroconf from 0.149.12 to 0.149.16

## Description

Bumps [zeroconf](https://github.com/python-zeroconf/python-zeroconf) from 0.149.12 to 0.149.16.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/releases">zeroconf's releases</a>.</em></p>
<blockquote>
<h2>0.149.16</h2>
<h2>v0.149.16 (2026-05-21)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Re-release for GHSA-qc2x-6f54-m6h9 (<a href="">#1770</a>, <a href=""><code>fad8646</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.15...0.149.16">0.149.15...0.149.16</a></p>
<h2>0.149.15</h2>
<h2>v0.149.15 (2026-05-21)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Preserve scope_id when scoped AAAA arrives alongside unscoped (<a href="">#1764</a>, <a href=""><code>e2352ea</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.14...0.149.15">0.149.14...0.149.15</a></p>
<h2>0.149.14</h2>
<h2>v0.149.14 (2026-05-20)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Skip NSEC records in ServiceBrowser to suppress spurious updates (<a href="">#1762</a>, <a href=""><code>137a5d6</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>
<p>Add blockbuster to detect blocking calls in asyncio tests (<a href="">#1761</a>, <a href=""><code>90a5a39</code></a>)</p>
</li>
<li>
<p>Scale aggregation timings 10x to speed up timing-dependent tests (<a href="">#1759</a>, <a href=""><code>3e5ac4f</code></a>)</p>
</li>
<li>
<p>Shave loopback timing overhead from remaining slow tests (<a href="">#1760</a>, <a href=""><code>343dc7a</code></a>)</p>
</li>
<li>
<p>Widen QM follow-up window in info_asking_default test (<a href="">#1765</a>, <a href=""><code>4ffba87</code></a>)</p>
</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.13...0.149.14">0.149.13...0.149.14</a></p>
<h2>0.149.13</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/blob/master/CHANGELOG.md">zeroconf's changelog</a>.</em></p>
<blockquote>
<h2>v0.149.16 (2026-05-21)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Re-release for GHSA-qc2x-6f54-m6h9
(<a href="">#1770</a>,
<a href=""><code>fad8646</code></a>)</li>
</ul>
<h2>v0.149.15 (2026-05-21)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Preserve scope_id when scoped AAAA arrives alongside unscoped
(<a href="">#1764</a>,
<a href=""><code>e2352ea</code></a>)</li>
</ul>
<h2>v0.149.14 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Skip NSEC records in ServiceBrowser to suppress spurious updates
(<a href="">#1762</a>,
<a href=""><code>137a5d6</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>
<p>Add blockbuster to detect blocking calls in asyncio tests
(<a href="">#1761</a>,
<a href=""><code>90a5a39</code></a>)</p>
</li>
<li>
<p>Scale aggregation timings 10x to speed up timing-dependent tests
(<a href="">#1759</a>,
<a href=""><code>3e5ac4f</code></a>)</p>
</li>
<li>
<p>Shave loopback timing overhead from remaining slow tests
(<a href="">#1760</a>,
<a href=""><code>343dc7a</code></a>)</p>
</li>
<li>
<p>Widen QM follow-up window in info_asking_default test
(<a href="">#1765</a>,
<a href=""><code>4ffba87</code></a>)</p>
</li>
</ul>
<h2>v0.149.13 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound record payload reads against rdlength overrun</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>78670f7</code></a> 0.149.16</li>
<li><a href=""><code>fad8646</code></a> fix: re-release for GHSA-qc2x-6f54-m6h9 (<a href="">#1770</a>)</li>
<li><a href=""><code>413d3ba</code></a> 0.149.15</li>
<li><a href=""><code>e2352ea</code></a> fix: preserve scope_id when scoped AAAA arrives alongside unscoped (<a href="">#1764</a>)</li>
<li><a href=""><code>9470bd6</code></a> 0.149.14</li>
<li><a href=""><code>137a5d6</code></a> fix: skip NSEC records in ServiceBrowser to suppress spurious updates (<a href="">#1762</a>)</li>
<li><a href=""><code>4ffba87</code></a> test: widen QM follow-up window in info_asking_default test (<a href="">#1765</a>)</li>
<li><a href=""><code>90a5a39</code></a> test: add blockbuster to detect blocking calls in asyncio tests (<a href="">#1761</a>)</li>
<li><a href=""><code>3e5ac4f</code></a> test: scale aggregation timings 10x to speed up timing-dependent tests (<a href="">#1759</a>)</li>
<li><a href=""><code>343dc7a</code></a> test: shave loopback timing overhead from remaining slow tests (<a href="">#1760</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.12...0.149.16">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=zeroconf&package-manager=uv&previous-version=0.149.12&new-version=0.149.16)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/psychopy/psychopy/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `429a5087e148`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.