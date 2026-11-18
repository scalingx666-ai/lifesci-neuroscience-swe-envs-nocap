# Issue

**Title:** Bump tornado from 6.5.5 to 6.5.7

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.5.5 to 6.5.7.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.5.7
releases/v6.5.6
releases/v6.5.5
releases/v6.5.4
releases/v6.5.3
releases/v6.5.2
releases/v6.5.1
releases/v6.5.0
releases/v6.4.2
releases/v6.4.1
releases/v6.4.0
releases/v6.3.3
releases/v6.3.2
releases/v6.3.1
releases/v6.3.0
releases/v6.2.0
releases/v6.1.0
releases/v6.0.4
releases/v6.0.3
releases/v6.0.2
releases/v6.0.1
releases/v6.0.0
releases/v5.1.1
releases/v5.1.0
releases/v5.0.2
releases/v5.0.1
releases/v5.0.0
releases/v4.5.3
releases/v4.5.2
releases/v4.5.1
releases/v4.5.0
releases/v4.4.3
releases/v4.4.2
releases/v4.4.1
releases/v4.4.0
releases/v4.3.0
releases/v4.2.1
releases/v4.2.0
releases/v4.1.0
releases/v4.0.2
releases/v4.0.1
releases/v4.0.0
releases/v3.2.2
releases/v3.2.1</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>48fc2d4</code></a> Merge pull request <a href="">#3633</a> from bdarnell/curl-reset-65</li>
<li><a href=""><code>4ae1ddd</code></a> Release notes and version bump for 6.5.7</li>
<li><a href=""><code>3154caa</code></a> curl_httpclient: Reset the curl object before putting it on the freelist</li>
<li><a href=""><code>7d869c0</code></a> Merge pull request <a href="">#3631</a> from bdarnell/cve-links</li>
<li><a href=""><code>288241f</code></a> docs: Use the correct link syntax</li>
<li><a href=""><code>8da981c</code></a> docs: Add CVE links to 6.5.6 release notes</li>
<li><a href=""><code>aba2569</code></a> Merge pull request <a href="">#3626</a> from bdarnell/fixes-656</li>
<li><a href=""><code>a24b260</code></a> httpclient_test: Accept an additional error message variant</li>
<li><a href=""><code>a74240a</code></a> Release notes and version bump for 6.5.6.</li>
<li><a href=""><code>e8fc7ed</code></a> simple_httpclient: Strip auth headers on cross-origin redirects</li>
<li>Additional commits viewable in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.5...v6.5.7">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `443b4c646c34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.