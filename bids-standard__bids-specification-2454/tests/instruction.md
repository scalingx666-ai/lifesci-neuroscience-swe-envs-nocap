# Issue

**Title:** chore(deps): bump prettier from 3.8.1 to 3.8.4 in the node-utilities group

## Description

Bumps the node-utilities group with 1 update: [prettier](https://github.com/prettier/prettier).

Updates `prettier` from 3.8.1 to 3.8.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/prettier/prettier/releases">prettier's releases</a>.</em></p>
<blockquote>
<h2>3.8.4</h2>
<ul>
<li>Markdown: Fix blank lines between list items and nested sub-lists being removed in Markdown/MDX (<a href="">prettier/prettier#17746</a> by <a href="https://github.com/byplayer"><code>@​byplayer</code></a>)</li>
</ul>
<p>🔗 <a href="https://github.com/prettier/prettier/blob/3.8.4/CHANGELOG.md#384">Changelog</a></p>
<h2>3.8.3</h2>
<ul>
<li>SCSS: Prevent trailing comma in <code>if()</code> function (<a href="">prettier/prettier#18471</a> by <a href="https://github.com/kovsu"><code>@​kovsu</code></a>)</li>
</ul>
<p>🔗 <a href="https://github.com/prettier/prettier/blob/3.8.3/CHANGELOG.md#383">Changelog</a></p>
<h2>3.8.2</h2>
<ul>
<li>Support Angular v21.2</li>
</ul>
<p>🔗 <a href="https://github.com/prettier/prettier/blob/main/CHANGELOG.md#382">Changelog</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/prettier/prettier/blob/main/CHANGELOG.md">prettier's changelog</a>.</em></p>
<blockquote>
<h1>3.8.4</h1>
<p><a href="https://github.com/prettier/prettier/compare/3.8.3...3.8.4">diff</a></p>
<h4>Markdown: Fix blank lines between list items and nested sub-lists being removed in Markdown/MDX (<a href="">#17746</a> by <a href="https://github.com/byplayer"><code>@​byplayer</code></a>)</h4>
<p>Prettier was removing blank lines between list items and their nested sub-lists, converting loose lists into tight lists and changing their semantic meaning.</p>
<!-- raw HTML omitted -->
<pre lang="markdown"><code>&lt;!-- Input --&gt;
- a
<ul>
<li>
<p>b</p>
</li>
<li>
<p>c</p>
<ul>
<li>d</li>
</ul>
</li>
</ul>
<p>&lt;!-- Prettier 3.8.3 --&gt;</p>
<ul>
<li>a
<ul>
<li>b</li>
</ul>
</li>
<li>c
<ul>
<li>d</li>
</ul>
</li>
</ul>
<p>&lt;!-- Prettier 3.8.4 --&gt;</p>
<ul>
<li>
<p>a</p>
<ul>
<li>b</li>
</ul>
</li>
<li>
<p>c</p>
<ul>
<li>d<br />
</code></pre></li>
</ul>
</li>
</ul>
<h1>3.8.3</h1>
<p><a href="https://github.com/prettier/prettier/compare/3.8.2...3.8.3">diff</a></p>
<h4>SCSS: Prevent trailing comma in <code>if()</code> function (<a href="">#18471</a> by <a href="https://github.com/kovsu"><code>@​kovsu</code></a>)</h4>
<!-- raw HTML omitted -->
<pre lang="scss"><code>// Input
$value: if(sass(false): 1; else: -1);
<p>// Prettier 3.8.2<br />
$value: if(<br />
sass(false): 1; else: -1,<br />
&lt;/tr&gt;&lt;/table&gt;<br />
</code></pre></p>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1c6ba55</code></a> Release 3.8.4</li>
<li><a href=""><code>4a673dc</code></a> Fix blank lines between list items and nested sub-lists being removed in Mark...</li>
<li><a href=""><code>074aaed</code></a> Replace <code>main</code> branch in changelog link with tags (<a href="">#19054</a>)</li>
<li><a href=""><code>c22a003</code></a> Bump Prettier dependency to 3.8.3</li>
<li><a href=""><code>07bad1f</code></a> Clean changelog_unreleased</li>
<li><a href=""><code>d7108a7</code></a> Release 3.8.3</li>
<li><a href=""><code>177f908</code></a> Prevent trailing comma in SCSS <code>if()</code> function (<a href="">#18471</a>)</li>
<li><a href=""><code>1cd4066</code></a> Release <code>@​prettier/plugin-oxc</code><a href="https://github.com/0"><code>@​0</code></a>.1.4</li>
<li><a href=""><code>a8700e2</code></a> Update oxc-parser to v0.125.0</li>
<li><a href=""><code>752157c</code></a> Fix tests</li>
<li>Additional commits viewable in <a href="https://github.com/prettier/prettier/compare/3.8.1...3.8.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=prettier&package-manager=npm_and_yarn&previous-version=3.8.1&new-version=3.8.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d6557dae121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.