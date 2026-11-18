# Issue

**Title:** Bump matlab-actions/setup-matlab from 1.2.5 to 2.0.0

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 1.2.5 to 2.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
<h2>v2.0.0</h2>
<ul>
<li>Add Windows and macOS support</li>
<li>Allow specifying products to install</li>
<li>Allow caching MATLAB installation</li>
</ul>
<h2>v2-beta</h2>
<p>Pre-release that uses token based licensing and mpm to setup MATLAB. If public licensing is required, this pre-release is only compatible with matlab-actions/run-command versions &gt;= 1.1.0 and matlab-actions/run-tests versions &gt;= 1.3.0.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>28eae5f</code></a> Build for 5a2d015</li>
<li><a href=""><code>5a2d015</code></a> [skip ci] Bump v2.0.0</li>
<li><a href=""><code>bb6404a</code></a> Update package.json to fix version conflict</li>
<li><a href=""><code>c597a06</code></a> update matlab-action versions in bat.yml</li>
<li><a href=""><code>1d65426</code></a> Merge v2-beta changes to main (<a href="">#86</a>)</li>
<li>See full diff in <a href="https://github.com/matlab-actions/setup-matlab/compare/v1.2.5...v2.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=1.2.5&new-version=2.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce0c6a9a26be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.