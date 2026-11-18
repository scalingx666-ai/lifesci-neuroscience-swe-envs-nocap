# Issue

**Title:** chore(deps): Bump postcss from 8.5.6 to 8.5.12

## Description

Bumps [postcss](https://github.com/postcss/postcss) from 8.5.6 to 8.5.12.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss/releases">postcss's releases</a>.</em></p>
<blockquote>
<h2>8.5.12</h2>
<ul>
<li>Fixed reading any file via user-generated CSS.</li>
<li>Added <code>opts.unsafeMap</code> to disable checks.</li>
</ul>
<h2>8.5.11</h2>
<ul>
<li>Fixed nested brackets parsing performance (by <a href="https://github.com/offset"><code>@​offset</code></a>).</li>
</ul>
<h2>8.5.10</h2>
<ul>
<li>Fixed XSS via unescaped <code>&lt;/style&gt;</code> in non-bundler cases (by <a href="https://github.com/TharVid"><code>@​TharVid</code></a>).</li>
</ul>
<h2>8.5.9</h2>
<ul>
<li>Speed up source map encoding paring in case of the error.</li>
</ul>
<h2>8.5.8</h2>
<ul>
<li>Fixed <code>Processor#version</code>.</li>
</ul>
<h2>8.5.7</h2>
<ul>
<li>Improved source map annotation cleaning performance (by CodeAnt AI).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss/blob/main/CHANGELOG.md">postcss's changelog</a>.</em></p>
<blockquote>
<h2>8.5.12</h2>
<ul>
<li>Fixed reading any file via user-generated CSS.</li>
<li>Added <code>opts.unsafeMap</code> to disable checks.</li>
</ul>
<h2>8.5.11</h2>
<ul>
<li>Fixed nested brackets parsing performance (by <a href="https://github.com/offset"><code>@​offset</code></a>).</li>
</ul>
<h2>8.5.10</h2>
<ul>
<li>Fixed XSS via unescaped <code>&lt;/style&gt;</code> in non-bundler cases (by <a href="https://github.com/TharVid"><code>@​TharVid</code></a>).</li>
</ul>
<h2>8.5.9</h2>
<ul>
<li>Speed up source map encoding paring in case of the error.</li>
</ul>
<h2>8.5.8</h2>
<ul>
<li>Fixed <code>Processor#version</code>.</li>
</ul>
<h2>8.5.7</h2>
<ul>
<li>Improved source map annotation cleaning performance (by CodeAnt AI).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9bc81c4</code></a> Release 8.5.12 version</li>
<li><a href=""><code>85c4d7d</code></a> Another try to fix coverage</li>
<li><a href=""><code>94484ca</code></a> Try to fix coverage</li>
<li><a href=""><code>c64b748</code></a> Load only .map source maps</li>
<li><a href=""><code>aaec7b7</code></a> Avoid throwing JSON parsing errors for non-JSON source maps</li>
<li><a href=""><code>233fb26</code></a> Mention original author of the solution</li>
<li><a href=""><code>2502f75</code></a> Release 8.5.11 version</li>
<li><a href=""><code>5ca1901</code></a> Speed up parsing many nested brackets</li>
<li><a href=""><code>42b5337</code></a> Update dependencies</li>
<li><a href=""><code>7e36e15</code></a> Cache node.raws locally in Stringifier hot methods</li>
<li>Additional commits viewable in <a href="https://github.com/postcss/postcss/compare/8.5.6...8.5.12">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=postcss&package-manager=npm_and_yarn&previous-version=8.5.6&new-version=8.5.12)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fecd69e33c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.