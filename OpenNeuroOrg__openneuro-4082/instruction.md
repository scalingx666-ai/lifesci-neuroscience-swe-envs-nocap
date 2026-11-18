# Issue

**Title:** chore(deps): Bump fflate from 0.7.4 to 0.8.3

## Description

Bumps [fflate](https://github.com/101arrowz/fflate) from 0.7.4 to 0.8.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/101arrowz/fflate/releases">fflate's releases</a>.</em></p>
<blockquote>
<h2>v0.8.3</h2>
<ul>
<li>Fix buffer over-read for Zip64 extra fields</li>
<li>Support sync flushes (<code>Z_SYNC_FLUSH</code> in zlib)
<ul>
<li>Allows for immediate decompression of all pushed bytes</li>
<li>Enables DEFLATE stream concatenation</li>
</ul>
</li>
<li>Fix <code>zip</code>/<code>zipSync</code> when using cross-realm <code>Uint8Array</code></li>
<li>Improve Zip64 support for streamed or undersized archives</li>
<li>Update performance estimates in README</li>
<li>Fix typings for TypeScript v5.7+</li>
<li>Reduce memory consumption after compression stream completion</li>
</ul>
<h2>v0.8.2</h2>
<ul>
<li>Fixed broken UMD build</li>
<li>Fixed edge-case causing skipped data during streaming compression</li>
<li>Fixed bug in GZIP streaming on member boundary</li>
<li>Improved streaming performance on inconsistent chunk sizes</li>
<li>Improved <code>unzip</code> performance on undercompressed archives</li>
<li>Added flushing support into streaming API</li>
<li>Added backpressure support into async streaming API
<ul>
<li>Use new <code>ondrain</code> handler and <code>queuedSize</code></li>
</ul>
</li>
</ul>
<h2>v0.8.0</h2>
<p>No release notes provided.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/101arrowz/fflate/blob/master/CHANGELOG.md">fflate's changelog</a>.</em></p>
<blockquote>
<h2>0.8.3</h2>
<ul>
<li>Fix buffer over-read for Zip64 extra fields</li>
<li>Support sync flushes (<code>Z_SYNC_FLUSH</code> in zlib)
<ul>
<li>Allows for immediate decompression of all pushed bytes</li>
<li>Enables DEFLATE stream concatenation</li>
</ul>
</li>
<li>Fix <code>zip</code>/<code>zipSync</code> when using cross-realm <code>Uint8Array</code></li>
<li>Improve Zip64 support for streamed or undersized archives</li>
<li>Update performance estimates in README</li>
<li>Fix typings for TypeScript v5.7+</li>
<li>Reduce memory consumption after compression stream completion</li>
</ul>
<h2>0.8.2</h2>
<ul>
<li>Fixed broken UMD build</li>
<li>Fixed edge-case causing skipped data during streaming compression</li>
<li>Fixed bug in GZIP streaming on member boundary</li>
<li>Improved streaming performance on inconsistent chunk sizes</li>
<li>Improved <code>unzip</code> performance on undercompressed archives</li>
<li>Added flushing support into streaming API</li>
<li>Added backpressure support into async streaming API
<ul>
<li>Use new <code>ondrain</code> handler and <code>queuedSize</code></li>
</ul>
</li>
</ul>
<h2>0.8.1</h2>
<ul>
<li>Fixed reallocating on pre-supplied buffer in <code>inflateSync</code> and <code>unzlibSync</code></li>
<li>Minor documentation fixes</li>
</ul>
<h2>0.8.0</h2>
<ul>
<li>BREAKING: synchronous decompression functions now take an options object rather than an output buffer as a second parameter
<ul>
<li><code>inflateSync(compressed, outBuf)</code> is now <code>inflateSync(compressed, { out: outBuf })</code></li>
</ul>
</li>
<li>Support dictionaries in compression and decompression</li>
<li>Support multi-member files in GZIP streaming decompression</li>
<li>Dramatically improved streaming performance</li>
<li>Fixed missing error on certain malformed GZIP files</li>
</ul>
<h2>0.7.3</h2>
<ul>
<li>Fix folder creation for certain operating system
<ul>
<li>Create 0-length &quot;files&quot; for each directory specified with &quot;object&quot; syntax&quot;</li>
<li>Support empty folders</li>
<li>Add options for folders</li>
</ul>
</li>
<li>Fix minification in SWC
<ul>
<li>Remove instanceof, no-whitespace assumptions in async functions</li>
</ul>
</li>
</ul>
<h2>0.7.2</h2>
<ul>
<li>Fixed TypeScript typing for errors when using <code>strictNullChecks</code></li>
<li>Fixed failure to compress files above 64kB with <code>{ level: 0 }</code></li>
<li>Fixed AMD module definition in UMD build</li>
</ul>
<h2>0.7.1</h2>
<ul>
<li>Removed requirement for <code>setTimeout</code></li>
<li>Added support for unzip file filters (thanks to <a href="https://github.com/manucorporat"><code>@​manucorporat</code></a>: <a href="">#67</a>)</li>
<li>Fixed streaming gunzip and unzlib bug causing corruption</li>
</ul>
<h2>0.7.0</h2>
<ul>
<li>Improved errors
<ul>
<li>Now errors are error objects instead of strings</li>
<li>Check the error code to apply custom logic based on error type</li>
</ul>
</li>
<li>Made async operations always call callbacks asynchronously</li>
<li>Fixed bug that caused errors to not appear in asynchronous operations in browsers</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dcb3714</code></a> 0.8.3</li>
<li><a href=""><code>31acfb8</code></a> prepare for v0.8.3</li>
<li><a href=""><code>7b71e3c</code></a> update dependencies</li>
<li><a href=""><code>44ff62d</code></a> fix zip64 header parsing</li>
<li><a href=""><code>7235df5</code></a> Fix TypeScript issues (<a href="">#242</a>)</li>
<li><a href=""><code>a44eda0</code></a> release compression buffers after stream end (<a href="">#213</a>)</li>
<li><a href=""><code>d94deb6</code></a> allow cross-realm Uint8Array for zip/zipSync (<a href="">#234</a>)</li>
<li><a href=""><code>2e1fb75</code></a> export package.json (<a href="">#244</a>)</li>
<li><a href=""><code>0f430b4</code></a> support sync flushes for compression streams (<a href="">#222</a>)</li>
<li><a href=""><code>4b7a6cb</code></a> skip transferring pooled Node buffers (<a href="">#227</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/101arrowz/fflate/compare/v0.7.4...v0.8.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fflate&package-manager=npm_and_yarn&previous-version=0.7.4&new-version=0.8.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd070ad41374`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.