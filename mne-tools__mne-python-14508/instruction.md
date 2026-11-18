# Issue

**Title:** [dependabot]: Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) and [prefix-dev/setup-pixi](https://github.com/prefix-dev/setup-pixi).

Updates `astral-sh/setup-uv` from 10.3.2 to 10.3.3
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
</blockquote>
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
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/v10.3.2...v10.3.3">compare view</a></li>
</ul>
</details>
<br />

Updates `prefix-dev/setup-pixi` from 0.11.2 to 0.11.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/prefix-dev/setup-pixi/releases">prefix-dev/setup-pixi's releases</a>.</em></p>
<blockquote>
<h2>v0.11.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>✨ New features</h3>
<ul>
<li>feat: Add configuration input for pixi global settings by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">prefix-dev/setup-pixi#248</a></li>
</ul>
<h3>⬆️ Dependency updates</h3>
<ul>
<li>chore(deps): bump the gh-actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#299</a></li>
<li>chore(deps): bump the nodejs group with 8 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#300</a></li>
</ul>
<h3>🤷🏻 Other changes</h3>
<ul>
<li>docs: Mention setup-pixi being pre-v1 by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#301</a></li>
<li>build: Add 7 day dependency cooldown via pnpm minimumReleaseAge by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#302</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.11.2...v0.11.3">https://github.com/prefix-dev/setup-pixi/compare/v0.11.2...v0.11.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9936258</code></a> feat: Add configuration input for pixi global settings (<a href="">#248</a>)</li>
<li><a href=""><code>784aed4</code></a> build: Add 7 day dependency cooldown via pnpm minimumReleaseAge (<a href="">#302</a>)</li>
<li><a href=""><code>d20971e</code></a> chore(deps): bump the nodejs group with 8 updates (<a href="">#300</a>)</li>
<li><a href=""><code>e3b12f5</code></a> docs: Mention setup-pixi being pre-v1 (<a href="">#301</a>)</li>
<li><a href=""><code>4d5f969</code></a> chore(deps): bump the gh-actions group with 2 updates (<a href="">#299</a>)</li>
<li>See full diff in <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.11.2...v0.11.3">compare view</a></li>
</ul>
</details>
<br />

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `256f27dfb28b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.