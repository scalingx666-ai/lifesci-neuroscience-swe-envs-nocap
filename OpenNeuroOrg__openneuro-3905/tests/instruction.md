# Issue

**Title:** chore(deps): Bump uuid from 10.0.0 to 14.0.0

## Description

Bumps [uuid](https://github.com/uuidjs/uuid) from 10.0.0 to 14.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/uuidjs/uuid/releases">uuid's releases</a>.</em></p>
<blockquote>
<h2>v14.0.0</h2>
<h2><a href="https://github.com/uuidjs/uuid/compare/v13.0.0...v14.0.0">14.0.0</a> (2026-04-19)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>expect <code>crypto</code> to be global everywhere (requires node@20+) (<a href="">#935</a>)</li>
<li>drop node@18 support (<a href="">#934</a>)</li>
</ul>
<h3>Features</h3>
<ul>
<li>drop node@18 support (<a href="">#934</a>) (<a href="">dc4ddb8</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>expect <code>crypto</code> to be global everywhere (requires node@20+) (<a href="">#935</a>) (<a href="">f2c235f</a>)</li>
<li>Use GITHUB_TOKEN for release-please and enable npm provenance (<a href="">#925</a>) (<a href="">ffa3138</a>)</li>
</ul>
<h2>v13.0.0</h2>
<h2><a href="https://github.com/uuidjs/uuid/compare/v12.0.0...v13.0.0">13.0.0</a> (2025-09-08)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>make browser exports the default (<a href="">#901</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>make browser exports the default (<a href="">#901</a>) (<a href="">bce9d72</a>)</li>
</ul>
<h2>v12.0.0</h2>
<h2><a href="https://github.com/uuidjs/uuid/compare/v11.1.0...v12.0.0">12.0.0</a> (2025-09-05)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>update to typescript@5.2 (<a href="">#887</a>)</li>
<li>remove CommonJS support (<a href="">#886</a>)</li>
<li>drop node@16 support (<a href="">#883</a>)</li>
</ul>
<h3>Features</h3>
<ul>
<li>add node@24 to ci matrix (<a href="">#879</a>) (<a href="">42b6178</a>)</li>
<li>drop node@16 support (<a href="">#883</a>) (<a href="">0f38cf1</a>)</li>
<li>remove CommonJS support (<a href="">#886</a>) (<a href="">ae786e2</a>)</li>
<li>update to typescript@5.2 (<a href="">#887</a>) (<a href="">c7ee405</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/uuidjs/uuid/blob/main/CHANGELOG.md">uuid's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/uuidjs/uuid/compare/v13.0.0...v14.0.0">14.0.0</a> (2026-04-19)</h2>
<h3>Security</h3>
<ul>
<li>Fixes <a href="https://github.com/uuidjs/uuid/security/advisories/GHSA-w5hq-g745-h8pq">GHSA-w5hq-g745-h8pq</a>: <code>v3()</code>, <code>v5()</code>, and <code>v6()</code> did not validate that writes would remain within the bounds of a caller-supplied buffer, allowing out-of-bounds writes when an invalid <code>offset</code> was provided. A <code>RangeError</code> is now thrown if <code>offset &lt; 0</code> or <code>offset + 16 &gt; buf.length</code>.</li>
</ul>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li><code>crypto</code> is now expected to be globally defined (requires node@20+) (<a href="">#935</a>)</li>
<li>drop node@18 support (<a href="">#934</a>)</li>
<li>upgrade minimum supported TypeScript version to 5.4.3, in keeping with the project's policy of supporting TypeScript versions released within the last two years</li>
</ul>
<h2><a href="https://github.com/uuidjs/uuid/compare/v12.0.0...v13.0.0">13.0.0</a> (2025-09-08)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>make browser exports the default (<a href="">#901</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>make browser exports the default (<a href="">#901</a>) (<a href="">bce9d72</a>)</li>
</ul>
<h2><a href="https://github.com/uuidjs/uuid/compare/v11.1.0...v12.0.0">12.0.0</a> (2025-09-05)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>update to typescript@5.2 (<a href="">#887</a>)</li>
<li>remove CommonJS support (<a href="">#886</a>)</li>
<li>drop node@16 support (<a href="">#883</a>)</li>
</ul>
<h3>Features</h3>
<ul>
<li>add node@24 to ci matrix (<a href="">#879</a>) (<a href="">42b6178</a>)</li>
<li>drop node@16 support (<a href="">#883</a>) (<a href="">0f38cf1</a>)</li>
<li>remove CommonJS support (<a href="">#886</a>) (<a href="">ae786e2</a>)</li>
<li>update to typescript@5.2 (<a href="">#887</a>) (<a href="">c7ee405</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>improve v4() performance (<a href="">#894</a>) (<a href="">5fd974c</a>)</li>
<li>restore node: prefix (<a href="">#889</a>) (<a href="">e1f42a3</a>)</li>
</ul>
<h2><a href="https://github.com/uuidjs/uuid/compare/v11.0.5...v11.1.0">11.1.0</a> (2025-02-19)</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c1ea08</code></a> chore(main): release 14.0.0 (<a href="">#926</a>)</li>
<li><a href=""><code>3d2c5b0</code></a> Merge commit from fork</li>
<li><a href=""><code>f2c235f</code></a> fix!: expect <code>crypto</code> to be global everywhere (requires node@20+) (<a href="">#935</a>)</li>
<li><a href=""><code>529ef08</code></a> chore: upgrade TypeScript and fixup types (<a href="">#927</a>)</li>
<li><a href=""><code>086fd79</code></a> chore: update dependencies (<a href="">#933</a>)</li>
<li><a href=""><code>dc4ddb8</code></a> feat!: drop node@18 support (<a href="">#934</a>)</li>
<li><a href=""><code>0f1f9c9</code></a> chore: switch to Biome for parsing and linting (<a href="">#932</a>)</li>
<li><a href=""><code>e2879e6</code></a> chore: use maintained version of npm-run-all (<a href="">#930</a>)</li>
<li><a href=""><code>ffa3138</code></a> fix: Use GITHUB_TOKEN for release-please and enable npm provenance (<a href="">#925</a>)</li>
<li><a href=""><code>0423d49</code></a> docs: remove obsolete v1 option notes (<a href="">#915</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/uuidjs/uuid/compare/v10.0.0...v14.0.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for uuid since your current version.</p>
</details>
<details>
<summary>Install script changes</summary>
<p>This version modifies <code>prepare</code> script that runs during installation. Review the package contents before updating.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=uuid&package-manager=npm_and_yarn&previous-version=10.0.0&new-version=14.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95f239b3e919`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.