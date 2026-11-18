# Issue

**Title:** [dependabot]: Bump the deps group with 3 updates

## Description

Bumps the deps group with 3 updates: [ruff](https://github.com/astral-sh/ruff), [tombi](https://github.com/tombi-toml/tombi) and [ty](https://github.com/astral-sh/ty).

Updates `ruff` from 0.15.14 to 0.15.15
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.15</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-28.</p>
<h3>Preview features</h3>
<ul>
<li>Fix Markdown closing fence handling (<a href="">#25310</a>)</li>
<li>[<code>pyflakes</code>] Report duplicate imports in <code>typing.TYPE_CHECKING</code> block (<code>F811</code>) (<a href="">#22560</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>pyflakes</code>] Treat function-scope bare annotations as locals per PEP 526 (<code>F821</code>) (<a href="">#21540</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid redundant <code>TokenValue</code> drops in the lexer (<a href="">#25300</a>)</li>
<li>Reduce memory usage by dropping token-excess capacity and improve performance by approximating the initial tokens <code>Vec</code> size (<a href="">#25354</a>)</li>
<li>Use <code>ThinVec</code> in AST to shrink <code>Stmt</code> (<a href="">#25361</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Fix <code>line-length</code> example for <code>--config</code> option (<a href="">#25389</a>)</li>
<li>[<code>flake8-comprehensions</code>] Document <code>RecursionError</code> edge case in <code>__len__</code> (<code>C416</code>) (<a href="">#25286</a>)</li>
<li>[<code>mccabe</code>] Improve example (<code>C901</code>) (<a href="">#25287</a>)</li>
<li>[<code>pyupgrade</code>] Clarify fix safety docs (<code>UP007</code>, <code>UP045</code>) (<a href="">#25288</a>)</li>
<li>[<code>refurb</code>] Document <code>FURB192</code> exception change for empty sequences (<a href="">#25317</a>)</li>
<li>[<code>ruff</code>] Document false negative for user-defined types (<code>RUF013</code>) (<a href="">#25289</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Fix formatting of lambdas nested within f-strings (<a href="">#25398</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Return code action for <code>codeAction/resolve</code> requests that contain no or no valid URL (<a href="">#25365</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Expand semantic syntax errors for invalid walruses (<a href="">#25415</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/chirizxc"><code>@​chirizxc</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/adityasingh2400"><code>@​adityasingh2400</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/fallintoplace"><code>@​fallintoplace</code></a></li>
<li><a href="https://github.com/martin-schlossarek"><code>@​martin-schlossarek</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.15</h2>
<p>Released on 2026-05-28.</p>
<h3>Preview features</h3>
<ul>
<li>Fix Markdown closing fence handling (<a href="">#25310</a>)</li>
<li>[<code>pyflakes</code>] Report duplicate imports in <code>typing.TYPE_CHECKING</code> block (<code>F811</code>) (<a href="">#22560</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>pyflakes</code>] Treat function-scope bare annotations as locals per PEP 526 (<code>F821</code>) (<a href="">#21540</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid redundant <code>TokenValue</code> drops in the lexer (<a href="">#25300</a>)</li>
<li>Reduce memory usage by dropping token-excess capacity and improve performance by approximating the initial tokens <code>Vec</code> size (<a href="">#25354</a>)</li>
<li>Use <code>ThinVec</code> in AST to shrink <code>Stmt</code> (<a href="">#25361</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Fix <code>line-length</code> example for <code>--config</code> option (<a href="">#25389</a>)</li>
<li>[<code>flake8-comprehensions</code>] Document <code>RecursionError</code> edge case in <code>__len__</code> (<code>C416</code>) (<a href="">#25286</a>)</li>
<li>[<code>mccabe</code>] Improve example (<code>C901</code>) (<a href="">#25287</a>)</li>
<li>[<code>pyupgrade</code>] Clarify fix safety docs (<code>UP007</code>, <code>UP045</code>) (<a href="">#25288</a>)</li>
<li>[<code>refurb</code>] Document <code>FURB192</code> exception change for empty sequences (<a href="">#25317</a>)</li>
<li>[<code>ruff</code>] Document false negative for user-defined types (<code>RUF013</code>) (<a href="">#25289</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Fix formatting of lambdas nested within f-strings (<a href="">#25398</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Return code action for <code>codeAction/resolve</code> requests that contain no or no valid URL (<a href="">#25365</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Expand semantic syntax errors for invalid walruses (<a href="">#25415</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/chirizxc"><code>@​chirizxc</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/adityasingh2400"><code>@​adityasingh2400</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/fallintoplace"><code>@​fallintoplace</code></a></li>
<li><a href="https://github.com/martin-schlossarek"><code>@​martin-schlossarek</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/Ruchir28"><code>@​Ruchir28</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>db5aa0a</code></a> Bump 0.15.15 (<a href="">#25431</a>)</li>
<li><a href=""><code>366fe21</code></a> [ty] Improve diagnostics for syntax errors in forward annotations (<a href="">#25158</a>)</li>
<li><a href=""><code>e2e1e64</code></a> [ty] Remove excess capacity from more Salsa cached collections (<a href="">#25411</a>)</li>
<li><a href=""><code>1bd77e1</code></a> [ty] Use diagnostic message as tie breaker when sorting (<a href="">#25424</a>)</li>
<li><a href=""><code>7e1bc1e</code></a> Add agent skills for working on ty (<a href="">#25422</a>)</li>
<li><a href=""><code>574e107</code></a> Expand semantic syntax errors for invalid walruses (<a href="">#25415</a>)</li>
<li><a href=""><code>4a7ca06</code></a> [ty] Display docs for matching parameter when hovering over the name of an ar...</li>
<li><a href=""><code>5432709</code></a> Refine a few agents instructions (<a href="">#25423</a>)</li>
<li><a href=""><code>3cb09eb</code></a> [ty] Support <code>typing.TypeForm</code> (<a href="">#25334</a>)</li>
<li><a href=""><code>c8cd59f</code></a> [ty] Infer class attributes assigned by metaclass initialization (<a href="">#25342</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.14...0.15.15">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.11.6 to 1.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.1.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Align multiline delimiter comments with trailing comment width by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1924</a></li>
</ul>
<h3>👒 Dependencies</h3>
<ul>
<li>fix: address Dependabot security alerts by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1919</a></li>
<li>fix: remove unused surf fallback from schema store by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1920</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: statically link Windows MSVC CRT by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1917</a></li>
<li>fix: resolve Dependabot security alerts by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1918</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.1.0...v1.1.1">https://github.com/tombi-toml/tombi/compare/v1.1.0...v1.1.1</a></p>
<h2>v1.1.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>Starting with this version, we will synchronize <a href="https://github.com/tombi-toml/setup-tombi">setup-tombi</a> with version control.</p>
<h3>🛠️ Other Changes</h3>
<ul>
<li>test: consolidate tombi-lsp ad hoc cases by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1914</a></li>
<li>ci: sync setup-tombi release automation by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1915</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.0.0...v1.1.0">https://github.com/tombi-toml/tombi/compare/v1.0.0...v1.1.0</a></p>
<h2>v1.0.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>Since Tombi's functionality has stabilized, we are releasing version 1.0.0 🎉</p>
<p>This is part of our effort to align the version with <a href="https://github.com/tombi-toml/setup-tombi">setup-tombi</a> in the future.</p>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: restore cargo document links for standalone dependencies by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1913</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Refactor: Cargo.toml files for improved readability and consistency in dependency definitions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1910</a></li>
<li>fix: pin Cargo.toml schema to TOML 1.0 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1911</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.11.7...v1.0.0">https://github.com/tombi-toml/tombi/compare/v0.11.7...v1.0.0</a></p>
<h2>v0.11.7</h2>
<!-- raw HTML omitted -->
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e921337</code></a> Merge pull request <a href="">#1924</a> from tombi-toml/ya7010/nested-toml-trailing-comments</li>
<li><a href=""><code>8e83e1f</code></a> Fix trailing comment alignment for multiline delimiters</li>
<li><a href=""><code>c813b37</code></a> Merge pull request <a href="">#1920</a> from tombi-toml/ya7010/fix-code-scanning-alerts</li>
<li><a href=""><code>ab78123</code></a> fix: export wasm schema-store http client</li>
<li><a href=""><code>084dd46</code></a> fix: remove unused surf schema-store client</li>
<li><a href=""><code>599cc05</code></a> Merge pull request <a href="">#1919</a> from tombi-toml/ya7010/fix-dependabot-alerts-v1</li>
<li><a href=""><code>94e2d6d</code></a> fix: address Dependabot security alerts</li>
<li><a href=""><code>861602c</code></a> Merge pull request <a href="">#1918</a> from tombi-toml/ya7010/fix-dependabot-alerts</li>
<li><a href=""><code>2ef9df8</code></a> fix: docsのNode engine要件を更新</li>
<li><a href=""><code>4e0fb2a</code></a> fix: Dependabot security alert対応\n\nCo-Authored-By: Claude Opus 4.6 &lt;noreply@...</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.11.6...v1.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.38 to 0.0.40
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.40</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-27.</p>
<h3>Bug fixes</h3>
<ul>
<li>Accept complete enum-literal alias unions as enums (<a href="">#25341</a>)</li>
<li>Fix diagnostics in ignored folders after adding new files (<a href="">#25236</a>)</li>
<li>Show <code>LiteralString</code> when hovering over an inline of a literal string in an IDE (<a href="">#25373</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Follow aliases when attempting to map a definition in a stub file to its &quot;real&quot; runtime definition (<a href="">#25328</a>)</li>
<li>Treat Python notebook text documents as Python sources (<a href="">#25393</a>)</li>
<li>Fix autocompletion for elements inside incomplete list comprehensions (<a href="">#25326</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add a subdiagnostic help message to <code>invalid-generic-class</code> diagnostics regarding incompatible variance (<a href="">#25385</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Ignore and reject annotations on non-name targets (<a href="">#25324</a>)</li>
<li>Infer class attributes assigned by metaclass initialization (<a href="">#25342</a>)</li>
<li>Reject inconsistent generic bases in &quot;dynamic&quot; classes created using <code>type(...)</code>, <code>types.new_type(...)</code>, etc. (<a href="">#25413</a>)</li>
<li>Resolve enum names for all unions arms in <code>Literal</code> enum subsets (<a href="">#25379</a>)</li>
<li>Support <code>typing.TypeForm</code> (<a href="">#25334</a>)</li>
<li>Fix many issues in the generics solver by using constraint sets more widely to solve type variables (<a href="">#24540</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/anuraaga"><code>@​anuraaga</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/Dev-X25874"><code>@​Dev-X25874</code></a></li>
</ul>
<h2>Install ty 0.0.40</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.40/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.40/ty-installer.ps1 | iex&quot;
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.40</h2>
<p>Released on 2026-05-27.</p>
<h3>Bug fixes</h3>
<ul>
<li>Accept complete enum-literal alias unions as enums (<a href="">#25341</a>)</li>
<li>Fix diagnostics in ignored folders after adding new files (<a href="">#25236</a>)</li>
<li>Show <code>LiteralString</code> when hovering over an inline of a literal string in an IDE (<a href="">#25373</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Follow aliases when attempting to map a definition in a stub file to its &quot;real&quot; runtime definition (<a href="">#25328</a>)</li>
<li>Treat Python notebook text documents as Python sources (<a href="">#25393</a>)</li>
<li>Fix autocompletion for elements inside incomplete list comprehensions (<a href="">#25326</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add a subdiagnostic help message to <code>invalid-generic-class</code> diagnostics regarding incompatible variance (<a href="">#25385</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Ignore and reject annotations on non-name targets (<a href="">#25324</a>)</li>
<li>Infer class attributes assigned by metaclass initialization (<a href="">#25342</a>)</li>
<li>Reject inconsistent generic bases in &quot;dynamic&quot; classes created using <code>type(...)</code>, <code>types.new_type(...)</code>, etc. (<a href="">#25413</a>)</li>
<li>Resolve enum names for all unions arms in <code>Literal</code> enum subsets (<a href="">#25379</a>)</li>
<li>Support <code>typing.TypeForm</code> (<a href="">#25334</a>)</li>
<li>Fix many issues in the generics solver by using constraint sets more widely to solve type variables (<a href="">#24540</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/anuraaga"><code>@​anuraaga</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/Dev-X25874"><code>@​Dev-X25874</code></a></li>
</ul>
<h2>0.0.39</h2>
<p>Released on 2026-05-22.</p>
<p>This release removes the Python 3.9 branches from our vendored standard library stubs. ty now only has &quot;full&quot; support for
Python 3.10 and later, but will still report version-specific syntax errors and other diagnostics when <code>--python-version 3.9</code>
is provided via the CLI.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid panicking on <code>__new__</code> assignments to classes (<a href="">#25282</a>)</li>
<li>Preserve declaration order when synthesizing class fields (<a href="">#25249</a>)</li>
<li>Respect <code>dict</code>-compatible fallbacks in TypedDict unions (<a href="">#25242</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7b95bc2</code></a> Bump version to 0.0.40 (<a href="">#3554</a>)</li>
<li><a href=""><code>54c7498</code></a> Update prek dependencies (<a href="">#3546</a>)</li>
<li><a href=""><code>0d8540a</code></a> docs: set Eglot <code>:language-id</code> so ty works with <code>python-base-mode</code> (<a href="">#3532</a>)</li>
<li><a href=""><code>8f1cee0</code></a> scripts/update_schemastore: add text=True to git revision check_output calls ...</li>
<li><a href=""><code>32b654a</code></a> docs: add Flycheck note to Emacs editor integration (<a href="">#3528</a>)</li>
<li><a href=""><code>4e1b4e7</code></a> docs: fix broken link and minor wording in suppression.md (<a href="">#3527</a>)</li>
<li><a href=""><code>0205125</code></a> Bump version to 0.0.39 (<a href="">#3516</a>)</li>
<li><a href=""><code>ae8058d</code></a> Update maturin to v1.13.3 (<a href="">#3494</a>)</li>
<li><a href=""><code>33b60f8</code></a> Update prek dependencies (<a href="">#3495</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.38...0.0.40">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4197a03972d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.