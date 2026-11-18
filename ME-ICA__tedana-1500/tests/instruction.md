# Issue

**Title:** Bump tornado from 6.5.7 to 6.5.8

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.5.7 to 6.5.8.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.6.0
releases/v6.5.10
releases/v6.5.9
releases/v6.5.8
releases/v6.5.7
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
releases/v4.0.2</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a55abe3</code></a> Merge pull request <a href="">#3704</a> from bdarnell/security-6.5.8</li>
<li><a href=""><code>fc79488</code></a> docs: add additional credit to release notes</li>
<li><a href=""><code>7b01763</code></a> Fix test_strip_headers_on_redirect's URL-embedded-credentials cases</li>
<li><a href=""><code>d72fff8</code></a> release notes and version bump for 6.5.8</li>
<li><a href=""><code>b168818</code></a> auth: Formally deprecated OpenIDMixin</li>
<li><a href=""><code>da28476</code></a> web: Also check for semicolons in deprecated mixed-case cookie args</li>
<li><a href=""><code>8d6363e</code></a> httputil: Enforce a new limit on the number of arguments in a request</li>
<li><a href=""><code>de85b3f</code></a> httputil: Apply multipart max_parts limit earlier</li>
<li>See full diff in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.7...v6.5.8">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b21f37c182b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.