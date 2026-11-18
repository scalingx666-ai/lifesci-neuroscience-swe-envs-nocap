# Issue

**Title:** COMP: Bump the github-actions group with 3 updates

## Description

Bumps the github-actions group with 3 updates: [actions/create-github-app-token](https://github.com/actions/create-github-app-token), [ossf/scorecard-action](https://github.com/ossf/scorecard-action) and [github/codeql-action/upload-sarif](https://github.com/github/codeql-action).

Updates `actions/create-github-app-token` from 3.2.0 to 3.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/create-github-app-token/releases">actions/create-github-app-token's releases</a>.</em></p>
<blockquote>
<h2>v3.3.0</h2>
<h2><a href="https://github.com/actions/create-github-app-token/compare/v3.2.0...v3.3.0">3.3.0</a> (2026-10-12)</h2>
<h3>Features</h3>
<ul>
<li>update permission inputs (<a href="">#399</a>) (<a href="">a47236f</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li><strong>deps:</strong> bump nested undici from 6.24.0 to 6.29.0 (<a href="">#403</a>) (<a href="">12461a3</a>)</li>
<li><strong>deps:</strong> bump the production-dependencies group across 1 directory with 3 updates (<a href="">#395</a>) (<a href="">a69c19d</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/create-github-app-token/blob/main/CHANGELOG.md">actions/create-github-app-token's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<h2><a href="https://github.com/actions/create-github-app-token/compare/v3.2.0...v3.3.0">3.3.0</a> (2026-10-12)</h2>
<h3>Features</h3>
<ul>
<li>update permission inputs (<a href="">#399</a>) (<a href="">a47236f</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li><strong>deps:</strong> bump nested undici from 6.24.0 to 6.29.0 (<a href="">#403</a>) (<a href="">12461a3</a>)</li>
<li><strong>deps:</strong> bump the production-dependencies group across 1 directory with 3 updates (<a href="">#395</a>) (<a href="">a69c19d</a>)</li>
</ul>
<h2><a href="https://github.com/actions/create-github-app-token/compare/v3.1.1...v3.2.0">3.2.0</a> (2026-05-12)</h2>
<h3>Features</h3>
<ul>
<li>add support for enterprise-level GitHub Apps (<a href="">#263</a>) (<a href="">952a2a7</a>)</li>
<li>support full repository names in <code>repositories</code> input (<a href="">#372</a>) (<a href="">85eb8dd</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li><strong>deps:</strong> bump <code>@​actions/core</code> from 3.0.0 to 3.0.1 in the production-dependencies group (<a href="">#364</a>) (<a href="">43e5c34</a>)</li>
<li>validate private-key input (<a href="">#376</a>) (<a href="">f24bbd8</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>64ab729</code></a> chore(main): release 3.3.0 (<a href="">#402</a>)</li>
<li><a href=""><code>f3a828e</code></a> ci: create signed dist commits in release workflow (<a href="">#404</a>)</li>
<li><a href=""><code>655017f</code></a> docs: clarify when owner grants access to all repositories (<a href="">#378</a>)</li>
<li><a href=""><code>12461a3</code></a> fix(deps): bump nested undici from 6.24.0 to 6.29.0 (<a href="">#403</a>)</li>
<li><a href=""><code>a47236f</code></a> feat: update permission inputs (<a href="">#399</a>)</li>
<li><a href=""><code>a69c19d</code></a> fix(deps): bump the production-dependencies group across 1 directory with 3 u...</li>
<li><a href=""><code>d5cb7ae</code></a> build(deps): bump actions/checkout from 6 to 7 (<a href="">#384</a>)</li>
<li><a href=""><code>575da86</code></a> build(deps): bump stefanzweifel/git-auto-commit-action from 7.1.0 to 7.2.0 in...</li>
<li><a href=""><code>e85f677</code></a> test: omit stack traces from snapshots (<a href="">#401</a>)</li>
<li><a href=""><code>9419396</code></a> build(deps-dev): bump c8 from 11.0.0 to 12.0.0 (<a href="">#400</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/create-github-app-token/compare/bcd2ba49218906704ab6c1aa796996da409d3eb1...64ab729a6294000f5aa4a4bc0b73d1f32bc45510">compare view</a></li>
</ul>
</details>
<br />

Updates `ossf/scorecard-action` from 2.4.4 to 2.5.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/ossf/scorecard-action/releases">ossf/scorecard-action's releases</a>.</em></p>
<blockquote>
<h2>v2.5.0</h2>
<h2>What's Changed</h2>
<p>This release moves the action to Scorecard v5.6.0, the first Scorecard release since its hosted
services moved to new infrastructure.</p>
<p>For changes to checks and results, and what the infrastructure move means for you, see the
<a href="https://github.com/ossf/scorecard/releases/tag/v5.6.0">Scorecard v5.6.0 release notes</a>.</p>
<ul>
<li>The action's container image is built with Go 1.27.2 on a refreshed distroless base. by
<a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1716</a></li>
<li>The installer (<code>cmd/installer</code>) now creates <code>.github/workflows/scorecard.yml</code>, and still
recognizes existing <code>scorecards.yml</code> and <code>scorecards-analysis.yml</code> workflows. by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1716</a></li>
<li>The Scorecard version in results now always matches the Scorecard release the action is built
with. by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1718</a></li>
<li>The action no longer prints the GitHub token variable while validating its options. by
<a href="https://github.com/arpitjain099"><code>@​arpitjain099</code></a> in <a href="">ossf/scorecard-action#1709</a></li>
<li><code>results_format</code> accepts <code>intoto</code>, which wraps the JSON results in an in-toto attestation
statement. by <a href="https://github.com/puerco"><code>@​puerco</code></a> in <a href="">ossf/scorecard-action#1702</a></li>
</ul>
<h3>Other</h3>
<ul>
<li>Add a daily canary against Scorecard main by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1711</a></li>
<li>Bump Scorecard to the v5.6.0 candidate and fix the canary toolchain by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1714</a></li>
<li>Run Scorecard on every merge, add a zizmor presubmit, analyze workflows with CodeQL, and update
RELEASE.md by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1716</a></li>
<li>Bump Scorecard to v5.6.0 by <a href="https://github.com/justaugustus"><code>@​justaugustus</code></a> in <a href="">ossf/scorecard-action#1719</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/arpitjain099"><code>@​arpitjain099</code></a> made their first contribution in <a href="">ossf/scorecard-action#1709</a></li>
<li><a href="https://github.com/puerco"><code>@​puerco</code></a> made their first contribution in <a href="">ossf/scorecard-action#1702</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/ossf/scorecard-action/compare/v2.4.4...v2.5.0">https://github.com/ossf/scorecard-action/compare/v2.4.4...v2.5.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fa7117d</code></a> Bump action tag for v2.5.0 release (<a href="">#1720</a>)</li>
<li><a href=""><code>cef4eb5</code></a> :seedling: Bump Scorecard to v5.6.0 (<a href="">#1719</a>)</li>
<li><a href=""><code>bedb16e</code></a> :sparkles: Add intoto results format (<a href="">#1702</a>)</li>
<li><a href=""><code>de70347</code></a> Remove the leftover debug print of the auth token (<a href="">#1709</a>)</li>
<li><a href=""><code>950873d</code></a> :seedling: Derive the reported Scorecard version from go.mod (<a href="">#1718</a>)</li>
<li><a href=""><code>2ce8ee4</code></a> :seedling: Bump github.com/sigstore/cosign/v2 from 2.6.4 to 2.6.5 (<a href="">#1695</a>)</li>
<li><a href=""><code>aabdf5a</code></a> :seedling: Bump the github-actions group across 1 directory with 7 updates (#...</li>
<li><a href=""><code>b4b9adf</code></a> :seedling: CodeQL: Analyze workflows instead of a placeholder JavaScript file</li>
<li><a href=""><code>4e9f2a2</code></a> :book: RELEASE.md: Document drafting release notes</li>
<li><a href=""><code>f618e8b</code></a> :seedling: Build the image with Go 1.27.2 and refresh distroless</li>
<li>Additional commits viewable in <a href="https://github.com/ossf/scorecard-action/compare/2d1146689b8cda280b9bc96326124645441f03bc...fa7117db83c52d787ae5a89f350999701505d78e">compare view</a></li>
</ul>
</details>
<br />

Updates `github/codeql-action/upload-sarif` from 4.38.3 to 4.39.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action/upload-sarif's releases</a>.</em></p>
<blockquote>
<h2>v4.39.0</h2>
<ul>
<li><em>Breaking change</em>: Bump the minimum required CodeQL bundle version to 2.20.7. <a href="">#4205</a></li>
<li>The <code>codeql-action/analyze</code> step now validates that a correct argument for the <code>checkout_path</code> input has been provided. The <code>checkout_path</code> input must be set to the path where the repository that is being analyzed is checked out at on the runner, if that path is something other than the workspace root. If the path does not point to a repository checkout or is different from the path that was used by <code>codeql-action/init</code>, then the CodeQL Action now produces a warning. <a href="">#4148</a></li>
<li>Resolved an issue with third-party caching implementations that prevented caches from being restored correctly. <a href="">#4206</a></li>
<li>The <code>codeql-action/start-proxy</code> step that is used in Code Scanning Default Setup now finds CodeQL releases using the same logic as <code>codeql-action/init</code>. This primarily benefits customers who are using GitHub instances other than <code>github.com</code> where the <code>codeql-action/start-proxy</code> step may previously have been unable to locate recent releases and ended up using outdated versions of the private registry authentication proxy as a result. <a href="">#4198</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action/upload-sarif's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
<p>No user facing changes.</p>
<h2>4.39.1 - 21 Oct 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.3">2.27.3</a>. <a href="">#4256</a></li>
</ul>
<h2>4.39.0 - 15 Oct 2026</h2>
<ul>
<li><em>Breaking change</em>: Bump the minimum required CodeQL bundle version to 2.20.7. <a href="">#4205</a></li>
<li>The <code>codeql-action/analyze</code> step now validates that a correct argument for the <code>checkout_path</code> input has been provided. The <code>checkout_path</code> input must be set to the path where the repository that is being analyzed is checked out at on the runner, if that path is something other than the workspace root. If the path does not point to a repository checkout or is different from the path that was used by <code>codeql-action/init</code>, then the CodeQL Action now produces a warning. <a href="">#4148</a></li>
<li>Resolved an issue with third-party caching implementations that prevented caches from being restored correctly. <a href="">#4206</a></li>
<li>The <code>codeql-action/start-proxy</code> step that is used in Code Scanning Default Setup now finds CodeQL releases using the same logic as <code>codeql-action/init</code>. This primarily benefits customers who are using GitHub instances other than <code>github.com</code> where the <code>codeql-action/start-proxy</code> step may previously have been unable to locate recent releases and ended up using outdated versions of the private registry authentication proxy as a result. <a href="">#4198</a></li>
</ul>
<h2>4.38.3 - 08 Oct 2026</h2>
<ul>
<li><em>Upcoming breaking change</em>: CodeQL version 2.21.2 and earlier were discontinued on 24 September 2026 alongside GitHub Enterprise Server 3.17, and will be unsupported by the next minor release of the CodeQL Action. Added a deprecation warning for customers using these versions of CodeQL. <a href="">#4188</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.2">2.27.2</a>. <a href="">#4203</a></li>
<li>Fixed a bug where the decision of whether to use a per-language bundle did not account for custom configurations that reference queries outside of compiled CodeQL packs. This issue was caught during internal testing and did not affect any customer repositories. We will resume the roll out of per-language bundles in the coming weeks. <a href="">#4184</a></li>
</ul>
<h2>4.38.2 - 24 Sept 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.1">2.27.1</a>. <a href="">#4160</a></li>
</ul>
<h2>4.38.1 - 18 Sept 2026</h2>
<ul>
<li>The CodeQL Action now has experimental support for CodeQL releases for which per-language bundles are available. Per-language bundles support analysis for a single language and are therefore smaller than the combined bundles that allow analysis for all supported languages. As a result, per-language bundles take up less space on disk and are faster to download. We expect to roll this change out to everyone in the coming weeks. <a href="">#4146</a></li>
</ul>
<h2>4.38.0 - 09 Sept 2026</h2>
<ul>
<li>On GitHub-hosted runners, the CodeQL Action now deletes unused CodeQL bundles from the toolcache before downloading a different bundle, which frees up disk space for the analysis. We expect to roll this change out to everyone in September. <a href="">#4124</a></li>
<li>The CodeQL Action now supports CodeQL releases that are compatible with Linux Arm64 and downloads the native <code>linux-arm64</code> CodeQL bundle when available. <a href="">#4072</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.0">2.27.0</a>. <a href="">#4129</a></li>
</ul>
<h2>4.37.9 - 26 Aug 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.4">2.26.4</a>. <a href="">#4106</a></li>
</ul>
<h2>4.37.8 - 21 Aug 2026</h2>
<p>No user facing changes.</p>
<h2>4.37.7 - 13 Aug 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.3">2.26.3</a>. <a href="">#4085</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6f2ac81</code></a> Merge pull request <a href="">#4239</a> from github/update-v4.39.0-d63383a73</li>
<li><a href=""><code>eb1c428</code></a> Trigger workflows</li>
<li><a href=""><code>4443333</code></a> Update changelog for v4.39.0</li>
<li><a href=""><code>d63383a</code></a> Merge pull request <a href="">#4233</a> from github/mbg/start-proxy/report-version</li>
<li><a href=""><code>8dec0b9</code></a> Rename <code>path</code> to <code>result</code> in tests</li>
<li><a href=""><code>4eabea6</code></a> Merge remote-tracking branch 'origin/main' into mbg/start-proxy/report-version</li>
<li><a href=""><code>57938b8</code></a> Merge pull request <a href="">#4201</a> from github/mario-campos/automate-changenotes-assemble</li>
<li><a href=""><code>ee07b50</code></a> Merge pull request <a href="">#4236</a> from github/mbg/add-missing-changenotes</li>
<li><a href=""><code>a897ed5</code></a> Add change note for <a href="">#4206</a></li>
<li><a href=""><code>c8bd019</code></a> Add change note for <a href="">#4198</a></li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/24c54180a607b1449ed407dd24f251e4e9147c8d...6f2ac81f5cd81fe351a197ba0b00d91d03cd2aee">compare view</a></li>
</ul>
</details>
<br />

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `128fd5a309d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.