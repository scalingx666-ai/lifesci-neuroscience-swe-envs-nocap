# Issue

**Title:** build(deps): bump github.com/klauspost/compress from 1.18.0 to 1.18.7

## Description

Bumps [github.com/klauspost/compress](https://github.com/klauspost/compress) from 1.18.0 to 1.18.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/klauspost/compress/releases">github.com/klauspost/compress's releases</a>.</em></p>
<blockquote>
<h2>v1.18.7</h2>
<ul>
<li>Fix s2.NewDict OOB read.</li>
</ul>
<p>Security release without other changes.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/klauspost/compress/compare/v1.18.6...v1.18.7">https://github.com/klauspost/compress/compare/v1.18.6...v1.18.7</a></p>
<h2>v1.18.6</h2>
<h2>What's Changed</h2>
<ul>
<li>s2: Fix amd64 stack frame corruption by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1145</a></li>
<li>gzhttp: Canonicalize ETag header by <a href="https://github.com/justinmayhew"><code>@​justinmayhew</code></a> in <a href="">klauspost/compress#1139</a></li>
<li>perf: pool hash tables in Go encode paths to reduce allocations by <a href="https://github.com/huynhanx03"><code>@​huynhanx03</code></a> in <a href="">klauspost/compress#1143</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/justinmayhew"><code>@​justinmayhew</code></a> made their first contribution in <a href="">klauspost/compress#1139</a></li>
<li><a href="https://github.com/huynhanx03"><code>@​huynhanx03</code></a> made their first contribution in <a href="">klauspost/compress#1143</a></li>
<li><a href="https://github.com/thaJeztah"><code>@​thaJeztah</code></a> made their first contribution in <a href="">klauspost/compress#1144</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/klauspost/compress/compare/v1.18.5...v1.18.6">https://github.com/klauspost/compress/compare/v1.18.5...v1.18.6</a></p>
<h2>v1.18.5</h2>
<h2>What's Changed</h2>
<ul>
<li>zstd: Fix crash when changing encoder dictionary with same ID by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1135</a></li>
<li>zstd: Default to full zero frames by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1134</a></li>
<li>flate: Clean up histogram order by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1133</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/klauspost/compress/compare/v1.18.4...v1.18.5">https://github.com/klauspost/compress/compare/v1.18.4...v1.18.5</a></p>
<h2>v1.18.4</h2>
<h2>What's Changed</h2>
<ul>
<li>gzhttp: Add zstandard to server handler wrapper by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1121</a></li>
<li>zstd: Add ResetWithOptions to encoder/decoder by <a href="https://github.com/klauspost"><code>@​klauspost</code></a> in <a href="">klauspost/compress#1122</a></li>
<li>gzhttp: preserve qvalue when extra parameters follow in Accept-Encoding by <a href="https://github.com/analytically"><code>@​analytically</code></a> in <a href="">klauspost/compress#1116</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/analytically"><code>@​analytically</code></a> made their first contribution in <a href="">klauspost/compress#1116</a></li>
<li><a href="https://github.com/ethaizone"><code>@​ethaizone</code></a> made their first contribution in <a href="">klauspost/compress#1124</a></li>
<li><a href="https://github.com/zwass"><code>@​zwass</code></a> made their first contribution in <a href="">klauspost/compress#1125</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/klauspost/compress/compare/v1.18.2...v1.18.4">https://github.com/klauspost/compress/compare/v1.18.2...v1.18.4</a></p>
<h2>v1.18.3</h2>
<p>Downstream CVE-2025-61728</p>
<p>See <a href="">golang/go#77102</a></p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/klauspost/compress/compare/v1.18.2...v1.18.3">https://github.com/klauspost/compress/compare/v1.18.2...v1.18.3</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8668e35</code></a> Merge commit from fork</li>
<li><a href=""><code>ac2f5e8</code></a> docs: use unix line-endings for markdown files (<a href="">#1144</a>)</li>
<li><a href=""><code>620d7b5</code></a> s2: Fix amd64 stack frame corruption (<a href="">#1145</a>)</li>
<li><a href=""><code>1b63f2f</code></a> build(deps): bump the github-actions group with 2 updates (<a href="">#1141</a>)</li>
<li><a href=""><code>3d86b89</code></a> s2: pool hash tables in Go encode paths to reduce allocations (<a href="">#1143</a>)</li>
<li><a href=""><code>15967de</code></a> gzhttp: Canonicalize ETag header (<a href="">#1139</a>)</li>
<li><a href=""><code>c5e0077</code></a> zstd: Fix encoder changing dictionary with same ID (<a href="">#1135</a>)</li>
<li><a href=""><code>fd3f23e</code></a> zstd: Default to full zero frames (<a href="">#1134</a>)</li>
<li><a href=""><code>8233c58</code></a> flate: Clean up histogram order (<a href="">#1133</a>)</li>
<li><a href=""><code>bcf0d12</code></a> build(deps): bump the github-actions group with 3 updates (<a href="">#1132</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/klauspost/compress/compare/v1.18.0...v1.18.7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github.com/klauspost/compress&package-manager=go_modules&previous-version=1.18.0&new-version=1.18.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b211efbe46d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.