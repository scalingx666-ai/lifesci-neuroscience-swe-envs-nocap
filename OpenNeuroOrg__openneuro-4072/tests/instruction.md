# Issue

**Title:** chore(deps): Bump immutable from 4.3.8 to 4.3.9

## Description

Bumps [immutable](https://github.com/immutable-js/immutable-js) from 4.3.8 to 4.3.9.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/immutable-js/immutable-js/releases">immutable's releases</a>.</em></p>
<blockquote>
<h2>v4.3.9</h2>
<h1>What's changed</h1>
<ul>
<li>fix(List): guard oversized bounds in setListBounds. Fixes CVE <a href="https://github.com/immutable-js/immutable-js/security/advisories/GHSA-v56q-mh7h-f735">https://github.com/immutable-js/immutable-js/security/advisories/GHSA-v56q-mh7h-f735</a></li>
<li>perf(Map): index large hash-collision buckets for faster lookups. Fixes CVE <a href="https://github.com/immutable-js/immutable-js/security/advisories/GHSA-xvcm-6775-5m9r">https://github.com/immutable-js/immutable-js/security/advisories/GHSA-xvcm-6775-5m9r</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/immutable-js/immutable-js/compare/v4.3.8...v4.3.9">https://github.com/immutable-js/immutable-js/compare/v4.3.8...v4.3.9</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/immutable-js/immutable-js/blob/main/CHANGELOG.md">immutable's changelog</a>.</em></p>
<blockquote>
<h2>4.3.9</h2>
<ul>
<li>fix(List): guard oversized bounds in setListBounds. Fixes CVE <a href="https://github.com/immutable-js/immutable-js/security/advisories/GHSA-v56q-mh7h-f735">https://github.com/immutable-js/immutable-js/security/advisories/GHSA-v56q-mh7h-f735</a></li>
<li>perf(Map): index large hash-collision buckets for faster lookups. Fixes CVE <a href="https://github.com/immutable-js/immutable-js/security/advisories/GHSA-xvcm-6775-5m9r">https://github.com/immutable-js/immutable-js/security/advisories/GHSA-xvcm-6775-5m9r</a></li>
</ul>
<h2>5.1.7</h2>
<ul>
<li>fix(Repeat): lastIndexOf returned size instead of size - 1 by <a href="https://github.com/chatman-media"><code>@​chatman-media</code></a> in <a href="">immutable-js/immutable-js#2227</a>. Fixes CVE <a href="https://github.com/immutable-js/immutable-js/security/advisories/GHSA-wf6x-7x77-mvgw">CVE-2026-29063 </a></li>
<li>fix(IndexedCollection): <code>has(index)</code> on a lazy <code>Seq</code> of unknown size now checks index existence instead of searching for a value equal to the index <a href="">#2203</a></li>
<li>[TypeScript]: <code>reduce</code>/<code>reduceRight</code> without an initial value now infer the result type from the collection's values when the reducer returns a value (e.g. <code>list.reduce((a, b) =&gt; a + b)</code> infers <code>number</code>), matching <code>Array#reduce</code>. Previously an explicit type argument was required. <a href="">#2205</a></li>
</ul>
<h2>5.1.6</h2>
<ul>
<li>fix(reverseFactory): read <code>reversedSequence.size</code> in <code>__iterator</code> instead of this <a href="">#2196</a></li>
</ul>
<h2>5.1.5</h2>
<ul>
<li>Fix Improperly Controlled Modification of Object Prototype Attributes ('Prototype Pollution') in immutable</li>
</ul>
<h2>5.1.4</h2>
<ul>
<li>Migrate some files to TS by <a href="https://github.com/jdeniau"><code>@​jdeniau</code></a> in <a href="">immutable-js/immutable-js#2125</a>
<ul>
<li>Iterator.ts</li>
<li>PairSorting.ts</li>
<li>toJS.ts</li>
<li>Math.ts</li>
<li>Hash.ts</li>
</ul>
</li>
<li>Extract CollectionHelperMethods and convert to TS by <a href="https://github.com/jdeniau"><code>@​jdeniau</code></a> in <a href="">immutable-js/immutable-js#2131</a></li>
<li>Use npm <a href="https://docs.npmjs.com/trusted-publishers">trusted publishing only</a> to avoid token stealing.</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Fix/a11y issues by <a href="https://github.com/lyannel"><code>@​lyannel</code></a> in <a href="">immutable-js/immutable-js#2136</a></li>
<li>Doc add Map.get signature update by <a href="https://github.com/borracciaBlu"><code>@​borracciaBlu</code></a> in <a href="">immutable-js/immutable-js#2138</a></li>
<li>fix(doc):minor-issues#2132 by <a href="https://github.com/JayMeDotDot"><code>@​JayMeDotDot</code></a> in <a href="">immutable-js/immutable-js#2133</a></li>
<li>Fix algolia search by <a href="https://github.com/jdeniau"><code>@​jdeniau</code></a> in <a href="">immutable-js/immutable-js#2135</a></li>
<li>Typo in OrderedMap by <a href="https://github.com/jdeniau"><code>@​jdeniau</code></a> in <a href="">immutable-js/immutable-js#2144</a></li>
</ul>
<h3>Internal</h3>
<ul>
<li>chore: Sort all imports and activate eslint import rule by <a href="https://github.com/jdeniau"><code>@​jdeniau</code></a> in <a href="">immutable-js/immutable-js#2119</a></li>
</ul>
<h2>5.1.3</h2>
<h3>TypeScript</h3>
<ul>
<li>fix: allow readonly map entry constructor by <a href="https://github.com/septs"><code>@​septs</code></a> in <a href="">immutable-js/immutable-js#2123</a></li>
</ul>
<h3>Documentation</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5da7919</code></a> 4.3.9</li>
<li><a href=""><code>794a1a9</code></a> Merge commit from fork</li>
<li><a href=""><code>3dd7e56</code></a> perf(Map): index large hash-collision buckets for faster lookups</li>
<li><a href=""><code>62d0b58</code></a> fix ts in tests</li>
<li><a href=""><code>8c0e5f8</code></a> Merge commit from fork</li>
<li><a href=""><code>f0bc997</code></a> Merge commit from fork</li>
<li><a href=""><code>8ac83f4</code></a> change tag</li>
<li><a href=""><code>f7373e5</code></a> use id-token to deploy 4.x version</li>
<li><a href=""><code>2f545ad</code></a> changelog</li>
<li>See full diff in <a href="https://github.com/immutable-js/immutable-js/compare/v4.3.8...v4.3.9">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=immutable&package-manager=npm_and_yarn&previous-version=4.3.8&new-version=4.3.9)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a212423519b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.