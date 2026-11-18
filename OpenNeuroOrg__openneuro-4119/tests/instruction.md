# Issue

**Title:** chore(deps): Bump postcss-selector-parser from 7.1.5 to 7.1.6

## Description

Bumps [postcss-selector-parser](https://github.com/postcss/postcss-selector-parser) from 7.1.5 to 7.1.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/releases">postcss-selector-parser's releases</a>.</em></p>
<blockquote>
<h2>7.1.6</h2>
<ul>
<li>fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability (<a href="https://github.com/advisories/GHSA-rj75-hqrm-r3gf">GHSA-rj75-hqrm-r3gf</a>, reported by Wayde Shi)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/blob/main/CHANGELOG.md">postcss-selector-parser's changelog</a>.</em></p>
<blockquote>
<h2>7.1.6 - 2026-09-03</h2>
<ul>
<li>fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability (<a href="https://github.com/advisories/GHSA-rj75-hqrm-r3gf">GHSA-rj75-hqrm-r3gf</a>, reported by Wayde Shi)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4eb3468</code></a> 7.1.6</li>
<li><a href=""><code>62b1917</code></a> fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability</li>
<li>See full diff in <a href="https://github.com/postcss/postcss-selector-parser/compare/7.1.5...7.1.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=postcss-selector-parser&package-manager=npm_and_yarn&previous-version=7.1.5&new-version=7.1.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `003a3dc0e377`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.