# Issue

**Title:** chore(deps): bump the actions-infrastructure group with 2 updates

## Description

Bumps the actions-infrastructure group with 2 updates: [actions/upload-artifact](https://github.com/actions/upload-artifact) and [actions/download-artifact](https://github.com/actions/download-artifact).

Updates `actions/upload-artifact` from 5 to 6
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
</blockquote>
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
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/download-artifact` from 6 to 7
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
</blockquote>
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
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/v6...v7">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f61bcbc1c2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.