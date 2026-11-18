# Issue

**Title:** chore(deps): bump js-yaml from 5.2.0 to 5.2.1

## Description

Bumps [js-yaml](https://github.com/nodeca/js-yaml) from 5.2.0 to 5.2.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nodeca/js-yaml/blob/master/CHANGELOG.md">js-yaml's changelog</a>.</em></p>
<blockquote>
<h2>[5.2.1] - 2026-07-02</h2>
<h3>Fixed</h3>
<ul>
<li>Add <code>Map</code> support to !!omap (should work when <code>realMapTag</code> used)</li>
</ul>
<h3>Security</h3>
<ul>
<li>Remove quadratic complexity from !!omap <code>addItem</code>. Regression from v5
(usually not critical, because YAML11_SCHEMA is not default anymore).</li>
</ul>
<h2>4.3.0, 3.15.0 - 2026-06-27</h2>
<h3>Security</h3>
<ul>
<li>Backported <code>maxTotalMergeKeys</code> option.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ac16b42</code></a> 5.2.1 released</li>
<li><a href=""><code>4a864e5</code></a> Deps bump</li>
<li><a href=""><code>39f3211</code></a> !!omap: add <code>Map</code> support and remove quadratic complexity</li>
<li><a href=""><code>ff17f1e</code></a> Changelog update</li>
<li><a href=""><code>8ed15f1</code></a> deps bump</li>
<li><a href=""><code>1a562dc</code></a> Fix changelog link</li>
<li>See full diff in <a href="https://github.com/nodeca/js-yaml/compare/5.2.0...5.2.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=js-yaml&package-manager=npm_and_yarn&previous-version=5.2.0&new-version=5.2.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/NeuroAIHub/BrainPilot/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14643e5a12d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.