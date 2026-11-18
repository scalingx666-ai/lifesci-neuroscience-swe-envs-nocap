# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [jupyter-server-proxy](https://github.com/jupyterhub/jupyter-server-proxy) | `4.4.0` | `4.5.0` |
| [openneuro-py](https://github.com/openneuro-py/openneuro-py) | `2026.3.0` | `2026.3.1` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.8` | `0.15.9` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.9.9` | `0.9.13` |
| [ty](https://github.com/astral-sh/ty) | `0.0.26` | `0.0.28` |
| [mkdocs-include-markdown-plugin](https://github.com/mondeja/mkdocs-include-markdown-plugin) | `7.2.1` | `7.2.2` |

Updates `jupyter-server-proxy` from 4.4.0 to 4.5.0
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>068b927</code></a> Merge pull request <a href="">#568</a> from minrk/tp</li>
<li><a href=""><code>2fdcc4a</code></a> Merge pull request <a href="">#543</a> from jupyterhub/pre-commit-ci-update-config</li>
<li><a href=""><code>3e4ff45</code></a> enable trusted publishing</li>
<li><a href=""><code>6733d48</code></a> Bump to 4.5.0</li>
<li><a href=""><code>cdcccf6</code></a> Merge pull request <a href="">#567</a> from jupyterhub/dependabot/github_actions/codecov/cod...</li>
<li><a href=""><code>6da513f</code></a> Bump codecov/codecov-action from 5 to 6</li>
<li><a href=""><code>323077e</code></a> Merge pull request <a href="">#566</a> from jwindgassen/prepare-release</li>
<li><a href=""><code>3e222be</code></a> Update Changelog</li>
<li><a href=""><code>f6144e0</code></a> Merge pull request <a href="">#565</a> from jwindgassen/prepare-release</li>
<li><a href=""><code>61ff523</code></a> Refreeze yarn.lock</li>
<li>Additional commits viewable in <a href="https://github.com/jupyterhub/jupyter-server-proxy/compare/v4.4.0...v4.5.0">compare view</a></li>
</ul>
</details>
<br />

Updates `openneuro-py` from 2026.3.0 to 2026.3.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/openneuro-py/openneuro-py/releases">openneuro-py's releases</a>.</em></p>
<blockquote>
<h2>v2026.3.1</h2>
<!-- raw HTML omitted -->
<h2>👁️ User-visible changes</h2>
<ul>
<li>Automatically retry downloads on more commonly encountered server error responses by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#265</a></li>
<li>Improve TLS/SSL connections for users behind a corporate firewall by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#278</a> and <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#271</a></li>
</ul>
<h2>📖 Documentation</h2>
<ul>
<li>Suggest to always use the <code>latest</code> version of the package when running via <code>uvx</code> by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#277</a></li>
<li>Update the homepage address by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#268</a></li>
</ul>
<h2>⛑️ Code health</h2>
<ul>
<li>Update dependabot settings to inspect <code>uv</code> and to group updates by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#272</a></li>
<li>Add a post-merge hook to remind devs to re-sync their environment after project definitions have changed by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#276</a></li>
<li>Add instructions for AI agents by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#269</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.3.0...v2026.3.1">https://github.com/openneuro-py/openneuro-py/compare/v2026.3.0...v2026.3.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b37c5b8</code></a> Use context for TLS certificate verification (<a href="">#278</a>)</li>
<li><a href=""><code>ca1a5a2</code></a> Improve retry check (<a href="">#265</a>)</li>
<li><a href=""><code>6cf8112</code></a> Suggest to always use the <code>latest</code> version of the package when runnin via `uv...</li>
<li><a href=""><code>798e7c0</code></a> Bump requests from 2.32.5 to 2.33.0 (<a href="">#284</a>)</li>
<li><a href=""><code>1bf3588</code></a> Bump the minor-patch group with 3 updates (<a href="">#283</a>)</li>
<li><a href=""><code>355bb8b</code></a> Bump the minor-patch group with 4 updates (<a href="">#282</a>)</li>
<li><a href=""><code>7530cb8</code></a> Bump types-tqdm from 4.67.3.20260205 to 4.67.3.20260303 (<a href="">#281</a>)</li>
<li><a href=""><code>7e6cc20</code></a> Bump the minor-patch group with 5 updates (<a href="">#280</a>)</li>
<li><a href=""><code>e114870</code></a> Bump the minor-patch group with 2 updates (<a href="">#279</a>)</li>
<li><a href=""><code>dace49b</code></a> Add a post-merge hook to remind devs to re-sync their environment after proje...</li>
<li>Additional commits viewable in <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.3.0...v2026.3.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.8 to 0.15.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.9</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-02.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pyflakes</code>] Flag annotated variable redeclarations as <code>F811</code> in preview mode (<a href="">#24244</a>)</li>
<li>[<code>ruff</code>] Allow dunder-named assignments in non-strict mode for <code>RUF067</code> (<a href="">#24089</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-errmsg</code>] Avoid shadowing existing <code>msg</code> in fix for <code>EM101</code> (<a href="">#24363</a>)</li>
<li>[<code>flake8-simplify</code>] Ignore pre-initialization references in <code>SIM113</code> (<a href="">#24235</a>)</li>
<li>[<code>pycodestyle</code>] Fix <code>W391</code> fixes for consecutive empty notebook cells (<a href="">#24236</a>)</li>
<li>[<code>pyupgrade</code>] Fix <code>UP008</code> nested class matching (<a href="">#24273</a>)</li>
<li>[<code>pyupgrade</code>] Ignore strings with string-only escapes (<code>UP012</code>) (<a href="">#16058</a>)</li>
<li>[<code>ruff</code>] <code>RUF072</code>: skip formfeeds on dedent (<a href="">#24308</a>)</li>
<li>[<code>ruff</code>] Avoid re-using symbol in <code>RUF024</code> fix (<a href="">#24316</a>)</li>
<li>[<code>ruff</code>] Parenthesize expression in <code>RUF050</code> fix (<a href="">#24234</a>)</li>
<li>Disallow starred expressions as values of starred expressions (<a href="">#24280</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-simplify</code>] Suppress <code>SIM105</code> for <code>except*</code> before Python 3.12 (<a href="">#23869</a>)</li>
<li>[<code>pyflakes</code>] Extend <code>F507</code> to flag <code>%</code>-format strings with zero placeholders (<a href="">#24215</a>)</li>
<li>[<code>pyupgrade</code>] <code>UP018</code> should detect more unnecessarily wrapped literals (UP018) (<a href="">#24093</a>)</li>
<li>[<code>pyupgrade</code>] Fix <code>UP008</code> callable scope handling to support lambdas (<a href="">#24274</a>)</li>
<li>[<code>ruff</code>] <code>RUF010</code>: Mark fix as unsafe when it deletes a comment (<a href="">#24270</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Add <code>nested-string-quote-style</code> formatting option (<a href="">#24312</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-bugbear</code>] Clarify RUF071 fix safety for non-path string comparisons (<a href="">#24149</a>)</li>
<li>[<code>flake8-type-checking</code>] Clarify import cycle wording for <code>TC001</code>/<code>TC002</code>/<code>TC003</code> (<a href="">#24322</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Avoid rendering fix lines with trailing whitespace after <code>|</code> (<a href="">#24343</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/tranhoangtu-it"><code>@​tranhoangtu-it</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.9</h2>
<p>Released on 2026-04-02.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pyflakes</code>] Flag annotated variable redeclarations as <code>F811</code> in preview mode (<a href="">#24244</a>)</li>
<li>[<code>ruff</code>] Allow dunder-named assignments in non-strict mode for <code>RUF067</code> (<a href="">#24089</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-errmsg</code>] Avoid shadowing existing <code>msg</code> in fix for <code>EM101</code> (<a href="">#24363</a>)</li>
<li>[<code>flake8-simplify</code>] Ignore pre-initialization references in <code>SIM113</code> (<a href="">#24235</a>)</li>
<li>[<code>pycodestyle</code>] Fix <code>W391</code> fixes for consecutive empty notebook cells (<a href="">#24236</a>)</li>
<li>[<code>pyupgrade</code>] Fix <code>UP008</code> nested class matching (<a href="">#24273</a>)</li>
<li>[<code>pyupgrade</code>] Ignore strings with string-only escapes (<code>UP012</code>) (<a href="">#16058</a>)</li>
<li>[<code>ruff</code>] <code>RUF072</code>: skip formfeeds on dedent (<a href="">#24308</a>)</li>
<li>[<code>ruff</code>] Avoid re-using symbol in <code>RUF024</code> fix (<a href="">#24316</a>)</li>
<li>[<code>ruff</code>] Parenthesize expression in <code>RUF050</code> fix (<a href="">#24234</a>)</li>
<li>Disallow starred expressions as values of starred expressions (<a href="">#24280</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-simplify</code>] Suppress <code>SIM105</code> for <code>except*</code> before Python 3.12 (<a href="">#23869</a>)</li>
<li>[<code>pyflakes</code>] Extend <code>F507</code> to flag <code>%</code>-format strings with zero placeholders (<a href="">#24215</a>)</li>
<li>[<code>pyupgrade</code>] <code>UP018</code> should detect more unnecessarily wrapped literals (UP018) (<a href="">#24093</a>)</li>
<li>[<code>pyupgrade</code>] Fix <code>UP008</code> callable scope handling to support lambdas (<a href="">#24274</a>)</li>
<li>[<code>ruff</code>] <code>RUF010</code>: Mark fix as unsafe when it deletes a comment (<a href="">#24270</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Add <code>nested-string-quote-style</code> formatting option (<a href="">#24312</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-bugbear</code>] Clarify RUF071 fix safety for non-path string comparisons (<a href="">#24149</a>)</li>
<li>[<code>flake8-type-checking</code>] Clarify import cycle wording for <code>TC001</code>/<code>TC002</code>/<code>TC003</code> (<a href="">#24322</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Avoid rendering fix lines with trailing whitespace after <code>|</code> (<a href="">#24343</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/tranhoangtu-it"><code>@​tranhoangtu-it</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/renovate"><code>@​renovate</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>724ccc1</code></a> Bump 0.15.9 (<a href="">#24369</a>)</li>
<li><a href=""><code>96d9e09</code></a> [ty] Move the <code>deferred</code> submodule inside <code>infer/builder</code> (<a href="">#24368</a>)</li>
<li><a href=""><code>130da28</code></a> [ty] Infer the <code>extra_items</code> keyword argument to class-based TypedDicts as an...</li>
<li><a href=""><code>a617c54</code></a> [ty] Validate type qualifiers in functional TypedDict fields and the `extra_i...</li>
<li><a href=""><code>d851708</code></a> [ty] Improve robustness of various type-qualifier-related checks (<a href="">#24251</a>)</li>
<li><a href=""><code>aecb587</code></a> Only run the release-gate on workflow dispatch (<a href="">#24366</a>)</li>
<li><a href=""><code>b889571</code></a> [ty] Use <code>infer_type_expression</code> for parsing parameter annotations and return...</li>
<li><a href=""><code>3286a62</code></a> Add a &quot;release-gate&quot; step to the release workflow (<a href="">#24365</a>)</li>
<li><a href=""><code>5f88756</code></a> Disallow starred expressions as values of starred expressions (<a href="">#24280</a>)</li>
<li><a href=""><code>5c59f8a</code></a> [<code>pyupgrade</code>] Ignore strings with string-only escapes (<code>UP012</code>) (<a href="">#16058</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.8...0.15.9">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.9 to 0.9.13
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.13</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Async local manifest preload for cargo hints by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1666</a></li>
<li>Resolve dependency versions from Cargo.lock for metadata fetching by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1665</a></li>
<li>Fix LineIndex text ownership in LSP by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1668</a></li>
<li>Trigger inlay hint refresh on Cargo.toml/pyproject.toml open by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1667</a></li>
<li>Improve Cargo.toml workspace caching by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1669</a></li>
<li>chore: remove warning. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1670</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.12...v0.9.13">https://github.com/tombi-toml/tombi/compare/v0.9.12...v0.9.13</a></p>
<h2>v0.9.12</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>Add PyPI links for uv dependency lists by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1656</a></li>
<li>Add Cargo workspace-value hints for lints by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1657</a></li>
<li>Fix Cargo workspace dependency rewrite output by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1661</a></li>
<li>Fix hover display for quoted extension keys by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1660</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Add fallback for path dependency version hints by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1658</a></li>
<li>Refine hover ranges for array and inline table items by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1664</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: Update Cargo inlay hint configuration in documentation by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1654</a></li>
<li>Add hover and inlay hint configuration documentation by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1655</a></li>
<li>Add JSON Schema metadata docs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1659</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.11...v0.9.12">https://github.com/tombi-toml/tombi/compare/v0.9.11...v0.9.12</a></p>
<h2>v0.9.11</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>We released <code>inlay hint</code></p>
<!-- raw HTML omitted -->
<h3>🚀 New Features</h3>
<ul>
<li>Add hover configuration to extension features by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1641</a></li>
<li>Add extension did_open registry prefetch by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1643</a></li>
<li>Add lockfile-based dependency inlay hints by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1645</a></li>
<li>Limit Cargo hover metadata to crate keys by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1646</a></li>
<li>Add workspace package inlay hints by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1647</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d5056f9</code></a> Merge pull request <a href="">#1670</a> from tombi-toml/remove_warning</li>
<li><a href=""><code>b20dad9</code></a> feat: remove warning.</li>
<li><a href=""><code>b8614dc</code></a> Merge pull request <a href="">#1669</a> from tombi-toml/ya7010/cargo-did-open-prefetch</li>
<li><a href=""><code>b3e37fc</code></a> Merge workspace Cargo.toml helpers</li>
<li><a href=""><code>6db0393</code></a> Rename Cargo.toml workspace helpers</li>
<li><a href=""><code>12ee869</code></a> Address PR review feedback</li>
<li><a href=""><code>3744c4f</code></a> Improve Cargo.toml workspace caching</li>
<li><a href=""><code>58f5971</code></a> Merge pull request <a href="">#1667</a> from tombi-toml/ya7010/inlay-hint-cause</li>
<li><a href=""><code>acbf737</code></a> Move did_open prefetch work into background tasks</li>
<li><a href=""><code>9657d33</code></a> Merge remote-tracking branch 'origin/main' into ya7010/inlay-hint-cause</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.9...v0.9.13">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.26 to 0.0.28
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.28</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-02.</p>
<h3>Bug fixes</h3>
<ul>
<li>Mark loop header assignments as used to avoid false positives in &quot;unused variable&quot; diagnostics (<a href="">#24336</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Show constructor signature of classes when hovering over them (<a href="">#24257</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid emitting cascading diagnostics when parsing invalid type expressions (<a href="">#24326</a>)</li>
<li>Handle most &quot;deep&quot; mutual TypeVar constraints (<a href="">#24079</a>)</li>
<li>Improve consistency and quality of diagnostics relating to invalid type forms (<a href="">#24325</a>)</li>
<li>Improve robustness of various type-qualifier-related checks (<a href="">#24251</a>)</li>
<li>Infer the <code>extra_items</code> keyword argument to class-based TypedDicts as an annotation expression (<a href="">#24362</a>)</li>
<li>Use bidirectional inference to fix false positives on operations such as <code>x: list[int | None] = [None] * 2</code> (<a href="">#24197</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24340</a>). <a href="https://github.com/python/typeshed/compare/f8f0794d0fe249c06dc9f31a004d85be6cca6ced...c5e47faeda2cf9d233f91bc1dc95814b0cc7ccba">Typeshed diff</a></li>
<li>Tighten up validation of subscripts and attributes in type expressions (<a href="">#24329</a>)</li>
<li>Use <code>infer_type_expression</code> for parsing parameter annotations and return-type annotations (<a href="">#24353</a>)</li>
<li>Use <code>infer_type_expression</code> for validating PEP-613 type aliases (<a href="">#24370</a>)</li>
<li>Validate TypedDict fields when subclassing (<a href="">#24338</a>)</li>
<li>Validate type qualifiers in functional TypedDict fields and the <code>extra_items</code> keyword to functional TypedDicts (<a href="">#24360</a>)</li>
<li>Improve diagnostics for invalid functional <code>TypedDict</code>s (<a href="">#24345</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
</ul>
<h2>Install ty 0.0.28</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.28/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.28/ty-installer.ps1 | iex&quot;
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.28</h2>
<p>Released on 2026-04-02.</p>
<h3>Bug fixes</h3>
<ul>
<li>Mark loop header assignments as used to avoid false positives in &quot;unused variable&quot; diagnostics (<a href="">#24336</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Show constructor signature of classes when hovering over them (<a href="">#24257</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid emitting cascading diagnostics when parsing invalid type expressions (<a href="">#24326</a>)</li>
<li>Handle most &quot;deep&quot; mutual TypeVar constraints (<a href="">#24079</a>)</li>
<li>Improve consistency and quality of diagnostics relating to invalid type forms (<a href="">#24325</a>)</li>
<li>Improve robustness of various type-qualifier-related checks (<a href="">#24251</a>)</li>
<li>Infer the <code>extra_items</code> keyword argument to class-based TypedDicts as an annotation expression (<a href="">#24362</a>)</li>
<li>Use bidirectional inference to fix false positives on operations such as <code>x: list[int | None] = [None] * 2</code> (<a href="">#24197</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24340</a>). <a href="https://github.com/python/typeshed/compare/f8f0794d0fe249c06dc9f31a004d85be6cca6ced...c5e47faeda2cf9d233f91bc1dc95814b0cc7ccba">Typeshed diff</a></li>
<li>Tighten up validation of subscripts and attributes in type expressions (<a href="">#24329</a>)</li>
<li>Use <code>infer_type_expression</code> for parsing parameter annotations and return-type annotations (<a href="">#24353</a>)</li>
<li>Use <code>infer_type_expression</code> for validating PEP-613 type aliases (<a href="">#24370</a>)</li>
<li>Validate TypedDict fields when subclassing (<a href="">#24338</a>)</li>
<li>Validate type qualifiers in functional TypedDict fields and the <code>extra_items</code> keyword to functional TypedDicts (<a href="">#24360</a>)</li>
<li>Improve diagnostics for invalid functional <code>TypedDict</code>s (<a href="">#24345</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
</ul>
<h2>0.0.27</h2>
<p>Released on 2026-03-31.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic on debug builds when attempting to provide autocomplete suggestions for <code>list[int]&lt;CURSOR&gt;()</code> (<a href="">#24167</a>)</li>
<li>Fix instance-attribute lookup in methods of protocol classes (<a href="">#24213</a>)</li>
<li>Fix nested global and nonlocal lookups through forwarding scopes (<a href="">#24279</a>)</li>
<li>Fix panic on <code>list[Annotated[()]]</code> (<a href="">#24303</a>)</li>
<li>Fix stack overflow on <code>type A = TypeIs[Callable[[], A]]</code> (<a href="">#24245</a>)</li>
<li>Use <code>_cls</code> as the name of the first argument for synthesized <code>collections.namedtuple</code> constructor methods (<a href="">#24333</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>927aad2</code></a> Bump version to 0.0.28 (<a href="">#3206</a>)</li>
<li><a href=""><code>29d288e</code></a> Publish installers to <code>/installers/ty/latest</code> on the mirror (<a href="">#3202</a>)</li>
<li><a href=""><code>5c9e342</code></a> Bump version to 0.0.27 (<a href="">#3185</a>)</li>
<li><a href=""><code>e6a5731</code></a> Update actions/cache action to v5.0.4 (<a href="">#3172</a>)</li>
<li><a href=""><code>c47b982</code></a> Update prek dependencies (<a href="">#3173</a>)</li>
<li><a href=""><code>657abcf</code></a> Update astral-sh/setup-uv action to v8 (<a href="">#3174</a>)</li>
<li><a href=""><code>9e582cb</code></a> Fetch the cargo-dist binary directly instead of using the installer (<a href="">#3160</a>)</li>
<li><a href=""><code>d5c51ea</code></a> docs: use content tabs (<a href="">#3146</a>)</li>
<li><a href=""><code>9893776</code></a> Use the <code>release</code> environment in <code>publish-docs</code> (<a href="">#3147</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.26...0.0.28">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-include-markdown-plugin` from 7.2.1 to 7.2.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mondeja/mkdocs-include-markdown-plugin/releases">mkdocs-include-markdown-plugin's releases</a>.</em></p>
<blockquote>
<h2>v7.2.2</h2>
<h3>Bug fixes</h3>
<ul>
<li>Fix natural order by extension not correctly applied</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>98cf8e8</code></a> Fix natural order by extension not correctly applied (<a href="">#292</a>)</li>
<li>See full diff in <a href="https://github.com/mondeja/mkdocs-include-markdown-plugin/compare/v7.2.1...v7.2.2">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4bc4c4ffa14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.