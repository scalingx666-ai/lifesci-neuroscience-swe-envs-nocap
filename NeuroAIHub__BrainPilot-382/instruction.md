# Issue

**Title:** chore(deps-dev): bump postcss from 8.5.15 to 8.5.18

## Description

Bumps [postcss](https://github.com/postcss/postcss) from 8.5.15 to 8.5.18.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss/releases">postcss's releases</a>.</em></p>
<blockquote>
<h2>8.5.18</h2>
<ul>
<li>Restricted loading previous source maps file to the <code>opts.from</code> folder for security reasons (use <code>unsafeMap: true</code> to disable the check).</li>
</ul>
<h2>8.5.17</h2>
<ul>
<li>Fixed <code>Maximum call stack size exceeded</code> error.</li>
<li>Fixed Prototype hijacking for <code>postcss.fromJSON()</code>.</li>
<li>Fixed <code>Input#origin()</code> for unmapped end position (by <a href="https://github.com/chatman-media"><code>@​chatman-media</code></a>).</li>
</ul>
<h2>8.5.16</h2>
<ul>
<li>Fixed <code>Input#origin()</code> position (by <a href="https://github.com/mizdra"><code>@​mizdra</code></a>).</li>
<li>Fixed <code>raws</code> after rehydrating a JSON AST (by <a href="https://github.com/sarathfrancis90"><code>@​sarathfrancis90</code></a>).</li>
<li>Fixed putting parent-less node in <code>nodes</code> of new node (by <a href="https://github.com/MahinAnowar"><code>@​MahinAnowar</code></a>).</li>
<li>Fixed computing <code>offset</code> in <code>positionBy()</code> (by <a href="https://github.com/greymoth-jp"><code>@​greymoth-jp</code></a>).</li>
<li>Fixed <code>rangeBy()</code> on <code>index: 0</code> (by <a href="https://github.com/sarathfrancis90"><code>@​sarathfrancis90</code></a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss/blob/main/CHANGELOG.md">postcss's changelog</a>.</em></p>
<blockquote>
<h2>8.5.18</h2>
<ul>
<li>Restricted loading previous source maps file to the <code>opts.from</code> folder for security reasons (use <code>unsafeMap: true</code> to disable the check).</li>
</ul>
<h2>8.5.17</h2>
<ul>
<li>Fixed <code>Maximum call stack size exceeded</code> error.</li>
<li>Fixed Prototype hijacking for <code>postcss.fromJSON()</code>.</li>
<li>Fixed <code>Input#origin()</code> for unmapped end position (by <a href="https://github.com/chatman-media"><code>@​chatman-media</code></a>).</li>
</ul>
<h2>8.5.16</h2>
<ul>
<li>Fixed <code>Input#origin()</code> position (by <a href="https://github.com/mizdra"><code>@​mizdra</code></a>).</li>
<li>Fixed <code>raws</code> after rehydrating a JSON AST (by <a href="https://github.com/sarathfrancis90"><code>@​sarathfrancis90</code></a>).</li>
<li>Fixed putting parent-less node in <code>nodes</code> of new node (by <a href="https://github.com/MahinAnowar"><code>@​MahinAnowar</code></a>).</li>
<li>Fixed computing <code>offset</code> in <code>positionBy()</code> (by <a href="https://github.com/greymoth-jp"><code>@​greymoth-jp</code></a>).</li>
<li>Fixed <code>rangeBy()</code> on <code>index: 0</code> (by <a href="https://github.com/sarathfrancis90"><code>@​sarathfrancis90</code></a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4c0d194</code></a> Release 8.5.18 version</li>
<li><a href=""><code>92b4e78</code></a> Update dependencies</li>
<li><a href=""><code>95663d3</code></a> Limit where source map can be loaded for security reasons</li>
<li><a href=""><code>74e25ae</code></a> Release 8.5.17 version</li>
<li><a href=""><code>d1518af</code></a> Fix Maximum call stack size exceeded error</li>
<li><a href=""><code>2421312</code></a> Fix linter</li>
<li><a href=""><code>a50352c</code></a> Fix CI</li>
<li><a href=""><code>33948f0</code></a> Prevent prototype hijacking in fromJSON</li>
<li><a href=""><code>2131909</code></a> Update dependencies</li>
<li><a href=""><code>93440ab</code></a> Fix non-closed <code>\&lt;div align=&quot;center&quot;&gt;</code> in README (<a href="">#2110</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/postcss/postcss/compare/8.5.15...8.5.18">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for postcss since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=postcss&package-manager=npm_and_yarn&previous-version=8.5.15&new-version=8.5.18)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/NeuroAIHub/BrainPilot/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74fe44bdddbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.