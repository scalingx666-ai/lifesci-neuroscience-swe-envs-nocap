# Issue

**Title:** Bump julia-actions/setup-julia from 2 to 3

## Description

Bumps [julia-actions/setup-julia](https://github.com/julia-actions/setup-julia) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/julia-actions/setup-julia/releases">julia-actions/setup-julia's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<h2>:warning: Breaking Changes, and Migration Guide for v2 ⟶ v3</h2>
<ol>
<li>v3 requires Node 24 (compared to v2, which required Node 20).</li>
<li>The behavior of <code>version: min</code> has changed between v2 and v3.
<ul>
<li>In v2, <code>version: min</code> would resolve to the minimum major/minor/patch, e.g. 1.10.0.</li>
<li>In v3, <code>version: min</code> resolves to the minimum major/minor but the latest patch, e.g. 1.10.11.</li>
<li>If you specifically want the minimum major/minor/patch under v3, you should specify <code>version: min-patch</code>. Note: v3 also adds the alias <code>version: min-minor</code>, which is equivalent to <code>version: min</code>.</li>
</ul>
</li>
<li>v3 will throw an error if <code>x86_64</code> Julia binaries are requested on Apple Silicon macOS. (Under v2, this was a warning.) Under v3, if you specifically want to run <code>x86_64</code> Julia binaries on Apple Silicon (under Rosetta 2), you must now opt-in by specifying the <code>force-arch: true</code> input.</li>
</ol>
<h2>Other Changes</h2>
<p>We updated some dependencies, and we improved and updated the CI tooling on this repo.</p>
<h2>Full Changelog</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/julia-actions/setup-julia/compare/v2.7.0...v3.0.0">https://github.com/julia-actions/setup-julia/compare/v2.7.0...v3.0.0</a></p>
<h2>v2.7.0</h2>
<h2>Documentation</h2>
<ul>
<li>Make the README less misleading by putting some reasonable defaults in (instead of empty strings <code>''</code>) by <a href="https://github.com/DilumAluthge"><code>@​DilumAluthge</code></a> in <a href="">julia-actions/setup-julia#302</a></li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Bump julia-actions/setup-julia from 2.6.0 to 2.6.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#304</a></li>
<li>Bump nock from 13.5.5 to 13.5.6 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#305</a></li>
<li>Bump prettier from 3.3.3 to 3.4.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#306</a></li>
<li>Bump <code>@​vercel/ncc</code> from 0.38.2 to 0.38.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#309</a></li>
<li>Bump <code>@​types/node</code> from 22.9.0 to 22.10.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#307</a></li>
<li>Bump <code>@​types/node</code> from 22.10.1 to 22.13.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#314</a></li>
<li>Bump nock from 13.5.6 to 14.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#313</a></li>
<li>Bump typescript from 5.6.3 to 5.7.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#317</a></li>
<li>Bump semver from 7.6.3 to 7.7.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#315</a></li>
<li>Bump undici from 5.28.4 to 5.28.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#312</a></li>
<li>Bump <code>@​actions/tool-cache</code> from 2.0.1 to 2.0.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#316</a></li>
<li>Bump prettier from 3.4.1 to 3.4.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#310</a></li>
<li>Bump typescript from 5.7.3 to 5.8.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#321</a></li>
<li>Bump prettier from 3.4.2 to 3.5.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#323</a></li>
<li>Bump nock from 14.0.0 to 14.0.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#324</a></li>
<li>Bump <code>@​types/node</code> from 22.13.0 to 22.13.8 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#325</a></li>
<li>Bump prettier from 3.5.2 to 3.5.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#326</a></li>
<li>Bump typescript from 5.8.2 to 5.8.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#331</a></li>
<li>Bump nock from 14.0.1 to 14.0.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#332</a></li>
<li>Bump <code>@​types/node</code> from 22.13.8 to 22.15.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#333</a></li>
<li>Bump undici from 5.28.5 to 5.29.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#334</a></li>
<li>Bump ts-jest from 29.2.5 to 29.3.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#330</a></li>
<li>[CI] Group dependabot PRs by <a href="https://github.com/giordano"><code>@​giordano</code></a> in <a href="">julia-actions/setup-julia#341</a></li>
<li>Bump the all-npm-actions group with 4 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#342</a></li>
<li>Bump asdf-vm/actions from 3.0.2 to 4.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#340</a></li>
<li>Bump the all-npm-actions group with 6 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">julia-actions/setup-julia#343</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4a12c5f</code></a> Breaking: Change <code>min</code> to return the latest patch (but still the minimum majo...</li>
<li><a href=""><code>a8c65a2</code></a> Bump the all-github-actions group across 1 directory with 2 updates (<a href="">#381</a>)</li>
<li><a href=""><code>92d77f5</code></a> Bump picomatch from 2.3.1 to 2.3.2 (<a href="">#379</a>)</li>
<li><a href=""><code>679f144</code></a> Bump handlebars from 4.7.8 to 4.7.9 (<a href="">#377</a>)</li>
<li><a href=""><code>7c976c8</code></a> Add workflow to run make everything-from-scratch (<a href="">#378</a>)</li>
<li><a href=""><code>101e139</code></a> Breaking: Migrate from Node 20 to Node 24 (<a href="">#374</a>)</li>
<li><a href=""><code>44a615a</code></a> Require opt-in via <code>force-arch</code> to run x86 on macOS arm (<a href="">#352</a>)</li>
<li>See full diff in <a href="https://github.com/julia-actions/setup-julia/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=julia-actions/setup-julia&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dcd624b1cc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.