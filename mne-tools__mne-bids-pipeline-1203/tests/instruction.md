# Issue

**Title:** [dependabot]: Bump the deps group with 4 updates

## Description

Bumps the deps group with 4 updates: [pytest-cov](https://github.com/pytest-dev/pytest-cov), [ruff](https://github.com/astral-sh/ruff), [tombi](https://github.com/tombi-toml/tombi) and [ty](https://github.com/astral-sh/ty).

Updates `pytest-cov` from 7.0.0 to 7.1.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest-cov/blob/master/CHANGELOG.rst">pytest-cov's changelog</a>.</em></p>
<blockquote>
<h2>7.1.0 (2026-03-21)</h2>
<ul>
<li>
<p>Fixed total coverage computation to always be consistent, regardless of reporting settings.
Previously some reports could produce different total counts, and consequently can make --cov-fail-under behave different depending on
reporting options.
See <code> &lt;</code>_.</p>
</li>
<li>
<p>Improve handling of ResourceWarning from sqlite3.</p>
<p>The plugin adds warning filter for sqlite3 <code>ResourceWarning</code> unclosed database (since 6.2.0).
It checks if there is already existing plugin for this message by comparing filter regular expression.
When filter is specified on command line the message is escaped and does not match an expected message.
A check for an escaped regular expression is added to handle this case.</p>
<p>With this fix one can suppress <code>ResourceWarning</code> from sqlite3 from command line::</p>
<p>pytest -W &quot;ignore:unclosed database in &lt;sqlite3.Connection object at:ResourceWarning&quot; ...</p>
</li>
<li>
<p>Various improvements to documentation.
Contributed by Art Pelling in <code> &lt;</code>_ and
&quot;vivodi&quot; in <code> &lt;</code><em>.
Also closed <code> &lt;</code></em>.</p>
</li>
<li>
<p>Fixed some assertions in tests.
Contributed by in Markéta Machová in <code> &lt;</code>_.</p>
</li>
<li>
<p>Removed unnecessary coverage configuration copying (meant as a backup because reporting commands had configuration side-effects before coverage 5.0).</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>66c8a52</code></a> Bump version: 7.0.0 → 7.1.0</li>
<li><a href=""><code>f707662</code></a> Make the examples use pypy 3.11.</li>
<li><a href=""><code>6049a78</code></a> Make context test use the old ctracer (seems the new sysmon tracer behaves di...</li>
<li><a href=""><code>8ebf20b</code></a> Update changelog.</li>
<li><a href=""><code>861d30e</code></a> Remove the backup context manager  - shouldn't be needed since coverage 5.0, ...</li>
<li><a href=""><code>fd4c956</code></a> Pass the precision on the nulled total (seems that there's some caching goion...</li>
<li><a href=""><code>78c9c4e</code></a> Only run the 3.9 on older deps.</li>
<li><a href=""><code>4849a92</code></a> Punctuation.</li>
<li><a href=""><code>197c35e</code></a> Update changelog and hopefully I don't forget to publish release again :))</li>
<li><a href=""><code>14dc1c9</code></a> Update examples to use 3.11 and make the adhoc layout example look a bit more...</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest-cov/compare/v7.0.0...v7.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.7 to 0.15.8
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.8</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-26.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] New rule <code>unnecessary-if</code> (<code>RUF050</code>) (<a href="">#24114</a>)</li>
<li>[<code>ruff</code>] New rule <code>useless-finally</code> (<code>RUF072</code>) (<a href="">#24165</a>)</li>
<li>[<code>ruff</code>] New rule <code>f-string-percent-format</code> (<code>RUF073</code>): warn when using <code>%</code> operator on an f-string (<a href="">#24162</a>)</li>
<li>[<code>pyflakes</code>] Recognize <code>frozendict</code> as a builtin for Python 3.15+ (<a href="">#24100</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Use fully-qualified <code>anyio.lowlevel</code> import in autofix (<code>ASYNC115</code>) (<a href="">#24166</a>)</li>
<li>[<code>flake8-bandit</code>] Check tuple arguments for partial paths in <code>S607</code> (<a href="">#24080</a>)</li>
<li>[<code>pyflakes</code>] Skip <code>undefined-name</code> (<code>F821</code>) for conditionally deleted variables (<a href="">#24088</a>)</li>
<li><code>E501</code>/<code>W505</code>/formatter: Exclude nested pragma comments from line width calculation (<a href="">#24071</a>)</li>
<li>Fix <code>%foo?</code> parsing in IPython assignment expressions (<a href="">#24152</a>)</li>
<li><code>analyze graph</code>: resolve string imports that reference attributes, not just modules (<a href="">#24058</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>eradicate</code>] ignore <code>ty: ignore</code> comments in <code>ERA001</code> (<a href="">#24192</a>)</li>
<li>[<code>flake8-bandit</code>] Treat <code>sys.executable</code> as trusted input in <code>S603</code> (<a href="">#24106</a>)</li>
<li>[<code>flake8-self</code>] Recognize <code>Self</code> annotation and <code>self</code> assignment in <code>SLF001</code> (<a href="">#24144</a>)</li>
<li>[<code>pyflakes</code>] <code>F507</code>: Fix false negative for non-tuple RHS in <code>%</code>-formatting (<a href="">#24142</a>)</li>
<li>[<code>refurb</code>] Parenthesize generator arguments in <code>FURB142</code> fixer (<a href="">#24200</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Speed up diagnostic rendering (<a href="">#24146</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Warn when Markdown files are skipped due to preview being disabled (<a href="">#24150</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Clarify <code>extend-ignore</code> and <code>extend-select</code> settings documentation (<a href="">#24064</a>)</li>
<li>Mention AI policy in PR template (<a href="">#24198</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use trusted publishing for NPM packages (<a href="">#24171</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/bitloi"><code>@​bitloi</code></a></li>
<li><a href="https://github.com/Sim-hu"><code>@​Sim-hu</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.8</h2>
<p>Released on 2026-03-26.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] New rule <code>unnecessary-if</code> (<code>RUF050</code>) (<a href="">#24114</a>)</li>
<li>[<code>ruff</code>] New rule <code>useless-finally</code> (<code>RUF072</code>) (<a href="">#24165</a>)</li>
<li>[<code>ruff</code>] New rule <code>f-string-percent-format</code> (<code>RUF073</code>): warn when using <code>%</code> operator on an f-string (<a href="">#24162</a>)</li>
<li>[<code>pyflakes</code>] Recognize <code>frozendict</code> as a builtin for Python 3.15+ (<a href="">#24100</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Use fully-qualified <code>anyio.lowlevel</code> import in autofix (<code>ASYNC115</code>) (<a href="">#24166</a>)</li>
<li>[<code>flake8-bandit</code>] Check tuple arguments for partial paths in <code>S607</code> (<a href="">#24080</a>)</li>
<li>[<code>pyflakes</code>] Skip <code>undefined-name</code> (<code>F821</code>) for conditionally deleted variables (<a href="">#24088</a>)</li>
<li><code>E501</code>/<code>W505</code>/formatter: Exclude nested pragma comments from line width calculation (<a href="">#24071</a>)</li>
<li>Fix <code>%foo?</code> parsing in IPython assignment expressions (<a href="">#24152</a>)</li>
<li><code>analyze graph</code>: resolve string imports that reference attributes, not just modules (<a href="">#24058</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>eradicate</code>] ignore <code>ty: ignore</code> comments in <code>ERA001</code> (<a href="">#24192</a>)</li>
<li>[<code>flake8-bandit</code>] Treat <code>sys.executable</code> as trusted input in <code>S603</code> (<a href="">#24106</a>)</li>
<li>[<code>flake8-self</code>] Recognize <code>Self</code> annotation and <code>self</code> assignment in <code>SLF001</code> (<a href="">#24144</a>)</li>
<li>[<code>pyflakes</code>] <code>F507</code>: Fix false negative for non-tuple RHS in <code>%</code>-formatting (<a href="">#24142</a>)</li>
<li>[<code>refurb</code>] Parenthesize generator arguments in <code>FURB142</code> fixer (<a href="">#24200</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Speed up diagnostic rendering (<a href="">#24146</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Warn when Markdown files are skipped due to preview being disabled (<a href="">#24150</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Clarify <code>extend-ignore</code> and <code>extend-select</code> settings documentation (<a href="">#24064</a>)</li>
<li>Mention AI policy in PR template (<a href="">#24198</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use trusted publishing for NPM packages (<a href="">#24171</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/bitloi"><code>@​bitloi</code></a></li>
<li><a href="https://github.com/Sim-hu"><code>@​Sim-hu</code></a></li>
<li><a href="https://github.com/mvanhorn"><code>@​mvanhorn</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c2a8815</code></a> Release 0.15.8 (<a href="">#24217</a>)</li>
<li><a href=""><code>d444d52</code></a> [ty] Infer lambda expressions with <code>Callable</code> type context (<a href="">#22633</a>)</li>
<li><a href=""><code>9622285</code></a> [ty] Autocomplete arguments if in arguments node (<a href="">#24167</a>)</li>
<li><a href=""><code>d812662</code></a> Use the <code>release</code> environment in <code>publish-docs</code> (<a href="">#24214</a>)</li>
<li><a href=""><code>eda2355</code></a> [ty] Show <code>Final</code> source in final assignment diagnostic (<a href="">#24194</a>)</li>
<li><a href=""><code>929eb52</code></a> [ty] Enforce Final attribute assignment rules for annotated and augmented wri...</li>
<li><a href=""><code>34998be</code></a> [ty] Fix typo in comment (<a href="">#24211</a>)</li>
<li><a href=""><code>560aca0</code></a> [ty] Minor simplifications to some benchmark code (<a href="">#24209</a>)</li>
<li><a href=""><code>683bae5</code></a> [ty] Track non-terminal-call constraints in global scope (<a href="">#23245</a>)</li>
<li><a href=""><code>4704c2a</code></a> [ty] Remove unnecessary intermediate collection in `StaticClassLiteral::field...</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.7...0.15.8">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.7 to 0.9.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.9</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: resolve parent relative file schema URIs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1610</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.8...v0.9.9">https://github.com/tombi-toml/tombi/compare/v0.9.8...v0.9.9</a></p>
<h2>v0.9.8</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>feat: support fragment by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1608</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: update dependencies and enhance completion logic for Cargo.toml by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1604</a></li>
<li>fix: update SemVerRequirement to include examples in schema by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1605</a></li>
<li>fix: add logging for TOML AST parsing errors by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1606</a></li>
<li>Update: schema uri by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1607</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.7...v0.9.8">https://github.com/tombi-toml/tombi/compare/v0.9.7...v0.9.8</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>12f3a4f</code></a> Merge pull request <a href="">#1610</a> from tombi-toml/fix/relative-file-schema-uri-resolution</li>
<li><a href=""><code>d8e4433</code></a> chore: update lockfile for tempfile test dep</li>
<li><a href=""><code>0e56451</code></a> fix: use tempfile in comment uri tests</li>
<li><a href=""><code>0769ab6</code></a> fix: resolve parent relative file schema URIs</li>
<li><a href=""><code>41ffdd6</code></a> Merge pull request <a href="">#1608</a> from tombi-toml/feat_support_fragment</li>
<li><a href=""><code>dcaa642</code></a> feat: add pretty_assertions for improved test output in comment tests</li>
<li><a href=""><code>6b42ba9</code></a> fix: resolve base directory URI joining logic in comment schema handling</li>
<li><a href=""><code>de6547c</code></a> feat: add pretty_assertions as a dev-dependency and refactor schema URI handl...</li>
<li><a href=""><code>52a4f3a</code></a> fix schema fragment resolution edge cases</li>
<li><a href=""><code>90f8b44</code></a> feat: add anchor-table-test schema to completion labels tests</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.7...v0.9.9">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.24 to 0.0.26
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.26</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-26.</p>
<h3>Bug fixes</h3>
<ul>
<li>Prevent &quot;too many cycle iteration&quot; panics in more situations (<a href="">#24061</a>)</li>
<li>Fix false positives and false negatives when unpacking a union of tuples into a function call (<a href="">#23298</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for <code>typing.Concatenate</code> (<a href="">#23689</a>)</li>
<li>Validate the return type of generator functions (<a href="">#24026</a>)</li>
<li>Support dataclass field <code>converter</code>s (<a href="">#23088</a>)</li>
<li>Disallow <code>Self</code> in metaclass and static methods (<a href="">#23231</a>)</li>
<li>Improve call inference for keyword-only <code>dict()</code> (<a href="">#24103</a>)</li>
<li>Respect non-explicitly defined <code>dataclass_transform</code> params (<a href="">#24170</a>)</li>
<li>Unconditionally silence diagnostics in unreachable code (<a href="">#24179</a>)</li>
<li>Respect terminal-function-call narrowing in global scope (<a href="">#23245</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Fix performance regression for narrowing on a larger <code>Literal</code> type(<a href="">#24185</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/choucavalier"><code>@​choucavalier</code></a></li>
</ul>
<h2>Install ty 0.0.26</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.26/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.26/ty-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ty 0.0.26</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.26</h2>
<p>Released on 2026-03-26.</p>
<h3>Bug fixes</h3>
<ul>
<li>Prevent &quot;too many cycle iteration&quot; panics in more situations (<a href="">#24061</a>)</li>
<li>Fix false positives and false negatives when unpacking a union of tuples into a function call (<a href="">#23298</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for <code>typing.Concatenate</code> (<a href="">#23689</a>)</li>
<li>Validate the return type of generator functions (<a href="">#24026</a>)</li>
<li>Support dataclass field <code>converter</code>s (<a href="">#23088</a>)</li>
<li>Disallow <code>Self</code> in metaclass and static methods (<a href="">#23231</a>)</li>
<li>Improve call inference for keyword-only <code>dict()</code> (<a href="">#24103</a>)</li>
<li>Respect non-explicitly defined <code>dataclass_transform</code> params (<a href="">#24170</a>)</li>
<li>Unconditionally silence diagnostics in unreachable code (<a href="">#24179</a>)</li>
<li>Respect terminal-function-call narrowing in global scope (<a href="">#23245</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Fix performance regression for narrowing on a larger <code>Literal</code> type(<a href="">#24185</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/choucavalier"><code>@​choucavalier</code></a></li>
</ul>
<h2>0.0.25</h2>
<p>Released on 2026-03-24.</p>
<h3>Breaking changes</h3>
<ul>
<li>Support <code>type:ignore[ty:code]</code> suppressions (<a href="">#24096</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Avoid eager TypedDict diagnostics in <code>TypedDict | dict</code> unions (<a href="">#24151</a>)</li>
<li>Fix Salsa panic propagation (<a href="">#24141</a>)</li>
<li>Fix folding ranges of comments separated by statements (<a href="">#24132</a>)</li>
<li>Fix loop-header reachability cycles in conditional unpacking (<a href="">#24006</a>)</li>
<li>Fix subtyping of intersections containing <code>NewType</code>s of unions vs. unions (<a href="">#24087</a>)</li>
<li>Fix untracked reads in Salsa queries that can lead to backdating panics (<a href="">#24051</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9403051</code></a> Bump version to 0.0.26 (<a href="">#3145</a>)</li>
<li><a href=""><code>d60899a</code></a> Bump version to 0.0.25 (<a href="">#3125</a>)</li>
<li><a href=""><code>db65b3e</code></a> Update documentation to reflect <code>type:ignore</code> changes (<a href="">#3121</a>)</li>
<li><a href=""><code>9e46432</code></a> Use ty in Emacs with Eglot (<a href="">#3107</a>)</li>
<li><a href=""><code>1f30d7c</code></a> Update artifact github actions dependencies (<a href="">#3113</a>)</li>
<li><a href=""><code>255ef63</code></a> Revert &quot;Update Artifact GitHub Actions dependencies&quot; (<a href="">#3112</a>)</li>
<li><a href=""><code>5fe54ca</code></a> Update Artifact GitHub Actions dependencies (<a href="">#3108</a>)</li>
<li><a href=""><code>a0cf1e7</code></a> Update Swatinem/rust-cache action to v2.9.1 (<a href="">#3110</a>)</li>
<li><a href=""><code>fd2acb4</code></a> Update prek dependencies (<a href="">#3109</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.24...0.0.26">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `426626f54146`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.