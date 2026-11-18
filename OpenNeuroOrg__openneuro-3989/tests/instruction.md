# Issue

**Title:** chore(deps-dev): Bump vite from 7.3.2 to 7.3.5

## Description

Bumps [vite](https://github.com/vitejs/vite/tree/HEAD/packages/vite) from 7.3.2 to 7.3.5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/vitejs/vite/releases">vite's releases</a>.</em></p>
<blockquote>
<h2>v7.3.5</h2>
<p>Please refer to <a href="https://github.com/vitejs/vite/blob/v7.3.5/packages/vite/CHANGELOG.md">CHANGELOG.md</a> for details.</p>
<h2>v7.3.3</h2>
<p>Please refer to <a href="https://github.com/vitejs/vite/blob/v7.3.3/packages/vite/CHANGELOG.md">CHANGELOG.md</a> for details.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/vitejs/vite/blob/v7.3.5/packages/vite/CHANGELOG.md">vite's changelog</a>.</em></p>
<blockquote>
<h2><!-- raw HTML omitted --><a href="https://github.com/vitejs/vite/compare/v7.3.3...v7.3.5">7.3.5</a> (2026-06-01)<!-- raw HTML omitted --></h2>
<h3>Bug Fixes</h3>
<ul>
<li>backport <a href="">#22572</a>, reject windows alternate paths (<a href="">#22574</a>) (<a href="">8c18556</a>)</li>
<li><strong>deps:</strong> backport <a href="">#22571</a>, reject UNC paths for launch-editor-middleware (<a href="">#22573</a>) (<a href="">f20d64b</a>)</li>
</ul>
<h3>Miscellaneous Chores</h3>
<ul>
<li>skip v7.3.4 release (<a href="">8a6a0c9</a>)</li>
</ul>
<h2><!-- raw HTML omitted --><a href="https://github.com/vitejs/vite/compare/v7.3.3...v7.3.4">7.3.4</a> (2026-06-01)<!-- raw HTML omitted --></h2>
<h3>Bug Fixes</h3>
<ul>
<li>backport <a href="">#22572</a>, reject windows alternate paths (<a href="">#22574</a>) (<a href="">8c18556</a>)</li>
<li><strong>deps:</strong> backport <a href="">#22571</a>, reject UNC paths for launch-editor-middleware (<a href="">#22573</a>) (<a href="">f20d64b</a>)</li>
</ul>
<h2><!-- raw HTML omitted --><a href="https://github.com/vitejs/vite/compare/v7.3.2...v7.3.3">7.3.3</a> (2026-05-07)<!-- raw HTML omitted --></h2>
<h3>Bug Fixes</h3>
<ul>
<li>avoid destructure lowering for newer safari (<a href="">#22346</a>) (<a href="">5ab51c0</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>077945c</code></a> release: v7.3.5</li>
<li><a href=""><code>8a6a0c9</code></a> chore: skip v7.3.4 release</li>
<li><a href=""><code>8c18556</code></a> fix: backport <a href="">#22572</a>, reject windows alternate paths (<a href="">#22574</a>)</li>
<li><a href=""><code>f20d64b</code></a> fix(deps): backport <a href="">#22571</a>, reject UNC paths for launch-editor-middleware (<a href="">#2</a>...</li>
<li><a href=""><code>ca31424</code></a> release: v7.3.3</li>
<li><a href=""><code>5ab51c0</code></a> fix: avoid destructure lowering for newer safari (<a href="">#22346</a>)</li>
<li>See full diff in <a href="https://github.com/vitejs/vite/commits/v7.3.5/packages/vite">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vite&package-manager=npm_and_yarn&previous-version=7.3.2&new-version=7.3.5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9b0e8d7254f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.