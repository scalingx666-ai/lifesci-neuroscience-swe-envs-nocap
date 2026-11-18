# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [pytest](https://github.com/pytest-dev/pytest) | `9.1.0` | `9.1.1` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.18` | `0.15.20` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.1.3` | `1.1.5` |
| [ty](https://github.com/astral-sh/ty) | `0.0.51` | `0.0.54` |
| [mkdocstrings-python](https://github.com/mkdocstrings/python) | `2.0.4` | `2.0.5` |

Updates `pytest` from 9.1.0 to 9.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.1.1</h2>
<h1>pytest 9.1.1 (2026-06-19)</h1>
<h2>Bug fixes</h2>
<ul>
<li><a href="">#14220</a>: Fixed a logic bug in <code>pytest.RaisesGroup</code> which would might cause it to display incorrect &quot;It matches <!-- raw HTML omitted -->FooError()<!-- raw HTML omitted --> which was paired with <!-- raw HTML omitted -->BarError<!-- raw HTML omitted -->&quot; messages.</li>
<li><a href="">#14591</a>: Fixed a regression in pytest 9.1.0 which caused overriding a parametrized fixture with an indirect <!-- raw HTML omitted --><a href="https://github.com/pytest"><code>@​pytest</code></a>.mark.parametrize<!-- raw HTML omitted --> to fail with &quot;duplicate parametrization of '&lt;fixture name&gt;'&quot;.</li>
<li><a href="">#14606</a>: Fixed <code>list-item</code> typing errors from mypy in <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> <code>argvalues</code> parameter.</li>
<li><a href="">#14608</a>: Fixed a regression in pytest 9.1.0 where <code>conftest.py</code> files located in <code>&lt;invocation dir&gt;/test*</code> were no longer loaded as initial conftests when invoked without arguments.
This could cause certain hooks (like <code>pytest_addoption</code>) in these files to not fire.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf470ec</code></a> Prepare release version 9.1.1</li>
<li><a href=""><code>e0c8ce6</code></a> Merge pull request <a href="">#14625</a> from pytest-dev/patchback/backports/9.1.x/a07c31a97...</li>
<li><a href=""><code>1b82d16</code></a> Merge pull request <a href="">#14624</a> from pytest-dev/patchback/backports/9.1.x/b375b79ec...</li>
<li><a href=""><code>501c4bc</code></a> Merge pull request <a href="">#14596</a> from bluetech/doc-classmethod</li>
<li><a href=""><code>b61f588</code></a> Merge pull request <a href="">#14622</a> from chrisburr/fix-14608-initial-conftest-test-subdir</li>
<li><a href=""><code>9a567e0</code></a> [automated] Update plugin list (<a href="">#14617</a>) (<a href="">#14618</a>)</li>
<li><a href=""><code>ef8b299</code></a> Merge pull request <a href="">#14620</a> from pytest-dev/patchback/backports/9.1.x/680f9f3ed...</li>
<li><a href=""><code>66abd07</code></a> Merge pull request <a href="">#14220</a> from bysiber/fix-stale-iexp-raisesgroup</li>
<li><a href=""><code>79fbf93</code></a> Merge pull request <a href="">#14612</a> from pytest-dev/patchback/backports/9.1.x/974ed48b6...</li>
<li><a href=""><code>0d312eb</code></a> Merge pull request <a href="">#14611</a> from bluetech/parametrize-argvalues-typing</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.1.0...9.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.18 to 0.15.20
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.20</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-25.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in rule selectors (<a href="">#25887</a>)</li>
<li>Emit a warning instead of an error for unknown rule selectors (<a href="">#26113</a>)</li>
<li>Match <code>noqa</code> shebang handling in <code>ruff:ignore</code> comments (<a href="">#26286</a>)</li>
<li>[<code>ruff</code>] Remove <code>pytest-fixture-autouse</code> (<code>RUF076</code>) (<a href="">#26240</a>, <a href="">#26371</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add versioning sections to custom crate READMEs (<a href="">#26317</a>)</li>
<li>Update <code>ruff_python_parser</code> README for crates.io (<a href="">#26315</a>)</li>
<li>[<code>perflint</code>] Clarify that <code>PERF402</code> applies to any iterable (<a href="">#26242</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/trilamsr"><code>@​trilamsr</code></a></li>
</ul>
<h2>Install ruff 0.15.20</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ruff 0.15.20</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-apple-darwin.tar.gz">ruff-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-x86_64-apple-darwin.tar.gz">ruff-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-pc-windows-msvc.zip">ruff-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-i686-pc-windows-msvc.zip">ruff-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-x86_64-pc-windows-msvc.zip">ruff-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-unknown-linux-gnu.tar.gz">ruff-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-i686-unknown-linux-gnu.tar.gz">ruff-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.20/ruff-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.20</h2>
<p>Released on 2026-06-25.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in rule selectors (<a href="">#25887</a>)</li>
<li>Emit a warning instead of an error for unknown rule selectors (<a href="">#26113</a>)</li>
<li>Match <code>noqa</code> shebang handling in <code>ruff:ignore</code> comments (<a href="">#26286</a>)</li>
<li>[<code>ruff</code>] Remove <code>pytest-fixture-autouse</code> (<code>RUF076</code>) (<a href="">#26240</a>, <a href="">#26371</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add versioning sections to custom crate READMEs (<a href="">#26317</a>)</li>
<li>Update <code>ruff_python_parser</code> README for crates.io (<a href="">#26315</a>)</li>
<li>[<code>perflint</code>] Clarify that <code>PERF402</code> applies to any iterable (<a href="">#26242</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/trilamsr"><code>@​trilamsr</code></a></li>
</ul>
<h2>0.15.19</h2>
<p>Released on 2026-06-23.</p>
<h3>Preview features</h3>
<ul>
<li>Support human-readable names when hovering suppression comments and in code actions (<a href="">#26114</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fall back to default settings when editor-only settings are invalid (<a href="">#26244</a>)</li>
<li>Fix panic when inserting text at a notebook cell boundary (<a href="">#26111</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pylint</code>] Update fix suggestions for <code>__floor__</code>, <code>__trunc__</code>, <code>__length_hint__</code>, and <code>__matmul__</code> variants (<code>PLC2801</code>) (<a href="">#26239</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid allocating when parsing single string literals (<a href="">#26200</a>)</li>
<li>Avoid reallocating singleton call arguments (<a href="">#26223</a>)</li>
<li>Lazily create source files for lint diagnostics (<a href="">#26226</a>)</li>
<li>Optimize formatter text width and indentation (<a href="">#26236</a>)</li>
<li>Reserve capacity for builtin bindings (<a href="">#26229</a>)</li>
<li>Skip repeated-key checks for singleton dictionaries (<a href="">#26228</a>)</li>
<li>Use ArrayVec for qualified name segments (<a href="">#26224</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f82a36b</code></a> Bump 0.15.20 (<a href="">#26376</a>)</li>
<li><a href=""><code>af32943</code></a> Improve the summarise-ecosystem-results skill (<a href="">#26378</a>)</li>
<li><a href=""><code>485ebab</code></a> Remove <code>RUF076</code> name from schema (<a href="">#26371</a>)</li>
<li><a href=""><code>ef81835</code></a> [ty] Implement rust-analyzer's &quot;Click for full compiler diagnostic&quot; feature (...</li>
<li><a href=""><code>572b31e</code></a> [<code>ruff</code>] Remove <code>pytest-fixture-autouse</code> (<code>RUF076</code>) (<a href="">#26240</a>)</li>
<li><a href=""><code>f703f21</code></a> Allow human-readable names in rule selectors (<a href="">#25887</a>)</li>
<li><a href=""><code>0d726b2</code></a> [ty] Reuse equality semantics for membership compatibility (<a href="">#25955</a>)</li>
<li><a href=""><code>dbe6e98</code></a> [ty] Infer definite equality comparison results (<a href="">#26337</a>)</li>
<li><a href=""><code>e700ea3</code></a> [ty] Prove TypedDict structural patterns exhaustive (<a href="">#26285</a>)</li>
<li><a href=""><code>6a0d2ec</code></a> [ty] Widen inferred class-valued instance attributes (<a href="">#26338</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.18...0.15.20">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.1.3 to 1.1.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.1.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix(lsp): merge allOf table key completions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1959</a></li>
<li>fix(vscode): color TOML dates as constants by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1960</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix(lsp): complete literal keys in tables by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1958</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.1.4...v1.1.5">https://github.com/tombi-toml/tombi/compare/v1.1.4...v1.1.5</a></p>
<h2>v1.1.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix(lsp): avoid stale diagnostics after changes by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1954</a></li>
</ul>
<h3>👒 Dependencies</h3>
<ul>
<li>build(deps-dev): bump esbuild from 0.28.0 to 0.28.1 in the npm_and_yarn group across 1 directory by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">tombi-toml/tombi#1945</a></li>
<li>build(deps-dev): bump the npm_and_yarn group across 2 directories with 1 update by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">tombi-toml/tombi#1952</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix(ci): include LICENSE in python sdist by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1942</a></li>
<li>docs: explain selective auto-sort re-enable by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1943</a></li>
<li>Use GitHub App token for dependent release dispatches by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1951</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.1.3...v1.1.4">https://github.com/tombi-toml/tombi/compare/v1.1.3...v1.1.4</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>62a9245</code></a> fix(vscode): color TOML dates as constants (<a href="">#1960</a>)</li>
<li><a href=""><code>fcefa05</code></a> fix(lsp): merge allOf table key completions (<a href="">#1959</a>)</li>
<li><a href=""><code>606f1af</code></a> fix(lsp): complete literal keys in tables (<a href="">#1958</a>)</li>
<li><a href=""><code>14fdcfe</code></a> test: use std assert_matches macro (<a href="">#1955</a>)</li>
<li><a href=""><code>d98d203</code></a> docs: update install.sh stable version to 1.1.4</li>
<li><a href=""><code>28099db</code></a> fix(lsp): avoid stale diagnostics after changes (<a href="">#1954</a>)</li>
<li><a href=""><code>311cb3c</code></a> build(deps-dev): bump the npm_and_yarn group across 2 directories with 1 upda...</li>
<li><a href=""><code>71973b6</code></a> Use app token for dependent release dispatches (<a href="">#1951</a>)</li>
<li><a href=""><code>9d68d00</code></a> Disable blank issues (<a href="">#1948</a>)</li>
<li><a href=""><code>6de7313</code></a> Remove blank issue setting (<a href="">#1947</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.1.3...v1.1.5">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.51 to 0.0.54
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.54</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-25.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid duplicate configuration error output (<a href="">#26375</a>)</li>
<li>Avoid stack overflows in reachability analysis (<a href="">#26272</a>)</li>
<li>Fix divergent recursive tuple cycle handling in ty (<a href="">#26316</a>)</li>
<li>Fix panic from relation queries during cycle recovery (<a href="">#26335</a>)</li>
<li>Fix panics by reverting recursive <code>TypeOf</code> cycle recovery (<a href="">#26339</a>)</li>
<li>Support basic usages of <code>__class__</code> closure cells in methods (<a href="">#26329</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix typealias token classification inconsistency (<a href="">#26255</a>)</li>
<li>Implement rust-analyzer's &quot;Click for full compiler diagnostic&quot; feature (<a href="">#26269</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Co-locate retained definition usage state (<a href="">#26019</a>)</li>
<li>Use never-change durability for immutable file inputs (<a href="">#26353</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Reject undeclared protocol instance attributes (<a href="">#26336</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Allow replacing ordinary methods with compatible functions (<a href="">#26158</a>)</li>
<li>Distinguish <code>typing.TypedDict</code> from <code>typing_extensions.TypedDict</code> (<a href="">#25843</a>)</li>
<li>Don't treat non-empty ranges as single-valued (<a href="">#26351</a>)</li>
<li>Handle TypeVar bounds over <code>type[...]</code> in attribute lookup (<a href="">#26146</a>)</li>
<li>Infer definite equality comparison results (<a href="">#26337</a>)</li>
<li>Infer mismatched literal comparisons (<a href="">#26313</a>)</li>
<li><code>match</code> statements: make class-pattern fallthrough member-aware (<a href="">#26283</a>)</li>
<li><code>match</code> statements: prove TypedDict structural patterns exhaustive (<a href="">#26285</a>)</li>
<li><code>match</code> statements: resolve positional class-pattern exhaustiveness (<a href="">#26284</a>)</li>
<li>Model non-exhaustive enum member sets (<code>enum.Flag</code>s) (<a href="">#26277</a>)</li>
<li>Reduce retained definition map storage (<a href="">#26348</a>)</li>
<li>Reuse equality semantics for membership compatibility (<a href="">#25955</a>)</li>
<li>Sync vendored typeshed stubs to support <code>builtins.sentinel</code> (<a href="">#26341</a>)</li>
<li>Treat non-empty <code>range</code> calls as non-empty for reachability (<a href="">#25220</a>)</li>
<li>Use assignability for divergent constraints (<a href="">#26334</a>)</li>
<li>Widen inferred class-valued instance attributes (<a href="">#26338</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.54</h2>
<p>Released on 2026-06-25.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid duplicate configuration error output (<a href="">#26375</a>)</li>
<li>Avoid stack overflows in reachability analysis (<a href="">#26272</a>)</li>
<li>Fix divergent recursive tuple cycle handling in ty (<a href="">#26316</a>)</li>
<li>Fix panic from relation queries during cycle recovery (<a href="">#26335</a>)</li>
<li>Fix panics by reverting recursive <code>TypeOf</code> cycle recovery (<a href="">#26339</a>)</li>
<li>Support basic usages of <code>__class__</code> closure cells in methods (<a href="">#26329</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix typealias token classification inconsistency (<a href="">#26255</a>)</li>
<li>Implement rust-analyzer's &quot;Click for full compiler diagnostic&quot; feature (<a href="">#26269</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Co-locate retained definition usage state (<a href="">#26019</a>)</li>
<li>Use never-change durability for immutable file inputs (<a href="">#26353</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Reject undeclared protocol instance attributes (<a href="">#26336</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Allow replacing ordinary methods with compatible functions (<a href="">#26158</a>)</li>
<li>Distinguish <code>typing.TypedDict</code> from <code>typing_extensions.TypedDict</code> (<a href="">#25843</a>)</li>
<li>Don't treat non-empty ranges as single-valued (<a href="">#26351</a>)</li>
<li>Handle TypeVar bounds over <code>type[...]</code> in attribute lookup (<a href="">#26146</a>)</li>
<li>Infer definite equality comparison results (<a href="">#26337</a>)</li>
<li>Infer mismatched literal comparisons (<a href="">#26313</a>)</li>
<li><code>match</code> statements: make class-pattern fallthrough member-aware (<a href="">#26283</a>)</li>
<li><code>match</code> statements: prove TypedDict structural patterns exhaustive (<a href="">#26285</a>)</li>
<li><code>match</code> statements: resolve positional class-pattern exhaustiveness (<a href="">#26284</a>)</li>
<li>Model non-exhaustive enum member sets (<code>enum.Flag</code>s) (<a href="">#26277</a>)</li>
<li>Reduce retained definition map storage (<a href="">#26348</a>)</li>
<li>Reuse equality semantics for membership compatibility (<a href="">#25955</a>)</li>
<li>Sync vendored typeshed stubs to support <code>builtins.sentinel</code> (<a href="">#26341</a>)</li>
<li>Treat non-empty <code>range</code> calls as non-empty for reachability (<a href="">#25220</a>)</li>
<li>Use assignability for divergent constraints (<a href="">#26334</a>)</li>
<li>Widen inferred class-valued instance attributes (<a href="">#26338</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/sqqueak"><code>@​sqqueak</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bf8a7dd</code></a> Bump version to 0.0.54</li>
<li><a href=""><code>78e094d</code></a> Document the <code>fullDiagnosticOutput</code> extension to the Language Server Protocol...</li>
<li><a href=""><code>7bda89e</code></a> Document ty's <code>@Todo</code> type in the typing FAQ (<a href="">#3847</a>)</li>
<li><a href=""><code>66a94cd</code></a> Update maturin to v1.14.0 (<a href="">#3840</a>)</li>
<li><a href=""><code>dc2b39d</code></a> Update prek dependencies (<a href="">#3839</a>)</li>
<li><a href=""><code>23f26f9</code></a> Bump version to 0.0.53 (<a href="">#3841</a>)</li>
<li><a href=""><code>13f91b0</code></a> Bump version to 0.0.52 (<a href="">#3828</a>)</li>
<li><a href=""><code>bfc2b24</code></a> Document recent changes to how exit codes are determined (<a href="">#3824</a>)</li>
<li><a href=""><code>caf5e06</code></a> Move Python support guidance to FAQ (<a href="">#3823</a>)</li>
<li><a href=""><code>03ec364</code></a> Document Python version support (<a href="">#3821</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.51...0.0.54">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocstrings-python` from 2.0.4 to 2.0.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/releases">mkdocstrings-python's releases</a>.</em></p>
<blockquote>
<h2>2.0.5</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.5">2.0.5</a> - 2026-06-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.4...2.0.5">Compare with 2.0.4</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Allow relative cross-references to work in summaries (<a href="">abe2888</a> by Timothée Mazzucotelli). <a href="">Issue-331</a></li>
<li>Always display attribute values as they're written in the source (<a href="">0334131</a> by Timothée Mazzucotelli). <a href="">Issue-311</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/blob/main/CHANGELOG.md">mkdocstrings-python's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.5">2.0.5</a> - 2026-06-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.4...2.0.5">Compare with 2.0.4</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Allow relative cross-references to work in summaries (<a href="">abe2888</a> by Timothée Mazzucotelli). <a href="">Issue-331</a></li>
<li>Always display attribute values as they're written in the source (<a href="">0334131</a> by Timothée Mazzucotelli). <a href="">Issue-311</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1670ecb</code></a> chore: Prepare release 2.0.5</li>
<li><a href=""><code>abe2888</code></a> fix: Allow relative cross-references to work in summaries</li>
<li><a href=""><code>0334131</code></a> fix: Always display attribute values as they're written in the source</li>
<li><a href=""><code>39311c7</code></a> docs: Lint docs</li>
<li><a href=""><code>835a406</code></a> chore: Never fail type-checking (maintenance mode)</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/python/compare/2.0.4...2.0.5">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `052ae38bad51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.