# Issue

**Title:** chore(deps): Bump body-parser from 2.3.0 to 2.4.0

## Description

Bumps [body-parser](https://github.com/expressjs/body-parser) from 2.3.0 to 2.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/expressjs/body-parser/releases">body-parser's releases</a>.</em></p>
<blockquote>
<h2>v2.4.0</h2>
<h2>Important: Security</h2>
<ul>
<li>Security fix for <a href="https://www.cve.org/CVERecord?id=CVE-2026-111181">CVE-2026-111181</a> (<a href="https://github.com/expressjs/body-parser/security/advisories/GHSA-27r3-jxmh-p828">GHSA-27r3-jxmh-p828</a>)</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>build(deps): bump actions/checkout from 6.0.3 to 7.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">expressjs/body-parser#737</a></li>
<li>chore: group github actions updates by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#743</a></li>
<li>build(deps): bump the github-actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">expressjs/body-parser#745</a></li>
<li>test: fix 'presist' typo in test descriptions by <a href="https://github.com/maxtaran2010"><code>@​maxtaran2010</code></a> in <a href="">expressjs/body-parser#749</a></li>
<li>docs: include security fix in 2.3.0 changes by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/body-parser#748</a></li>
<li>fix: avoid mutating read options when reading body by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#742</a></li>
<li>refactor: move getCharset helper to only usage by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#707</a></li>
<li>build(deps): bump the github-actions group with 7 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">expressjs/body-parser#753</a></li>
<li>refactor: switch to neostandard by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#751</a></li>
<li>perf(json): avoid first-char regex for direct JSON bodies by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#744</a></li>
<li>docs: fix entity verify error description by <a href="https://github.com/Rawal27"><code>@​Rawal27</code></a> in <a href="">expressjs/body-parser#755</a></li>
<li>feat: zstandard support by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#586</a></li>
<li>test: remove unused experimentalZstd option by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#757</a></li>
<li>ci: run tests on windows and macos matrix by <a href="https://github.com/kilisamemarisaaa"><code>@​kilisamemarisaaa</code></a> in <a href="">expressjs/body-parser#759</a></li>
<li>deps: qs@^6.16.0 by <a href="https://github.com/krzysdz"><code>@​krzysdz</code></a> in <a href="">expressjs/body-parser#762</a></li>
<li>build(deps): bump the github-actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">expressjs/body-parser#763</a></li>
<li>ci: trigger npm publish on release published and set dist-tag by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/body-parser#768</a></li>
<li>build(deps): bump the github-actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">expressjs/body-parser#771</a></li>
<li>fix(test): pin supertest to 7.3.0 to avoid 7.3.1 regression by <a href="https://github.com/saadkhantareen"><code>@​saadkhantareen</code></a> in <a href="">expressjs/body-parser#773</a></li>
<li>perf: inline content stream setup by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#750</a></li>
<li>docs: note that req.body may be undefined in v2 by <a href="https://github.com/Hashim1999164"><code>@​Hashim1999164</code></a> in <a href="">expressjs/body-parser#752</a></li>
<li>docs: fix strict option description by <a href="https://github.com/Rawal27"><code>@​Rawal27</code></a> in <a href="">expressjs/body-parser#756</a></li>
<li>docs: fix depth error description by <a href="https://github.com/johnnyhuirilef"><code>@​johnnyhuirilef</code></a> in <a href="">expressjs/body-parser#776</a></li>
<li>chore: update dependencies by <a href="https://github.com/Phillip9587"><code>@​Phillip9587</code></a> in <a href="">expressjs/body-parser#778</a></li>
<li>Release: 2.4.0 by <a href="https://github.com/UlisesGascon"><code>@​UlisesGascon</code></a> in <a href="">expressjs/body-parser#777</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/maxtaran2010"><code>@​maxtaran2010</code></a> made their first contribution in <a href="">expressjs/body-parser#749</a></li>
<li><a href="https://github.com/Rawal27"><code>@​Rawal27</code></a> made their first contribution in <a href="">expressjs/body-parser#755</a></li>
<li><a href="https://github.com/kilisamemarisaaa"><code>@​kilisamemarisaaa</code></a> made their first contribution in <a href="">expressjs/body-parser#759</a></li>
<li><a href="https://github.com/saadkhantareen"><code>@​saadkhantareen</code></a> made their first contribution in <a href="">expressjs/body-parser#773</a></li>
<li><a href="https://github.com/Hashim1999164"><code>@​Hashim1999164</code></a> made their first contribution in <a href="">expressjs/body-parser#752</a></li>
<li><a href="https://github.com/johnnyhuirilef"><code>@​johnnyhuirilef</code></a> made their first contribution in <a href="">expressjs/body-parser#776</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/expressjs/body-parser/compare/v2.3.0...v2.4.0">https://github.com/expressjs/body-parser/compare/v2.3.0...v2.4.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/expressjs/body-parser/blob/master/HISTORY.md">body-parser's changelog</a>.</em></p>
<blockquote>
<h1>2.4.0</h1>
<ul>
<li>Security fix for <a href="https://github.com/expressjs/body-parser/security/advisories/GHSA-27r3-jxmh-p828">GHSA-27r3-jxmh-p828</a> (CVE-2026-111181)</li>
<li>feat: add <code>zstd</code> content-encoding support (<a href="">#586</a>)
<ul>
<li>Requires Node.js <code>^22.15.0</code> or <code>&gt;=23.8.0</code>; older versions keep returning <code>415</code> for <code>zstd</code> encoded bodies</li>
</ul>
</li>
<li>fix: avoid mutating the parser options and the request object while reading the body (<a href="">#742</a>, <a href="">#750</a>)</li>
<li>perf(json): avoid first-char regex for direct JSON bodies (<a href="">#744</a>)</li>
<li>deps:
<ul>
<li>content-type@^2.1.0</li>
<li>iconv-lite^0.7.3</li>
<li>qs@^6.16.1</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b4744d7</code></a> 2.4.0 (<a href="">#777</a>)</li>
<li><a href=""><code>f7075ea</code></a> fix: prevent process crash from trailing bytes after a compressed body</li>
<li><a href=""><code>185ff1d</code></a> chore: update dependencies (<a href="">#778</a>)</li>
<li><a href=""><code>73713f7</code></a> docs: fix depth error description (<a href="">#776</a>)</li>
<li><a href=""><code>2dcc826</code></a> docs: improve readability (<a href="">#756</a>)</li>
<li><a href=""><code>402dbdc</code></a> docs: note that req.body may be undefined in v2 (<a href="">#752</a>)</li>
<li><a href=""><code>9883a1e</code></a> perf: inline content stream setup (<a href="">#750</a>)</li>
<li><a href=""><code>02101da</code></a> fix(test): pin supertest to 7.3.0 to avoid 7.3.1 regression (<a href="">#773</a>)</li>
<li><a href=""><code>822a0fd</code></a> build(deps): bump the github-actions group with 3 updates (<a href="">#771</a>)</li>
<li><a href=""><code>aa9889b</code></a> ci: trigger npm publish on release published and set dist-tag (<a href="">#768</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/expressjs/body-parser/compare/v2.3.0...v2.4.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for body-parser since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=body-parser&package-manager=npm_and_yarn&previous-version=2.3.0&new-version=2.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c26416935b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.