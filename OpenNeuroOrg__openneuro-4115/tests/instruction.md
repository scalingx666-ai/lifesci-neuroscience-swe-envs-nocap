# Issue

**Title:** chore(deps): Bump pbkdf2 from 3.1.5 to 3.1.7

## Description

Bumps [pbkdf2](https://github.com/browserify/pbkdf2) from 3.1.5 to 3.1.7.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/browserify/pbkdf2/blob/master/CHANGELOG.md">pbkdf2's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/browserify/pbkdf2/compare/v3.1.6...v3.1.7">v3.1.7</a> - 2026-09-29</h2>
<h3>Commits</h3>
<ul>
<li>[Fix] hash long passwords once, not on every iteration <a href=""><code>493d8d8</code></a></li>
<li>[Dev Deps] update <code>@arethetypeswrong/cli</code>, <code>@ljharb/eslint-config</code>, <code>@types/node</code>, <code>auto-changelog</code>, <code>tape</code> <a href=""><code>bbc305e</code></a></li>
<li>[Tests] skip rmd160 in the long-password test on node 17 <a href=""><code>3905818</code></a></li>
</ul>
<h2><a href="https://github.com/browserify/pbkdf2/compare/v3.1.5...v3.1.6">v3.1.6</a> - 2026-05-26</h2>
<h3>Commits</h3>
<ul>
<li>[New] add TypeScript type declarations <a href=""><code>fb1f747</code></a></li>
<li>[Fix] coerce <code>-0</code> keylen to <code>+0</code> <a href=""><code>7c4a495</code></a></li>
<li>[Dev Deps] update <code>@ljharb/eslint-config</code>, <code>@types/node</code>, <code>eslint</code>, <code>npmignore</code> <a href=""><code>e3cce16</code></a></li>
<li>[eslint] fix an error <a href=""><code>f6b0e42</code></a></li>
<li>[Tests] fix <code>npm run postlint</code> <a href=""><code>b729629</code></a></li>
<li>[Dev Deps] update <code>@ljharb/eslint-config</code>, <code>@types/node</code>, <code>auto-changelog</code> <a href=""><code>5e0cf51</code></a></li>
<li>[Deps] update <code>to-buffer</code> <a href=""><code>1c3b1f5</code></a></li>
<li>[readme] replace runkit CI badge with shields.io check-runs badge <a href=""><code>528bd38</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e09b47a</code></a> v3.1.7</li>
<li><a href=""><code>3905818</code></a> [Tests] skip rmd160 in the long-password test on node 17</li>
<li><a href=""><code>bbc305e</code></a> [Dev Deps] update <code>@arethetypeswrong/cli</code>, <code>@ljharb/eslint-config</code>, `@types/n...</li>
<li><a href=""><code>493d8d8</code></a> [Fix] hash long passwords once, not on every iteration</li>
<li><a href=""><code>ea4768b</code></a> v3.1.6</li>
<li><a href=""><code>b729629</code></a> [Tests] fix <code>npm run postlint</code></li>
<li><a href=""><code>7c4a495</code></a> [Fix] coerce <code>-0</code> keylen to <code>+0</code></li>
<li><a href=""><code>5e0cf51</code></a> [Dev Deps] update <code>@ljharb/eslint-config</code>, <code>@types/node</code>, <code>auto-changelog</code></li>
<li><a href=""><code>1c3b1f5</code></a> [Deps] update <code>to-buffer</code></li>
<li><a href=""><code>e3cce16</code></a> [Dev Deps] update <code>@ljharb/eslint-config</code>, <code>@types/node</code>, <code>eslint</code>, <code>npmignore</code></li>
<li>Additional commits viewable in <a href="https://github.com/browserify/pbkdf2/compare/v3.1.5...v3.1.7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pbkdf2&package-manager=npm_and_yarn&previous-version=3.1.5&new-version=3.1.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `785b06dbe5d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.