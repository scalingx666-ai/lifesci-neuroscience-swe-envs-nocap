# Issue

**Title:** Bump zeroconf from 0.148.0 to 0.149.7

## Description

Bumps [zeroconf](https://github.com/python-zeroconf/python-zeroconf) from 0.148.0 to 0.149.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/releases">zeroconf's releases</a>.</em></p>
<blockquote>
<h2>0.149.7</h2>
<h2>v0.149.7 (2026-05-18)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Bound DNSCache record count to prevent unbounded LAN-driven growth (<a href="">#1718</a>, <a href=""><code>0ad3f37</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>Shave ServiceBrowser first-query delay on loopback (<a href="">#1720</a>, <a href=""><code>0ff3c6b</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.6...0.149.7">0.149.6...0.149.7</a></p>
<h2>0.149.6</h2>
<h2>v0.149.6 (2026-05-18)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Bound _seen_logs and stop retaining exc_info (<a href="">#1717</a>, <a href=""><code>95561e2</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.5...0.149.6">0.149.5...0.149.6</a></p>
<h2>0.149.5</h2>
<h2>v0.149.5 (2026-05-18)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Bound DNS compression-pointer chain depth in DNSIncoming (<a href="">#1719</a>, <a href=""><code>f9e2359</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>
<p>Cap helper get_service_info timeout in suppression test (~3.0s → ~1.85s) (<a href="">#1708</a>, <a href=""><code>ee3c7d7</code></a>)</p>
</li>
<li>
<p>Drop ZeroconfServiceTypes.find() timeouts from 500ms to 200ms on loopback (<a href="">#1710</a>, <a href=""><code>64d143d</code></a>)</p>
</li>
<li>
<p>Eliminate test_get_info_single race by injecting from the send mock (<a href="">#1716</a>, <a href=""><code>963d3d7</code></a>)</p>
</li>
<li>
<p>Fix race in test_register_and_lookup_type_by_uppercase_name (<a href="">#1712</a>, <a href=""><code>91aa21d</code></a>)</p>
</li>
<li>
<p>Speed up service-info request tests with quick_request_timing fixture (<a href="">#1709</a>, <a href=""><code>4bae30a</code></a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/blob/master/CHANGELOG.md">zeroconf's changelog</a>.</em></p>
<blockquote>
<h2>v0.149.7 (2026-05-18)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound DNSCache record count to prevent unbounded LAN-driven growth
(<a href="">#1718</a>,
<a href=""><code>0ad3f37</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>Shave ServiceBrowser first-query delay on loopback
(<a href="">#1720</a>,
<a href=""><code>0ff3c6b</code></a>)</li>
</ul>
<h2>v0.149.6 (2026-05-18)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound _seen_logs and stop retaining exc_info
(<a href="">#1717</a>,
<a href=""><code>95561e2</code></a>)</li>
</ul>
<h2>v0.149.5 (2026-05-18)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound DNS compression-pointer chain depth in DNSIncoming
(<a href="">#1719</a>,
<a href=""><code>f9e2359</code></a>)</li>
</ul>
<h3>Testing</h3>
<ul>
<li>
<p>Cap helper get_service_info timeout in suppression test (~3.0s → ~1.85s)
(<a href="">#1708</a>,
<a href=""><code>ee3c7d7</code></a>)</p>
</li>
<li>
<p>Drop ZeroconfServiceTypes.find() timeouts from 500ms to 200ms on loopback
(<a href="">#1710</a>,
<a href=""><code>64d143d</code></a>)</p>
</li>
<li>
<p>Eliminate test_get_info_single race by injecting from the send mock
(<a href="">#1716</a>,
<a href=""><code>963d3d7</code></a>)</p>
</li>
<li>
<p>Fix race in test_register_and_lookup_type_by_uppercase_name
(<a href="">#1712</a>,
<a href=""><code>91aa21d</code></a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e32f52d</code></a> 0.149.7</li>
<li><a href=""><code>0ad3f37</code></a> fix: bound DNSCache record count to prevent unbounded LAN-driven growth (<a href="">#1718</a>)</li>
<li><a href=""><code>0ff3c6b</code></a> test: shave ServiceBrowser first-query delay on loopback (<a href="">#1720</a>)</li>
<li><a href=""><code>9683fe6</code></a> 0.149.6</li>
<li><a href=""><code>95561e2</code></a> fix: bound _seen_logs and stop retaining exc_info (<a href="">#1717</a>)</li>
<li><a href=""><code>65b22cb</code></a> 0.149.5</li>
<li><a href=""><code>f9e2359</code></a> fix: bound DNS compression-pointer chain depth in DNSIncoming (<a href="">#1719</a>)</li>
<li><a href=""><code>64d143d</code></a> test: drop ZeroconfServiceTypes.find() timeouts from 500ms to 200ms on loopba...</li>
<li><a href=""><code>963d3d7</code></a> test: eliminate test_get_info_single race by injecting from the send mock (<a href="">#1</a>...</li>
<li><a href=""><code>91aa21d</code></a> test: fix race in test_register_and_lookup_type_by_uppercase_name (<a href="">#1712</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.148.0...0.149.7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=zeroconf&package-manager=uv&previous-version=0.148.0&new-version=0.149.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3954c179f5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.