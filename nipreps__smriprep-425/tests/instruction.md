# Issue

**Title:** Build(deps): Bump the actions-infrastructure group with 2 updates

## Description

Bumps the actions-infrastructure group with 2 updates: [actions/upload-artifact](https://github.com/actions/upload-artifact) and [actions/download-artifact](https://github.com/actions/download-artifact).

Updates `actions/upload-artifact` from 3 to 4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/upload-artifact/releases">actions/upload-artifact's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<h2>What's Changed</h2>
<p>The release of upload-artifact@v4 and download-artifact@v4 are major changes to the backend architecture of Artifacts. They have numerous performance and behavioral improvements.</p>
<p>ℹ️ However, this is a major update that includes breaking changes. Artifacts created with versions v3 and below are not compatible with the v4 actions. Uploads and downloads <em>must</em> use the same major actions versions. There are also key differences from previous versions that may require updates to your workflows.</p>
<p>For more information, please see:</p>
<ol>
<li>The <a href="https://github.blog/changelog/2023-12-14-github-actions-artifacts-v4-is-now-generally-available/">changelog</a> post.</li>
<li>The <a href="https://github.com/actions/upload-artifact/blob/main/README.md">README</a>.</li>
<li>The <a href="https://github.com/actions/upload-artifact/blob/main/docs/MIGRATION.md">migration documentation</a>.</li>
<li>As well as the underlying npm package, <a href="https://github.com/actions/toolkit/tree/main/packages/artifact"><code>@​actions/artifact</code></a> documentation.</li>
</ol>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/vmjoseph"><code>@​vmjoseph</code></a> made their first contribution in <a href="">actions/upload-artifact#464</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v3...v4.0.0">https://github.com/actions/upload-artifact/compare/v3...v4.0.0</a></p>
<h2>v3.1.3</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(github): remove trailing whitespaces by <a href="https://github.com/ljmf00"><code>@​ljmf00</code></a> in <a href="">actions/upload-artifact#313</a></li>
<li>Bump <code>@​actions/artifact</code> version to v1.1.2 by <a href="https://github.com/bethanyj28"><code>@​bethanyj28</code></a> in <a href="">actions/upload-artifact#436</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v3...v3.1.3">https://github.com/actions/upload-artifact/compare/v3...v3.1.3</a></p>
<h2>v3.1.2</h2>
<ul>
<li>Update all <code>@actions/*</code> NPM packages to their latest versions- <a href="">#374</a></li>
<li>Update all dev dependencies to their most recent versions - <a href="">#375</a></li>
</ul>
<h2>v3.1.1</h2>
<ul>
<li>Update actions/core package to latest version to remove <code>set-output</code> deprecation warning <a href="">#351</a></li>
</ul>
<h2>v3.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump <code>@​actions/artifact</code> to v1.1.0 (<a href="">actions/upload-artifact#327</a>)
<ul>
<li>Adds checksum headers on artifact upload (<a href="">actions/toolkit#1095</a>) (<a href="">actions/toolkit#1063</a>)</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5d5d22a</code></a> Merge pull request <a href="">#515</a> from actions/eggyhead/update-artifact-v2.1.1</li>
<li><a href=""><code>f1e993d</code></a> update artifact license</li>
<li><a href=""><code>4881bfd</code></a> updating dist:</li>
<li><a href=""><code>a30777e</code></a> <a href="https://github.com/eggyhead"><code>@​eggyhead</code></a></li>
<li><a href=""><code>3a80482</code></a> Merge pull request <a href="">#511</a> from actions/robherley/migration-docs-typo</li>
<li><a href=""><code>9d63e3f</code></a> Merge branch 'main' into robherley/migration-docs-typo</li>
<li><a href=""><code>dfa1ab2</code></a> fix typo with v3 artifact downloads in migration guide</li>
<li><a href=""><code>d00351b</code></a> Merge pull request <a href="">#509</a> from markmssd/patch-1</li>
<li><a href=""><code>707f5a7</code></a> Update limitation of <code>10</code> artifacts upload to <code>500</code></li>
<li><a href=""><code>26f96df</code></a> Merge pull request <a href="">#505</a> from actions/robherley/merge-artifacts</li>
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/v3...v4">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/download-artifact` from 3 to 4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<h2>What's Changed</h2>
<p>The release of upload-artifact@v4 and download-artifact@v4 are major changes to the backend architecture of Artifacts. They have numerous performance and behavioral improvements.</p>
<p>ℹ️ However, this is a major update that includes breaking changes. Artifacts created with versions v3 and below are not compatible with the v4 actions. Uploads and downloads <em>must</em> use the same major actions versions. There are also key differences from previous versions that may require updates to your workflows.</p>
<p>For more information, please see:</p>
<ol>
<li>The <a href="https://github.blog/changelog/2023-12-14-github-actions-artifacts-v4-is-now-generally-available/">changelog</a> post.</li>
<li>The <a href="https://github.com/actions/download-artifact/blob/main/README.md">README</a>.</li>
<li>The <a href="https://github.com/actions/upload-artifact/blob/main/docs/MIGRATION.md">migration documentation</a>.</li>
<li>As well as the underlying npm package, <a href="https://github.com/actions/toolkit/tree/main/packages/artifact"><code>@​actions/artifact</code></a> documentation.</li>
</ol>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/bflad"><code>@​bflad</code></a> made their first contribution in <a href="">actions/download-artifact#194</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v3...v4.0.0">https://github.com/actions/download-artifact/compare/v3...v4.0.0</a></p>
<h2>v3.0.2</h2>
<ul>
<li>Bump <code>@actions/artifact</code> to v1.1.1 - <a href="">actions/download-artifact#195</a></li>
<li>Fixed a bug in Node16 where if an HTTP download finished too quickly (&lt;1ms, e.g. when it's mocked) we attempt to delete a temp file that has not been created yet <a href="h">actions/toolkit#1278</a></li>
</ul>
<h2>v3.0.1</h2>
<ul>
<li><a href="">Bump <code>@​actions/core</code> to 1.10.0</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c850b93</code></a> Merge pull request <a href="">#307</a> from bethanyj28/main</li>
<li><a href=""><code>6fd111f</code></a> update <code>@​actions/artifact</code></li>
<li><a href=""><code>87c5514</code></a> Merge pull request <a href="">#303</a> from bethanyj28/main</li>
<li><a href=""><code>47f9ce6</code></a> update <code>@​actions/artifact</code></li>
<li><a href=""><code>127824d</code></a> Merge pull request <a href="">#299</a> from bethanyj28/main</li>
<li><a href=""><code>6dd49bf</code></a> licensed only artifact</li>
<li><a href=""><code>f71c0e3</code></a> Revert &quot;licensed&quot;</li>
<li><a href=""><code>7c63dfd</code></a> licensed</li>
<li><a href=""><code>67d37cd</code></a> Update toolkit</li>
<li><a href=""><code>3487549</code></a> Update release-new-action-version.yml (<a href="">#292</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/v3...v4">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39b796ba4e8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.