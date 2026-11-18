# Issue

**Title:** chore(deps): bump the actions-infrastructure group with 3 updates

## Description

Bumps the actions-infrastructure group with 3 updates: [actions/download-artifact](https://github.com/actions/download-artifact), [actions/upload-artifact](https://github.com/actions/upload-artifact) and [actions/setup-node](https://github.com/actions/setup-node).

Updates `actions/download-artifact` from 5 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<p><strong>BREAKING CHANGE:</strong> this update supports Node <code>v24.x</code>. This is not a breaking change per-se but we're treating it as such.</p>
<ul>
<li>Update README for download-artifact v5 changes by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/download-artifact#417</a></li>
<li>Update README with artifact extraction details by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/download-artifact#424</a></li>
<li>Readme: spell out the first use of GHES by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#431</a></li>
<li>Bump <code>@actions/artifact</code> to <code>v4.0.0</code></li>
<li>Prepare <code>v6.0.0</code> by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#438</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> made their first contribution in <a href="">actions/download-artifact#431</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v5...v6.0.0">https://github.com/actions/download-artifact/compare/v5...v6.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>018cc2c</code></a> Merge pull request <a href="">#438</a> from actions/danwkennedy/prepare-6.0.0</li>
<li><a href=""><code>815651c</code></a> Revert &quot;Remove <code>github.dep.yml</code>&quot;</li>
<li><a href=""><code>bb3a066</code></a> Remove <code>github.dep.yml</code></li>
<li><a href=""><code>fa1ce46</code></a> Prepare <code>v6.0.0</code></li>
<li><a href=""><code>4a24838</code></a> Merge pull request <a href="">#431</a> from danwkennedy/patch-1</li>
<li><a href=""><code>5e3251c</code></a> Readme: spell out the first use of GHES</li>
<li><a href=""><code>abefc31</code></a> Merge pull request <a href="">#424</a> from actions/yacaovsnc/update_readme</li>
<li><a href=""><code>ac43a60</code></a> Update README with artifact extraction details</li>
<li><a href=""><code>de96f46</code></a> Merge pull request <a href="">#417</a> from actions/yacaovsnc/update_readme</li>
<li><a href=""><code>7993cb4</code></a> Remove migration guide for artifact download changes</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/upload-artifact` from 4 to 5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/upload-artifact/releases">actions/upload-artifact's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<p><strong>BREAKING CHANGE:</strong> this update supports Node <code>v24.x</code>. This is not a breaking change per-se but we're treating it as such.</p>
<ul>
<li>Update README.md by <a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> in <a href="">actions/upload-artifact#681</a></li>
<li>Update README.md by <a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> in <a href="">actions/upload-artifact#712</a></li>
<li>Readme: spell out the first use of GHES by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#727</a></li>
<li>Update GHES guidance to include reference to Node 20 version by <a href="https://github.com/patrikpolyak"><code>@​patrikpolyak</code></a> in <a href="">actions/upload-artifact#725</a></li>
<li>Bump <code>@actions/artifact</code> to <code>v4.0.0</code></li>
<li>Prepare <code>v5.0.0</code> by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#734</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> made their first contribution in <a href="">actions/upload-artifact#681</a></li>
<li><a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> made their first contribution in <a href="">actions/upload-artifact#712</a></li>
<li><a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> made their first contribution in <a href="">actions/upload-artifact#727</a></li>
<li><a href="https://github.com/patrikpolyak"><code>@​patrikpolyak</code></a> made their first contribution in <a href="">actions/upload-artifact#725</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v4...v5.0.0">https://github.com/actions/upload-artifact/compare/v4...v5.0.0</a></p>
<h2>v4.6.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Update to use artifact 2.3.2 package &amp; prepare for new upload-artifact release by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#685</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> made their first contribution in <a href="">actions/upload-artifact#685</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v4...v4.6.2">https://github.com/actions/upload-artifact/compare/v4...v4.6.2</a></p>
<h2>v4.6.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Update to use artifact 2.2.2 package by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/upload-artifact#673</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v4...v4.6.1">https://github.com/actions/upload-artifact/compare/v4...v4.6.1</a></p>
<h2>v4.6.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Expose env vars to control concurrency and timeout by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/upload-artifact#662</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v4...v4.6.0">https://github.com/actions/upload-artifact/compare/v4...v4.6.0</a></p>
<h2>v4.5.0</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: deprecated <code>Node.js</code> version in action by <a href="https://github.com/hamirmahal"><code>@​hamirmahal</code></a> in <a href="">actions/upload-artifact#578</a></li>
<li>Add new <code>artifact-digest</code> output by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/upload-artifact#656</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/hamirmahal"><code>@​hamirmahal</code></a> made their first contribution in <a href="">actions/upload-artifact#578</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>330a01c</code></a> Merge pull request <a href="">#734</a> from actions/danwkennedy/prepare-5.0.0</li>
<li><a href=""><code>03f2824</code></a> Update <code>github.dep.yml</code></li>
<li><a href=""><code>905a1ec</code></a> Prepare <code>v5.0.0</code></li>
<li><a href=""><code>2d9f9cd</code></a> Merge pull request <a href="">#725</a> from patrikpolyak/patch-1</li>
<li><a href=""><code>9687587</code></a> Merge branch 'main' into patch-1</li>
<li><a href=""><code>2848b2c</code></a> Merge pull request <a href="">#727</a> from danwkennedy/patch-1</li>
<li><a href=""><code>9b51177</code></a> Spell out the first use of GHES</li>
<li><a href=""><code>cd231ca</code></a> Update GHES guidance to include reference to Node 20 version</li>
<li><a href=""><code>de65e23</code></a> Merge pull request <a href="">#712</a> from actions/nebuk89-patch-1</li>
<li><a href=""><code>8747d8c</code></a> Update README.md</li>
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/setup-node` from 5 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-node/releases">actions/setup-node's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<p><strong>Breaking Changes</strong></p>
<ul>
<li>Limit automatic caching to npm, update workflows and documentation by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-node#1374</a></li>
</ul>
<p><strong>Dependency Upgrades</strong></p>
<ul>
<li>Upgrade ts-jest from 29.1.2 to 29.4.1 and document breaking changes in v5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1336</a></li>
<li>Upgrade prettier from 2.8.8 to 3.6.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1334</a></li>
<li>Upgrade actions/publish-action from 0.3.0 to 0.4.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">#1362</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-node/compare/v5...v6.0.0">https://github.com/actions/setup-node/compare/v5...v6.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2028fbc</code></a> Limit automatic caching to npm, update workflows and documentation (<a href="">#1374</a>)</li>
<li><a href=""><code>1342781</code></a> Bump actions/publish-action from 0.3.0 to 0.4.0 (<a href="">#1362</a>)</li>
<li><a href=""><code>89d709d</code></a> Bump prettier from 2.8.8 to 3.6.2 (<a href="">#1334</a>)</li>
<li><a href=""><code>cd2651c</code></a> Bump ts-jest from 29.1.2 to 29.4.1 (<a href="">#1336</a>)</li>
<li>See full diff in <a href="https://github.com/actions/setup-node/compare/v5...v6">compare view</a></li>
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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63d5362e4458`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.