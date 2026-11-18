# Issue

**Title:** Bump matlab-actions/setup-matlab from 2.5.0 to 2.6.0

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 2.5.0 to 2.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
<h2>v2.6.0</h2>
<h2>Features</h2>
<ul>
<li>With the <code>cache</code> input specified as <code>true</code>, the action now caches MATLAB if it is set up successfully. Previously, the action cached MATLAB only if the entire job completed successfully.</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Action dependencies have been updated based on <code>npm audit</code> and <code>npm outdated</code>.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3929308</code></a> Build for 70cd02d</li>
<li><a href=""><code>70cd02d</code></a> [skip ci] Bump v2.6.0</li>
<li><a href=""><code>5139c0a</code></a> [skip ci] Revert to v2.5.0</li>
<li><a href=""><code>9f16bff</code></a> Update publish.yml</li>
<li><a href=""><code>64471cb</code></a> [skip ci] Bump v2.6.0</li>
<li><a href=""><code>646a2e2</code></a> Update dependencies (<a href="">#155</a>)</li>
<li><a href=""><code>2003946</code></a> Bump form-data from 2.5.3 to 2.5.5 (<a href="">#153</a>)</li>
<li><a href=""><code>14aba26</code></a> adding a note about external language interfaces</li>
<li><a href=""><code>1dcf7e8</code></a> Cache when install successful (<a href="">#148</a>)</li>
<li><a href=""><code>bd5e318</code></a> streamlining text about licensing</li>
<li>See full diff in <a href="https://github.com/matlab-actions/setup-matlab/compare/v2.5.0...v2.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=2.5.0&new-version=2.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e46b9be0424a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.