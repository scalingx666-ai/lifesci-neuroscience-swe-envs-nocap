# Issue

**Title:** chore(deps-dev): bump browserslist from 4.28.2 to 4.28.9

## Description

Bumps [browserslist](https://github.com/browserslist/browserslist) from 4.28.2 to 4.28.9.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/browserslist/browserslist/releases">browserslist's releases</a>.</em></p>
<blockquote>
<h2>4.28.9</h2>
<ul>
<li>Improve <code>or</code> parsing performance (by <a href="https://github.com/NotAFlightRisk"><code>@​NotAFlightRisk</code></a>).</li>
</ul>
<h2>4.28.8</h2>
<ul>
<li>Fixed <code>including kaios</code> in baseline queries (by <a href="https://github.com/Jaybhade"><code>@​Jaybhade</code></a>).</li>
</ul>
<h2>4.28.7</h2>
<ul>
<li>Improved parsing performance.</li>
<li>Fixed unbounded memory growth (by <a href="https://github.com/alanturing881"><code>@​alanturing881</code></a>).</li>
<li>Fixed prototype write issue (by <a href="https://github.com/alanturing881"><code>@​alanturing881</code></a>).</li>
</ul>
<h2>4.28.6</h2>
<ul>
<li>Fixed Electron version queries (by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>).</li>
</ul>
<h2>4.28.5</h2>
<ul>
<li>Fixed <code>&gt;</code> and <code>&gt;=</code> queries (by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>).</li>
</ul>
<h2>4.28.4</h2>
<ul>
<li>Fixed <code>SyntaxError</code> regression of 4.28.3.</li>
</ul>
<h2>4.28.3</h2>
<ul>
<li>Fixed baseline query case-insensitivity (by <a href="https://github.com/swwind"><code>@​swwind</code></a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/browserslist/browserslist/blob/main/CHANGELOG.md">browserslist's changelog</a>.</em></p>
<blockquote>
<h2>4.28.9</h2>
<ul>
<li>Improve <code>or</code> parsing performance (by <a href="https://github.com/NotAFlightRisk"><code>@​NotAFlightRisk</code></a>).</li>
</ul>
<h2>4.28.8</h2>
<ul>
<li>Fixed <code>including kaios</code> in baseline queries (by <a href="https://github.com/Jaybhade"><code>@​Jaybhade</code></a>).</li>
</ul>
<h2>4.28.7</h2>
<ul>
<li>Improved parsing performance.</li>
<li>Fixed unbounded memory growth (by <a href="https://github.com/alanturing881"><code>@​alanturing881</code></a>).</li>
<li>Fixed prototype write issue (by <a href="https://github.com/alanturing881"><code>@​alanturing881</code></a>).</li>
</ul>
<h2>4.28.6</h2>
<ul>
<li>Fixed Electron version queries (by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>).</li>
</ul>
<h2>4.28.5</h2>
<ul>
<li>Fixed <code>&gt;</code> and <code>&gt;=</code> queries (by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>).</li>
</ul>
<h2>4.28.4</h2>
<ul>
<li>Fixed <code>SyntaxError</code> regression of 4.28.3.</li>
</ul>
<h2>4.28.3</h2>
<ul>
<li>Fixed baseline query case-insensitivity (by <a href="https://github.com/swwind"><code>@​swwind</code></a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>12ed525</code></a> Release 4.28.9 version</li>
<li><a href=""><code>b1d8cf9</code></a> Update dependencies</li>
<li><a href=""><code>21517b6</code></a> Improve <code>or</code> parsing performance</li>
<li><a href=""><code>f2f2e6c</code></a> Release 4.28.8 version</li>
<li><a href=""><code>d0787c8</code></a> Update dependencies</li>
<li><a href=""><code>fcf8fa9</code></a> Merge pull request <a href="">#939</a> from Jaybhade/fix/baseline-kaios-without-downstream</li>
<li><a href=""><code>57ecd64</code></a> fix: support &quot;including kaios&quot; without downstream</li>
<li><a href=""><code>093a0f6</code></a> Update EM banner</li>
<li><a href=""><code>b637868</code></a> Release 4.28.7 version</li>
<li><a href=""><code>313f465</code></a> Update dependencies</li>
<li>Additional commits viewable in <a href="https://github.com/browserslist/browserslist/compare/4.28.2...4.28.9">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for browserslist since your current version.</p>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8657bb2c4516`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.