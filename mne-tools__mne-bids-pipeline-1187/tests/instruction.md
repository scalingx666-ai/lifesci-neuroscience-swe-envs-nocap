# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [pyvista](https://github.com/pyvista/pyvista) | `0.47.0` | `0.47.1` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.2` | `0.15.4` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.7.31` | `0.7.33` |
| [ty](https://github.com/astral-sh/ty) | `0.0.17` | `0.0.19` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.2` | `9.7.3` |
| [mkdocstrings-python](https://github.com/mkdocstrings/python) | `2.0.2` | `2.0.3` |

Updates `pyvista` from 0.47.0 to 0.47.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvista/releases">pyvista's releases</a>.</em></p>
<blockquote>
<h2>v0.47.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bug fixes or behavior changes</h3>
<ul>
<li>Remove <code>relpath</code> from <code>deprecate_positional_args</code> decorator (<a href="">#8345</a>) by <a href="https://github.com/jcapriot"><code>@​jcapriot</code></a>, backported in <a href="">pyvista/pyvista#8346</a></li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Remove assertions from <code>mesh_validation</code> example (<a href="">#8328</a>) by <a href="https://github.com/user27182"><code>@​user27182</code></a>, backported in <a href="">pyvista/pyvista#8334</a></li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Upper pin <code>trame-vtk</code> (<a href="">#8325</a>) by <a href="https://github.com/edabor"><code>@​edabor</code></a>, backported in <a href="">pyvista/pyvista#8329</a></li>
<li>Add Python 3.14 classifier (<a href="">#8316</a>) by <a href="https://github.com/user27182"><code>@​user27182</code></a>, backported in <a href="">pyvista/pyvista#8330</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/pyvista/compare/v0.47.0...v0.47.1">https://github.com/pyvista/pyvista/compare/v0.47.0...v0.47.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f0fc516</code></a> Bump version to 0.47.1 (<a href="">#8351</a>)</li>
<li><a href=""><code>7e89dbf</code></a> Remove <code>relpath</code> from <code>deprecate_positional_args</code> decorator (<a href="">#8345</a>) (<a href="">#8346</a>)</li>
<li><a href=""><code>d0faf60</code></a> Remove assertions from <code>mesh_validation</code> example (<a href="">#8328</a>) (<a href="">#8334</a>)</li>
<li><a href=""><code>9837b2a</code></a> Add Python 3.14 classifier (<a href="">#8316</a>) (<a href="">#8330</a>)</li>
<li><a href=""><code>89dcb51</code></a> Upper pin <code>trame-vtk</code> (<a href="">#8325</a>) (<a href="">#8329</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvista/compare/v0.47.0...v0.47.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.2 to 0.15.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.4</h2>
<h2>Release Notes</h2>
<p>Released on 2026-02-26.</p>
<p>This is a follow-up release to 0.15.3 that resolves a panic when the new rule <code>PLR1712</code> was enabled with any rule that analyzes definitions, such as many of the <code>ANN</code> or <code>D</code> rules.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic on access to definitions after analyzing definitions (<a href="">#23588</a>)</li>
<li>[<code>pyflakes</code>] Suppress false positive in <code>F821</code> for names used before <code>del</code> in stub files (<a href="">#23550</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Clarify first-party import detection in Ruff (<a href="">#23591</a>)</li>
<li>Fix incorrect <code>import-heading</code> example (<a href="">#23568</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/stakeswky"><code>@​stakeswky</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/thejcannon"><code>@​thejcannon</code></a></li>
<li><a href="https://github.com/GeObts"><code>@​GeObts</code></a></li>
</ul>
<h2>Install ruff 0.15.4</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ruff 0.15.4</h2>
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
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-apple-darwin.tar.gz">ruff-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-x86_64-apple-darwin.tar.gz">ruff-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-pc-windows-msvc.zip">ruff-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-i686-pc-windows-msvc.zip">ruff-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-x86_64-pc-windows-msvc.zip">ruff-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-unknown-linux-gnu.tar.gz">ruff-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-i686-unknown-linux-gnu.tar.gz">ruff-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-powerpc64-unknown-linux-gnu.tar.gz">ruff-powerpc64-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64 Linux</td>
<td><a href="https://github.com/astral-sh/ruff/releases/download/0.15.4/ruff-powerpc64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
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
<h2>0.15.4</h2>
<p>Released on 2026-02-26.</p>
<p>This is a follow-up release to 0.15.3 that resolves a panic when the new rule <code>PLR1712</code> was enabled with any rule that analyzes definitions, such as many of the <code>ANN</code> or <code>D</code> rules.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic on access to definitions after analyzing definitions (<a href="">#23588</a>)</li>
<li>[<code>pyflakes</code>] Suppress false positive in <code>F821</code> for names used before <code>del</code> in stub files (<a href="">#23550</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Clarify first-party import detection in Ruff (<a href="">#23591</a>)</li>
<li>Fix incorrect <code>import-heading</code> example (<a href="">#23568</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/stakeswky"><code>@​stakeswky</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/thejcannon"><code>@​thejcannon</code></a></li>
<li><a href="https://github.com/GeObts"><code>@​GeObts</code></a></li>
</ul>
<h2>0.15.3</h2>
<p>Released on 2026-02-26.</p>
<h3>Preview features</h3>
<ul>
<li>
<p>Drop explicit support for <code>.qmd</code> file extension (<a href="">#23572</a>)</p>
<p>This can now be enabled instead by setting the <a href="https://docs.astral.sh/ruff/settings/#extension"><code>extension</code></a> option:</p>
<pre lang="toml"><code># ruff.toml
extension = { qmd = &quot;markdown&quot; }
<h1>pyproject.toml</h1>
<p>[tool.ruff]
extension = { qmd = &quot;markdown&quot; }
</code></pre></p>
</li>
<li>
<p>Include configured extensions in file discovery (<a href="">#23400</a>)</p>
</li>
<li>
<p>[<code>flake8-bandit</code>] Allow suspicious imports in <code>TYPE_CHECKING</code> blocks (<code>S401</code>-<code>S415</code>) (<a href="">#23441</a>)</p>
</li>
<li>
<p>[<code>flake8-bugbear</code>] Allow <code>B901</code> in pytest hook wrappers (<a href="">#21931</a>)</p>
</li>
<li>
<p>[<code>flake8-import-conventions</code>] Add missing conventions from upstream (<code>ICN001</code>, <code>ICN002</code>) (<a href="">#21373</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f14edd8</code></a> Bump 0.15.4 (<a href="">#23595</a>)</li>
<li><a href=""><code>fd09d37</code></a> Fix panic on access to definitions after analyzing definitions (<a href="">#23588</a>)</li>
<li><a href=""><code>81d655f</code></a> [<code>pyflakes</code>] suppress false positive in <code>F821</code> for names used before <code>del</code> in...</li>
<li><a href=""><code>625b4f5</code></a> [ruff] docs: Clarify first-party import detection in Ruff (<a href="">#23591</a>)</li>
<li><a href=""><code>60facfa</code></a> one word typo fix in a <code>while_loop.md</code> test case (<a href="">#23589</a>)</li>
<li><a href=""><code>fbb9fa7</code></a> docs: fix incorrect import-heading example (<a href="">#23568</a>)</li>
<li><a href=""><code>5bc49a9</code></a> Increase the ruleset size to 16 bits (<a href="">#23586</a>)</li>
<li><a href=""><code>a62ba8c</code></a> [ty] Fix overloaded callable assignability for unary Callable targets (<a href="">#23277</a>)</li>
<li><a href=""><code>e5f2f36</code></a> Bump 0.15.3 (<a href="">#23585</a>)</li>
<li><a href=""><code>0e19fc9</code></a> [ty] defer calculating conjunctions in narrowing constraints (<a href="">#23552</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.2...0.15.4">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.7.31 to 0.7.33
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.7.33</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>refactor: remove TOML language support files by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1520</a></li>
<li>chore: update version to 0.2.1 in extension.toml by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1521</a></li>
<li>chore: add wasm32-wasip2 target to rust-toolchain.toml by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1522</a></li>
<li>Revert &quot;refactor: remove TOML language support files&quot; by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1525</a></li>
<li>Zed:  v0.2.2 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1526</a></li>
<li>fix: update node filtering logic to exclude TABLE and ARRAY_OF_TABLE kinds by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1528</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.32...v0.7.33">https://github.com/tombi-toml/tombi/compare/v0.7.32...v0.7.33</a></p>
<h2>v0.7.32</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: logic by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1503</a></li>
<li>feat: support lsp formatting options by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1506</a></li>
<li>chore: comment by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1508</a></li>
<li>chore: Update formatting by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1509</a></li>
<li>fix: improve error handling in config loading by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1513</a></li>
<li>fix: try recursive schema resolution by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1512</a></li>
<li>refactor: Remove ast toml version by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1517</a></li>
<li>refactor: referable by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1518</a></li>
<li>fix: improve error message formatting in StrictAdditionalKeys diagnostic by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1519</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.31...v0.7.32">https://github.com/tombi-toml/tombi/compare/v0.7.31...v0.7.32</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>31fa1f5</code></a> Merge pull request <a href="">#1528</a> from tombi-toml/fix_issue_1527</li>
<li><a href=""><code>6bb6d15</code></a> fix: update node filtering logic to exclude TABLE and ARRAY_OF_TABLE kinds</li>
<li><a href=""><code>4551416</code></a> Merge pull request <a href="">#1526</a> from tombi-toml/zed_0_2_2</li>
<li><a href=""><code>0f8c81c</code></a> chore: update version to 0.2.2 in Cargo.toml and Cargo.lock</li>
<li><a href=""><code>1b73d56</code></a> chore: update version to 0.2.2 in extension.toml and add key7 to sample.toml</li>
<li><a href=""><code>8e1b439</code></a> Merge pull request <a href="">#1525</a> from tombi-toml/revert-1520-remove_zed_grammars</li>
<li><a href=""><code>e75d05c</code></a> Revert &quot;refactor: remove TOML language support files&quot;</li>
<li><a href=""><code>1517a93</code></a> Merge pull request <a href="">#1522</a> from tombi-toml/update_target_toolchain</li>
<li><a href=""><code>1dea458</code></a> chore: add wasm32-wasip2 target to rust-toolchain.toml</li>
<li><a href=""><code>d665e7f</code></a> Merge pull request <a href="">#1521</a> from tombi-toml/zed_0_2_1</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.7.31...v0.7.33">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.17 to 0.0.19
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.19</h2>
<h2>Release Notes</h2>
<p>Released on 2026-02-26.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic in diagnostic rendering when attempting to render a code frame pointing to leading whitespace (<a href="">#23458</a>)</li>
<li>Fix panics and incorrect inference stemming from incorrectly considering overloads in another file as being associated with a function in the file being checked (<a href="">#21977</a>)</li>
<li>Fix panic when attempting to narrow the type of a dictionary key that was assigned using a multi-target assignment, e.g. <code>x = y = {&quot;a&quot;: 1}</code> (<a href="">#23523</a>)</li>
<li>Fix infinite hang on mutually recursive <code>TypeAliasType</code> definitions (<a href="">#23397</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix inlay hints for starred unpacking targets (<a href="">#23454</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Fix assignability, subtyping and equivalence checks relating to <code>typing.Generator</code> prior to Python 3.13 (<a href="">#23386</a>)</li>
<li>Understand that a scope's control flow terminates after <code>await foo()</code> if <code>foo</code> returns <code>typing.Awaitable[typing.Never]</code> or similar (<a href="">#23479</a>)</li>
<li>Implement stricter handling of calls to instances of <code>type[T]</code> types (<a href="">#23472</a>)</li>
<li>Support basic type narrowing for <code>case {...}:</code> patterns in <code>match</code> statements (<a href="">#23462</a>)</li>
<li>Fix bugs that could manifest in incorrect overload evaluation, false-positive complaints regarding <code>assert_type</code> calls or false-positive <code>redundant-cast</code> diagnostics by reimplementing the equivalence type relation as mutual subtyping of top and bottom materializations (<a href="">#23428</a>)</li>
<li>Fix equality and <code>__contains__</code> narrowing with PEP-695 type aliases (<a href="">#23545</a>)</li>
<li>Support <code>_value_</code> annotations on enum classes (<a href="">#22228</a>)</li>
</ul>
<h3>Improvements to diagnostics</h3>
<ul>
<li>Improve diagnostics when attempting to specialize non-generic types (<a href="">#23516</a>)</li>
<li>Render subdiagnostics when <code>--output-format=github</code> is specified (<a href="">#23455</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Add a cached method for calculating the intersection of two types (<a href="">#23547</a>)</li>
<li>Add a cached method for calculating the union of two types (<a href="">#23565</a>)</li>
<li>Reduce the threshold above which <code>Literal</code> types in unions are upcasted to nominal-instance types in situations where the union type is recursively defined (<a href="">#23521</a>)</li>
<li>Control flow: isolate the calculation of &quot;loop header reachability&quot; in a dedicated, cached function (<a href="">#23520</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/silamon"><code>@​silamon</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/Hugo-Polloli"><code>@​Hugo-Polloli</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/knutwannheden"><code>@​knutwannheden</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.19</h2>
<p>Released on 2026-02-26.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic in diagnostic rendering when attempting to render a code frame pointing to leading whitespace (<a href="">#23458</a>)</li>
<li>Fix panics and incorrect inference stemming from incorrectly considering overloads in another file as being associated with a function in the file being checked (<a href="">#21977</a>)</li>
<li>Fix panic when attempting to narrow the type of a dictionary key that was assigned using a multi-target assignment, e.g. <code>x = y = {&quot;a&quot;: 1}</code> (<a href="">#23523</a>)</li>
<li>Fix infinite hang on mutually recursive <code>TypeAliasType</code> definitions (<a href="">#23397</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix inlay hints for starred unpacking targets (<a href="">#23454</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Fix assignability, subtyping and equivalence checks relating to <code>typing.Generator</code> prior to Python 3.13 (<a href="">#23386</a>)</li>
<li>Understand that a scope's control flow terminates after <code>await foo()</code> if <code>foo</code> returns <code>typing.Awaitable[typing.Never]</code> or similar (<a href="">#23479</a>)</li>
<li>Implement stricter handling of calls to instances of <code>type[T]</code> types (<a href="">#23472</a>)</li>
<li>Support basic type narrowing for <code>case {...}:</code> patterns in <code>match</code> statements (<a href="">#23462</a>)</li>
<li>Fix bugs that could manifest in incorrect overload evaluation, false-positive complaints regarding <code>assert_type</code> calls or false-positive <code>redundant-cast</code> diagnostics by reimplementing the equivalence type relation as mutual subtyping of top and bottom materializations (<a href="">#23428</a>)</li>
<li>Fix equality and <code>__contains__</code> narrowing with PEP-695 type aliases (<a href="">#23545</a>)</li>
<li>Support <code>_value_</code> annotations on enum classes (<a href="">#22228</a>)</li>
</ul>
<h3>Improvements to diagnostics</h3>
<ul>
<li>Improve diagnostics when attempting to specialize non-generic types (<a href="">#23516</a>)</li>
<li>Render subdiagnostics when <code>--output-format=github</code> is specified (<a href="">#23455</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Add a cached method for calculating the intersection of two types (<a href="">#23547</a>)</li>
<li>Add a cached method for calculating the union of two types (<a href="">#23565</a>)</li>
<li>Reduce the threshold above which <code>Literal</code> types in unions are upcasted to nominal-instance types in situations where the union type is recursively defined (<a href="">#23521</a>)</li>
<li>Control flow: isolate the calculation of &quot;loop header reachability&quot; in a dedicated, cached function (<a href="">#23520</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/silamon"><code>@​silamon</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/Hugo-Polloli"><code>@​Hugo-Polloli</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/knutwannheden"><code>@​knutwannheden</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
</ul>
<h2>0.0.18</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ae10022</code></a> Bump version to 0.0.19 (<a href="">#2908</a>)</li>
<li><a href=""><code>6bdb7d7</code></a> Update Fathom code for ty (<a href="">#2890</a>)</li>
<li><a href=""><code>d207424</code></a> Update docker/build-push-action action to v6.19.2 (<a href="">#2880</a>)</li>
<li><a href=""><code>839cfc3</code></a> Update prek dependencies (<a href="">#2879</a>)</li>
<li><a href=""><code>7516727</code></a> Bump version to 0.0.18 (<a href="">#2869</a>)</li>
<li><a href=""><code>8e86a56</code></a> Mention code folding on language server feature page</li>
<li><a href=""><code>ca49bf9</code></a> Add shellcheck to pre-commit configuration (<a href="">#2845</a>)</li>
<li><a href=""><code>532e761</code></a> Update PyO3/maturin-action action to v1.50.0 (<a href="">#2823</a>)</li>
<li><a href=""><code>0211006</code></a> Update prek dependencies (<a href="">#2822</a>)</li>
<li><a href=""><code>60ebbfe</code></a> docs: Add beta status notice to README (<a href="">#2556</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.17...0.0.19">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.2 to 9.7.3
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.3 (2026-02-24)</p>
<ul>
<li>Fixed <a href="">#8567</a>: Print MkDocs 2.0 incompatibility warning to stderr</li>
</ul>
<p>mkdocs-material-9.7.2 (2026-02-18)</p>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to 'mkdocs build' about impending MkDocs 2.0 incompatibility</li>
</ul>
<p>mkdocs-material-9.7.1 (2025-12-18)</p>
<ul>
<li>Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li>Fixed privacy plugin not picking up protocol-relative URLs</li>
<li>Fixed <a href="">#8542</a>: false positives and negatives captured in privacy plugin</li>
</ul>
<p>mkdocs-material-9.7.0 (2025-11-11)</p>
<p>⚠️ Material for MkDocs is now in maintenance mode</p>
<p>This is the last release of Material for MkDocs that will receive new features.
Going forward, the Material for MkDocs team focuses on Zensical, a next-gen
static site generator built from first principles. We will provide critical
bug fixes and security updates for Material for MkDocs for 12 months at least.</p>
<p>Read the full announcement on our blog:
<a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/</a></p>
<p>This release includes all features that were previously exclusive to the
Insiders edition. These features are now freely available to everyone.</p>
<p>Note on deprecated plugins: The projects and typeset plugins are included in
this release, but must be considered deprecated. Both plugins proved
unsustainable to maintain and represent architectural dead ends. They are
provided as-is without ongoing support.</p>
<p>Changes:</p>
<ul>
<li>Added support for pinned blog posts and author profiles</li>
<li>Added support for customizing pagination for blog index pages</li>
<li>Added support for customizing blog category sort order</li>
<li>Added support for staying on page when switching languages</li>
<li>Added support for disabling tags in table of contents</li>
<li>Added support for nested tags and shadow tags</li>
<li>Added support for footnote tooltips</li>
<li>Added support for instant previews</li>
<li>Added support for instant prefetching</li>
<li>Added support for custom social card layouts</li>
<li>Added support for custom social card background images</li>
<li>Added support for selectable rangs in code blocks</li>
<li>Added support for custom selectors for code annotations</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>da5d442</code></a> Prepare 9.7.3 release</li>
<li><a href=""><code>03e8bae</code></a> Fixed order of imports</li>
<li><a href=""><code>70dee38</code></a> Switched warning message to print to stderr</li>
<li><a href=""><code>b78109b</code></a> Updated blog post on MkDocs 2.0</li>
<li><a href=""><code>e1dd2c8</code></a> Updated blog post on MkDocs 2.0</li>
<li><a href=""><code>6972761</code></a> Updated blog post on MkDocs 2.0</li>
<li>See full diff in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.2...9.7.3">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocstrings-python` from 2.0.2 to 2.0.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/releases">mkdocstrings-python's releases</a>.</em></p>
<blockquote>
<h2>2.0.3</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.3">2.0.3</a> - 2026-02-20</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.2...2.0.3">Compare with 2.0.2</a><!-- raw HTML omitted --></p>
<h3>Build</h3>
<ul>
<li>Depend on griffelib instead of griffe (<a href="">770a5f6</a> by Timothée Mazzucotelli).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/blob/main/CHANGELOG.md">mkdocstrings-python's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.3">2.0.3</a> - 2026-02-20</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.2...2.0.3">Compare with 2.0.2</a><!-- raw HTML omitted --></p>
<h3>Build</h3>
<ul>
<li>Depend on griffelib instead of griffe (<a href="">770a5f6</a> by Timothée Mazzucotelli).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a0b99c5</code></a> chore: Prepare release 2.0.3</li>
<li><a href=""><code>770a5f6</code></a> build: Depend on griffelib instead of griffe</li>
<li><a href=""><code>bf8caaf</code></a> Merge branch 'main' of github.com:mkdocstrings/python</li>
<li><a href=""><code>95f58aa</code></a> ci: Minor lint fixes</li>
<li><a href=""><code>186d6cf</code></a> chore: Update sponsors section in README</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/python/compare/2.0.2...2.0.3">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70d3ec27957b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.