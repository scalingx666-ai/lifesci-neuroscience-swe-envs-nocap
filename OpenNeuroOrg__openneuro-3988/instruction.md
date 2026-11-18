# Issue

**Title:** chore(deps): Bump dompurify from 3.4.0 to 3.4.11

## Description

Bumps [dompurify](https://github.com/cure53/DOMPurify) from 3.4.0 to 3.4.11.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/cure53/DOMPurify/releases">dompurify's releases</a>.</em></p>
<blockquote>
<h2>DOMPurify 3.4.11</h2>
<ul>
<li>Fixed an issue with a leaky config for hooks via <code>setConfig</code>, thanks <a href="https://github.com/trace37labs"><code>@​trace37labs</code></a></li>
<li>Bumped vulnerable development dependencies to arrive at plain 0 with <code>npm audit</code></li>
<li>Updated the <code>osv-scanner</code> suppression list as no vulnerable dependencies are left for now</li>
<li>Updated up the linting tool-chain and removed now-redundant lint directives</li>
<li>Updated the documentation is several spots, README, wiki, etc.</li>
<li>Bumped several dependencies where possible</li>
</ul>
<h2>DOMPurify 3.4.10</h2>
<ul>
<li>Refactored codebase for clarity: extracted the public type declarations into <code>types.ts</code></li>
<li>Decomposed the three largest sanitizer functions into focused helpers</li>
<li>Removed duplicated defaults and dead branches, consolidated <code>SAFE_FOR_TEMPLATES</code> scrubbing into single shared path</li>
<li>Improved per-node performance by hoisting the mXSS probe regexes and testing <code>textContent</code> before <code>innerHTML</code></li>
<li>Added a deterministic micro-benchmark harness (<code>npm run bench</code>) with a <code>--compare</code> mode</li>
<li>Reduced CI cost by running the full three-engine browser suite once per PR</li>
<li>Refreshed the <code>demos/</code> folder so every demo runs again, and added a SVG-via-<code>&lt;img&gt;</code> demo</li>
<li>Documented the bench and <code>test:happydom</code> scripts in the README</li>
<li>Completed the Attack Classes &amp; Bypass History wiki page</li>
<li>Bumped several dependencies where possible</li>
</ul>
<h2>DOMPurify 3.4.9</h2>
<ul>
<li>Further improved the handling of Trusted Types config options, thanks <a href="https://github.com/offset"><code>@​offset</code></a></li>
<li>Further improved the handling of <code>IN_PLACE</code> sanitization, thanks <a href="https://github.com/mozfreddyb"><code>@​mozfreddyb</code></a></li>
<li>Added more test coverage for <code>IN_PLACE</code> and Trusted Types related usage</li>
<li>Bumped several dependencies where possible</li>
<li>Updated README and wiki with more accurate documentation &amp; attack samples</li>
</ul>
<h2>DOMPurify 3.4.8</h2>
<ul>
<li>Cleaned up the repository root, renamed some and removed unneeded files</li>
<li>Fixed an issue with handling of Trusted Types policies, thanks <a href="https://github.com/fulstadev"><code>@​fulstadev</code></a></li>
<li>Fixed the node iterator for better template scrubbing, thanks <a href="https://github.com/IamLeandrooooo"><code>@​IamLeandrooooo</code></a></li>
<li>Included formerly missing LICENSE-MPL in published npm package, thanks <a href="https://github.com/asamuzaK"><code>@​asamuzaK</code></a></li>
<li>Bumped several dependencies where possible</li>
</ul>
<h2>DOMPurify 3.4.7</h2>
<ul>
<li>Hardened the handling of Shadow Roots when using <code>IN_PLACE</code>, thanks <a href="https://github.com/GameZoneHacker"><code>@​GameZoneHacker</code></a></li>
<li>Removed a problem leading to permanent hook pollution, thanks <a href="https://github.com/offset"><code>@​offset</code></a></li>
<li>Refactored the test suite and expanded test coverage significantly</li>
</ul>
<h2>DOMPurify 3.4.6</h2>
<ul>
<li>Fixed several issues with DOM Clobbering in <code>IN_PLACE</code> mode, thanks <a href="https://github.com/offset"><code>@​offset</code></a> &amp; <a href="https://github.com/Bankde"><code>@​Bankde</code></a></li>
<li>Hardened the checks for cross-realm <code>IN_PLACE</code> and Shadow DOM sanitization, thanks <a href="https://github.com/offset"><code>@​offset</code></a> &amp; <a href="https://github.com/Bankde"><code>@​Bankde</code></a></li>
<li>Added more test coverage for <code>IN_PLACE</code> and general DOM Clobbering attacks</li>
<li>Bumped several dependencies where possible</li>
</ul>
<h2>DOMPurify 3.4.5</h2>
<ul>
<li>Fixed a bypass caused by the new HTML element <code>selectedcontent</code> added in 3.4.4, thanks <a href="https://github.com/KabirAcharya"><code>@​KabirAcharya</code></a></li>
</ul>
<p><strong>Note that this is a security release for an issue introduced in 3.4.4 and should be upgraded to immediately.</strong></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0cae518</code></a> release: 3.4.11 (<a href="">#1494</a>)</li>
<li><a href=""><code>6ee5716</code></a> release: 3.4.10 (<a href="">#1478</a>)</li>
<li><a href=""><code>5210247</code></a> release: 3.4.9 (<a href="">#1459</a>)</li>
<li><a href=""><code>bcdd828</code></a> release: 3.4.8 (<a href="">#1439</a>)</li>
<li><a href=""><code>ca30f07</code></a> release: 3.4.7 (<a href="">#1414</a>)</li>
<li><a href=""><code>bb7739e</code></a> release: 3.4.6 (<a href="">#1394</a>)</li>
<li><a href=""><code>011b0c7</code></a> release: 3.4.5 (<a href="">#1382</a>)</li>
<li><a href=""><code>5817ad9</code></a> release: 3.4.4 (<a href="">#1374</a>)</li>
<li><a href=""><code>520edb0</code></a> release: 3.4.3 (<a href="">#1352</a>)</li>
<li><a href=""><code>6f67fd3</code></a> Sync/3.4.2 (<a href="">#1322</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/cure53/DOMPurify/compare/3.4.0...3.4.11">compare view</a></li>
</ul>
</details>
<details>
<summary>Install script changes</summary>
<p>This version adds <code>prepare</code> script that runs during installation. Review the package contents before updating.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=dompurify&package-manager=npm_and_yarn&previous-version=3.4.0&new-version=3.4.11)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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