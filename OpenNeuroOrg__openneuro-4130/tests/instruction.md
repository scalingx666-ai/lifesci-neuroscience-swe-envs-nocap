# Issue

**Title:** chore(deps-dev): Bump vite from 7.3.5 to 7.3.7

## Description

Bumps [vite](https://github.com/vitejs/vite/tree/HEAD/packages/vite) from 7.3.5 to 7.3.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/vitejs/vite/releases">vite's releases</a>.</em></p>
<blockquote>
<h2>v7.3.7</h2>
<p>Please refer to <a href="https://github.com/vitejs/vite/blob/v7.3.7/packages/vite/CHANGELOG.md">CHANGELOG.md</a> for details.</p>
<h2>v7.3.6</h2>
<p>Please refer to <a href="https://github.com/vitejs/vite/blob/v7.3.6/packages/vite/CHANGELOG.md">CHANGELOG.md</a> for details.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/vitejs/vite/blob/v7.3.7/packages/vite/CHANGELOG.md">vite's changelog</a>.</em></p>
<blockquote>
<h2><!-- raw HTML omitted --><a href="https://github.com/vitejs/vite/compare/v7.3.6...v7.3.7">7.3.7</a> (2026-10-06)<!-- raw HTML omitted --></h2>
<h3>Bug Fixes</h3>
<ul>
<li><strong>deps:</strong> update launch-editor to v2.14.2 (<a href="">#23654</a>) (<a href="">a0a3339</a>)</li>
<li><strong>html:</strong> filename passed to transformIndexHtml should not include queries (<a href="">#23653</a>) (<a href="">8d479f9</a>)</li>
<li><strong>server:</strong> store ids to <code>safeModulePaths</code> rather than URLs (<a href="">#23656</a>) (<a href="">f0d76c7</a>)</li>
</ul>
<h2><!-- raw HTML omitted --><a href="https://github.com/vitejs/vite/compare/v7.3.5...v7.3.6">7.3.6</a> (2026-06-25)<!-- raw HTML omitted --></h2>
<h3>Features</h3>
<ul>
<li>allow esbuild 0.28 (<a href="">#22743</a>) (<a href="">a24931e</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>284f6b5</code></a> release: v7.3.7</li>
<li><a href=""><code>f0d76c7</code></a> fix(server): store ids to <code>safeModulePaths</code> rather than URLs (<a href="">#23656</a>)</li>
<li><a href=""><code>a0a3339</code></a> fix(deps): update launch-editor to v2.14.2 (<a href="">#23654</a>)</li>
<li><a href=""><code>8d479f9</code></a> fix(html): filename passed to transformIndexHtml should not include queries (...</li>
<li><a href=""><code>0a7b53b</code></a> release: v7.3.6</li>
<li><a href=""><code>a24931e</code></a> feat: allow esbuild 0.28 (<a href="">#22743</a>)</li>
<li>See full diff in <a href="https://github.com/vitejs/vite/commits/v7.3.7/packages/vite">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vite&package-manager=npm_and_yarn&previous-version=7.3.5&new-version=7.3.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d397dcd6ca3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.