# Issue

**Title:** chore(deps): bump tornado from 6.5.5 to 6.5.7

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.5.5 to 6.5.7.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.5.7
releases/v6.5.6
releases/v6.5.5
releases/v6.5.4
releases/v6.5.3
releases/v6.5.2
releases/v6.5.1
releases/v6.5.0
releases/v6.4.2
releases/v6.4.1
releases/v6.4.0
releases/v6.3.3
releases/v6.3.2
releases/v6.3.1
releases/v6.3.0
releases/v6.2.0
releases/v6.1.0
releases/v6.0.4
releases/v6.0.3
releases/v6.0.2
releases/v6.0.1
releases/v6.0.0
releases/v5.1.1
releases/v5.1.0
releases/v5.0.2
releases/v5.0.1
releases/v5.0.0
releases/v4.5.3
releases/v4.5.2
releases/v4.5.1
releases/v4.5.0
releases/v4.4.3
releases/v4.4.2
releases/v4.4.1
releases/v4.4.0
releases/v4.3.0
releases/v4.2.1
releases/v4.2.0
releases/v4.1.0
releases/v4.0.2
releases/v4.0.1
releases/v4.0.0
releases/v3.2.2
releases/v3.2.1</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>48fc2d4</code></a> Merge pull request <a href="">#3633</a> from bdarnell/curl-reset-65</li>
<li><a href=""><code>4ae1ddd</code></a> Release notes and version bump for 6.5.7</li>
<li><a href=""><code>3154caa</code></a> curl_httpclient: Reset the curl object before putting it on the freelist</li>
<li><a href=""><code>7d869c0</code></a> Merge pull request <a href="">#3631</a> from bdarnell/cve-links</li>
<li><a href=""><code>288241f</code></a> docs: Use the correct link syntax</li>
<li><a href=""><code>8da981c</code></a> docs: Add CVE links to 6.5.6 release notes</li>
<li><a href=""><code>aba2569</code></a> Merge pull request <a href="">#3626</a> from bdarnell/fixes-656</li>
<li><a href=""><code>a24b260</code></a> httpclient_test: Accept an additional error message variant</li>
<li><a href=""><code>a74240a</code></a> Release notes and version bump for 6.5.6.</li>
<li><a href=""><code>e8fc7ed</code></a> simple_httpclient: Strip auth headers on cross-origin redirects</li>
<li>Additional commits viewable in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.5...v6.5.7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tornado&package-manager=uv&previous-version=6.5.5&new-version=6.5.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-specification/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d20ee463cc32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.