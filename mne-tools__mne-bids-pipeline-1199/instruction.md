# Issue

**Title:** [dependabot]: Bump the deps group with 4 updates

## Description

Bumps the deps group with 4 updates: [ruff](https://github.com/astral-sh/ruff), [tombi](https://github.com/tombi-toml/tombi), [ty](https://github.com/astral-sh/ty) and [mkdocs-material](https://github.com/squidfunk/mkdocs-material).

Updates `ruff` from 0.15.6 to 0.15.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.7</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-19.</p>
<h3>Preview features</h3>
<ul>
<li>Display output severity in preview (<a href="">#23845</a>)</li>
<li>Don't show <code>noqa</code> hover for non-Python documents (<a href="">#24040</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pycodestyle</code>] Recognize <code>pyrefly:</code> as a pragma comment (<code>E501</code>) (<a href="">#24019</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Don't return code actions for non-Python documents (<a href="">#23905</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add company AI policy to contributing guide (<a href="">#24021</a>)</li>
<li>Document editor features for Markdown code formatting (<a href="">#23924</a>)</li>
<li>[<code>pylint</code>] Improve phrasing (<code>PLC0208</code>) (<a href="">#24033</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use PEP 639 license information (<a href="">#19661</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/tmimmanuel"><code>@​tmimmanuel</code></a></li>
<li><a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a></li>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/statxc"><code>@​statxc</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/hunterhogan"><code>@​hunterhogan</code></a></li>
<li><a href="https://github.com/renovate"><code>@​renovate</code></a></li>
</ul>
<h2>Install ruff 0.15.7</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.15.7/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ruff/releases/download/0.15.7/ruff-installer.ps1 | iex&quot;
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.7</h2>
<p>Released on 2026-03-19.</p>
<h3>Preview features</h3>
<ul>
<li>Display output severity in preview (<a href="">#23845</a>)</li>
<li>Don't show <code>noqa</code> hover for non-Python documents (<a href="">#24040</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pycodestyle</code>] Recognize <code>pyrefly:</code> as a pragma comment (<code>E501</code>) (<a href="">#24019</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Don't return code actions for non-Python documents (<a href="">#23905</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add company AI policy to contributing guide (<a href="">#24021</a>)</li>
<li>Document editor features for Markdown code formatting (<a href="">#23924</a>)</li>
<li>[<code>pylint</code>] Improve phrasing (<code>PLC0208</code>) (<a href="">#24033</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use PEP 639 license information (<a href="">#19661</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/tmimmanuel"><code>@​tmimmanuel</code></a></li>
<li><a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a></li>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/statxc"><code>@​statxc</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/hunterhogan"><code>@​hunterhogan</code></a></li>
<li><a href="https://github.com/renovate"><code>@​renovate</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0ef39de</code></a> Bump 0.15.7 (<a href="">#24049</a>)</li>
<li><a href=""><code>beb543b</code></a> [ty] ecosystem-analyzer: Fail on newly panicking projects (<a href="">#24043</a>)</li>
<li><a href=""><code>378fe73</code></a> Don't show noqa hover for non-Python documents (<a href="">#24040</a>)</li>
<li><a href=""><code>b5665bd</code></a> [<code>pylint</code>] Improve phrasing (<code>PLC0208</code>) (<a href="">#24033</a>)</li>
<li><a href=""><code>6e20f22</code></a> test: migrate <code>show_settings</code> and <code>version</code> tests to use <code>CliTest</code> (<a href="">#23702</a>)</li>
<li><a href=""><code>f99b284</code></a> Drain file watcher events during test setup (<a href="">#24030</a>)</li>
<li><a href=""><code>744c996</code></a> [ty] Filter out unsatisfiable inference attempts during generic call narrowin...</li>
<li><a href=""><code>1616095</code></a> [ty] Avoid inferring intersection types for call arguments (<a href="">#23933</a>)</li>
<li><a href=""><code>7f275f4</code></a> [ty] Pin mypy_primer in <code>setup_primer_project.py</code> (<a href="">#24020</a>)</li>
<li><a href=""><code>7255e36</code></a> [<code>pycodestyle</code>] Recognize <code>pyrefly:</code> as a pragma comment (<code>E501</code>) (<a href="">#24019</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.6...0.15.7">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.4 to 0.9.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.7</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: terminal pop-up problem with vscode extension in Windows system by <a href="https://github.com/luo2430"><code>@​luo2430</code></a> in <a href="">tombi-toml/tombi#1600</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: update installation guide to clarify type definition request behavior in Zed by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1596</a></li>
<li>doc: fix and move  tombi.toml sample by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1597</a></li>
<li>ci: skip irrelevant GitHub Actions runs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1598</a></li>
<li>refactor(vscode): extract node command check by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1601</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/luo2430"><code>@​luo2430</code></a> made their first contribution in <a href="">tombi-toml/tombi#1600</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.6...v0.9.7">https://github.com/tombi-toml/tombi/compare/v0.9.6...v0.9.7</a></p>
<h2>v0.9.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: apply tombi schema to user config path by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1594</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: add JSON Schema dialect compliance table by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1591</a></li>
<li>docs: add Zed initial configuration guide by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1592</a></li>
<li>docs: clarify JSON Schema dialect compatibility table by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1593</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.5...v0.9.6">https://github.com/tombi-toml/tombi/compare/v0.9.5...v0.9.6</a></p>
<h2>v0.9.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>Our JSON Schema implementation now supports major features.</p>
<p><a href="https://tombi-toml.github.io/tombi/docs/json-schema#compliance-status">https://tombi-toml.github.io/tombi/docs/json-schema#compliance-status</a></p>
<h3>👒 Dependencies</h3>
<ul>
<li>chore(deps): bump quinn-proto from 0.11.12 to 0.11.14 in the cargo group across 1 directory by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">tombi-toml/tombi#1583</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: correct unevaluated evaluation and add regression coverage by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1579</a></li>
<li>Fix bundled schemastore URIs for embedded schemas by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1584</a></li>
<li>feat: nextest options. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1585</a></li>
<li>fix: validate adjacent applicators on typed schemas by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1582</a></li>
<li>test: add issue 1580 diagnostic fixture by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1587</a></li>
<li>chore: update JSON Schema compliance TODO statuses by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1588</a></li>
<li>refactor: use evaluated locations as validation result by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1589</a></li>
<li>fix(vscode): handle node_modules tombi launch by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1590</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2b22063</code></a> Merge pull request <a href="">#1601</a> from tombi-toml/refactor_node_command</li>
<li><a href=""><code>2dccffb</code></a> refactor(vscode): extract node command check</li>
<li><a href=""><code>031082d</code></a> Merge pull request <a href="">#1600</a> from luo2430/main</li>
<li><a href=""><code>37ba9e3</code></a> fix: terminal pop-up problem with vscode extension in Windows system</li>
<li><a href=""><code>abe830c</code></a> Merge pull request <a href="">#1598</a> from tombi-toml/codex/skip-irrelevant-actions</li>
<li><a href=""><code>80d4681</code></a> ci: tighten change detection logic</li>
<li><a href=""><code>73715fc</code></a> ci: skip irrelevant GitHub Actions runs</li>
<li><a href=""><code>6c6f55f</code></a> Merge pull request <a href="">#1597</a> from tombi-toml/fix_doc</li>
<li><a href=""><code>10538c0</code></a> fix docs grammar in configuration warning</li>
<li><a href=""><code>b7b65a1</code></a> docs: add full configuration structure example to documentation</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.4...v0.9.7">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.22 to 0.0.24
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.24</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-19.</p>
<h3>Bug fixes</h3>
<ul>
<li>Ensure <code>TypedDict</code> subscripts for unknown keys return <code>Unknown</code> (<a href="">#23926</a>)</li>
<li>Fix overflow with recursive <code>TypeIs</code> (<a href="">#23784</a>)</li>
<li>Fix variance of frozen dataclass-transform models (<a href="">#23931</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Improve <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens">semantic token</a> classification for attribute access on union types (<a href="">#23841</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Improve performance and correctness by avoiding inferring intersection types for call arguments as a result of bidirectional inference (<a href="">#23933</a>)</li>
<li>Narrow keyword arguments when unpacking dictionary instances (<a href="">#23436</a>)</li>
<li>Discover <code>/usr/local/lib</code> dist-packages on Debian/Ubuntu (<a href="">#23797</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#23963</a>). <a href="https://github.com/python/typeshed/compare/fa659b1def704dea3dc8e25c7857b23eac69df4d...f8f0794d0fe249c06dc9f31a004d85be6cca6ced">Typeshed diff</a></li>
</ul>
<h2>Install ty 0.0.24</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ty 0.0.24</h2>
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
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-apple-darwin.tar.gz">ty-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-x86_64-apple-darwin.tar.gz">ty-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-pc-windows-msvc.zip">ty-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-i686-pc-windows-msvc.zip">ty-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-x86_64-pc-windows-msvc.zip">ty-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-unknown-linux-gnu.tar.gz">ty-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-i686-unknown-linux-gnu.tar.gz">ty-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-powerpc64-unknown-linux-gnu.tar.gz">ty-powerpc64-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-powerpc64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-powerpc64le-unknown-linux-gnu.tar.gz">ty-powerpc64le-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64LE Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-powerpc64le-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-s390x-unknown-linux-gnu.tar.gz">ty-s390x-unknown-linux-gnu.tar.gz</a></td>
<td>S390x Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.24/ty-s390x-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.24</h2>
<p>Released on 2026-03-19.</p>
<h3>Bug fixes</h3>
<ul>
<li>Ensure <code>TypedDict</code> subscripts for unknown keys return <code>Unknown</code> (<a href="">#23926</a>)</li>
<li>Fix overflow with recursive <code>TypeIs</code> (<a href="">#23784</a>)</li>
<li>Fix variance of frozen dataclass-transform models (<a href="">#23931</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Improve <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens">semantic token</a> classification for attribute access on union types (<a href="">#23841</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Improve performance and correctness by avoiding inferring intersection types for call arguments as a result of bidirectional inference (<a href="">#23933</a>)</li>
<li>Narrow keyword arguments when unpacking dictionary instances (<a href="">#23436</a>)</li>
<li>Discover <code>/usr/local/lib</code> dist-packages on Debian/Ubuntu (<a href="">#23797</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#23963</a>). <a href="https://github.com/python/typeshed/compare/fa659b1def704dea3dc8e25c7857b23eac69df4d...f8f0794d0fe249c06dc9f31a004d85be6cca6ced">Typeshed diff</a></li>
</ul>
<h2>Performance</h2>
<ul>
<li>Introduce fast path for protocol non-assignability (<a href="">#23952</a>)</li>
<li>Improved generic-solver performance in cases involving overload sets (<a href="">#23881</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/Geo5"><code>@​Geo5</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/ollema"><code>@​ollema</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<h2>0.0.23</h2>
<p>Released on 2026-03-13.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix false-positive diagnostics for PEP-604 union annotations on attribute targets on Python 3.9 when <code>from __future__ import annotations</code> is active (<a href="">#23915</a>)</li>
<li><code>dataclass_transform</code>: Respect <code>kw_only</code> overwrites in dataclasses (<a href="">#23930</a>)</li>
<li>Fix too-many-cycle panics when inferring loop variables with <code>Literal</code> types (<a href="">#23875</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Fix <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_foldingRange">folding range</a> classification of lines starting with <code>#</code> (<a href="">#23831</a>)</li>
<li>Fix <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_foldingRange">folding ranges</a> for notebooks (<a href="">#23830</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8762330</code></a> Bump version to 0.0.24 (<a href="">#3084</a>)</li>
<li><a href=""><code>a6f24e1</code></a> Update prek dependencies (<a href="">#3045</a>)</li>
<li><a href=""><code>95150e7</code></a> Typing FAQ: New entry explaining invariance (<a href="">#3073</a>)</li>
<li><a href=""><code>bc9e8a8</code></a> Remove the repository code of conduct in favor of the organization one (<a href="">#3058</a>)</li>
<li><a href=""><code>3d12b2e</code></a> Update astral-sh/setup-uv action to v7.6.0 (<a href="">#3054</a>)</li>
<li><a href=""><code>64fe9c2</code></a> Update actions/attest-build-provenance action to v4 (<a href="">#3046</a>)</li>
<li><a href=""><code>86d05eb</code></a> Update docker/setup-buildx-action action to v4 (<a href="">#3050</a>)</li>
<li><a href=""><code>eb3f320</code></a> Update docker/metadata-action action to v6 (<a href="">#3049</a>)</li>
<li><a href=""><code>7da93b8</code></a> Update docker/login-action action to v4 (<a href="">#3048</a>)</li>
<li><a href=""><code>fa4db72</code></a> Update docker/build-push-action action to v7 (<a href="">#3047</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.22...0.0.24">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.5 to 9.7.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.6</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Automatically disable MkDocs 2.0 warning for forks of MkDocs</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.6 (2026-03-19)</p>
<ul>
<li>Automatically disable MkDocs 2.0 warning for forks of MkDocs</li>
</ul>
<p>mkdocs-material-9.7.5 (2026-03-10)</p>
<ul>
<li>Limited version range of mkdocs to &lt;2</li>
<li>Updated MkDocs 2.0 incompatibility warning (clarify relation with MkDocs)</li>
</ul>
<p>mkdocs-material-9.7.4 (2026-03-03)</p>
<ul>
<li>Hardened social cards plugin by switching to sandboxed environment</li>
<li>Updated MkDocs 2.0 incompatibility warning</li>
</ul>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6c52ed6</code></a> Prepare 9.7.6 release</li>
<li><a href=""><code>51d9b76</code></a> Automatically disable MkDocs 2.0 warning for forks of MkDocs</li>
<li><a href=""><code>6f9a48b</code></a> Updated links</li>
<li>See full diff in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.5...9.7.6">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3b71fcf74f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.