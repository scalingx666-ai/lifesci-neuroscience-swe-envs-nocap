# Issue

**Title:** Bump astral-sh/setup-uv from 10.2.0 to 10.3.3

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 10.2.0 to 10.3.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.3.3 🌈 Use Astral mirror for version manifests with GitHub fallback</h2>
<h2>Changes</h2>
<p>This release contains something that should have been included a very long time ago. Sorry for sleeping on that.</p>
<p>This action now retrieves the release manifest that contains the available versions, their download links and checksums from the Astral mirror, rather than trying GitHub first. This should present much more stable.
(Known checksums are still checked, so the security impact does not change)</p>
<p>Also a big thank you to <a href="https://github.com/soujasK"><code>@​soujasK</code></a> for a set of bugfixes 👏</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Use Astral mirror for version manifests with GitHub fallback <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1119</a>)</li>
<li>fix: allow whitespace in uv requirement specifiers <a href="https://github.com/soujasK"><code>@​soujasK</code></a> (<a href="">#1112</a>)</li>
<li>fix: resolve ~= specifiers with PEP 440 semantics <a href="https://github.com/soujasK"><code>@​soujasK</code></a> (<a href="">#1111</a>)</li>
<li>fix: only report a saved cache when saving succeeded <a href="https://github.com/soujasK"><code>@​soujasK</code></a> (<a href="">#1110</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.13.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1117</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: use JSDoc for compatible release specifier comment <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1113</a>)</li>
<li>docs: update version references to v10.3.2 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1104</a>)</li>
</ul>
<h2>v10.3.2 🌈 update known checksums for 0.13.5</h2>
<h2>Changes</h2>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.13.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1103</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: update version references to v10.3.1 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1102</a>)</li>
</ul>
<h2>v10.3.1 🌈 preserve cache error class names in save-cache bundle</h2>
<h2>Changes</h2>
<p>This release includes a fix so that multiple concurrent workflows trying to upload the same cache no longer warn</p>
<p><code>##[warning]Failed to save: Unable to reserve cache with key ..., another job may be creating this cache.</code></p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: preserve cache error class names in save-cache bundle <a href="https://github.com/dannyward630"><code>@​dannyward630</code></a> (<a href="">#1093</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>68559e9</code></a> Use Astral mirror for version manifests with GitHub fallback (<a href="">#1119</a>)</li>
<li><a href=""><code>0192b69</code></a> chore: update known checksums for 0.13.6 (<a href="">#1117</a>)</li>
<li><a href=""><code>2f29784</code></a> docs: use JSDoc for compatible release specifier comment (<a href="">#1113</a>)</li>
<li><a href=""><code>9c73321</code></a> fix: allow whitespace in uv requirement specifiers (<a href="">#1112</a>)</li>
<li><a href=""><code>80fbe01</code></a> fix: resolve ~= specifiers with PEP 440 semantics (<a href="">#1111</a>)</li>
<li><a href=""><code>36b7b57</code></a> fix: only report a saved cache when saving succeeded (<a href="">#1110</a>)</li>
<li><a href=""><code>56618ca</code></a> docs: update version references to v10.3.2 (<a href="">#1104</a>)</li>
<li><a href=""><code>07a047e</code></a> chore: update known checksums for 0.13.5 (<a href="">#1103</a>)</li>
<li><a href=""><code>e1b8536</code></a> docs: update version references to v10.3.1 (<a href="">#1102</a>)</li>
<li><a href=""><code>18d369b</code></a> chore(deps): roll up Dependabot updates (<a href="">#1101</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v10.2.0...v10.3.3">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f4287ef6175`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.