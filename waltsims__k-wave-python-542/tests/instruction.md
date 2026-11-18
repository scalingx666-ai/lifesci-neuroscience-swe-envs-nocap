# Issue

**Title:** Bump pre-commit from 4.0.1 to 4.1.0

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 4.0.1 to 4.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.1.0</h2>
<h3>Features</h3>
<ul>
<li>Add <code>language: julia</code>.
<ul>
<li><a href="">#3348</a> PR by <a href="https://github.com/fredrikekre"><code>@​fredrikekre</code></a>.</li>
<li><a href="">#2689</a> issue <a href="https://github.com/jmuchovej"><code>@​jmuchovej</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Disable automatic toolchain switching for <code>language: golang</code>.
<ul>
<li><a href="">#3304</a> PR by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3300</a> issue by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3149</a> issue by <a href="https://github.com/nijel"><code>@​nijel</code></a>.</li>
</ul>
</li>
<li>Fix <code>language: r</code> installation when initiated by RStudio.
<ul>
<li><a href="">#3389</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3385</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.1.0 - 2025-01-20</h1>
<h3>Features</h3>
<ul>
<li>Add <code>language: julia</code>.
<ul>
<li><a href="">#3348</a> PR by <a href="https://github.com/fredrikekre"><code>@​fredrikekre</code></a>.</li>
<li><a href="">#2689</a> issue <a href="https://github.com/jmuchovej"><code>@​jmuchovej</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Disable automatic toolchain switching for <code>language: golang</code>.
<ul>
<li><a href="">#3304</a> PR by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3300</a> issue by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3149</a> issue by <a href="https://github.com/nijel"><code>@​nijel</code></a>.</li>
</ul>
</li>
<li>Fix <code>language: r</code> installation when initiated by RStudio.
<ul>
<li><a href="">#3389</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3385</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b152e92</code></a> v4.1.0</li>
<li><a href=""><code>c3125a4</code></a> Merge pull request <a href="">#3389</a> from lorenzwalthert/dev-always-unset-renv</li>
<li><a href=""><code>c2c061c</code></a> fix: ensure env patch is applied for vanilla emulation</li>
<li><a href=""><code>cd429db</code></a> Merge pull request <a href="">#3382</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>9b9f8e2</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>86300a4</code></a> Merge pull request <a href="">#3376</a> from pre-commit/r-gone</li>
<li><a href=""><code>77edad8</code></a> install r on ubuntu runners</li>
<li><a href=""><code>18b3939</code></a> Merge pull request <a href="">#3375</a> from pre-commit/dotnet-tests-ubuntu-latest</li>
<li><a href=""><code>31cb945</code></a> Merge pull request <a href="">#3374</a> from pre-commit/docker-image-tests-ubuntu-22-not-pre...</li>
<li><a href=""><code>28c3d81</code></a> update .net tests to use .net 8</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v4.0.1...v4.1.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&package-manager=pip&previous-version=4.0.1&new-version=4.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c74065af01b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.