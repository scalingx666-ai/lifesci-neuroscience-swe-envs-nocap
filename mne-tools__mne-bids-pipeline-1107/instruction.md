# Issue

**Title:** [dependabot]: Bump actions/download-artifact from 4 to 5

## Description

Bumps [actions/download-artifact](https://github.com/actions/download-artifact) from 4 to 5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
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
<p>Previously, <strong>single artifact downloads</strong> behaved differently depending on how you specified the artifact:</p>
<ul>
<li><strong>By name</strong>: <code>name: my-artifact</code> → extracted to <code>path/</code> (direct)</li>
<li><strong>By ID</strong>: <code>artifact-ids: 12345</code> → extracted to <code>path/my-artifact/</code> (nested)</li>
</ul>
<p>Now both methods are consistent:</p>
<ul>
<li><strong>By name</strong>: <code>name: my-artifact</code> → extracted to <code>path/</code> (unchanged)</li>
<li><strong>By ID</strong>: <code>artifact-ids: 12345</code> → extracted to <code>path/</code> (fixed - now direct)</li>
</ul>
<h4>Migration Guide</h4>
<h5>✅ No Action Needed If:</h5>
<ul>
<li>You download artifacts by <strong>name</strong></li>
<li>You download <strong>multiple</strong> artifacts by ID</li>
<li>You already use <code>merge-multiple: true</code> as a workaround</li>
</ul>
<h5>⚠️ Action Required If:</h5>
<p>You download <strong>single artifacts by ID</strong> and your workflows expect the nested directory structure.</p>
<p><strong>Before v5 (nested structure):</strong></p>
<pre lang="yaml"><code>- uses: actions/download-artifact@v4
  with:
    artifact-ids: 12345
    path: dist
# Files were in: dist/my-artifact/
</code></pre>
<blockquote>
<p>Where <code>my-artifact</code> is the name of the artifact you previously uploaded</p>
</blockquote>
<p><strong>To maintain old behavior (if needed):</strong></p>
<pre lang="yaml"><code>&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>634f93c</code></a> Merge pull request <a href="">#416</a> from actions/single-artifact-id-download-path</li>
<li><a href=""><code>b19ff43</code></a> refactor: resolve download path correctly in artifact download tests (mainly ...</li>
<li><a href=""><code>e262cbe</code></a> bundle dist</li>
<li><a href=""><code>bff23f9</code></a> update docs</li>
<li><a href=""><code>fff8c14</code></a> fix download path logic when downloading a single artifact by id</li>
<li><a href=""><code>448e3f8</code></a> Merge pull request <a href="">#407</a> from actions/nebuk89-patch-1</li>
<li><a href=""><code>47225c4</code></a> Update README.md</li>
<li>See full diff in <a href="https://github.com/actions/download-artifact/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/download-artifact&package-manager=github_actions&previous-version=4&new-version=5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbab2d18833c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.