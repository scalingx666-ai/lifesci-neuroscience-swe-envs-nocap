# Issue

**Title:** chore(deps): Bump qs from 6.14.0 to 6.15.3

## Description

Bumps [qs](https://github.com/ljharb/qs) from 6.14.0 to 6.15.3.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/ljharb/qs/blob/main/CHANGELOG.md">qs's changelog</a>.</em></p>
<blockquote>
<h2><strong>6.15.3</strong></h2>
<ul>
<li>[Fix] <code>parse</code>: enforce <code>throwOnLimitExceeded</code> for cumulative array growth via <code>combine</code>/<code>merge</code></li>
<li>[Fix] <code>utils</code>: respect encoding of surrogate pairs across chunks (<a href="">#559</a>)</li>
<li>[Robustness] <code>parse</code>: throw the <code>arrayLimit</code> error before splitting oversized comma values</li>
<li>[Robustness] <code>utils.merge</code> / <code>utils.assign</code>: avoid invoking <code>__proto__</code> setter when copying own properties</li>
<li>[Robustness] <code>utils</code>: enforce <code>arrayLimit</code> consistently across <code>merge</code>'s array paths</li>
<li>[Perf] <code>utils</code>: make <code>compact</code> O(n) via a side-channel visited-set instead of <code>Array.indexOf</code></li>
<li>[Deps] update <code>side-channel</code></li>
<li>[Dev Deps] update <code>eslint</code>, <code>mock-property</code>, <code>tape</code></li>
<li>[Tests] <code>parse</code>: characterize current lenient handling of unbalanced bracket keys (<a href="">#558</a>)</li>
</ul>
<h2><strong>6.15.2</strong></h2>
<ul>
<li>[Fix] <code>stringify</code>: skip null/undefined entries in <code>arrayFormat: 'comma'</code> + <code>encodeValuesOnly</code> instead of crashing in <code>encoder</code></li>
<li>[Fix] <code>stringify</code>: use configured <code>delimiter</code> after <code>charsetSentinel</code> (<a href="">#555</a>)</li>
<li>[Fix] <code>stringify</code>: apply <code>formatter</code> to encoded key under <code>strictNullHandling</code> (<a href="">#554</a>)</li>
<li>[Fix] <code>stringify</code>: skip null/undefined filter-array entries instead of crashing in <code>encoder</code> (<a href="">#551</a>)</li>
<li>[Fix] <code>parse</code>: handle nested bracket groups and add regression tests (<a href="">#530</a>)</li>
<li>[readme] fix grammar (<a href="">#550</a>)</li>
<li>[Dev Deps] update <code>@ljharb/eslint-config</code></li>
<li>[Tests] add regression tests for keys containing percent-encoded bracket text</li>
</ul>
<h2><strong>6.15.1</strong></h2>
<ul>
<li>[Fix] <code>parse</code>: <code>parameterLimit: Infinity</code> with <code>throwOnLimitExceeded: true</code> silently drops all parameters</li>
<li>[Deps] update <code>@ljharb/eslint-config</code></li>
<li>[Dev Deps] update <code>@ljharb/eslint-config</code>, <code>iconv-lite</code></li>
<li>[Tests] increase coverage</li>
</ul>
<h2><strong>6.15.0</strong></h2>
<ul>
<li>[New] <code>parse</code>: add <code>strictMerge</code> option to wrap object/primitive conflicts in an array (<a href="">#425</a>, <a href="">#122</a>)</li>
<li>[Fix] <code>duplicates</code> option should not apply to bracket notation keys (<a href="">#514</a>)</li>
</ul>
<h2><strong>6.14.2</strong></h2>
<ul>
<li>[Fix] <code>parse</code>: mark overflow objects for indexed notation exceeding <code>arrayLimit</code> (<a href="">#546</a>)</li>
<li>[Fix] <code>arrayLimit</code> means max count, not max index, in <code>combine</code>/<code>merge</code>/<code>parseArrayValue</code></li>
<li>[Fix] <code>parse</code>: throw on <code>arrayLimit</code> exceeded with indexed notation when <code>throwOnLimitExceeded</code> is true (<a href="">#529</a>)</li>
<li>[Fix] <code>parse</code>: enforce <code>arrayLimit</code> on <code>comma</code>-parsed values</li>
<li>[Fix] <code>parse</code>: fix error message to reflect arrayLimit as max index; remove extraneous comments (<a href="">#545</a>)</li>
<li>[Robustness] avoid <code>.push</code>, use <code>void</code></li>
<li>[readme] document that <code>addQueryPrefix</code> does not add <code>?</code> to empty output (<a href="">#418</a>)</li>
<li>[readme] clarify <code>parseArrays</code> and <code>arrayLimit</code> documentation (<a href="">#543</a>)</li>
<li>[readme] replace runkit CI badge with shields.io check-runs badge</li>
<li>[meta] fix changelog typo (<code>arrayLength</code> → <code>arrayLimit</code>)</li>
<li>[actions] fix rebase workflow permissions</li>
</ul>
<h2><strong>6.14.1</strong></h2>
<ul>
<li>[Fix] ensure <code>arrayLimit</code> applies to <code>[]</code> notation as well</li>
<li>[Fix] <code>parse</code>: when a custom decoder returns <code>null</code> for a key, ignore that key</li>
<li>[Refactor] <code>parse</code>: extract key segment splitting helper</li>
<li>[meta] add threat model</li>
<li>[actions] add workflow permissions</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>18d085e</code></a> v6.15.3</li>
<li><a href=""><code>c38af42</code></a> [Deps] update <code>side-channel</code></li>
<li><a href=""><code>adce539</code></a> [Dev Deps] update <code>eslint</code>, <code>mock-property</code>, <code>tape</code></li>
<li><a href=""><code>74a0f6a</code></a> [Robustness] <code>utils</code>: enforce <code>arrayLimit</code> consistently across <code>merge</code>'s arra...</li>
<li><a href=""><code>f4938f5</code></a> [Tests] <code>parse</code>: characterize current lenient handling of unbalanced bracket ...</li>
<li><a href=""><code>5d5f723</code></a> [Perf] <code>utils</code>: make <code>compact</code> O(n) via a side-channel visited-set instead of...</li>
<li><a href=""><code>52afe00</code></a> [Robustness] <code>parse</code>: throw the <code>arrayLimit</code> error before splitting oversized...</li>
<li><a href=""><code>963e538</code></a> [Fix] <code>parse</code>: enforce <code>throwOnLimitExceeded</code> for cumulative array growth via...</li>
<li><a href=""><code>59da434</code></a> [Fix] <code>utils</code>: respect encoding of surrogate pairs across chunks</li>
<li><a href=""><code>9532969</code></a> [Robustness] <code>utils.merge</code> / <code>utils.assign</code>: avoid invoking <code>__proto__</code> sette...</li>
<li>Additional commits viewable in <a href="https://github.com/ljharb/qs/compare/v6.14.0...v6.15.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=qs&package-manager=npm_and_yarn&previous-version=6.14.0&new-version=6.15.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17d1ddcd68e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.