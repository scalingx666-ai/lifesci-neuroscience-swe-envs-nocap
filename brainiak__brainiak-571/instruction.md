# Issue

**Title:** build(deps): bump werkzeug from 3.1.3 to 3.1.6

## Description

Bumps [werkzeug](https://github.com/pallets/werkzeug) from 3.1.3 to 3.1.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pallets/werkzeug/releases">werkzeug's releases</a>.</em></p>
<blockquote>
<h2>3.1.6</h2>
<p>This is the Werkzeug 3.1.6 security fix release, which fixes a security issue but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/Werkzeug/3.1.6/">https://pypi.org/project/Werkzeug/3.1.6/</a>
Changes: <a href="https://werkzeug.palletsprojects.com/page/changes/#version-3-1-6">https://werkzeug.palletsprojects.com/page/changes/#version-3-1-6</a></p>
<ul>
<li><code>safe_join</code> on Windows does not allow special devices names in multi-segment paths. <a href="https://github.com/pallets/werkzeug/security/advisories/GHSA-29vq-49wr-vm6x">GHSA-29vq-49wr-vm6x</a></li>
</ul>
<h2>3.1.5</h2>
<p>This is the Werkzeug 3.1.5 security fix release, which fixes security issues and bugs but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/Werkzeug/3.1.5/">https://pypi.org/project/Werkzeug/3.1.5/</a>
Changes: <a href="https://werkzeug.palletsprojects.com/page/changes/#version-3-1-5">https://werkzeug.palletsprojects.com/page/changes/#version-3-1-5</a>
Milestone: <a href="https://github.com/pallets/werkzeug/milestone/43?closed=1">https://github.com/pallets/werkzeug/milestone/43?closed=1</a></p>
<ul>
<li><code>safe_join</code> on Windows does not allow more special device names, regardless of extension or surrounding spaces. <a href="https://github.com/pallets/werkzeug/security/advisories/GHSA-87hc-h4r5-73f7">GHSA-87hc-h4r5-73f7</a></li>
<li>The multipart form parser handles a <code>\r\n</code> sequence at a chunk boundary. This fixes the previous attempt, which caused incorrect content lengths. <a href="">#3065</a> <a href="">#3077</a></li>
<li>Fix <code>AttributeError</code> when initializing <code>DebuggedApplication</code> with <code>pin_security=False</code>. <a href="">#3075</a></li>
</ul>
<h2>3.1.4</h2>
<p>This is the Werkzeug 3.1.4 fix release, which fixes bugs but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/Werkzeug/3.1.4/">https://pypi.org/project/Werkzeug/3.1.4/</a>
Changes: <a href="https://werkzeug.palletsprojects.com/page/changes/#version-3-1-4">https://werkzeug.palletsprojects.com/page/changes/#version-3-1-4</a>
Milestone: <a href="https://github.com/pallets/werkzeug/milestone/42?closed=1">https://github.com/pallets/werkzeug/milestone/42?closed=1</a></p>
<ul>
<li><code>safe_join</code> on Windows does not allow special device names. This prevents reading from these when using <code>send_from_directory</code>. <code>secure_filename</code> already prevented writing to these. <a href="https://github.com/pallets/werkzeug/security/advisories/GHSA-hgf8-39gv-g3f2">ghsa-hgf8-39gv-g3f2</a></li>
<li>The debugger pin fails after 10 attempts instead of 11. <a href="">#3020</a></li>
<li>The multipart form parser handles a <code>\r\n</code> sequence at a chunk boundary. <a href="">#3065</a></li>
<li>Improve CPU usage during Watchdog reloader. <a href="">#3054</a></li>
<li><code>Request.json</code> annotation is more accurate. <a href="">#3067</a></li>
<li>Traceback rendering handles when the line number is beyond the available source lines. <a href="">#3044</a></li>
<li><code>HTTPException.get_response</code> annotation and doc better conveys the distinction between WSGI and sans-IO responses. <a href="">#3056</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pallets/werkzeug/blob/main/CHANGES.rst">werkzeug's changelog</a>.</em></p>
<blockquote>
<h2>Version 3.1.6</h2>
<p>Released 2026-02-19</p>
<ul>
<li><code>safe_join</code> on Windows does not allow special devices names in
multi-segment paths. :ghsa:<code>29vq-49wr-vm6x</code></li>
<li><code>Response.make_conditional</code> sets the <code>Accept-Ranges</code> header even if it
is not a satisfiable range request. :issue:<code>3108</code></li>
</ul>
<h2>Version 3.1.5</h2>
<p>Released 2026-01-08</p>
<ul>
<li><code>safe_join</code> on Windows does not allow more special device names, regardless
of extension or surrounding spaces. :ghsa:<code>87hc-h4r5-73f7</code></li>
<li>The multipart form parser handles a <code>\r\n</code> sequence at a chunk boundary.
This fixes the previous attempt, which caused incorrect content lengths.
:issue:<code>3065</code> :issue:<code>3077</code></li>
<li>Fix <code>AttributeError</code> when initializing <code>DebuggedApplication</code> with
<code>pin_security=False</code>. :issue:<code>3075</code></li>
</ul>
<h2>Version 3.1.4</h2>
<p>Released 2025-11-28</p>
<ul>
<li><code>safe_join</code> on Windows does not allow special device names. This prevents
reading from these when using <code>send_from_directory</code>. <code>secure_filename</code>
already prevented writing to these. :ghsa:<code>hgf8-39gv-g3f2</code></li>
<li>The debugger pin fails after 10 attempts instead of 11. :pr:<code>3020</code></li>
<li>The multipart form parser handles a <code>\r\n</code> sequence at a chunk boundary.
:issue:<code>3065</code></li>
<li>Improve CPU usage during Watchdog reloader. :issue:<code>3054</code></li>
<li><code>Request.json</code> annotation is more accurate. :issue:<code>3067</code></li>
<li>Traceback rendering handles when the line number is beyond the available
source lines. :issue:<code>3044</code></li>
<li><code>HTTPException.get_response</code> annotation and doc better conveys the
distinction between WSGI and sans-IO responses. :issue:<code>3056</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>04da1b5</code></a> release version 3.1.6</li>
<li><a href=""><code>f407712</code></a> Merge commit from fork</li>
<li><a href=""><code>f54fe98</code></a> safe_join prevents Windows special device names in multi-segment paths</li>
<li><a href=""><code>d005985</code></a> start version 3.1.6</li>
<li><a href=""><code>8565c2c</code></a> document rule priority (<a href="">#3102</a>)</li>
<li><a href=""><code>3febc7e</code></a> document rule priority</li>
<li><a href=""><code>2525b82</code></a> remove state machine docs</li>
<li><a href=""><code>4abfbd5</code></a> rewrite build docstring (<a href="">#3097</a>)</li>
<li><a href=""><code>161c18b</code></a> rewrite build docstring</li>
<li><a href=""><code>86e11c2</code></a> release version 3.1.5 (<a href="">#3085</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pallets/werkzeug/compare/3.1.3...3.1.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=werkzeug&package-manager=uv&previous-version=3.1.3&new-version=3.1.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/brainiak/brainiak/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad3c27c5fc4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.