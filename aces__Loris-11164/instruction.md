# Issue

**Title:** Bump dompurify from 3.4.12 to 3.4.13

## Description

Bumps [dompurify](https://github.com/cure53/DOMPurify) from 3.4.12 to 3.4.13.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/cure53/DOMPurify/releases">dompurify's releases</a>.</em></p>
<blockquote>
<h2>DOMPurify 3.4.13</h2>
<ul>
<li>Fixed an issue with hook removal during <code>IN_PLACE</code> sanitization, thanks <a href="https://github.com/koyokr"><code>@​koyokr</code></a></li>
<li>Fixed an issue with hooks potentially bypassing the clone guard, thanks <a href="https://github.com/AkshayjainG"><code>@​AkshayjainG</code></a></li>
<li>Fixed an issue with DOM clobbering via <code>ownerDocument</code> during <code>IN_PLACE</code>, thanks <a href="https://github.com/AkshayjainG"><code>@​AkshayjainG</code></a></li>
<li>Bumped several dependencies where possible</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3067f77</code></a> release: 3.4.13 (<a href="">#1562</a>)</li>
<li>See full diff in <a href="https://github.com/cure53/DOMPurify/compare/3.4.12...3.4.13">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=dompurify&package-manager=npm_and_yarn&previous-version=3.4.12&new-version=3.4.13)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aces/Loris/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.