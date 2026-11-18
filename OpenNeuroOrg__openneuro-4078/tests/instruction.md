# Issue

**Title:** chore(deps): Bump postcss-selector-parser from 7.1.1 to 7.1.5

## Description

Bumps [postcss-selector-parser](https://github.com/postcss/postcss-selector-parser) from 7.1.1 to 7.1.5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/releases">postcss-selector-parser's releases</a>.</em></p>
<blockquote>
<h2>7.1.5</h2>
<ul>
<li>fix: don't treat a non-prefix token before <code>|</code> as a namespace (<a href="">#324</a> by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>)</li>
<li>fix: preserve whitespace before a <code>*</code> namespace in attribute selectors (<a href="">#325</a> by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>)</li>
<li>fix: TypeError on unclosed <code>[</code>, <code>(</code> and trailing <code>|</code> (<a href="">#330</a> by <a href="https://github.com/theRizwan"><code>@​theRizwan</code></a>)</li>
</ul>
<h2>7.1.4</h2>
<ul>
<li>fix: tolerate non-node children when serializing selectors</li>
</ul>
<h2>7.1.3</h2>
<ul>
<li>Improve fix CVE-2026-9358 (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 (clone/walk)</li>
</ul>
<h2>7.1.2</h2>
<ul>
<li>Fix <a href="https://github.com/advisories/GHSA-w9m9-85wc-3x92">CVE-2026-9358</a> (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 (<a href="">#316</a> by <a href="https://github.com/MoOx"><code>@​MoOx</code></a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/blob/main/CHANGELOG.md">postcss-selector-parser's changelog</a>.</em></p>
<blockquote>
<h2>7.1.5 - 2026-08-07</h2>
<ul>
<li>fix: don't treat a non-prefix token before <code>|</code> as a namespace (<a href="">#324</a> by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>)</li>
<li>fix: preserve whitespace before a <code>*</code> namespace in attribute selectors (<a href="">#325</a> by <a href="https://github.com/spokodev"><code>@​spokodev</code></a>)</li>
<li>fix: TypeError on unclosed <code>[</code>, <code>(</code> and trailing <code>|</code> (<a href="">#330</a> by <a href="https://github.com/theRizwan"><code>@​theRizwan</code></a>)</li>
</ul>
<h2>7.1.4 - 2026-06-11</h2>
<ul>
<li>fix: tolerate non-node children when serializing selectors</li>
</ul>
<h2>7.1.3 - 2026-06-11</h2>
<ul>
<li>Improve fix CVE-2026-9358 (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 (clone/walk)</li>
</ul>
<h2>7.1.2 - 2026-06-09</h2>
<ul>
<li>Fix <a href="https://github.com/advisories/GHSA-w9m9-85wc-3x92">CVE-2026-9358</a> (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 (<a href="">#316</a> by <a href="https://github.com/MoOx"><code>@​MoOx</code></a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e33e9bc</code></a> 7.1.5</li>
<li><a href=""><code>6f4e6c1</code></a> fix: TypeError on unclosed <code>[</code>, <code>(</code> and trailing <code>|</code> (<a href="">#330</a>)</li>
<li><a href=""><code>4d8437f</code></a> fix: preserve whitespace before a <code>*</code> namespace in attribute selectors (<a href="">#325</a>)</li>
<li><a href=""><code>e2f9029</code></a> fix: don't treat a non-prefix token before <code>|</code> as a namespace (<a href="">#324</a>)</li>
<li><a href=""><code>dd50ee1</code></a> chore(deps-dev): bump postcss from 8.5.18 to 8.5.23 (<a href="">#331</a>)</li>
<li><a href=""><code>7e3abb2</code></a> chore(deps-dev): bump postcss from 8.5.15 to 8.5.18 (<a href="">#328</a>)</li>
<li><a href=""><code>4a7e4e3</code></a> 7.1.4</li>
<li><a href=""><code>e2021c5</code></a> fix: tolerate non-node children when serializing selectors</li>
<li><a href=""><code>7893b74</code></a> 7.1.3</li>
<li><a href=""><code>5bc698c</code></a> Improve fix CVE-2026-9358 (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 (clo...</li>
<li>Additional commits viewable in <a href="https://github.com/postcss/postcss-selector-parser/compare/v7.1.1...7.1.5">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~moox">moox</a>, a new releaser for postcss-selector-parser since your current version.</p>
</details>
<details>
<summary>Install script changes</summary>
<p>This version modifies <code>prepare</code> script that runs during installation. Review the package contents before updating.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=postcss-selector-parser&package-manager=npm_and_yarn&previous-version=7.1.1&new-version=7.1.5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `273c0f697a50`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.