# Issue

**Title:** Bump ajv from 6.10.2 to 6.12.6

## Description

Bumps [ajv](https://github.com/ajv-validator/ajv) from 6.10.2 to 6.12.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/ajv-validator/ajv/releases">ajv's releases</a>.</em></p>
<blockquote>
<h2>v6.12.6</h2>
<p>Fix performance issue of &quot;url&quot; format.</p>
<h2>v6.12.5</h2>
<p>Fix uri scheme validation (<a href="https://github.com/ChALkeR"><code>@​ChALkeR</code></a>).
Fix boolean schemas with strictKeywords option (<a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1270">#1270</a>)</p>
<h2>v6.12.4</h2>
<p>Fix: coercion of one-item arrays to scalar that should fail validation (<a href="https://runkit.com/esp/5f3672ba2f6642001ae27411">failing example</a>).</p>
<h2>v6.12.3</h2>
<p>Pass schema object to processCode function
Option for strictNumbers (<a href="https://github.com/issacgerges"><code>@​issacgerges</code></a>, <a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1128">#1128</a>)
Fixed vulnerability related to untrusted schemas (<a href="https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=CVE-2020-15366">CVE-2020-15366</a>)</p>
<h2>v6.12.2</h2>
<p>Removed post-install script</p>
<h2>v6.12.1</h2>
<p>Docs and dependency updates</p>
<h2>v6.12.0</h2>
<p>Improved hostname validation (<a href="https://github.com/sambauers"><code>@​sambauers</code></a>, <a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1143">#1143</a>)
Option <code>keywords</code> to add custom keywords (<a href="https://github.com/franciscomorais"><code>@​franciscomorais</code></a>, <a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1137">#1137</a>)
Types fixes (<a href="https://github.com/boenrobot"><code>@​boenrobot</code></a>, <a href="https://github.com/MattiAstedrone"><code>@​MattiAstedrone</code></a>)
Docs:</p>
<ul>
<li><a href="https://github.com/epoberezkin/ajv#error-logging">error logging</a> example (<a href="https://github.com/RadiationSickness"><code>@​RadiationSickness</code></a>)</li>
<li>TypeScript usage notes (<a href="https://github.com/thetric"><code>@​thetric</code></a>)</li>
</ul>
<h2>v6.11.0</h2>
<p>Time formats support two digit and colon-less variants of timezone offset (<a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1061">#1061</a> , <a href="https://github.com/cjpillsbury"><code>@​cjpillsbury</code></a>)
Docs: RegExp related security considerations
Tests: Disabled failing typescript test</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fe59143</code></a> 6.12.6</li>
<li><a href=""><code>d580d3e</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1298">#1298</a> from ajv-validator/fix-url</li>
<li><a href=""><code>fd36389</code></a> fix: regular expression for &quot;url&quot; format</li>
<li><a href=""><code>490e34c</code></a> docs: link to v7-beta branch</li>
<li><a href=""><code>9cd93a1</code></a> docs: note about v7 in readme</li>
<li><a href=""><code>877d286</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/ajv-validator/ajv/issues/1262">#1262</a> from b4h0-c4t/refactor-opt-object-type</li>
<li><a href=""><code>f1c8e45</code></a> 6.12.5</li>
<li><a href=""><code>764035e</code></a> Merge branch 'ChALkeR-chalker/fix-comma'</li>
<li><a href=""><code>3798160</code></a> Merge branch 'chalker/fix-comma' of git://github.com/ChALkeR/ajv into ChALkeR...</li>
<li><a href=""><code>a3c7eba</code></a> Merge branch 'refactor-opt-object-type' of github.com:b4h0-c4t/ajv into refac...</li>
<li>Additional commits viewable in <a href="https://github.com/ajv-validator/ajv/compare/v6.10.2...v6.12.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ajv&package-manager=npm_and_yarn&previous-version=6.10.2&new-version=6.12.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e53cb2bc19a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.