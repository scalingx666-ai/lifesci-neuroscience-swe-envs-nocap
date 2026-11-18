# Issue

**Title:** Bump actions/checkout from 3.5.3 to 3.6.0

## Description

Bumps [actions/checkout](https://github.com/actions/checkout) from 3.5.3 to 3.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v3.6.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Mark test scripts with Bash'isms to be run via Bash by <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1377</a></li>
<li>Add option to fetch tags even if fetch-depth &gt; 0 by <a href="https://github.com/RobertWieczoreck"><code>@​RobertWieczoreck</code></a> in <a href="">actions/checkout#579</a></li>
<li>Release 3.6.0 by <a href="https://github.com/luketomlinson"><code>@​luketomlinson</code></a> in <a href="">actions/checkout#1437</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/RobertWieczoreck"><code>@​RobertWieczoreck</code></a> made their first contribution in <a href="">actions/checkout#579</a></li>
<li><a href="https://github.com/luketomlinson"><code>@​luketomlinson</code></a> made their first contribution in <a href="">actions/checkout#1437</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3.5.3...v3.6.0">https://github.com/actions/checkout/compare/v3.5.3...v3.6.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h2>v3.6.0</h2>
<ul>
<li><a href="">Fix: Mark test scripts with Bash'isms to be run via Bash</a></li>
<li><a href="">Add option to fetch tags even if fetch-depth &gt; 0</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f43a0e5</code></a> Release 3.6.0 (<a href="">#1437</a>)</li>
<li><a href=""><code>7739b9b</code></a> Add option to fetch tags even if fetch-depth &gt; 0 (<a href="">#579</a>)</li>
<li><a href=""><code>96f5310</code></a> Mark test scripts with Bash'isms to be run via Bash (<a href="">#1377</a>)</li>
<li>See full diff in <a href="https://github.com/actions/checkout/compare/v3.5.3...v3.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/checkout&package-manager=github_actions&previous-version=3.5.3&new-version=3.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b17188086df1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.