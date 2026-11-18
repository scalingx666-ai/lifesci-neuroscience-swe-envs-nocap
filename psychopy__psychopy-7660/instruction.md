# Issue

**Title:** Bump zeroconf from 0.149.7 to 0.149.12

## Description

Bumps [zeroconf](https://github.com/python-zeroconf/python-zeroconf) from 0.149.7 to 0.149.12.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/releases">zeroconf's releases</a>.</em></p>
<blockquote>
<h2>0.149.12</h2>
<h2>v0.149.12 (2026-05-20)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>
<p>Bound QuestionHistory per-entry known-answer payload (<a href="">#1755</a>, <a href=""><code>4ff6540</code></a>)</p>
</li>
<li>
<p>Bound TC-deferred queues against spoofed-source flood OOM (<a href="">#1751</a>, <a href=""><code>b22c8ff</code></a>)</p>
</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.11...0.149.12">0.149.11...0.149.12</a></p>
<h2>0.149.11</h2>
<h2>v0.149.11 (2026-05-20)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>Bound duplicate-packet dedup against alternating-payload floods (<a href="">#1750</a>, <a href=""><code>8c9d6ce</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.10...0.149.11">0.149.10...0.149.11</a></p>
<h2>0.149.10</h2>
<h2>v0.149.10 (2026-05-20)</h2>
<p><em>This release is published under the LGPL-2.1-or-later License.</em></p>
<h3>Bug Fixes</h3>
<ul>
<li>
<p>Accept uppercase .local. trailer in service_type_name (<a href="">#1747</a>, <a href=""><code>37edde2</code></a>)</p>
</li>
<li>
<p>Bound TC-deferral assembly window to first-arrival + max delay (<a href="">#1732</a>, <a href=""><code>a096238</code></a>)</p>
</li>
</ul>
<h3>Testing</h3>
<ul>
<li>Add codspeed benchmarks for listener duplicate-packet dedup (<a href="">#1744</a>, <a href=""><code>068c3f6</code></a>)</li>
</ul>
<hr />
<p><strong>Detailed Changes</strong>: <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.9...0.149.10">0.149.9...0.149.10</a></p>
<h2>0.149.9</h2>
<h2>v0.149.9 (2026-05-20)</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-zeroconf/python-zeroconf/blob/master/CHANGELOG.md">zeroconf's changelog</a>.</em></p>
<blockquote>
<h2>v0.149.12 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>
<p>Bound QuestionHistory per-entry known-answer payload
(<a href="">#1755</a>,
<a href=""><code>4ff6540</code></a>)</p>
</li>
<li>
<p>Bound TC-deferred queues against spoofed-source flood OOM
(<a href="">#1751</a>,
<a href=""><code>b22c8ff</code></a>)</p>
</li>
</ul>
<h2>v0.149.11 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound duplicate-packet dedup against alternating-payload floods
(<a href="">#1750</a>,
<a href=""><code>8c9d6ce</code></a>)</li>
</ul>
<h2>v0.149.10 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>
<p>Accept uppercase .local. trailer in service_type_name
(<a href="">#1747</a>,
<a href=""><code>37edde2</code></a>)</p>
</li>
<li>
<p>Bound TC-deferral assembly window to first-arrival + max delay
(<a href="">#1732</a>,
<a href=""><code>a096238</code></a>)</p>
</li>
</ul>
<h3>Testing</h3>
<ul>
<li>Add codspeed benchmarks for listener duplicate-packet dedup
(<a href="">#1744</a>,
<a href=""><code>068c3f6</code></a>)</li>
</ul>
<h2>v0.149.9 (2026-05-20)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Bound QuestionHistory size to prevent LAN-driven OOM
(<a href="">#1733</a>,
<a href=""><code>0e5e637</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f4b5066</code></a> 0.149.12</li>
<li><a href=""><code>4ff6540</code></a> fix: bound QuestionHistory per-entry known-answer payload (<a href="">#1755</a>)</li>
<li><a href=""><code>b22c8ff</code></a> fix: bound TC-deferred queues against spoofed-source flood OOM (<a href="">#1751</a>)</li>
<li><a href=""><code>6a83ab8</code></a> 0.149.11</li>
<li><a href=""><code>8c9d6ce</code></a> fix: bound duplicate-packet dedup against alternating-payload floods (<a href="">#1750</a>)</li>
<li><a href=""><code>304fae6</code></a> chore: enable ruff PT006/PT007 parametrize tuple rules (<a href="">#1749</a>)</li>
<li><a href=""><code>a7cefe9</code></a> 0.149.10</li>
<li><a href=""><code>a096238</code></a> fix: bound TC-deferral assembly window to first-arrival + max delay (<a href="">#1732</a>)</li>
<li><a href=""><code>37edde2</code></a> fix: accept uppercase .local. trailer in service_type_name (<a href="">#1747</a>)</li>
<li><a href=""><code>0e201f7</code></a> ci: key venv cache on resolved python patch version (<a href="">#1745</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-zeroconf/python-zeroconf/compare/0.149.7...0.149.12">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=zeroconf&package-manager=uv&previous-version=0.149.7&new-version=0.149.12)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f72e64a45227`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.