# Issue

**Title:** Bump js-yaml from 3.14.1 to 3.15.2

## Description

Bumps [js-yaml](https://github.com/nodeca/js-yaml) from 3.14.1 to 3.15.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nodeca/js-yaml/blob/3.15.2/CHANGELOG.md">js-yaml's changelog</a>.</em></p>
<blockquote>
<h2>3.15.2 - 2026-08-26</h2>
<h3>Changed</h3>
<ul>
<li>[backport] Hard-limit merge sequence size to 100.</li>
</ul>
<h3>Security</h3>
<ul>
<li>[backport] Count empty mappings in merge sequences toward <code>maxTotalMergeKeys</code>
to limit CPU usage, <a href="">#797</a>.</li>
</ul>
<h2>3.15.1 - 2026-07-31</h2>
<h3>Security</h3>
<ul>
<li>[backport] Remove quadratic complexity from <code>!!omap</code> duplicate key detection.</li>
</ul>
<h2>3.15.0 - 2026-06-27</h2>
<h3>Added</h3>
<ul>
<li>Added <code>maxTotalMergeKeys</code> (10000) loader option to limit the total number of
keys processed by YAML merge (<code>&lt;&lt;</code>) across one <code>safeLoad()</code> / <code>safeLoadAll()</code>
call.</li>
</ul>
<h2>[3.14.2] - 2025-11-15</h2>
<h3>Security</h3>
<ul>
<li>Fix prototype pollution in merge (&lt;&lt;).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5c45bd6</code></a> 3.15.2 released</li>
<li><a href=""><code>5a708f9</code></a> dist rebuild</li>
<li><a href=""><code>3485bc0</code></a> Backport merge limits from v5.4.1</li>
<li><a href=""><code>f34812f</code></a> Update .gitignore</li>
<li><a href=""><code>ab85ae2</code></a> 3.15.1 released</li>
<li><a href=""><code>30a5e76</code></a> dist rebuild</li>
<li><a href=""><code>22a8071</code></a> Backport quadratic complexity fix for !!omap</li>
<li><a href=""><code>c34b6c4</code></a> 3.15.0 released</li>
<li><a href=""><code>21e13d3</code></a> dist rebuild</li>
<li><a href=""><code>4165c62</code></a> Add v3-legacy tag for publish</li>
<li>Additional commits viewable in <a href="https://github.com/nodeca/js-yaml/compare/3.14.1...3.15.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=js-yaml&package-manager=npm_and_yarn&previous-version=3.14.1&new-version=3.15.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3305a0031217`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.