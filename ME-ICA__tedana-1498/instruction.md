# Issue

**Title:** Bump pre-commit from 4.6.1 to 4.6.2

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 4.6.1 to 4.6.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.6.2</h2>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: node</code> hooks that contain <code>&quot;scripts&quot;: {&quot;build&quot;: ...}</code> with
npm 11.x.
<ul>
<li>Regressed in 4.6.1.</li>
<li><a href="">#3737</a> issue by <a href="https://github.com/mheiges"><code>@​mheiges</code></a>.</li>
<li><a href="">#3743</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.6.2 - 2026-08-10</h1>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: node</code> hooks that contain <code>&quot;scripts&quot;: {&quot;build&quot;: ...}</code> with
npm 11.x.
<ul>
<li>Regressed in 4.6.1.</li>
<li><a href="">#3737</a> issue by <a href="https://github.com/mheiges"><code>@​mheiges</code></a>.</li>
<li><a href="">#3743</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9767b6c</code></a> v4.6.2</li>
<li><a href=""><code>42ee3ff</code></a> Merge pull request <a href="">#3743</a> from pre-commit/npm-build-scripts-11-x</li>
<li><a href=""><code>3056619</code></a> fix <code>language: node</code> for hooks with build scripts and npm 11.x</li>
<li>See full diff in <a href="https://github.com/pre-commit/pre-commit/compare/v4.6.1...v4.6.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `790375b44e20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.