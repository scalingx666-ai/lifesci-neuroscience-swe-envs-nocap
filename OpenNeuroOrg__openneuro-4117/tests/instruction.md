# Issue

**Title:** chore(deps): Bump source-map-js from 1.0.2 to 1.2.2

## Description

Bumps [source-map-js](https://github.com/7rulnik/source-map-js) from 1.0.2 to 1.2.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/7rulnik/source-map-js/releases">source-map-js's releases</a>.</em></p>
<blockquote>
<h2>v1.2.2</h2>
<ul>
<li>
<p>Fix crash when executing in browser with CSP script-src that don't permit unsafe-eval (<a href="">#29</a>) <a href="https://github.com/xfournet"><code>@​xfournet</code></a></p>
</li>
<li>
<p>Fix denial of service from malicious indexed source maps (CVE-2026-93749) (<a href="">#79</a>)</p>
<p>Reported by <a href="https://github.com/waydeshi"><code>@​waydeshi</code></a> in <a href="">#76</a>. A fix was also proposed by <a href="https://github.com/aniebiet"><code>@​aniebiet</code></a> in <a href="">#78</a>.</p>
</li>
</ul>
<h2>v1.2.1</h2>
<ul>
<li>
<p>Fix TS2306 “not a module” errors in type definitions (<a href="">#16</a>) <a href="https://github.com/andersk"><code>@​andersk</code></a></p>
</li>
<li>
<p>Ensure null source is respected (<a href="">#26</a>) <a href="https://github.com/dragomirtitian"><code>@​dragomirtitian</code></a></p>
</li>
<li>
<p>Improve ts declarations to be null-safe (<a href="">#27</a>) <a href="https://github.com/dragomirtitian"><code>@​dragomirtitian</code></a></p>
</li>
</ul>
<h2>v1.2.0</h2>
<p>Allow to pass options to <code>SourceMapGenerator</code> using <code>SourceMapGenerator.fromSourceMap</code> as second argument</p>
<pre lang="js"><code>var generator = sourceMap.SourceMapGenerator.fromSourceMap(new SourceMapConsumer(), {
  ignoreInvalidMapping: true,
});
</code></pre>
<ul>
<li>Add generator options to fromSourceMap (<a href="">#22</a>) <a href="https://github.com/ai"><code>@​ai</code></a></li>
</ul>
<h2>v1.1.0</h2>
<p>Add <code>ignoreInvalidMapping</code> option to <code>SourceMapGenerator</code>. If enabled, source-map-js will not throw an error on the incorrect previous source map. Instead, it will print warnings and ignore broken mappings.</p>
<pre lang="js"><code>var generator = new sourceMap.SourceMapGenerator({
  file: &quot;my-generated-javascript-file.js&quot;,
  sourceRoot: &quot;http://example.com/app/js/&quot;,
  ignoreInvalidMapping: true,
});
</code></pre>
<ul>
<li>Do not throw an error since broken prev map is popular issue <a href="">#20</a> (<a href="">#20</a>) <a href="https://github.com/ai"><code>@​ai</code></a></li>
<li>Add ignoreInvalidMapping option (<a href="">#21</a>) <a href="https://github.com/7rulnik"><code>@​7rulnik</code></a></li>
</ul>
<h2>v1.0.3</h2>
<ul>
<li>Use sourceContents when non-null, even if it's an empty string (<a href="">#17</a>) <a href="https://github.com/bshepherdson"><code>@​bshepherdson</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/7rulnik/source-map-js/blob/main/CHANGELOG.md">source-map-js's changelog</a>.</em></p>
<blockquote>
<h2>1.2.2</h2>
<ul>
<li>
<p>Fix crash when executing in browser with CSP script-src that don't permit unsafe-eval (<a href="">#29</a>) <a href="https://github.com/xfournet"><code>@​xfournet</code></a></p>
</li>
<li>
<p>Fix denial of service from malicious indexed source maps (CVE-2026-93749) (<a href="">#79</a>)</p>
<p>Reported by <a href="https://github.com/waydeshi"><code>@​waydeshi</code></a> in <a href="">#76</a>. A fix was also proposed by <a href="https://github.com/aniebiet"><code>@​aniebiet</code></a> in <a href="">#78</a>.</p>
</li>
</ul>
<h2>1.2.1</h2>
<ul>
<li>
<p>Fix TS2306 “not a module” errors in type definitions (<a href="">#16</a>) <a href="https://github.com/andersk"><code>@​andersk</code></a></p>
</li>
<li>
<p>Ensure null source is respected (<a href="">#26</a>) <a href="https://github.com/dragomirtitian"><code>@​dragomirtitian</code></a></p>
</li>
<li>
<p>Improve ts declarations to be null-safe (<a href="">#27</a>) <a href="https://github.com/dragomirtitian"><code>@​dragomirtitian</code></a></p>
</li>
</ul>
<h2>1.2.0</h2>
<p>Allow to pass options to <code>SourceMapGenerator</code> using <code>SourceMapGenerator.fromSourceMap</code> as second argument</p>
<pre lang="js"><code>var generator = sourceMap.SourceMapGenerator.fromSourceMap(new SourceMapConsumer(), {
  ignoreInvalidMapping: true,
});
</code></pre>
<ul>
<li>Add generator options to fromSourceMap (<a href="">#22</a>) <a href="https://github.com/ai"><code>@​ai</code></a></li>
</ul>
<h2>1.1.0</h2>
<p>Add <code>ignoreInvalidMapping</code> option to <code>SourceMapGenerator</code>. If enabled, source-map-js will not throw an error on the incorrect previous source map. Instead, it will print warnings and ignore broken mappings.</p>
<pre lang="js"><code>var generator = new sourceMap.SourceMapGenerator({
  file: &quot;my-generated-javascript-file.js&quot;,
  sourceRoot: &quot;http://example.com/app/js/&quot;,
  ignoreInvalidMapping: true,
});
</code></pre>
<ul>
<li>Do not throw an error since broken prev map is popular issue (<a href="">#20</a>) <a href="https://github.com/ai"><code>@​ai</code></a></li>
<li>Add ignoreInvalidMapping option (<a href="">#21</a>) <a href="https://github.com/7rulnik"><code>@​7rulnik</code></a></li>
</ul>
<h2>1.0.3</h2>
<ul>
<li>Use sourceContents when non-null, even if it's an empty string (<a href="">#17</a>) <a href="https://github.com/bshepherdson"><code>@​bshepherdson</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0a1d334</code></a> 1.2.2</li>
<li><a href=""><code>4c6fa26</code></a> Update changelog</li>
<li><a href=""><code>cf76580</code></a> Fix denial of service from malicious indexed source maps (CVE-2026-93749) (<a href="">#79</a>)</li>
<li><a href=""><code>7899a86</code></a> Fix crash when executing browser with CSP script-src that don't permit unsafe...</li>
<li><a href=""><code>428d49f</code></a> 1.2.1</li>
<li><a href=""><code>c8b2f0b</code></a> Update changelog</li>
<li><a href=""><code>bd538e4</code></a> Improve ts declarations (<a href="">#27</a>)</li>
<li><a href=""><code>0f58a3f</code></a> Ensure null source is respected. (<a href="">#26</a>)</li>
<li><a href=""><code>9403576</code></a> Fix TS2306 “not a module” errors in type definitions (<a href="">#16</a>)</li>
<li><a href=""><code>9b69fab</code></a> 1.2.0</li>
<li>Additional commits viewable in <a href="https://github.com/7rulnik/source-map-js/compare/v1.0.2...v1.2.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=source-map-js&package-manager=npm_and_yarn&previous-version=1.0.2&new-version=1.2.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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