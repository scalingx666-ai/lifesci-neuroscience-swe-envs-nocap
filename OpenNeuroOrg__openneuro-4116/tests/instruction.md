# Issue

**Title:** chore(deps): Bump handlebars from 4.7.9 to 4.7.10

## Description

Bumps [handlebars](https://github.com/handlebars-lang/handlebars.js) from 4.7.9 to 4.7.10.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/handlebars-lang/handlebars.js/releases">handlebars's releases</a>.</em></p>
<blockquote>
<h2>v4.7.10</h2>
<ul>
<li>security: Sanitize the source map URL when minifying - f37c599</li>
<li>security: Iterate lazily in #each and strip whitespace in linear time - 812c226</li>
<li>security: Escape <code>&lt;!--</code> and <code>&lt;script</code> in precompiled output - 609d1b1 GHSA-xw65-4hp5-5hc7</li>
<li>security: Don't trust special properties on context data - ceec388 GHSA-p8wg-vrv2-v86f</li>
<li>security: Only compile partials that are template strings - c28ee7a</li>
<li>security: Only dispatch known node types in the Compiler and Visitor - 7d501a5</li>
<li>security: Validate AST values in the compiler instead of the parser - 703fdcc GHSA-8r5x-fm3f-whwj</li>
<li>Clarify that --root does not restrict filesystem access - 0fcf25c</li>
<li>Bump minimist to ^1.2.8 - ea8ed82</li>
<li>Fix Ruby component publishing documentation - d069c1c</li>
<li>Fix Composer component definition - 6714e07</li>
</ul>
<p>Compatibility notes:</p>
<ul>
<li><code>{{#each}}</code> iterates iterables such as <code>Map</code>, <code>Set</code> and generators lazily, like <code>for...of</code>, instead of
copying them into an array first. Values added to the iterable while the block renders are now visited too.</li>
</ul>
<p><a href="https://github.com/handlebars-lang/handlebars.js/compare/v4.7.9...v4.7.10">Commits</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/handlebars-lang/handlebars.js/blob/v4.7.10/release-notes.md">handlebars's changelog</a>.</em></p>
<blockquote>
<h2>v4.7.10 - October 5th, 2026</h2>
<ul>
<li>security: Sanitize the source map URL when minifying - f37c599</li>
<li>security: Iterate lazily in #each and strip whitespace in linear time - 812c226</li>
<li>security: Escape <code>&lt;!--</code> and <code>&lt;script</code> in precompiled output - 609d1b1 GHSA-xw65-4hp5-5hc7</li>
<li>security: Don't trust special properties on context data - ceec388 GHSA-p8wg-vrv2-v86f</li>
<li>security: Only compile partials that are template strings - c28ee7a</li>
<li>security: Only dispatch known node types in the Compiler and Visitor - 7d501a5</li>
<li>security: Validate AST values in the compiler instead of the parser - 703fdcc GHSA-8r5x-fm3f-whwj</li>
<li>Clarify that --root does not restrict filesystem access - 0fcf25c</li>
<li>Bump minimist to ^1.2.8 - ea8ed82</li>
<li>Fix Ruby component publishing documentation - d069c1c</li>
<li>Fix Composer component definition - 6714e07</li>
</ul>
<p>Compatibility notes:</p>
<ul>
<li><code>{{#each}}</code> iterates iterables such as <code>Map</code>, <code>Set</code> and generators lazily, like <code>for...of</code>, instead of
copying them into an array first. Values added to the iterable while the block renders are now visited too.</li>
</ul>
<p><a href="https://github.com/handlebars-lang/handlebars.js/compare/v4.7.9...v4.7.10">Commits</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>45ce152</code></a> v4.7.10</li>
<li><a href=""><code>e47b236</code></a> Update release notes</li>
<li><a href=""><code>f37c599</code></a> Sanitize the source map URL when minifying</li>
<li><a href=""><code>812c226</code></a> Iterate lazily in #each and strip whitespace in linear time</li>
<li><a href=""><code>609d1b1</code></a> Escape <code>&lt;!--</code> and <code>&lt;script</code> in precompiled output</li>
<li><a href=""><code>ceec388</code></a> Don't trust special properties on context data</li>
<li><a href=""><code>c28ee7a</code></a> Only compile partials that are template strings</li>
<li><a href=""><code>7d501a5</code></a> Only dispatch known node types in the Compiler and Visitor</li>
<li><a href=""><code>703fdcc</code></a> Validate AST values in the compiler instead of the parser</li>
<li><a href=""><code>0fcf25c</code></a> Clarify that --root does not restrict filesystem access</li>
<li>Additional commits viewable in <a href="https://github.com/handlebars-lang/handlebars.js/compare/v4.7.9...v4.7.10">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=handlebars&package-manager=npm_and_yarn&previous-version=4.7.9&new-version=4.7.10)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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