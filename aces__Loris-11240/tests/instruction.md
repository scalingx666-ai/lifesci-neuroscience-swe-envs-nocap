# Issue

**Title:** Bump postcss-selector-parser, postcss-modules-local-by-default and postcss-modules-scope

## Description

Bumps [postcss-selector-parser](https://github.com/postcss/postcss-selector-parser), [postcss-modules-local-by-default](https://github.com/css-modules/postcss-modules-local-by-default) and [postcss-modules-scope](https://github.com/css-modules/postcss-modules-scope). These dependencies needed to be updated together.
Updates `postcss-selector-parser` from 6.0.13 to 7.1.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/releases">postcss-selector-parser's releases</a>.</em></p>
<blockquote>
<h2>7.1.6</h2>
<ul>
<li>fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability (<a href="https://github.com/advisories/GHSA-rj75-hqrm-r3gf">GHSA-rj75-hqrm-r3gf</a>, reported by Wayde Shi)</li>
</ul>
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
<h2>v7.1.1</h2>
<h1>7.1.1</h1>
<ul>
<li>perf: replace startsWith with strict equality (<a href="">#308</a>)</li>
<li>fix(types): add walkUniversal declaration (<a href="">#311</a>)</li>
</ul>
<h2>v7.1.0</h2>
<h1>7.1.0</h1>
<ul>
<li>feat: insert(Before|After) support multiple new node</li>
</ul>
<h2>v7.0.0</h2>
<h1>7.0.0</h1>
<ul>
<li>Feat: make insertions during iteration safe (major)</li>
</ul>
<h2>6.1.4</h2>
<ul>
<li>fix: tolerate non-node children when serializing selectors</li>
</ul>
<h2>6.1.3</h2>
<ul>
<li>Fix <a href="https://github.com/advisories/GHSA-w9m9-85wc-3x92">CVE-2026-9358</a> (NVD) / SNYK-JS-POSTCSSSELECTORPARSER-16873882 via backport of (<a href="">#316</a> by <a href="https://github.com/MoOx"><code>@​MoOx</code></a>)</li>
</ul>
<h2>v6.1.2</h2>
<h1>6.1.2</h1>
<ul>
<li>Fixed: erroneous trailing combinators in pseudos</li>
</ul>
<h2>v6.1.1</h2>
<h1>6.1.1</h1>
<ul>
<li>Fixed: improve typings of constructor helpers (<a href="">#292</a>)</li>
</ul>
<h2>v6.1.0</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/postcss/postcss-selector-parser/blob/main/CHANGELOG.md">postcss-selector-parser's changelog</a>.</em></p>
<blockquote>
<h2>7.1.6 - 2026-09-03</h2>
<ul>
<li>fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability (<a href="https://github.com/advisories/GHSA-rj75-hqrm-r3gf">GHSA-rj75-hqrm-r3gf</a>, reported by Wayde Shi)</li>
</ul>
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
<h2>7.1.1</h2>
<ul>
<li>perf: replace startsWith with strict equality (<a href="">#308</a>)</li>
<li>fix(types): add walkUniversal declaration (<a href="">#311</a>)</li>
</ul>
<h2>7.1.0</h2>
<ul>
<li>feat: insert(Before|After) support multiple new node</li>
</ul>
<h2>7.0.0</h2>
<ul>
<li>Feat: make insertions during iteration safe (major)</li>
</ul>
<h2>6.1.2</h2>
<ul>
<li>Fixed: erroneous trailing combinators in pseudos</li>
</ul>
<h2>6.1.1</h2>
<ul>
<li>Fixed: improve typings of constructor helpers (<a href="">#292</a>)</li>
</ul>
<h2>6.1.0</h2>
<ul>
<li>Feature: add <code>sourceIndex</code> to <code>Selector</code> nodes (<a href="">#290</a>)</li>
</ul>
<h2>6.0.16</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4eb3468</code></a> 7.1.6</li>
<li><a href=""><code>62b1917</code></a> fix: parse flat selectors in linear time, closing a CPU exhaustion vulnerability</li>
<li><a href=""><code>e33e9bc</code></a> 7.1.5</li>
<li><a href=""><code>6f4e6c1</code></a> fix: TypeError on unclosed <code>[</code>, <code>(</code> and trailing <code>|</code> (<a href="">#330</a>)</li>
<li><a href=""><code>4d8437f</code></a> fix: preserve whitespace before a <code>*</code> namespace in attribute selectors (<a href="">#325</a>)</li>
<li><a href=""><code>e2f9029</code></a> fix: don't treat a non-prefix token before <code>|</code> as a namespace (<a href="">#324</a>)</li>
<li><a href=""><code>dd50ee1</code></a> chore(deps-dev): bump postcss from 8.5.18 to 8.5.23 (<a href="">#331</a>)</li>
<li><a href=""><code>7e3abb2</code></a> chore(deps-dev): bump postcss from 8.5.15 to 8.5.18 (<a href="">#328</a>)</li>
<li><a href=""><code>4a7e4e3</code></a> 7.1.4</li>
<li><a href=""><code>e2021c5</code></a> fix: tolerate non-node children when serializing selectors</li>
<li>Additional commits viewable in <a href="https://github.com/postcss/postcss-selector-parser/compare/v6.0.13...7.1.6">compare view</a></li>
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

Updates `postcss-modules-local-by-default` from 4.0.3 to 4.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/css-modules/postcss-modules-local-by-default/releases">postcss-modules-local-by-default's releases</a>.</em></p>
<blockquote>
<h2>v4.2.0</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.1.1...v4.2.0">4.2.0</a> - 2024-12-11</h2>
<ul>
<li>feat: add support a <code>/* cssmodules-pure-no-check */</code> comment</li>
</ul>
<h2>v4.1.0</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.5...v4.1.1">4.1.0</a> - 2024-11-11</h2>
<ul>
<li>feat: add <code>global()</code> and <code>local()</code> for animations</li>
<li>feat: add pure ignore comment</li>
<li>fix: css nesting and pure mode</li>
</ul>
<h2>v4.0.5</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.4...v4.0.5">4.0.5</a> - 2024-04-03</h2>
<h3>Fixes</h3>
<ul>
<li>don't break the <code>@scope</code> at-rule without params</li>
</ul>
<h2>v4.0.4</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.3...v4.0.4">4.0.4</a> - 2024-01-17</h2>
<h3>Fixes</h3>
<ul>
<li>handle <code>@scope</code> at-rule</li>
<li>css nesting</li>
<li>do not tread negative values as identifiers in the animation shorthand</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/css-modules/postcss-modules-local-by-default/blob/master/CHANGELOG.md">postcss-modules-local-by-default's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.1.1...v4.2.0">4.2.0</a> - 2024-12-11</h2>
<ul>
<li>feat: add support a <code>/* cssmodules-pure-no-check */</code> comment</li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.5...v4.1.1">4.1.0</a> - 2024-11-11</h2>
<ul>
<li>feat: add <code>global()</code> and <code>local()</code> for animations</li>
<li>feat: add pure ignore comment</li>
<li>fix: css nesting and pure mode</li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.4...v4.0.5">4.0.5</a> - 2024-04-03</h2>
<h3>Fixes</h3>
<ul>
<li>don't break the <code>@scope</code> at-rule without params</li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v4.0.3...v4.0.4">4.0.4</a> - 2024-01-17</h2>
<h3>Fixes</h3>
<ul>
<li>handle <code>@scope</code> at-rule</li>
<li>css nesting</li>
<li>do not tread negative values as identifiers in the animation shorthand</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>db195e7</code></a> chore(release): 4.2.0</li>
<li><a href=""><code>ba7e8ef</code></a> feat: added support a <code>cssmodules-pure-no-check</code> comment</li>
<li><a href=""><code>39a2f78</code></a> docs: fix (<a href="">#83</a>)</li>
<li><a href=""><code>e489ff8</code></a> chore(release): 4.1.0</li>
<li><a href=""><code>3811927</code></a> fix: css nesting and pure mode</li>
<li><a href=""><code>582bd9e</code></a> chore: postcss-selector-parser (<a href="">#81</a>)</li>
<li><a href=""><code>9d07eeb</code></a> feat: add pure ignore comment for CSS Modules (<a href="">#80</a>)</li>
<li><a href=""><code>fde62d7</code></a> feat: add <code>global</code> and <code>local</code> for animations (<a href="">#76</a>)</li>
<li><a href=""><code>a73b700</code></a> test: for current pure logic (<a href="">#74</a>)</li>
<li><a href=""><code>f1c05a5</code></a> test: enhanced test cases to prepare for CSS declaration-level processing (<a href="">#77</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/css-modules/postcss-modules-local-by-default/compare/v4.0.3...v4.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `postcss-modules-scope` from 3.0.0 to 3.2.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/css-modules/postcss-modules-scope/releases">postcss-modules-scope's releases</a>.</em></p>
<blockquote>
<h2>v3.2.1</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.2.0...v3.2.1">3.2.1</a></h2>
<h3>Chore</h3>
<ul>
<li>update <code>postcss-selector-parser</code></li>
</ul>
<h2>v3.2.0</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.1.2...v3.2.0">3.2.0</a> - 2024-04-03</h2>
<h3>Features</h3>
<ul>
<li>supports multiple composes, i.e. <code>.class { composes: a b, global(c), d e from &quot;./path/file.css&quot; }</code></li>
</ul>
<h2>v3.1.2</h2>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.1.1...v3.1.2">3.1.2</a> - 2024-04-03</h2>
<h3>Fixes</h3>
<ul>
<li>export a root and limit from the <code>@scope</code> at-rule</li>
</ul>
<h2>v3.1.1</h2>
<h2><a href="https://github.com/css-modules/postcss-modules-scope/compare/v3.1.0...v3.1.1">3.1.1</a> - 2024-01-18</h2>
<h3>Fixes</h3>
<ul>
<li>handle <code>@scope</code> at-rule</li>
<li>fix CSS nesting logic</li>
</ul>
<h2>v3.1.0</h2>
<h2><a href="https://github.com/css-modules/postcss-modules-scope/compare/v3.0.0...v3.1.0">3.1.0</a> - 2023-12-21</h2>
<h3>Fixes</h3>
<ul>
<li>scoped class attribute</li>
</ul>
<h3>Feature</h3>
<ul>
<li>pass a node to the <code>generateExportEntry</code> option</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/css-modules/postcss-modules-scope/blob/master/CHANGELOG.md">postcss-modules-scope's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.2.0...v3.2.1">3.2.1</a></h2>
<h3>Chore</h3>
<ul>
<li>update <code>postcss-selector-parser</code></li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.1.2...v3.2.0">3.2.0</a> - 2024-04-03</h2>
<h3>Features</h3>
<ul>
<li>supports multiple composes, i.e. <code>.class { composes: a b, global(c), d e from &quot;./path/file.css&quot; }</code></li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.1.1...v3.1.2">3.1.2</a> - 2024-04-03</h2>
<h3>Fixes</h3>
<ul>
<li>export a root and limit from the <code>@scope</code> at-rule</li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.1.0...v3.1.1">3.1.1</a> - 2024-01-18</h2>
<h3>Fixes</h3>
<ul>
<li>handle <code>@scope</code> at-rule</li>
<li>fix CSS nesting logic</li>
</ul>
<h2><a href="https://github.com/postcss-modules-local-by-default/compare/v3.0.0...v3.1.0">3.1.0</a> - 2023-12-21</h2>
<h3>Fixes</h3>
<ul>
<li>scoped class attribute</li>
</ul>
<h3>Features</h3>
<ul>
<li>pass a node to the <code>generateExportEntry</code> option</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>710d00e</code></a> chore(release): 3.2.1</li>
<li><a href=""><code>bc9d3bb</code></a> chore: update lock file (<a href="">#64</a>)</li>
<li><a href=""><code>be0c9f8</code></a> fix: update <code>postcss-selector-parser</code> (<a href="">#63</a>)</li>
<li><a href=""><code>0fea4e6</code></a> chore(release): 3.2.0</li>
<li><a href=""><code>0141278</code></a> feat: supports multiple composes (<a href="">#62</a>)</li>
<li><a href=""><code>ef877d0</code></a> chore(release): 3.1.2</li>
<li><a href=""><code>c8c3ee9</code></a> fix: export <a href="https://github.com/scope"><code>@​scope</code></a> root and limit locals (<a href="">#61</a>)</li>
<li><a href=""><code>2ef17a3</code></a> chore(release): 3.1.1</li>
<li><a href=""><code>f749cf2</code></a> fix: support css nesting and scope at-rule (<a href="">#59</a>)</li>
<li><a href=""><code>50a2a77</code></a> chore(release): 3.1.0</li>
<li>Additional commits viewable in <a href="https://github.com/css-modules/postcss-modules-scope/compare/v3.0.0...v3.2.1">compare view</a></li>
</ul>
</details>
<br />

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0796e4269274`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.