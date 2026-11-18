# Issue

**Title:** [dependabot]: Bump the actions group with 4 updates

## Description

Bumps the actions group with 4 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv), [github/codeql-action](https://github.com/github/codeql-action), [prefix-dev/setup-pixi](https://github.com/prefix-dev/setup-pixi) and [codecov/codecov-action](https://github.com/codecov/codecov-action).

Updates `astral-sh/setup-uv` from 10.1.0 to 10.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.2.0 🌈 Disable automatic cache saves for merge queues</h2>
<h2>Changes</h2>
<p>This release contains the known-checksum of the most recent uv releases and also disabled the uploading(saving) of the cache when in a merge queue since theses caches would almost never be used.</p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Disable automatic cache saves for merge queues <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1056</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.12.17 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1058</a>)</li>
<li>chore: update known checksums for 0.12.16 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1057</a>)</li>
<li>chore: update known checksums for 0.12.15 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1054</a>)</li>
<li>chore: update known checksums for 0.12.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1053</a>)</li>
<li>chore: update known checksums for 0.12.13 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1045</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: update version references to v10.1.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1044</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps): roll up Dependabot updates <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1059</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c18668a</code></a> chore(deps): roll up Dependabot updates (<a href="">#1059</a>)</li>
<li><a href=""><code>ffe1476</code></a> chore: update known checksums for 0.12.17 (<a href="">#1058</a>)</li>
<li><a href=""><code>f5548c5</code></a> chore: update known checksums for 0.12.16 (<a href="">#1057</a>)</li>
<li><a href=""><code>a761a4e</code></a> Disable automatic cache saves for merge queues (<a href="">#1056</a>)</li>
<li><a href=""><code>3377a30</code></a> chore: update known checksums for 0.12.15 (<a href="">#1054</a>)</li>
<li><a href=""><code>dfb5f38</code></a> chore: update known checksums for 0.12.14 (<a href="">#1053</a>)</li>
<li><a href=""><code>45c121f</code></a> chore: update known checksums for 0.12.13 (<a href="">#1045</a>)</li>
<li><a href=""><code>8073452</code></a> docs: update version references to v10.1.0 (<a href="">#1044</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/v10.1.0...v10.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `github/codeql-action` from 4.38.0 to 4.38.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.38.1</h2>
<ul>
<li>The CodeQL Action now has experimental support for CodeQL releases for which per-language bundles are available. Per-language bundles support analysis for a single language and are therefore smaller than the combined bundles that allow analysis for all supported languages. As a result, per-language bundles take up less space on disk and are faster to download. We expect to roll this change out to everyone in the coming weeks. <a href="">#4146</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.38.1 - 18 Sept 2026</h2>
<ul>
<li>The CodeQL Action now has experimental support for CodeQL releases for which per-language bundles are available. Per-language bundles support analysis for a single language and are therefore smaller than the combined bundles that allow analysis for all supported languages. As a result, per-language bundles take up less space on disk and are faster to download. We expect to roll this change out to everyone in the coming weeks. <a href="">#4146</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1c5b675</code></a> Merge pull request <a href="">#4152</a> from github/update-v4.38.1-a65b83a73</li>
<li><a href=""><code>a97cdca</code></a> Add changelog entry for <a href="">#4146</a></li>
<li><a href=""><code>cc6c691</code></a> Update changelog for v4.38.1</li>
<li><a href=""><code>a65b83a</code></a> Merge pull request <a href="">#4146</a> from github/henrymercer/per-language-bundles-pr</li>
<li><a href=""><code>07fa87d</code></a> Clarify the latest-nightly eligibility exception</li>
<li><a href=""><code>f18f353</code></a> Describe the bundle URL resolver</li>
<li><a href=""><code>ecec9b5</code></a> Share per-language telemetry fields without renaming</li>
<li><a href=""><code>79fe3a1</code></a> Move download telemetry into the status-report directory</li>
<li><a href=""><code>ead1f7d</code></a> Rename the platform module</li>
<li><a href=""><code>549d498</code></a> Simplify per-language platform eligibility checks</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.38.0...v4.38.1">compare view</a></li>
</ul>
</details>
<br />

Updates `prefix-dev/setup-pixi` from 0.9.4 to 0.10.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/prefix-dev/setup-pixi/releases">prefix-dev/setup-pixi's releases</a>.</em></p>
<blockquote>
<h2>v0.10.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>✨ New features</h3>
<ul>
<li>feat: Add support for linux-riscv64 by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#282</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.10.1...v0.10.2">https://github.com/prefix-dev/setup-pixi/compare/v0.10.1...v0.10.2</a></p>
<h2>v0.10.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>⬆️ Dependency updates</h3>
<ul>
<li>chore(deps): bump the nodejs group with 6 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#274</a></li>
<li>chore(deps): bump the gh-actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#273</a></li>
<li>chore(deps): bump the gh-actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#276</a></li>
</ul>
<h3>🤷🏻 Other changes</h3>
<ul>
<li>Update dependencies and add pnpm workspace configuration by <a href="https://github.com/wolfv"><code>@​wolfv</code></a> in <a href="">prefix-dev/setup-pixi#279</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/wolfv"><code>@​wolfv</code></a> made their first contribution in <a href="">prefix-dev/setup-pixi#279</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.10.0...v0.10.1">https://github.com/prefix-dev/setup-pixi/compare/v0.10.0...v0.10.1</a></p>
<h2>v0.10.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>💥 Breaking changes</h3>
<ul>
<li>feat: change post-cleanup default to false by <a href="https://github.com/Hofer-Julian"><code>@​Hofer-Julian</code></a> in <a href="">prefix-dev/setup-pixi#272</a></li>
</ul>
<h3>⬆️ Dependency updates</h3>
<ul>
<li>chore(deps): bump the gh-actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#268</a></li>
<li>chore(deps): bump the nodejs group with 6 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#269</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Hofer-Julian"><code>@​Hofer-Julian</code></a> made their first contribution in <a href="">prefix-dev/setup-pixi#272</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.9.6...v0.10.0">https://github.com/prefix-dev/setup-pixi/compare/v0.9.6...v0.10.0</a></p>
<h2>v0.9.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>✨ New features</h3>
<ul>
<li>feat: Add <code>persist-credentials</code> option by <a href="https://github.com/AndreasAlbertQC"><code>@​AndreasAlbertQC</code></a> in <a href="">prefix-dev/setup-pixi#266</a></li>
</ul>
<h3>⬆️ Dependency updates</h3>
<ul>
<li>chore(deps): bump the gh-actions group with 4 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#261</a></li>
<li>chore(deps): bump the gh-actions group with 5 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">prefix-dev/setup-pixi#263</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d3f436a</code></a> feat: Add support for linux-riscv64 (<a href="">#282</a>)</li>
<li><a href=""><code>f00437f</code></a> Update dependencies and add pnpm workspace configuration (<a href="">#279</a>)</li>
<li><a href=""><code>d0c199d</code></a> chore(deps): bump the gh-actions group with 3 updates (<a href="">#276</a>)</li>
<li><a href=""><code>2253d9c</code></a> chore(deps): bump the gh-actions group with 3 updates (<a href="">#273</a>)</li>
<li><a href=""><code>c5359a3</code></a> chore(deps): bump the nodejs group with 6 updates (<a href="">#274</a>)</li>
<li><a href=""><code>a09b624</code></a> feat: change post-cleanup default to false (<a href="">#272</a>)</li>
<li><a href=""><code>947fc1f</code></a> chore(deps): bump the nodejs group with 6 updates (<a href="">#269</a>)</li>
<li><a href=""><code>36c1c8c</code></a> chore(deps): bump the gh-actions group with 2 updates (<a href="">#268</a>)</li>
<li><a href=""><code>5185adf</code></a> feat: Add <code>persist-credentials</code> option (<a href="">#266</a>)</li>
<li><a href=""><code>92596c3</code></a> chore(deps): bump the nodejs group with 6 updates (<a href="">#264</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.9.4...v0.10.2">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 7.1.0 to 7.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/releases">codecov/codecov-action's releases</a>.</em></p>
<blockquote>
<h2>v7.1.1</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(release): 7.1.1 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1973</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v7.1.0...v7.1.1">https://github.com/codecov/codecov-action/compare/v7.1.0...v7.1.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>303a32d</code></a> chore(release): 7.1.1 (<a href="">#1973</a>)</li>
<li>See full diff in <a href="https://github.com/codecov/codecov-action/compare/v7.1.0...v7.1.1">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `590dd73e7ff6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.