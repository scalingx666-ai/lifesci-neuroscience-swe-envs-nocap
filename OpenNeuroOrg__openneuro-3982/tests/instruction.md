# Issue

**Title:** chore(deps): Bump js-yaml from 4.1.1 to 4.2.0

## Description

Bumps [js-yaml](https://github.com/nodeca/js-yaml) from 4.1.1 to 4.2.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nodeca/js-yaml/blob/master/CHANGELOG.md">js-yaml's changelog</a>.</em></p>
<blockquote>
<h2>[4.2.0] - 2026-06-01</h2>
<h3>Added</h3>
<ul>
<li>Added <code>docs/safety.md</code> with notes about processing untrusted YAML.</li>
<li>Added <code>maxDepth</code> (100) loader option. Not a problem, but gives a better
exception instead of RangeError on stack overflow.</li>
<li>Added <code>maxMergeSeqLength</code> (20) loader option. Not a problem after <code>merge</code> fix,
but an additional restriction for safety.</li>
<li>Added sourcemaps to <code>dist/</code> builds.</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Stop resolving numbers with underscores as numeric scalars, <a href="">#627</a>.</li>
<li>Switched dev toolchains to Vite / neostandard.</li>
<li>Updated demo.</li>
<li>Reorganized tests.</li>
<li><code>dist/</code> files are no longer kept in the repository.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix parsing of properties on the first implicit block mapping key, <a href="">#62</a>.</li>
<li>Fix trailing whitespace handling when folding flow scalar lines, <a href="">#307</a>.</li>
<li>Reject top-level block scalars without content indentation, <a href="">#280</a>.</li>
<li>Ensure numbers survive round-trip, <a href="">#737</a>.</li>
<li>Fix test coverage for issue <a href="">#221</a>.</li>
<li>Fix flow scalar trailing whitespace folding, <a href="">#307</a>.</li>
<li>Fix digits in YAML named tag handles.</li>
</ul>
<h3>Security</h3>
<ul>
<li>Fix potential DoS via quadratic complexity in merge - deduplicate repeated
elements (makes sense for malformed files &gt; 10K).</li>
</ul>
<h2>[3.14.2] - 2025-11-15</h2>
<h3>Security</h3>
<ul>
<li>Backported v4.1.1 fix to v3</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/nodeca/js-yaml/commits">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=js-yaml&package-manager=npm_and_yarn&previous-version=4.1.1&new-version=4.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9b0e8d7254f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.