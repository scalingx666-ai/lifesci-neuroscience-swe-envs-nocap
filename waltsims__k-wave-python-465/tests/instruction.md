# Issue

**Title:** Bump pre-commit from 3.7.1 to 3.8.0

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 3.7.1 to 3.8.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v3.8.0</h2>
<h3>Features</h3>
<ul>
<li>Implement health checks for <code>language: r</code> so environments are recreated if the system version of R changes.
<ul>
<li><a href="">#3206</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3265</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>3.8.0 - 2024-07-28</h1>
<h3>Features</h3>
<ul>
<li>Implement health checks for <code>language: r</code> so environments are recreated if
the system version of R changes.
<ul>
<li><a href="">#3206</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3265</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d46423f</code></a> v3.8.0</li>
<li><a href=""><code>8133abd</code></a> Merge pull request <a href="">#3265</a> from lorenzwalthert/issue-3206</li>
<li><a href=""><code>da0c1d0</code></a> implement health check for language:r</li>
<li><a href=""><code>f641f6a</code></a> Merge pull request <a href="">#3264</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>a68a19d</code></a> fixes for mypy 1.11</li>
<li><a href=""><code>88317dd</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>faa6f8c</code></a> Merge pull request <a href="">#3244</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>f632459</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>0252908</code></a> Merge pull request <a href="">#3240</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>69b5dce</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v3.7.1...v3.8.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&package-manager=pip&previous-version=3.7.1&new-version=3.8.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2dfa2827844`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.