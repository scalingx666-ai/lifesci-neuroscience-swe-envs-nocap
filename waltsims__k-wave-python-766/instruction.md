# Issue

**Title:** Bump soupsieve from 2.8.3 to 2.8.4

## Description

Bumps [soupsieve](https://github.com/facelessuser/soupsieve) from 2.8.3 to 2.8.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/soupsieve/releases">soupsieve's releases</a>.</em></p>
<blockquote>
<h2>2.8.4</h2>
<ul>
<li><strong>FIX</strong>: Fix another inefficient attribute pattern (<a href="https://github.com/mauriceng98"><code>@​mauriceng98</code></a>).</li>
<li><strong>FIX</strong>: Limit total number of selectors processed in a pattern to prevent massive selector requests (<a href="https://github.com/mauriceng98"><code>@​mauriceng98</code></a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>28108ab</code></a> Limit excessive selectors</li>
<li><a href=""><code>ef18872</code></a> Fix test for Windows</li>
<li><a href=""><code>eb43976</code></a> Merge commit from fork</li>
<li><a href=""><code>3a661b2</code></a> Fix typo in pseudo-classes.md (<a href="">#294</a>)</li>
<li><a href=""><code>0cb533d</code></a> Update hatchling version requirement in pyproject.toml (<a href="">#290</a>)</li>
<li>See full diff in <a href="https://github.com/facelessuser/soupsieve/compare/2.8.3...2.8.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=soupsieve&package-manager=uv&previous-version=2.8.3&new-version=2.8.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/waltsims/k-wave-python/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2f5cbd3b354`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.