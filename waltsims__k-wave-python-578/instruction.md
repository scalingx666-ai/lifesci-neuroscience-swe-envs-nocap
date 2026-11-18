# Issue

**Title:** Bump pre-commit from 4.1.0 to 4.2.0

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 4.1.0 to 4.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.2.0</h2>
<h3>Features</h3>
<ul>
<li>For <code>language: python</code> first attempt a versioned python executable for the default language version before consulting a potentially unversioned <code>sys.executable</code>.
<ul>
<li><a href="">#3430</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle error during conflict detection when a file is named &quot;HEAD&quot;
<ul>
<li><a href="">#3425</a> PR by <a href="https://github.com/tusharsadhwani"><code>@​tusharsadhwani</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.2.0 - 2025-03-18</h1>
<h3>Features</h3>
<ul>
<li>For <code>language: python</code> first attempt a versioned python executable for
the default language version before consulting a potentially unversioned
<code>sys.executable</code>.
<ul>
<li><a href="">#3430</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle error during conflict detection when a file is named &quot;HEAD&quot;
<ul>
<li><a href="">#3425</a> PR by <a href="https://github.com/tusharsadhwani"><code>@​tusharsadhwani</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>aa48766</code></a> v4.2.0</li>
<li><a href=""><code>bf6f11d</code></a> Merge pull request <a href="">#3430</a> from pre-commit/preferential-sys-impl</li>
<li><a href=""><code>3e8d0f5</code></a> adjust python default_language_version to prefer versioned exe</li>
<li><a href=""><code>ff7256c</code></a> Merge pull request <a href="">#3425</a> from tusharsadhwani/ambiguous-ref</li>
<li><a href=""><code>b7eb412</code></a> fix: crash on ambiguous ref 'HEAD'</li>
<li><a href=""><code>7b88c63</code></a> Merge pull request <a href="">#3404</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>94b97e2</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>2f93b80</code></a> Merge pull request <a href="">#3401</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>4f90a1e</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>aba1ce0</code></a> Merge pull request <a href="">#3396</a> from pre-commit/all-repos_autofix_all-repos-sed</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v4.1.0...v4.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&package-manager=pip&previous-version=4.1.0&new-version=4.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9a1300e7fe8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.