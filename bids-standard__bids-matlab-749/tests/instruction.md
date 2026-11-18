# Issue

**Title:** Bump matlab-actions/setup-matlab from 2.3.0 to 2.3.1

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 2.3.0 to 2.3.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
<h2>v2.3.1</h2>
<h3><strong>Bug Fixes</strong></h3>
<ul>
<li><strong>setup-matlab</strong> can now be called multiple times within a single workflow to install different releases of MATLAB. In previous releases, attempting to configure two different releases in the same workflow resulted in an error. For more information, see <a href="">issue#130</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>06d9ddc</code></a> Build for 9697dc2</li>
<li><a href=""><code>9697dc2</code></a> [skip ci] Bump v2.3.1</li>
<li><a href=""><code>b41cf6a</code></a> Merge pull request <a href="">#135</a> from matlab-actions/fix_130</li>
<li><a href=""><code>f17c71c</code></a> Delete mpm file if it exists</li>
<li><a href=""><code>2b689a9</code></a> Add test for calling setup-matlab twice</li>
<li><a href=""><code>7e9161d</code></a> Add check if mpm already exists</li>
<li><a href=""><code>250e572</code></a> Merge pull request <a href="">#124</a> from matlab-actions/self_hosted_support</li>
<li><a href=""><code>b50a758</code></a> Merge pull request <a href="">#125</a> from matlab-actions/cache_revert</li>
<li><a href=""><code>b410805</code></a> Remove potentially poisoned MATLAB intall when mpm fails</li>
<li><a href=""><code>80640a3</code></a> Remove destination folder if mpm fails</li>
<li>Additional commits viewable in <a href="https://github.com/matlab-actions/setup-matlab/compare/v2.3.0...v2.3.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=2.3.0&new-version=2.3.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba453b7e81c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.