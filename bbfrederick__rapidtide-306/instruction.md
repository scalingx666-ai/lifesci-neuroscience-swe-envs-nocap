# Issue

**Title:** Bump github/codeql-action from 4.39.2 to 4.39.3

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.39.2 to 4.39.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.39.3</h2>
<ul>
<li>Fixed diff-informed alert filtering incorrectly removing alerts in changed files whose paths contain spaces, special characters, or non-ASCII characters. <a href="">#4283</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.39.3 - 04 Nov 2026</h2>
<ul>
<li>Fixed diff-informed alert filtering incorrectly removing alerts in changed files whose paths contain spaces, special characters, or non-ASCII characters. <a href="">#4283</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>33d7b85</code></a> Merge pull request <a href="">#4299</a> from github/update-v4.39.3-064910ba2</li>
<li><a href=""><code>24393f8</code></a> Update changelog for v4.39.3</li>
<li><a href=""><code>064910b</code></a> Merge pull request <a href="">#4297</a> from github/mbg/update-glob</li>
<li><a href=""><code>f532ac5</code></a> Update <code>glob</code> to <code>14.0.3</code></li>
<li><a href=""><code>8cd4dfa</code></a> Merge pull request <a href="">#4280</a> from github/mbg/ci/validate-yaml</li>
<li><a href=""><code>cea289b</code></a> Return different exit code when a language is not recognised</li>
<li><a href=""><code>7287bb3</code></a> Remove <code>exclude</code> entry that's no longer needed</li>
<li><a href=""><code>8eb7cdf</code></a> Use normal <code>.editorconfig</code> pattern</li>
<li><a href=""><code>160e547</code></a> Merge remote-tracking branch 'origin/main' into mbg/ci/validate-yaml</li>
<li><a href=""><code>913e1bb</code></a> Merge pull request <a href="">#4283</a> from github/sam-robson/decode-diff-informed-sarif-uris</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.39.2...v4.39.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.39.2&new-version=4.39.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46f57f4f1e7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.