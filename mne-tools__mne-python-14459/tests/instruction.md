# Issue

**Title:** [dependabot]: Bump the actions group with 3 updates

## Description

Bumps the actions group with 3 updates: [j178/prek-action](https://github.com/j178/prek-action), [prefix-dev/setup-pixi](https://github.com/prefix-dev/setup-pixi) and [github/codeql-action](https://github.com/github/codeql-action).

Updates `j178/prek-action` from 3.0.1 to 3.0.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek-action/releases">j178/prek-action's releases</a>.</em></p>
<blockquote>
<h2>v3.0.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Preserve class names in bundled dist by <a href="https://github.com/TheKevJames"><code>@​TheKevJames</code></a> in <a href="">j178/prek-action#181</a></li>
<li>Update known versions for prek 0.5.6 by <a href="https://github.com/j178"><code>@​j178</code></a> in <a href="">j178/prek-action#182</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/TheKevJames"><code>@​TheKevJames</code></a> made their first contribution in <a href="">j178/prek-action#181</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/j178/prek-action/compare/v3.0.1...v3.0.2">https://github.com/j178/prek-action/compare/v3.0.1...v3.0.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>af4d4fc</code></a> Update known versions for prek 0.5.6 (<a href="">#182</a>)</li>
<li><a href=""><code>2458803</code></a> Preserve class names in bundled dist (<a href="">#181</a>)</li>
<li>See full diff in <a href="https://github.com/j178/prek-action/compare/v3.0.1...v3.0.2">compare view</a></li>
</ul>
</details>
<br />

Updates `prefix-dev/setup-pixi` from 0.11.0 to 0.11.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/prefix-dev/setup-pixi/releases">prefix-dev/setup-pixi's releases</a>.</em></p>
<blockquote>
<h2>v0.11.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🤷🏻 Other changes</h3>
<ul>
<li>docs: Adjust workload-identity-audience section by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#293</a></li>
<li>fix: Don't delete preinstalled pixi bin in cleanup by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#297</a></li>
<li>fix(deps): bump undici, brace-expansion and handlebars by <a href="https://github.com/wolfv"><code>@​wolfv</code></a> in <a href="">prefix-dev/setup-pixi#295</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.11.1...v0.11.2">https://github.com/prefix-dev/setup-pixi/compare/v0.11.1...v0.11.2</a></p>
<h2>v0.11.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🤷🏻 Other changes</h3>
<ul>
<li>feat: Add auth-workload-identity inputs for OIDC login by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">prefix-dev/setup-pixi#292</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.11.0...v0.11.1">https://github.com/prefix-dev/setup-pixi/compare/v0.11.0...v0.11.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ad1da64</code></a> fix(deps): bump undici, brace-expansion and handlebars (<a href="">#295</a>)</li>
<li><a href=""><code>05a7f7a</code></a> fix: Don't delete preinstalled pixi bin in cleanup (<a href="">#297</a>)</li>
<li><a href=""><code>f549d46</code></a> ci: use pixi exec instead of choco to install yq (<a href="">#294</a>)</li>
<li><a href=""><code>4578022</code></a> docs: Adjust workload-identity-audience section (<a href="">#293</a>)</li>
<li><a href=""><code>a2789fe</code></a> feat: Add auth-workload-identity inputs for OIDC login (<a href="">#292</a>)</li>
<li>See full diff in <a href="https://github.com/prefix-dev/setup-pixi/compare/v0.11.0...v0.11.2">compare view</a></li>
</ul>
</details>
<br />

Updates `github/codeql-action` from 4.38.3 to 4.39.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
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
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.39.0 - 15 Oct 2026</h2>
<ul>
<li><em>Breaking change</em>: Bump the minimum required CodeQL bundle version to 2.20.7. <a href="">#4205</a></li>
<li>The <code>codeql-action/analyze</code> step now validates that a correct argument for the <code>checkout_path</code> input has been provided. The <code>checkout_path</code> input must be set to the path where the repository that is being analyzed is checked out at on the runner, if that path is something other than the workspace root. If the path does not point to a repository checkout or is different from the path that was used by <code>codeql-action/init</code>, then the CodeQL Action now produces a warning. <a href="">#4148</a></li>
<li>Resolved an issue with third-party caching implementations that prevented caches from being restored correctly. <a href="">#4206</a></li>
<li>The <code>codeql-action/start-proxy</code> step that is used in Code Scanning Default Setup now finds CodeQL releases using the same logic as <code>codeql-action/init</code>. This primarily benefits customers who are using GitHub instances other than <code>github.com</code> where the <code>codeql-action/start-proxy</code> step may previously have been unable to locate recent releases and ended up using outdated versions of the private registry authentication proxy as a result. <a href="">#4198</a></li>
</ul>
</blockquote>
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
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.38.3...v4.39.0">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1816be05e6c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.