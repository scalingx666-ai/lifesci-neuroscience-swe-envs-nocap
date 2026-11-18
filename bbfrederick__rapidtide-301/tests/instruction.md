# Issue

**Title:** Bump github/codeql-action from 4.39.0 to 4.39.1

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.39.0 to 4.39.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.39.1</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.3">2.27.3</a>. <a href="">#4256</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.39.1 - 21 Oct 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.3">2.27.3</a>. <a href="">#4256</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9b32540</code></a> Merge pull request <a href="">#4257</a> from github/update-v4.39.1-c5a2f4b0f</li>
<li><a href=""><code>b5e1ed9</code></a> Trigger workflows</li>
<li><a href=""><code>20f5ec3</code></a> Update changelog for v4.39.1</li>
<li><a href=""><code>c5a2f4b</code></a> Merge pull request <a href="">#4245</a> from github/henrymercer/graduate-overlay-trap-caching</li>
<li><a href=""><code>61a5a80</code></a> Merge pull request <a href="">#4256</a> from github/update-bundle/codeql-bundle-v2.27.3</li>
<li><a href=""><code>3dd33f8</code></a> Merge pull request <a href="">#4249</a> from github/mbg/upload-improvements-for-4223</li>
<li><a href=""><code>b96e339</code></a> Change comment for <code>getConfig</code> call in <code>upload-sarif</code></li>
<li><a href=""><code>7fa4518</code></a> Use <code>shouldSkipSarifUpload</code> in <code>analyze-action.ts</code></li>
<li><a href=""><code>a69c7cb</code></a> Document that setting the env vars to <code>false</code> takes precedence</li>
<li><a href=""><code>74ddcd9</code></a> Fix typo in comment</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.39.0...v4.39.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.39.0&new-version=4.39.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77f33d7e97e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.