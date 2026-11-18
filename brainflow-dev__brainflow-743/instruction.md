# Issue

**Title:** Bump micromatch from 4.0.5 to 4.0.8 in /nodejs_package

## Description

Bumps [micromatch](https://github.com/micromatch/micromatch) from 4.0.5 to 4.0.8.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/micromatch/micromatch/releases">micromatch's releases</a>.</em></p>
<blockquote>
<h2>4.0.8</h2>
<p>Ultimate release that fixes both CVE-2024-4067 and CVE-2024-4068. We consider the issues low-priority, so even if you see automated scanners saying otherwise, don't be scared.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/micromatch/micromatch/blob/master/CHANGELOG.md">micromatch's changelog</a>.</em></p>
<blockquote>
<h2>[4.0.8] - 2024-08-22</h2>
<ul>
<li>backported CVE-2024-4067 fix (from v4.0.6) over to 4.x branch</li>
</ul>
<h2>[4.0.7] - 2024-05-22</h2>
<ul>
<li>this is basically v4.0.5, with some README updates</li>
<li><strong>it is vulnerable to CVE-2024-4067</strong></li>
<li>Updated braces to v3.0.3 to avoid CVE-2024-4068</li>
<li>does NOT break API compatibility</li>
</ul>
<h2>[4.0.6] - 2024-05-21</h2>
<ul>
<li>Added <code>hasBraces</code> to check if a pattern contains braces.</li>
<li>Fixes CVE-2024-4067</li>
<li><strong>BREAKS API COMPATIBILITY</strong></li>
<li>Should be labeled as a major release, but it's not.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8bd704e</code></a> 4.0.8</li>
<li><a href=""><code>a0e6841</code></a> run verb to generate README documentation</li>
<li><a href=""><code>4ec2884</code></a> Merge branch 'v4' into hauserkristof-feature/v4.0.8</li>
<li><a href=""><code>03aa805</code></a> Merge pull request <a href="">#266</a> from hauserkristof/feature/v4.0.8</li>
<li><a href=""><code>814f5f7</code></a> lint</li>
<li><a href=""><code>67fcce6</code></a> fix: CHANGELOG about braces &amp; CVE-2024-4068, v4.0.5</li>
<li><a href=""><code>113f2e3</code></a> fix: CVE numbers in CHANGELOG</li>
<li><a href=""><code>d9dbd9a</code></a> feat: updated CHANGELOG</li>
<li><a href=""><code>2ab1315</code></a> fix: use actions/setup-node@v4</li>
<li><a href=""><code>1406ea3</code></a> feat: rework test to work on macos with node 10,12 and 14</li>
<li>Additional commits viewable in <a href="https://github.com/micromatch/micromatch/compare/4.0.5...4.0.8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=micromatch&package-manager=npm_and_yarn&previous-version=4.0.5&new-version=4.0.8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/brainflow-dev/brainflow/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c98d025b47c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.