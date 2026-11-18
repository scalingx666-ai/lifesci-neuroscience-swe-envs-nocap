# Issue

**Title:** build(deps): bump the actions-infrastructure group with 3 updates

## Description

Bumps the actions-infrastructure group with 3 updates: [actions/checkout](https://github.com/actions/checkout), [actions/cache](https://github.com/actions/cache) and [actions/download-artifact](https://github.com/actions/download-artifact).

Updates `actions/checkout` from 4.3.1 to 6.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v6.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Update all references from v5 and v4 to v6 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2314</a></li>
<li>Add worktree support for persist-credentials includeIf by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2327</a></li>
<li>Clarify v6 README by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2328</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v6...v6.0.1">https://github.com/actions/checkout/compare/v6...v6.0.1</a></p>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update README to include Node.js 24 support details and requirements by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2248</a></li>
<li>Persist creds to a separate file by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2286</a></li>
<li>v6-beta by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2298</a></li>
<li>update readme/changelog for v6 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2311</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v5.0.0...v6.0.0">https://github.com/actions/checkout/compare/v5.0.0...v6.0.0</a></p>
<h2>v6-beta</h2>
<h2>What's Changed</h2>
<p>Updated persist-credentials to store the credentials under <code>$RUNNER_TEMP</code> instead of directly in the local git config.</p>
<p>This requires a minimum Actions Runner version of <a href="https://github.com/actions/runner/releases/tag/v2.329.0">v2.329.0</a> to access the persisted credentials for <a href="https://docs.github.com/en/actions/tutorials/use-containerized-services/create-a-docker-container-action">Docker container action</a> scenarios.</p>
<h2>v5.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Port v6 cleanup to v5 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2301</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v5...v5.0.1">https://github.com/actions/checkout/compare/v5...v5.0.1</a></p>
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update actions checkout to use node 24 by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2226</a></li>
<li>Prepare v5.0.0 release by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2238</a></li>
</ul>
<h2>⚠️ Minimum Compatible Runner Version</h2>
<p><strong>v2.327.1</strong><br />
<a href="https://github.com/actions/runner/releases/tag/v2.327.1">Release Notes</a></p>
<p>Make sure your runner is updated to this version or newer to use this release.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v4...v5.0.0">https://github.com/actions/checkout/compare/v4...v5.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8e8c483</code></a> Clarify v6 README (<a href="">#2328</a>)</li>
<li><a href=""><code>033fa0d</code></a> Add worktree support for persist-credentials includeIf (<a href="">#2327</a>)</li>
<li><a href=""><code>c2d88d3</code></a> Update all references from v5 and v4 to v6 (<a href="">#2314</a>)</li>
<li><a href=""><code>1af3b93</code></a> update readme/changelog for v6 (<a href="">#2311</a>)</li>
<li><a href=""><code>71cf226</code></a> v6-beta (<a href="">#2298</a>)</li>
<li><a href=""><code>069c695</code></a> Persist creds to a separate file (<a href="">#2286</a>)</li>
<li><a href=""><code>ff7abcd</code></a> Update README to include Node.js 24 support details and requirements (<a href="">#2248</a>)</li>
<li><a href=""><code>08c6903</code></a> Prepare v5.0.0 release (<a href="">#2238</a>)</li>
<li><a href=""><code>9f26565</code></a> Update actions checkout to use node 24 (<a href="">#2226</a>)</li>
<li>See full diff in <a href="https://github.com/actions/checkout/compare/v4.3.1...v6.0.1">compare view</a></li>
</ul>
</details>
<br />

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
<h2>Changelog</h2>
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
<h3>4.2.4</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.5</li>
</ul>
<h3>4.2.3</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.3 (obfuscates SAS token in debug logs for cache entries)</li>
</ul>
<h3>4.2.2</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.2</li>
</ul>
<h3>4.2.1</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v4.0.1</li>
</ul>
<h3>4.2.0</h3>
<p>TLDR; The cache backend service has been rewritten from the ground up for improved performance and reliability. <a href="https://github.com/actions/cache">actions/cache</a> now integrates with the new cache service (v2) APIs.</p>
<p>The new service will gradually roll out as of <strong>February 1st, 2025</strong>. The legacy service will also be sunset on the same date. Changes in these release are <strong>fully backward compatible</strong>.</p>
<p><strong>We are deprecating some versions of this action</strong>. We recommend upgrading to version <code>v4</code> or <code>v3</code> as soon as possible before <strong>February 1st, 2025.</strong> (Upgrade instructions below).</p>
<p>If you are using pinned SHAs, please use the SHAs of versions <code>v4.2.0</code> or <code>v3.4.0</code></p>
<p>If you do not upgrade, all workflow runs using any of the deprecated <a href="https://github.com/actions/cache">actions/cache</a> will fail.</p>
<p>Upgrading to the recommended versions will not break your workflows.</p>
<h3>4.1.2</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9255dc7</code></a> Merge pull request <a href="">#1686</a> from actions/cache-v5.0.1-release</li>
<li><a href=""><code>8ff5423</code></a> chore: release v5.0.1</li>
<li><a href=""><code>9233019</code></a> Merge pull request <a href="">#1685</a> from salmanmkc/node24-storage-blob-fix</li>
<li><a href=""><code>b975f2b</code></a> fix: add peer property to package-lock.json for dependencies</li>
<li><a href=""><code>d0a0e18</code></a> fix: update license files for <code>@​actions/cache</code>, fast-xml-parser, and strnum</li>
<li><a href=""><code>74de208</code></a> fix: update <code>@​actions/cache</code> to ^5.0.1 for Node.js 24 punycode fix</li>
<li><a href=""><code>ac7f115</code></a> peer</li>
<li><a href=""><code>b0f846b</code></a> fix: update <code>@​actions/cache</code> with storage-blob fix for Node.js 24 punycode depr...</li>
<li><a href=""><code>a783357</code></a> Merge pull request <a href="">#1684</a> from actions/prepare-cache-v5-release</li>
<li><a href=""><code>3bb0d78</code></a> docs: highlight v5 runner requirement in releases</li>
<li>Additional commits viewable in <a href="https://github.com/actions/cache/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/download-artifact` from 4 to 7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v7.0.0</h2>
<h2>v7 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/download-artifact@v7 now runs on Node.js 24 (<code>runs.using: node24</code>) and requires a minimum Actions Runner version of 2.327.1. If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<h3>Node.js 24</h3>
<p>This release updates the runtime to Node.js 24. v6 had preliminary support for Node 24, however this action was by default still running on Node.js 20. Now this action by default will run on Node.js 24.</p>
<h2>What's Changed</h2>
<ul>
<li>Update GHES guidance to include reference to Node 20 version by <a href="https://github.com/patrikpolyak"><code>@​patrikpolyak</code></a> in <a href="">actions/download-artifact#440</a></li>
<li>Download Artifact Node24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#415</a></li>
<li>fix: update <code>@​actions/artifact</code> to fix Node.js 24 punycode deprecation by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#451</a></li>
<li>prepare release v7.0.0 for Node.js 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#452</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/patrikpolyak"><code>@​patrikpolyak</code></a> made their first contribution in <a href="">actions/download-artifact#440</a></li>
<li><a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> made their first contribution in <a href="">actions/download-artifact#415</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v6.0.0...v7.0.0">https://github.com/actions/download-artifact/compare/v6.0.0...v7.0.0</a></p>
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
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update README.md by <a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> in <a href="">actions/download-artifact#407</a></li>
<li>BREAKING fix: inconsistent path behavior for single artifact downloads by ID by <a href="https://github.com/GrantBirki"><code>@​GrantBirki</code></a> in <a href="">actions/download-artifact#416</a></li>
</ul>
<h2>v5.0.0</h2>
<h3>🚨 Breaking Change</h3>
<p>This release fixes an inconsistency in path behavior for single artifact downloads by ID. <strong>If you're downloading single artifacts by ID, the output path may change.</strong></p>
<h4>What Changed</h4>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>37930b1</code></a> Merge pull request <a href="">#452</a> from actions/download-artifact-v7-release</li>
<li><a href=""><code>72582b9</code></a> doc: update readme</li>
<li><a href=""><code>0d2ec9d</code></a> chore: release v7.0.0 for Node.js 24 support</li>
<li><a href=""><code>fd7ae8f</code></a> Merge pull request <a href="">#451</a> from actions/fix-storage-blob</li>
<li><a href=""><code>d484700</code></a> chore: restore minimatch.dep.yml license file</li>
<li><a href=""><code>03a8080</code></a> chore: remove obsolete dependency license files</li>
<li><a href=""><code>56fe6d9</code></a> chore: update <code>@​actions/artifact</code> license file to 5.0.1</li>
<li><a href=""><code>8e3ebc4</code></a> chore: update package-lock.json with <code>@​actions/artifact</code><a href="https://github.com/5"><code>@​5</code></a>.0.1</li>
<li><a href=""><code>1e3c4b4</code></a> fix: update <code>@​actions/artifact</code> to ^5.0.0 for Node.js 24 punycode fix</li>
<li><a href=""><code>458627d</code></a> chore: use local <code>@​actions/artifact</code> package for Node.js 24 testing</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/v4...v7">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba8c1bdff06c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.