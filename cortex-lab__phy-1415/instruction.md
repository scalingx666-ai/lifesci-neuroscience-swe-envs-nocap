# Issue

**Title:** Bump tornado from 6.5.7 to 6.5.8

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.5.7 to 6.5.8.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.5.8
releases/v6.5.7
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
releases/v3.2.2</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a55abe3</code></a> Merge pull request <a href="">#3704</a> from bdarnell/security-6.5.8</li>
<li><a href=""><code>fc79488</code></a> docs: add additional credit to release notes</li>
<li><a href=""><code>7b01763</code></a> Fix test_strip_headers_on_redirect's URL-embedded-credentials cases</li>
<li><a href=""><code>d72fff8</code></a> release notes and version bump for 6.5.8</li>
<li><a href=""><code>b168818</code></a> auth: Formally deprecated OpenIDMixin</li>
<li><a href=""><code>da28476</code></a> web: Also check for semicolons in deprecated mixed-case cookie args</li>
<li><a href=""><code>8d6363e</code></a> httputil: Enforce a new limit on the number of arguments in a request</li>
<li><a href=""><code>de85b3f</code></a> httputil: Apply multipart max_parts limit earlier</li>
<li>See full diff in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.7...v6.5.8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tornado&package-manager=uv&previous-version=6.5.7&new-version=6.5.8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/cortex-lab/phy/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff493558eac2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.