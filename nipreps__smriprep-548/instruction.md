# Issue

**Title:** build(deps): bump the actions-infrastructure group across 1 directory with 2 updates

## Description

Bumps the actions-infrastructure group with 2 updates in the / directory: [actions/cache](https://github.com/actions/cache) and [actions/upload-artifact](https://github.com/actions/upload-artifact).

Updates `actions/cache` from 4 to 5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/releases">actions/cache's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<blockquote>
<p>[!IMPORTANT]
<strong><code>actions/cache@v5</code> runs on the Node.js 24 runtime and requires a minimum Actions Runner version of <code>2.327.1</code>.</strong></p>
<p>If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<hr />
<h2>What's Changed</h2>
<ul>
<li>Upgrade to use node24 by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/cache#1630</a></li>
<li>Prepare v5.0.0 release by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/cache#1684</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v4.3.0...v5.0.0">https://github.com/actions/cache/compare/v4.3.0...v5.0.0</a></p>
<h2>v4.3.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Add note on runner versions by <a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> in <a href="">actions/cache#1642</a></li>
<li>Prepare <code>v4.3.0</code> release by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1655</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/GhadimiR"><code>@​GhadimiR</code></a> made their first contribution in <a href="">actions/cache#1642</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v4...v4.3.0">https://github.com/actions/cache/compare/v4...v4.3.0</a></p>
<h2>v4.2.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Update README.md by <a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> in <a href="">actions/cache#1620</a></li>
<li>Upgrade <code>@actions/cache</code> to <code>4.0.5</code> and move <code>@protobuf-ts/plugin</code> to dev depdencies by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1634</a></li>
<li>Prepare release <code>4.2.4</code> by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1636</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> made their first contribution in <a href="">actions/cache#1620</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v4...v4.2.4">https://github.com/actions/cache/compare/v4...v4.2.4</a></p>
<h2>v4.2.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Update to use <code>@​actions/cache</code> 4.0.3 package &amp; prepare for new release by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/cache#1577</a> (SAS tokens for cache entries are now masked in debug logs)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> made their first contribution in <a href="">actions/cache#1577</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v4.2.2...v4.2.3">https://github.com/actions/cache/compare/v4.2.2...v4.2.3</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/blob/main/RELEASES.md">actions/cache's changelog</a>.</em></p>
<blockquote>
<h1>Releases</h1>
<h2>How to prepare a release</h2>
<blockquote>
<p>[!NOTE]<br />
Relevant for maintainers with write access only.</p>
</blockquote>
<ol>
<li>Switch to a new branch from <code>main</code>.</li>
<li>Run <code>npm test</code> to ensure all tests are passing.</li>
<li>Update the version in <a href="https://github.com/actions/cache/blob/main/package.json"><code>https://github.com/actions/cache/blob/main/package.json</code></a>.</li>
<li>Run <code>npm run build</code> to update the compiled files.</li>
<li>Update this <a href="https://github.com/actions/cache/blob/main/RELEASES.md"><code>https://github.com/actions/cache/blob/main/RELEASES.md</code></a> with the new version and changes in the <code>## Changelog</code> section.</li>
<li>Run <code>licensed cache</code> to update the license report.</li>
<li>Run <code>licensed status</code> and resolve any warnings by updating the <a href="https://github.com/actions/cache/blob/main/.licensed.yml"><code>https://github.com/actions/cache/blob/main/.licensed.yml</code></a> file with the exceptions.</li>
<li>Commit your changes and push your branch upstream.</li>
<li>Open a pull request against <code>main</code> and get it reviewed and merged.</li>
<li>Draft a new release <a href="https://github.com/actions/cache/releases">https://github.com/actions/cache/releases</a> use the same version number used in <code>package.json</code>
<ol>
<li>Create a new tag with the version number.</li>
<li>Auto generate release notes and update them to match the changes you made in <code>RELEASES.md</code>.</li>
<li>Toggle the set as the latest release option.</li>
<li>Publish the release.</li>
</ol>
</li>
<li>Navigate to <a href="https://github.com/actions/cache/actions/workflows/release-new-action-version.yml">https://github.com/actions/cache/actions/workflows/release-new-action-version.yml</a>
<ol>
<li>There should be a workflow run queued with the same version number.</li>
<li>Approve the run to publish the new version and update the major tags for this action.</li>
</ol>
</li>
</ol>
<h2>Changelog</h2>
<h3>5.0.3</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v5.0.5 (Resolves: <a href="https://github.com/actions/cache/security/dependabot/33">https://github.com/actions/cache/security/dependabot/33</a>)</li>
<li>Bump <code>@actions/core</code> to v2.0.3</li>
</ul>
<h3>5.0.2</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v5.0.3 <a href="">#1692</a></li>
</ul>
<h3>5.0.1</h3>
<ul>
<li>Update <code>@azure/storage-blob</code> to <code>^12.29.1</code> via <code>@actions/cache@5.0.1</code> <a href="">#1685</a></li>
</ul>
<h3>5.0.0</h3>
<blockquote>
<p>[!IMPORTANT]
<code>actions/cache@v5</code> runs on the Node.js 24 runtime and requires a minimum Actions Runner version of <code>2.327.1</code>.
If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<h3>4.3.0</h3>
<ul>
<li>Bump <code>@actions/cache</code> to <a href="">v4.1.0</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cdf6c1f</code></a> Merge pull request <a href="">#1695</a> from actions/Link-/prepare-5.0.3</li>
<li><a href=""><code>a1bee22</code></a> Add review for the <code>@​actions/http-client</code> license</li>
<li><a href=""><code>4695763</code></a> Add licensed output</li>
<li><a href=""><code>dc73bb9</code></a> Upgrade dependencies and address security warnings</li>
<li><a href=""><code>345d5c2</code></a> Add 5.0.3 builds</li>
<li><a href=""><code>8b402f5</code></a> Merge pull request <a href="">#1692</a> from GhadimiR/main</li>
<li><a href=""><code>304ab5a</code></a> license for httpclient</li>
<li><a href=""><code>609fc19</code></a> Update licensed record for cache</li>
<li><a href=""><code>b22231e</code></a> Build</li>
<li><a href=""><code>93150cd</code></a> Add PR link to releases</li>
<li>Additional commits viewable in <a href="https://github.com/actions/cache/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/upload-artifact` from 4 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/upload-artifact/releases">actions/upload-artifact's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>v6 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/upload-artifact@v6 now runs on Node.js 24 (<code>runs.using: node24</code>) and requires a minimum Actions Runner version of 2.327.1. If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<h3>Node.js 24</h3>
<p>This release updates the runtime to Node.js 24. v5 had preliminary support for Node.js 24, however this action was by default still running on Node.js 20. Now this action by default will run on Node.js 24.</p>
<h2>What's Changed</h2>
<ul>
<li>Upload Artifact Node 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#719</a></li>
<li>fix: update <code>@​actions/artifact</code> for Node.js 24 punycode deprecation by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#744</a></li>
<li>prepare release v6.0.0 for Node.js 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#745</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v5.0.0...v6.0.0">https://github.com/actions/upload-artifact/compare/v5.0.0...v6.0.0</a></p>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b7c566a</code></a> Merge pull request <a href="">#745</a> from actions/upload-artifact-v6-release</li>
<li><a href=""><code>e516bc8</code></a> docs: correct description of Node.js 24 support in README</li>
<li><a href=""><code>ddc45ed</code></a> docs: update README to correct action name for Node.js 24 support</li>
<li><a href=""><code>615b319</code></a> chore: release v6.0.0 for Node.js 24 support</li>
<li><a href=""><code>017748b</code></a> Merge pull request <a href="">#744</a> from actions/fix-storage-blob</li>
<li><a href=""><code>38d4c79</code></a> chore: rebuild dist</li>
<li><a href=""><code>7d27270</code></a> chore: add missing license cache files for <code>@​actions/core</code>, <code>@​actions/io</code>, and mi...</li>
<li><a href=""><code>5f643d3</code></a> chore: update license files for <code>@​actions/artifact</code><a href="https://github.com/5"><code>@​5</code></a>.0.1 dependencies</li>
<li><a href=""><code>1df1684</code></a> chore: update package-lock.json with <code>@​actions/artifact</code><a href="https://github.com/5"><code>@​5</code></a>.0.1</li>
<li><a href=""><code>b5b1a91</code></a> fix: update <code>@​actions/artifact</code> to ^5.0.0 for Node.js 24 punycode fix</li>
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/v4...v6">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a1a4f859d09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.