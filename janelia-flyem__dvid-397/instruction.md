# Issue

**Title:** Bump github.com/golang-jwt/jwt/v4 from 4.4.1 to 4.5.1

## Description

Bumps [github.com/golang-jwt/jwt/v4](https://github.com/golang-jwt/jwt) from 4.4.1 to 4.5.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/golang-jwt/jwt/releases">github.com/golang-jwt/jwt/v4's releases</a>.</em></p>
<blockquote>
<h2>v4.5.1</h2>
<h1>Security</h1>
<p>Unclear documentation of the error behavior in <code>ParseWithClaims</code> in &lt;= 4.5.0 could lead to situation where users are potentially not checking errors in the way they should be. Especially, if a token is both expired and invalid, the errors returned by <code>ParseWithClaims</code> return both error codes. If users only check for the <code>jwt.ErrTokenExpired </code> using <code>error.Is</code>, they will ignore the embedded <code>jwt.ErrTokenSignatureInvalid</code> and thus potentially accept invalid tokens.</p>
<p>This issue was documented in <a href="https://github.com/golang-jwt/jwt/security/advisories/GHSA-29wx-vh33-7x7r">https://github.com/golang-jwt/jwt/security/advisories/GHSA-29wx-vh33-7x7r</a> and fixed in this release.</p>
<p>Note: <code>v5</code> was not affected by this issue. So upgrading to this release version is also recommended.</p>
<h1>What's Changed</h1>
<ul>
<li>Back-ported error-handling logic in <code>ParseWithClaims</code> from <code>v5</code> branch. This fixes <a href="https://github.com/golang-jwt/jwt/security/advisories/GHSA-29wx-vh33-7x7r">https://github.com/golang-jwt/jwt/security/advisories/GHSA-29wx-vh33-7x7r</a>.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang-jwt/jwt/compare/v4.5.0...v4.5.1">https://github.com/golang-jwt/jwt/compare/v4.5.0...v4.5.1</a></p>
<h2>v4.5.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Allow strict base64 decoding by <a href="https://github.com/AlexanderYastrebov"><code>@​AlexanderYastrebov</code></a> in <a href="">golang-jwt/jwt#259</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang-jwt/jwt/compare/v4.4.3...v4.5.0">https://github.com/golang-jwt/jwt/compare/v4.4.3...v4.5.0</a></p>
<h2>v4.4.3</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: link update for README.md for v4 by <a href="https://github.com/krokite"><code>@​krokite</code></a> in <a href="">golang-jwt/jwt#217</a></li>
<li>Implement a BearerExtractor by <a href="https://github.com/WhyNotHugo"><code>@​WhyNotHugo</code></a> in <a href="">golang-jwt/jwt#226</a></li>
<li>Bump matrix to support latest go version (go1.19) by <a href="https://github.com/mfridman"><code>@​mfridman</code></a> in <a href="">golang-jwt/jwt#231</a></li>
<li>Include <a href="https://github.com/golang-jwt/jwe">https://github.com/golang-jwt/jwe</a> in README by <a href="https://github.com/oxisto"><code>@​oxisto</code></a> in <a href="">golang-jwt/jwt#229</a></li>
<li>Add doc comment to ParseWithClaims by <a href="https://github.com/jkopczyn"><code>@​jkopczyn</code></a> in <a href="">golang-jwt/jwt#232</a></li>
<li>Refactor: removed the unneeded if statement by <a href="https://github.com/Krout0n"><code>@​Krout0n</code></a> in <a href="">golang-jwt/jwt#241</a></li>
<li>No pointer embedding in the example by <a href="https://github.com/oxisto"><code>@​oxisto</code></a> in <a href="">golang-jwt/jwt#255</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/krokite"><code>@​krokite</code></a> made their first contribution in <a href="">golang-jwt/jwt#217</a></li>
<li><a href="https://github.com/WhyNotHugo"><code>@​WhyNotHugo</code></a> made their first contribution in <a href="">golang-jwt/jwt#226</a></li>
<li><a href="https://github.com/jkopczyn"><code>@​jkopczyn</code></a> made their first contribution in <a href="">golang-jwt/jwt#232</a></li>
<li><a href="https://github.com/Krout0n"><code>@​Krout0n</code></a> made their first contribution in <a href="">golang-jwt/jwt#241</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang-jwt/jwt/compare/v4.4.2...v4.4.3">https://github.com/golang-jwt/jwt/compare/v4.4.2...v4.4.3</a></p>
<h2>v4.4.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Added MicahParks/keyfunc to extensions by <a href="https://github.com/oxisto"><code>@​oxisto</code></a> in <a href="">golang-jwt/jwt#194</a></li>
<li>Update link to v4 on pkg.go.dev page by <a href="https://github.com/polRk"><code>@​polRk</code></a> in <a href="">golang-jwt/jwt#195</a></li>
<li>add installation guidelines to the README file  by <a href="https://github.com/morelmiles"><code>@​morelmiles</code></a> in <a href="">golang-jwt/jwt#204</a></li>
<li>chore: replace ioutil with io and os by <a href="https://github.com/estensen"><code>@​estensen</code></a> in <a href="">golang-jwt/jwt#198</a></li>
<li>CI check for Go code formatting by <a href="https://github.com/mfridman"><code>@​mfridman</code></a> in <a href="">golang-jwt/jwt#206</a></li>
<li>Create SECURITY.md by <a href="https://github.com/mfridman"><code>@​mfridman</code></a> in <a href="">golang-jwt/jwt#171</a></li>
<li>Update SECURITY.md by <a href="https://github.com/oxisto"><code>@​oxisto</code></a> in <a href="">golang-jwt/jwt#207</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7b1c1c0</code></a> Merge commit from fork</li>
<li><a href=""><code>9358574</code></a> Allow strict base64 decoding (<a href="">#259</a>)</li>
<li><a href=""><code>2f0984a</code></a> Using <code>tparse</code> for nicer CI test display (<a href="">#251</a>)</li>
<li><a href=""><code>2101c1f</code></a> No pointer embedding in the example (<a href="">#255</a>)</li>
<li><a href=""><code>35053d4</code></a> Removed unneeded if statement (<a href="">#241</a>)</li>
<li><a href=""><code>0c4e387</code></a> Add doc comment to ParseWithClaims (<a href="">#232</a>)</li>
<li><a href=""><code>bfea432</code></a> Include <a href="https://github.com/golang-jwt/jwe">https://github.com/golang-jwt/jwe</a> in README (<a href="">#229</a>)</li>
<li><a href=""><code>d81acbf</code></a> Bump matrix to support latest go version (go1.19) (<a href="">#231</a>)</li>
<li><a href=""><code>fdaf0eb</code></a> Implement a BearerExtractor (<a href="">#226</a>)</li>
<li><a href=""><code>f2878bb</code></a> fix: link update for README.md for v4 (<a href="">#217</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/golang-jwt/jwt/compare/v4.4.1...v4.5.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github.com/golang-jwt/jwt/v4&package-manager=go_modules&previous-version=4.4.1&new-version=4.5.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/397)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a7eb62d8724`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.