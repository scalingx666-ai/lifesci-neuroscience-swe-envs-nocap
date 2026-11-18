# Issue

**Title:** Bump pre-commit from 4.5.1 to 4.6.0

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 4.5.1 to 4.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.6.0</h2>
<h3>Features</h3>
<ul>
<li><code>pre-commit hook-impl</code>: allow <code>--hook-dir</code> to be missing to enable easier usage with <code>git</code> 2.54+ git hooks.
<ul>
<li><a href="">#3662</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li><code>pre-commit hook-impl</code>: <code>--hook-type</code> is required.
<ul>
<li><a href="">#3661</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.6.0 - 2026-04-21</h1>
<h3>Features</h3>
<ul>
<li><code>pre-commit hook-impl</code>: allow <code>--hook-dir</code> to be missing to enable easier
usage with <code>git</code> 2.54+ git hooks.
<ul>
<li><a href="">#3662</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li><code>pre-commit hook-impl</code>: <code>--hook-type</code> is required.
<ul>
<li><a href="">#3661</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f35134b</code></a> v4.6.0</li>
<li><a href=""><code>2a51ffc</code></a> Merge pull request <a href="">#3662</a> from pre-commit/hook-impl-optional-hook-dir</li>
<li><a href=""><code>d7dee32</code></a> make --hook-dir optional for hook-impl</li>
<li><a href=""><code>965aeb1</code></a> Merge pull request <a href="">#3661</a> from pre-commit/hook-impl-required</li>
<li><a href=""><code>2eacc06</code></a> --hook-type is required for hook-impl</li>
<li><a href=""><code>f5678bf</code></a> Merge pull request <a href="">#3657</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>054cc5b</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>5c0f302</code></a> Merge pull request <a href="">#3652</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>a5d9114</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>129a1f5</code></a> Merge pull request <a href="">#3641</a> from pre-commit/mxr-patch-1</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v4.5.1...v4.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&package-manager=uv&previous-version=4.5.1&new-version=4.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4537e92a52f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.