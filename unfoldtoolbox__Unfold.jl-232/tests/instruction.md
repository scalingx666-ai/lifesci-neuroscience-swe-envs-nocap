# Issue

**Title:** Bump actions/upload-artifact from 2 to 4

## Description

Bumps [actions/upload-artifact](https://github.com/actions/upload-artifact) from 2 to 4.
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
<h2>v3.2.1</h2>
<h2>What's Changed</h2>
<p>This fixes the <code>include-hidden-files</code> input introduced in <a href="https://github.com/actions/upload-artifact/releases/tag/v3.2.0">https://github.com/actions/upload-artifact/releases/tag/v3.2.0</a></p>
<ul>
<li>Ensure hidden files input is used by <a href="https://github.com/joshmgross"><code>@​joshmgross</code></a> in <a href="">actions/upload-artifact#609</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v3.2.0...v3.2.1">https://github.com/actions/upload-artifact/compare/v3.2.0...v3.2.1</a></p>
<h2>v3.2.1-node20</h2>
<h2>What's Changed</h2>
<p>This fixes the <code>include-hidden-files</code> input introduced in <a href="https://github.com/actions/upload-artifact/releases/tag/v3.2.0-node20">https://github.com/actions/upload-artifact/releases/tag/v3.2.0-node20</a></p>
<ul>
<li>Ensure hidden files input is used by <a href="https://github.com/joshmgross"><code>@​joshmgross</code></a> in <a href="">actions/upload-artifact#608</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v3.2.0-node20...v3.2.1-node20">https://github.com/actions/upload-artifact/compare/v3.2.0-node20...v3.2.1-node20</a></p>
<h2>v3.2.0</h2>
<h2>Notice: Breaking Changes :warning:</h2>
<p>We will no longer include hidden files and folders by default in the <code>upload-artifact</code> action of this version. This reduces the risk that credentials are accidentally uploaded into artifacts. Customers who need to continue to upload these files can use a new option, <code>include-hidden-files</code>, to continue to do so.</p>
<p>See <a href="https://github.blog/changelog/2024-08-19-notice-of-upcoming-deprecations-and-breaking-changes-in-github-actions-runners/">&quot;Notice of upcoming deprecations and breaking changes in GitHub Actions runners&quot;</a> changelog and <a href="">this issue</a> for more details.</p>
<h2>What's Changed</h2>
<ul>
<li>V3 backport: Exclude hidden files by default by <a href="https://github.com/SrRyan"><code>@​SrRyan</code></a> in <a href="">actions/upload-artifact#604</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6f51ac0</code></a> Merge pull request <a href="">#656</a> from bdehamer/bdehamer/artifact-digest</li>
<li><a href=""><code>c40c16d</code></a> add new artifact-digest output</li>
<li><a href=""><code>735efb4</code></a> bump <code>@​actions/artifact</code> from 2.1.11 to 2.2.0</li>
<li><a href=""><code>184d73b</code></a> Merge pull request <a href="">#578</a> from hamirmahal/fix/deprecated-nodejs-usage-in-action</li>
<li><a href=""><code>b4a0a98</code></a> Merge branch 'main' into fix/deprecated-nodejs-usage-in-action</li>
<li><a href=""><code>b4b15b8</code></a> Merge pull request <a href="">#632</a> from actions/joshmgross/undo-dependency-changes</li>
<li><a href=""><code>92b01eb</code></a> Undo indirect dependency updates from <a href="">#627</a></li>
<li><a href=""><code>8448086</code></a> Merge pull request <a href="">#627</a> from actions/robherley/v4.4.2</li>
<li><a href=""><code>b1d4642</code></a> add explicit relative and absolute symlinks to workflow</li>
<li><a href=""><code>d50e660</code></a> bump version</li>
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/v2...v4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/upload-artifact&package-manager=github_actions&previous-version=2&new-version=4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `396dd2c76974`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.