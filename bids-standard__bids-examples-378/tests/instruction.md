# Issue

**Title:** Bump actions/setup-node from 2 to 3

## Description

Bumps [actions/setup-node](https://github.com/actions/setup-node) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-node/releases">actions/setup-node's releases</a>.</em></p>
<blockquote>
<h2>Add support for asdf format and update actions/cache version to 3.0.0</h2>
<p>In scope of this release we updated <code>actions/cache</code> package as the new version contains fixes for <a href="">caching error handling</a>. Moreover, we added support for asdf format as Node.js version file <a href="">actions/setup-node#373</a>. Besides, we introduced new output <a href="">node-version</a> and added <code>npm-shrinkwrap.json</code> to dependency file patterns: <a href="">actions/setup-node#439</a></p>
<h2>Update actions/cache version to 2.0.2</h2>
<p>In scope of this release we updated <code>actions/cache</code> package as the new version contains fixes related to GHES 3.5 (<a href="">actions/setup-node#460</a>)</p>
<h2>v3.0.0</h2>
<p>In scope of this release we changed version of the runtime Node.js for the setup-node action and updated package-lock.json file to  v2.</p>
<h3>Breaking Changes</h3>
<ul>
<li>With the update to Node 16 in <a href="">actions/setup-node#414</a>, all scripts will now be run with Node 16 rather than Node 12.</li>
<li>We removed deprecated <code>version</code> input (<a href="">actions/setup-node#424</a>). Please use <code>node-version</code> input instead.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>64ed1c7</code></a> Add support for v8-canary, nightly and rc (<a href="">#655</a>)</li>
<li><a href=""><code>92a57f4</code></a> Merge pull request <a href="">#650</a> from actions/update-code-owners</li>
<li><a href=""><code>99e61d6</code></a> Update CODEOWNERS</li>
<li><a href=""><code>3e8819f</code></a> Merge pull request <a href="">#649</a> from actions/update-codeowners</li>
<li><a href=""><code>8cd2fb2</code></a> Update CODEOWNERS</li>
<li><a href=""><code>c406543</code></a> Merge pull request <a href="">#647</a> from akv-platform/apply-reusable-workflows</li>
<li><a href=""><code>92a07fe</code></a> Fix review points</li>
<li><a href=""><code>217387c</code></a> Update action to use reusable-workflows repo</li>
<li><a href=""><code>2db3663</code></a> Merge branch 'main' of <a href="https://github.com/akv-platform/setup-node">https://github.com/akv-platform/setup-node</a> into apply-...</li>
<li><a href=""><code>bbe2ac7</code></a> Fix typo in README (<a href="">#646</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/setup-node/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/setup-node&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e96b7021a521`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.