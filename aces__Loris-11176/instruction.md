# Issue

**Title:** Bump mtdowling/jmespath.php from 2.8.0 to 2.9.2

## Description

Bumps [mtdowling/jmespath.php](https://github.com/jmespath/jmespath.php) from 2.8.0 to 2.9.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jmespath/jmespath.php/releases">mtdowling/jmespath.php's releases</a>.</em></p>
<blockquote>
<h2>2.9.2</h2>
<ul>
<li>Pass explicit trim characters ahead of the PHP 8.6 trim default change.</li>
</ul>
<h2>2.9.1</h2>
<ul>
<li>Fixed the compiled runtime to emit function names as string literals, preventing arbitrary code execution.</li>
<li>Fixed the parser to reject non-identifier function callees, such as literal and raw string callees.</li>
</ul>
<h2>2.9.0</h2>
<ul>
<li>Added PHP 8.5 support.</li>
<li>Fixed to_number() to parse number strings using the JSON number grammar.</li>
<li>Fixed reverse() and string slicing to operate on UTF-8 characters rather than bytes.</li>
<li>Fixed slicing of array-like (ArrayAccess + Countable) values.</li>
<li>Fixed equality and contains() to use JSON semantics, e.g. 1 == 1.0 is now true.</li>
<li>Fixed multi-select hashes to end projections, so following tokens apply to the projected list.</li>
<li>Fixed sort() and sort_by() to compare numbers numerically.</li>
<li>Changed sort(), sort_by(), max(), min(), max_by() and min_by() to order strings by code point.</li>
<li>Fixed max_by() and min_by() to error on mixed-type keys instead of returning arbitrary elements.</li>
<li>Fixed max() returning null or erroring when the first array element is falsy, e.g. max([0, 1]).</li>
<li>Fixed sum() and join() to return 0 and an empty string respectively for empty arrays.</li>
<li>Fixed 0.0 to be truthy in filters and logical operators, like every other number.</li>
<li>Fixed the compiled runtime to apply JMESPath truthiness to || and &amp;&amp;.</li>
<li>Fixed @(foo), foo[-] and oversized index literals to throw syntax errors.</li>
<li>Fixed PHP warnings emitted while parsing certain invalid expressions.</li>
<li>Fixed the caret position in syntax error messages for errors at the end of an expression.</li>
<li>Fixed map() to error on non-array second arguments instead of returning [].</li>
<li>Fixed Env::cleanCompileDir() when JP_PHP_COMPILE=on.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jmespath/jmespath.php/blob/master/CHANGELOG.md">mtdowling/jmespath.php's changelog</a>.</em></p>
<blockquote>
<h2>2.9.2 - 2026-07-06</h2>
<ul>
<li>Pass explicit trim characters ahead of the PHP 8.6 trim default change.</li>
</ul>
<h2>2.9.1 - 2026-06-11</h2>
<ul>
<li>Fixed the compiled runtime to emit function names as string literals, preventing arbitrary code execution.</li>
<li>Fixed the parser to reject non-identifier function callees, such as literal and raw string callees.</li>
</ul>
<h2>2.9.0 - 2026-06-10</h2>
<ul>
<li>Added PHP 8.5 support.</li>
<li>Fixed to_number() to parse number strings using the JSON number grammar.</li>
<li>Fixed reverse() and string slicing to operate on UTF-8 characters rather than bytes.</li>
<li>Fixed slicing of array-like (ArrayAccess + Countable) values.</li>
<li>Fixed equality and contains() to use JSON semantics, e.g. 1 == 1.0 is now true.</li>
<li>Fixed multi-select hashes to end projections, so following tokens apply to the projected list.</li>
<li>Fixed sort() and sort_by() to compare numbers numerically.</li>
<li>Changed sort(), sort_by(), max(), min(), max_by() and min_by() to order strings by code point.</li>
<li>Fixed max_by() and min_by() to error on mixed-type keys instead of returning arbitrary elements.</li>
<li>Fixed max() returning null or erroring when the first array element is falsy, e.g. max([0, 1]).</li>
<li>Fixed sum() and join() to return 0 and an empty string respectively for empty arrays.</li>
<li>Fixed 0.0 to be truthy in filters and logical operators, like every other number.</li>
<li>Fixed the compiled runtime to apply JMESPath truthiness to || and &amp;&amp;.</li>
<li>Fixed @(foo), foo[-] and oversized index literals to throw syntax errors.</li>
<li>Fixed PHP warnings emitted while parsing certain invalid expressions.</li>
<li>Fixed the caret position in syntax error messages for errors at the end of an expression.</li>
<li>Fixed map() to error on non-array second arguments instead of returning [].</li>
<li>Fixed Env::cleanCompileDir() when JP_PHP_COMPILE=on.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2157c5e</code></a> Release 2.9.2</li>
<li><a href=""><code>aa13a7b</code></a> Freeze trim characters ahead of PHP 8.6 (<a href="">#121</a>)</li>
<li><a href=""><code>9c208ba</code></a> Release 2.9.1</li>
<li><a href=""><code>83a51c1</code></a> Add security policy and convert readme to markdown (<a href="">#117</a>)</li>
<li><a href=""><code>69aea5a</code></a> Fix arbitrary code execution in the compiled runtime (<a href="">#119</a>)</li>
<li><a href=""><code>77105da</code></a> Replace old links in the code (<a href="">#118</a>)</li>
<li><a href=""><code>9501100</code></a> Release 2.9.0</li>
<li><a href=""><code>ca10035</code></a> Fixed sum() and join() to return 0 and an empty string respectively for empty...</li>
<li><a href=""><code>eb36591</code></a> Fixed 0.0 to be truthy in filters and logical operators, like every other num...</li>
<li><a href=""><code>eed8676</code></a> Fixed multi-select hashes to end projections, so following tokens apply to th...</li>
<li>Additional commits viewable in <a href="https://github.com/jmespath/jmespath.php/compare/2.8.0...2.9.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=mtdowling/jmespath.php&package-manager=composer&previous-version=2.8.0&new-version=2.9.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.