# Issue

**Title:** chore(deps): Bump fast-uri from 3.1.7 to 3.1.8

## Description

Bumps [fast-uri](https://github.com/fastify/fast-uri) from 3.1.7 to 3.1.8.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fastify/fast-uri/releases">fast-uri's releases</a>.</em></p>
<blockquote>
<h2>v3.1.8</h2>
<h2>⚠️ Security Warning</h2>
<p>This security release fixes the following medium-severity security advisory:</p>
<ul>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-hrr3-gc8f-f4qj">GHSA-hrr3-gc8f-f4qj</a> — inconsistent host case normalization via percent-encoded octets</li>
</ul>
<p>Users of the v3.x release line should upgrade to v3.1.8.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fastify/fast-uri/compare/v3.1.7...v3.1.8">https://github.com/fastify/fast-uri/compare/v3.1.7...v3.1.8</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ead3ab7</code></a> Bumped v3.1.8</li>
<li><a href=""><code>c88b59e</code></a> fix: normalize decoded reg-name case</li>
<li>See full diff in <a href="https://github.com/fastify/fast-uri/compare/v3.1.7...v3.1.8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fast-uri&package-manager=npm_and_yarn&previous-version=3.1.7&new-version=3.1.8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a77faaa537fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.