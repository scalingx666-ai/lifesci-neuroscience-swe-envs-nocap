# Issue

**Title:** chore(deps): Bump morgan from 1.10.0 to 1.12.0

## Description

Bumps [morgan](https://github.com/expressjs/morgan) from 1.10.0 to 1.12.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/expressjs/morgan/releases">morgan's releases</a>.</em></p>
<blockquote>
<h2>1.12.0</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: upgrade http:// to https:// in README by <a href="https://github.com/hanu-14"><code>@​hanu-14</code></a> in <a href="">expressjs/morgan#363</a></li>
<li>build: bump github actions and dev dependencies by <a href="https://github.com/sheplu"><code>@​sheplu</code></a> in <a href="">expressjs/morgan#369</a></li>
<li>chore(ci): npm-publish via reusable workflows by <a href="https://github.com/sheplu"><code>@​sheplu</code></a> in <a href="">expressjs/morgan#334</a></li>
<li>docs: add ES modules import example by <a href="https://github.com/aladi-debug"><code>@​aladi-debug</code></a> in <a href="">expressjs/morgan#352</a></li>
<li>docs: fix README lint errors by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/morgan#373</a></li>
<li>ci: use latest patch per Node.js major, add 23-26 by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/morgan#374</a></li>
<li>feat: pass objects through to streams in objectMode by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/morgan#375</a></li>
<li>feat: NO_COLOR env var removes color in dev format by <a href="https://github.com/jonchurch"><code>@​jonchurch</code></a> in <a href="">expressjs/morgan#377</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/hanu-14"><code>@​hanu-14</code></a> made their first contribution in <a href="">expressjs/morgan#363</a></li>
<li><a href="https://github.com/sheplu"><code>@​sheplu</code></a> made their first contribution in <a href="">expressjs/morgan#369</a></li>
<li><a href="https://github.com/aladi-debug"><code>@​aladi-debug</code></a> made their first contribution in <a href="">expressjs/morgan#352</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/expressjs/morgan/compare/1.11.0...1.12.0">https://github.com/expressjs/morgan/compare/1.11.0...1.12.0</a></p>
<h2>1.11.0</h2>
<h2>What's Changed</h2>
<ul>
<li>feat: add :pid token by <a href="https://github.com/ganesh3367"><code>@​ganesh3367</code></a> in <a href="">expressjs/morgan#329</a></li>
</ul>
<p>Security Fix:</p>
<ul>
<li>Escape control characters in <code>:remote-user</code> token to prevent log injection
<ul>
<li>Fixes <a href="https://www.cve.org/CVERecord?id=CVE-2026-5078">CVE-2026-5078</a> <a href="https://github.com/expressjs/morgan/security/advisories/GHSA-4vj7-5mj6-jm8m">GHSA-4vj7-5mj6-jm8m</a></li>
</ul>
</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/inigomarquinez"><code>@​inigomarquinez</code></a> made their first contribution in <a href="">expressjs/morgan#291</a></li>
<li><a href="https://github.com/jonchurch"><code>@​jonchurch</code></a> made their first contribution in <a href="">expressjs/morgan#299</a></li>
<li><a href="https://github.com/bjohansebas"><code>@​bjohansebas</code></a> made their first contribution in <a href="">expressjs/morgan#301</a></li>
<li><a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> made their first contribution in <a href="">expressjs/morgan#300</a></li>
<li><a href="https://github.com/ctcpip"><code>@​ctcpip</code></a> made their first contribution in <a href="">expressjs/morgan#319</a></li>
<li><a href="https://github.com/ganesh3367"><code>@​ganesh3367</code></a> made their first contribution in <a href="">expressjs/morgan#329</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/expressjs/morgan/compare/1.10.0...1.11.0">https://github.com/expressjs/morgan/compare/1.10.0...1.11.0</a></p>
<h2>1.10.1</h2>
<h2>What's Changed</h2>
<ul>
<li>renaming simple to sample in readme by <a href="https://github.com/ryhinchey"><code>@​ryhinchey</code></a> in <a href="">expressjs/morgan#237</a></li>
<li>adding installation instructions to readme by <a href="https://github.com/ryhinchey"><code>@​ryhinchey</code></a> in <a href="">expressjs/morgan#233</a></li>
<li>chore: add support for OSSF scorecard reporting by <a href="https://github.com/inigomarquinez"><code>@​inigomarquinez</code></a> in <a href="">expressjs/morgan#291</a></li>
<li>ci: replace travis with github actions by <a href="https://github.com/inigomarquinez"><code>@​inigomarquinez</code></a> in <a href="">expressjs/morgan#290</a></li>
<li>docs: add example output for log formats by <a href="https://github.com/jonchurch"><code>@​jonchurch</code></a> in <a href="">expressjs/morgan#299</a></li>
<li>ci: use ubuntu-latest by <a href="https://github.com/bjohansebas"><code>@​bjohansebas</code></a> in <a href="">expressjs/morgan#301</a></li>
<li>ci: apply OSSF Scorecard security best practices by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/morgan#300</a></li>
<li>remove --bail by <a href="https://github.com/jonchurch"><code>@​jonchurch</code></a> in <a href="">expressjs/morgan#314</a></li>
<li>⬆️ bump on-headers by <a href="https://github.com/ctcpip"><code>@​ctcpip</code></a> in <a href="">expressjs/morgan#319</a></li>
</ul>
<h2>New Contributors</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/expressjs/morgan/blob/master/HISTORY.md">morgan's changelog</a>.</em></p>
<blockquote>
<h1>1.12.0</h1>
<ul>
<li>Security fix for <a href="https://www.cve.org/CVERecord?id=CVE-2026-15603">CVE-2026-15603</a>(<a href="https://github.com/expressjs/morgan/security/advisories/GHSA-jxfw-x594-9x9m">GHSA-jxfw-x594-9x9m</a>)</li>
<li>Allow format functions to return objects for streams in <code>objectMode</code></li>
<li>Respect the <code>NO_COLOR</code> environment variable in the <code>dev</code> format</li>
</ul>
<h1>1.11.0</h1>
<ul>
<li>add <code>:pid</code> token</li>
</ul>
<p>Security Fix:</p>
<ul>
<li>Escape control characters in <code>:remote-user</code> token to prevent log injection
<ul>
<li>Fixes <a href="https://www.cve.org/CVERecord?id=CVE-2026-5078">CVE-2026-5078</a> <a href="https://github.com/expressjs/morgan/security/advisories/GHSA-4vj7-5mj6-jm8m">GHSA-4vj7-5mj6-jm8m</a></li>
</ul>
</li>
</ul>
<h1>1.10.1</h1>
<ul>
<li>deps: on-headers@~1.1.0
<ul>
<li>Fix <a href="https://www.cve.org/CVERecord?id=CVE-2025-7339">CVE-2025-7339</a> (<a href="https://github.com/expressjs/on-headers/security/advisories/GHSA-76c9-3jph-rj3q">GHSA-76c9-3jph-rj3q</a>)</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>063f084</code></a> 1.12.0 (<a href="">#376</a>)</li>
<li><a href=""><code>fbf9383</code></a> fix: escape all token values in log output</li>
<li><a href=""><code>0338399</code></a> feat: NO_COLOR env var removes color in dev format (<a href="">#377</a>)</li>
<li><a href=""><code>51007f9</code></a> feat: pass objects through to streams in objectMode (<a href="">#375</a>)</li>
<li><a href=""><code>4790f5d</code></a> ci: use latest patch per Node.js major, add 23-26 (<a href="">#374</a>)</li>
<li><a href=""><code>786c66d</code></a> docs: fix README lint errors (<a href="">#373</a>)</li>
<li><a href=""><code>98d848c</code></a> docs: add ES modules import example (<a href="">#352</a>)</li>
<li><a href=""><code>fb9a228</code></a> chore(ci): npm-publish via reusable workflows (<a href="">#334</a>)</li>
<li><a href=""><code>4729fe8</code></a> build: bump github actions and dev dependencies (<a href="">#369</a>)</li>
<li><a href=""><code>bd171d7</code></a> docs: update link (<a href="">#363</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/expressjs/morgan/compare/1.10.0...1.12.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for morgan since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=morgan&package-manager=npm_and_yarn&previous-version=1.10.0&new-version=1.12.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40b8017f2323`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.