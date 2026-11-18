# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.32.2` | `3.32.3` |
| [pygments](https://github.com/pygments/pygments) | `2.20.0` | `2.21.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.16.2` | `0.16.3` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.2.10` | `1.4.1` |
| [ty](https://github.com/astral-sh/ty) | `0.0.70` | `0.0.72` |
| [mkdocstrings-python](https://github.com/mkdocstrings/python) | `2.0.5` | `2.0.7` |

Updates `filelock` from 3.32.2 to 3.32.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.32.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🧪 test(strict): deflake close-fault injections on graalpy by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#697</a></li>
<li>📄 docs: publish llms.txt from the docs build by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#700</a></li>
<li>🐛 fix(fork): survive audit events during interpreter shutdown by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#703</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.32.2...3.32.3">https://github.com/tox-dev/filelock/compare/3.32.2...3.32.3</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<p>.. towncrier-draft-entries:: Unreleased</p>
<p>.. towncrier release notes start</p>
<hr />
<p>3.32.3 (2026-08-13)</p>
<hr />
<ul>
<li>The fork-safety audit hook no longer prints <code>Exception ignored in audit hook</code> with a <code>TypeError</code> when an audit
event fires during interpreter shutdown, after CPython has already cleared the module globals. :pr:<code>701</code></li>
</ul>
<hr />
<p>3.32.2 (2026-07-29)</p>
<hr />
<ul>
<li>A <code>SoftReadWriteLock</code> or <code>SoftFileLease</code> acquire whose heartbeat thread fails to start now unlinks its marker and
hands the claim back, instead of leaving an unrefreshed marker a peer takes while the caller believes it still holds
the lock. :pr:<code>691</code></li>
</ul>
<hr />
<p>3.32.1 (2026-07-26)</p>
<hr />
<ul>
<li>Canceling an <code>AsyncSoftReadWriteLock</code> acquire now releases the claim instead of leaking a marker whose heartbeat
wedges every contender. :pr:<code>686</code></li>
</ul>
<hr />
<p>3.32.0 (2026-07-21)</p>
<hr />
<ul>
<li><code>SoftReadWriteLock</code> closes the directory handle it opens to scan for readers as soon as a scan stops early, rather
than holding it until the generator is collected. :pr:<code>685</code></li>
<li>Declare support for Python 3.15 and run the test suite against it and its free-threaded build, both currently in beta. :pr:<code>683</code></li>
<li>The source distribution ships the capability probes the tests import, and reading one no longer needs <code>coverage</code>
installed, so the suite runs from an unpacked sdist instead of failing on a missing <code>coverage_pragmas</code>. :pr:<code>685</code></li>
</ul>
<hr />
<p>3.31.2 (2026-07-21)</p>
<hr />
<ul>
<li><code>filelock</code> imports again on runtimes whose <code>errno</code> omits <code>ENOTSUP</code>, such as GraalPy, where importing the package
raised <code>ImportError</code>. It probes the code instead, preferring <code>ENOTSUP</code>, falling back to <code>EOPNOTSUPP</code> where that
name is absent, and dropping to <code>ENOSYS</code>/<code>EXDEV</code> where neither exists. Platforms defining <code>ENOTSUP</code> keep their
behavior. :pr:<code>681</code></li>
</ul>
<hr />
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4aa742c</code></a> Release 3.32.3</li>
<li><a href=""><code>fb5ab3e</code></a> 🐛 fix(fork): survive audit events during interpreter shutdown (<a href="">#703</a>)</li>
<li><a href=""><code>35f759c</code></a> 📄 docs: publish llms.txt from the docs build (<a href="">#700</a>)</li>
<li><a href=""><code>4b6e966</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#699</a>)</li>
<li><a href=""><code>0e0f666</code></a> build(deps): bump pypa/gh-action-pypi-publish from 1.14.1 to 1.14.2 (<a href="">#698</a>)</li>
<li><a href=""><code>6689d82</code></a> 🧪 test(strict): deflake close-fault injections on graalpy (<a href="">#697</a>)</li>
<li><a href=""><code>df67bf7</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#696</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.32.2...3.32.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pygments` from 2.20.0 to 2.21.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pygments/pygments/releases">pygments's releases</a>.</em></p>
<blockquote>
<h2>2.21.0</h2>
<ul>
<li>
<p>New lexers:</p>
<ul>
<li>BitBake (<a href="">#3103</a>)</li>
<li>Caddyfile (<a href="">#3225</a>)</li>
<li>CEL (<a href="">#3048</a>)</li>
<li>PureScript (<a href="">#1077</a>, <a href="">#3054</a>)</li>
</ul>
</li>
<li>
<p>Updated lexers:</p>
<ul>
<li>Bash: Fix coloured keyword at the beginning of a name (<a href="">#2926</a>)</li>
<li>Boogie: Add missing Boogie and Civl Verifier keywords (<a href="">#3156</a>)</li>
<li>C#:
<ul>
<li>Recognize interpolated verbatim strings with either <code>$@</code> or <code>@$</code>
prefixes (<a href="">#2685</a>)</li>
<li>Support dollar-prefixed and multi-quote raw strings (<a href="">#3129</a>, <a href="">#2897</a>)</li>
<li>Recognize <code>union</code> (<a href="">#3182</a>)</li>
</ul>
</li>
<li>C/C++:
<ul>
<li>Add C23/C++26 attributes (<a href="">#3084</a>)</li>
<li>Add more C2Y keywords (<a href="">#3092</a>)</li>
<li>Highlight a function following a namespace body (<a href="">#2928</a>)</li>
<li>Fix C/C++ lexer support for multiline pre-processor comments (<a href="">#3051</a>)</li>
<li>Add <code>.ipp</code> as a file extension (<a href="">#3141</a>, <a href="">#1008</a>)</li>
</ul>
</li>
<li>Clojure: Recognize named, octal and unicode character literals such as
<code>\space</code> and <code>\o377</code> as a single token (<a href="">#979</a>)</li>
<li>Csound: Add missing opcode parameter type letter (<a href="">#3161</a>)</li>
<li>CUDA: Derive from the C++ lexer instead of C to highlight C++
constructs such as <code>template</code>, <code>class</code> and <code>namespace</code> (<a href="">#3127</a>)</li>
<li>D: Allow non-ASCII (Unicode) identifiers (<a href="">#1088</a>)</li>
<li>Fish: Fix single quote backslash escape (<a href="">#3138</a>, <a href="">#2821</a>)</li>
<li>Go: Various lexer improvements (<a href="">#3199</a>)</li>
<li>GoogleSQL: Require a word break after <code>SET</code> (<a href="">#3167</a>)</li>
<li>Hexdump: Only match valid digits (<a href="">#3200</a>, <a href="">#2847</a>)</li>
<li>JavaScript: Highlight the <code>arguments</code> object (<a href="">#3146</a>)</li>
<li>Jsonnet: Recognize colons in array slice expressions (<a href="">#2828</a>)</li>
<li>JSX: Allow apostrophes in element text (<a href="">#2816</a>)</li>
<li>Julia: Fix rstrings backslash (<a href="">#3140</a>, <a href="">#2537</a>)</li>
<li>Kotlin: Support companion objects without an explicit name (<a href="">#2525</a>)</li>
<li>Kotlin: Don't let a nullable type marker (<code>?</code>) consume the following
character, so <code>Foo?,</code> and <code>a?:b</code> tokenize correctly (<a href="">#2964</a>)</li>
<li>Kusto: Recognize member-access dots in dynamic objects (<a href="">#2779</a>)</li>
<li>Lua: Various improvements (<a href="">#3143</a>)</li>
<li>Macaulay2: Update symbols to 1.26.05 (<a href="">#3120</a>)</li>
<li>Markdown:
<ul>
<li>Highlight bold-italics (<code>***...***</code> and <code>___...___</code>) (<a href="">#3067</a>)</li>
<li>Fix mention regex to support hyphens in usernames (<a href="">#3139</a>, <a href="">#3135</a>)</li>
</ul>
</li>
<li>Markdown, reStructuredText, TiddlyWiki5: Fix wrong token offsets for
embedded code blocks (<a href="">#3133</a>)</li>
<li>Mathematica: Recognize <code>\[Name]</code> named-character escapes such as
<code>\[Nu]</code> instead of emitting an <code>Error</code> token (<a href="">#3097</a>)</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pygments/pygments/blob/master/CHANGES">pygments's changelog</a>.</em></p>
<blockquote>
<h2>Version 2.21.0</h2>
<p>(released August 17th, 2026)</p>
<ul>
<li>
<p>New lexers:</p>
<ul>
<li>BitBake (<a href="">#3103</a>)</li>
<li>Caddyfile (<a href="">#3225</a>)</li>
<li>CEL (<a href="">#3048</a>)</li>
<li>PureScript (<a href="">#1077</a>, <a href="">#3054</a>)</li>
</ul>
</li>
<li>
<p>Updated lexers:</p>
<ul>
<li>Bash: Fix coloured keyword at the beginning of a name (<a href="">#2926</a>)</li>
<li>Boogie: Add missing Boogie and Civl Verifier keywords (<a href="">#3156</a>)</li>
<li>C#:
<ul>
<li>Recognize interpolated verbatim strings with either <code>$@</code> or <code>@$</code>
prefixes (<a href="">#2685</a>)</li>
<li>Support dollar-prefixed and multi-quote raw strings (<a href="">#3129</a>, <a href="">#2897</a>)</li>
<li>Recognize <code>union</code> (<a href="">#3182</a>)</li>
</ul>
</li>
<li>C/C++:
<ul>
<li>Add C23/C++26 attributes (<a href="">#3084</a>)</li>
<li>Add more C2Y keywords (<a href="">#3092</a>)</li>
<li>Highlight a function following a namespace body (<a href="">#2928</a>)</li>
<li>Fix C/C++ lexer support for multiline pre-processor comments (<a href="">#3051</a>)</li>
<li>Add <code>.ipp</code> as a file extension (<a href="">#3141</a>, <a href="">#1008</a>)</li>
</ul>
</li>
<li>Clojure: Recognize named, octal and unicode character literals such as
<code>\space</code> and <code>\o377</code> as a single token (<a href="">#979</a>)</li>
<li>Csound: Add missing opcode parameter type letter (<a href="">#3161</a>)</li>
<li>CUDA: Derive from the C++ lexer instead of C to highlight C++
constructs such as <code>template</code>, <code>class</code> and <code>namespace</code> (<a href="">#3127</a>)</li>
<li>D: Allow non-ASCII (Unicode) identifiers (<a href="">#1088</a>)</li>
<li>Fish: Fix single quote backslash escape (<a href="">#3138</a>, <a href="">#2821</a>)</li>
<li>Go: Various lexer improvements (<a href="">#3199</a>)</li>
<li>GoogleSQL: Require a word break after <code>SET</code> (<a href="">#3167</a>)</li>
<li>Hexdump: Only match valid digits (<a href="">#3200</a>, <a href="">#2847</a>)</li>
<li>JavaScript: Highlight the <code>arguments</code> object (<a href="">#3146</a>)</li>
<li>Jsonnet: Recognize colons in array slice expressions (<a href="">#2828</a>)</li>
<li>JSX: Allow apostrophes in element text (<a href="">#2816</a>)</li>
<li>Julia: Fix rstrings backslash (<a href="">#3140</a>, <a href="">#2537</a>)</li>
<li>Kotlin: Support companion objects without an explicit name (<a href="">#2525</a>)</li>
<li>Kotlin: Don't let a nullable type marker (<code>?</code>) consume the following
character, so <code>Foo?,</code> and <code>a?:b</code> tokenize correctly (<a href="">#2964</a>)</li>
<li>Kusto: Recognize member-access dots in dynamic objects (<a href="">#2779</a>)</li>
<li>Lua: Various improvements (<a href="">#3143</a>)</li>
<li>Macaulay2: Update symbols to 1.26.05 (<a href="">#3120</a>)</li>
<li>Markdown:
<ul>
<li>Highlight bold-italics (<code>***...***</code> and <code>___...___</code>) (<a href="">#3067</a>)</li>
<li>Fix mention regex to support hyphens in usernames (<a href="">#3139</a>, <a href="">#3135</a>)</li>
</ul>
</li>
<li>Markdown, reStructuredText, TiddlyWiki5: Fix wrong token offsets for</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a43b45d</code></a> Get ready for the 2.21.0 release.</li>
<li><a href=""><code>d8f14cb</code></a> Fix version_added for Purescript.</li>
<li><a href=""><code>19c5817</code></a> Remove superfluous parentheses from PostgresExplainLexer (<a href="">#3232</a>)</li>
<li><a href=""><code>9992e09</code></a> Merge pull request <a href="">#3191</a> from jvoisin/dupes</li>
<li><a href=""><code>bd22577</code></a> Fix regexlint warnings after latest update.</li>
<li><a href=""><code>6a62df1</code></a> Release preparation: Update the changelog.</li>
<li><a href=""><code>aabba32</code></a> Merge pull request <a href="">#3221</a> from jvoisin/alter</li>
<li><a href=""><code>d3441d0</code></a> Merge pull request <a href="">#3225</a> from jvoisin/caddy</li>
<li><a href=""><code>c593f3f</code></a> Add a lexer for Caddy</li>
<li><a href=""><code>0644b53</code></a> Simplify single-character regex alternations to character classes</li>
<li>Additional commits viewable in <a href="https://github.com/pygments/pygments/compare/2.20.0...2.21.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.2 to 0.16.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.3</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-13.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pylint</code>] Fix false negatives on negative numbers (<code>PLR6104</code>) (<a href="">#27251</a>)</li>
<li>[<code>pyupgrade</code>] Add rule to replace <code>while 1</code> with <code>while True</code> (<code>UP048</code>) (<a href="">#27190</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-bandit</code>] Also check keyword arguments (<code>S602</code>, <code>S603</code>, <code>S607</code>, <code>S609</code>) (<a href="">#27687</a>)</li>
<li>[<code>pylint</code>] Allow <code>continue</code> in <code>finally</code> on Python 3.8 (<a href="">#27626</a>)</li>
<li>[<code>pylint</code>] Fix <code>PLE1307</code> false positive with bools (<a href="">#27651</a>)</li>
<li>[<code>pylint</code>] Fix false positives and negatives with <code>%b</code> format character (<code>PLE1300</code>, <code>PLE1307</code>) (<a href="">#27560</a>)</li>
<li>[<code>pylint</code>] Improve handling of concatenated strings (<code>PLE1300</code>) (<a href="">#27659</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>numpy</code>] Make <code>np.chararray</code> autofix backwards-compatible (<code>NPY201</code>) (<a href="">#27527</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Enable PGO for Linux x86-64 Ruff releases (<a href="">#27570</a>)</li>
<li>Enable PGO for Linux ARM64 Ruff releases (<a href="">#27574</a>)</li>
<li>Enable PGO for Windows x86-64 Ruff releases (<a href="">#27573</a>)</li>
<li>Enable PGO for macOS ARM64 Ruff releases (<a href="">#27572</a>)</li>
<li>Reduce <code>Expr</code> size to 64 bytes (<a href="">#27591</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Hyperlink rule codes in <code>ruff check --statistics</code> output (<a href="">#27646</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>ruff</code>] Also suggest <code>asyncio.TaskGroup</code> (<code>RUF006</code>) (<a href="">#27461</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use mimalloc v3 (<a href="">#27586</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/Andrej730"><code>@​Andrej730</code></a></li>
<li><a href="https://github.com/alonfaraj"><code>@​alonfaraj</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/Avasam"><code>@​Avasam</code></a></li>
<li><a href="https://github.com/tjkuson"><code>@​tjkuson</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.3</h2>
<p>Released on 2026-08-13.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pylint</code>] Fix false negatives on negative numbers (<code>PLR6104</code>) (<a href="">#27251</a>)</li>
<li>[<code>pyupgrade</code>] Add rule to replace <code>while 1</code> with <code>while True</code> (<code>UP048</code>) (<a href="">#27190</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-bandit</code>] Also check keyword arguments (<code>S602</code>, <code>S603</code>, <code>S607</code>, <code>S609</code>) (<a href="">#27687</a>)</li>
<li>[<code>pylint</code>] Allow <code>continue</code> in <code>finally</code> on Python 3.8 (<a href="">#27626</a>)</li>
<li>[<code>pylint</code>] Fix <code>PLE1307</code> false positive with bools (<a href="">#27651</a>)</li>
<li>[<code>pylint</code>] Fix false positives and negatives with <code>%b</code> format character (<code>PLE1300</code>, <code>PLE1307</code>) (<a href="">#27560</a>)</li>
<li>[<code>pylint</code>] Improve handling of concatenated strings (<code>PLE1300</code>) (<a href="">#27659</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>numpy</code>] Make <code>np.chararray</code> autofix backwards-compatible (<code>NPY201</code>) (<a href="">#27527</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Enable PGO for Linux x86-64 Ruff releases (<a href="">#27570</a>)</li>
<li>Enable PGO for Linux ARM64 Ruff releases (<a href="">#27574</a>)</li>
<li>Enable PGO for Windows x86-64 Ruff releases (<a href="">#27573</a>)</li>
<li>Enable PGO for macOS ARM64 Ruff releases (<a href="">#27572</a>)</li>
<li>Reduce <code>Expr</code> size to 64 bytes (<a href="">#27591</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Hyperlink rule codes in <code>ruff check --statistics</code> output (<a href="">#27646</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>ruff</code>] Also suggest <code>asyncio.TaskGroup</code> (<code>RUF006</code>) (<a href="">#27461</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Use mimalloc v3 (<a href="">#27586</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/Andrej730"><code>@​Andrej730</code></a></li>
<li><a href="https://github.com/alonfaraj"><code>@​alonfaraj</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/Avasam"><code>@​Avasam</code></a></li>
<li><a href="https://github.com/tjkuson"><code>@​tjkuson</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/chirizxc"><code>@​chirizxc</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b0e4702</code></a> Bump 0.16.3 (<a href="">#27723</a>)</li>
<li><a href=""><code>ecdd401</code></a> [ty] Separate script and uv modules from project metadata (<a href="">#27720</a>)</li>
<li><a href=""><code>1263524</code></a> [ty] Simplify display implementations with std::fmt::from_fn (<a href="">#27718</a>)</li>
<li><a href=""><code>59196ba</code></a> [ty] Unify polarity-aware relation construction (<a href="">#27707</a>)</li>
<li><a href=""><code>b8c5e73</code></a> [ty] Disable CodSpeed cycle estimation for instrumented benchmarks (<a href="">#27706</a>)</li>
<li><a href=""><code>2b0d210</code></a> [ty] Centralize matched argument relations (<a href="">#27705</a>)</li>
<li><a href=""><code>a9130f3</code></a> [<code>pyupgrade</code>] Add rule to replace <code>while 1</code> with <code>while True</code> (<code>while-one</code>, `...</li>
<li><a href=""><code>c64c7d6</code></a> [ty] Model try exception flow with operation checkpoints (<a href="">#27471</a>)</li>
<li><a href=""><code>9dea5ef</code></a> [ty] Avoid deriving sequents for typevars with concrete bounds (<a href="">#27587</a>)</li>
<li><a href=""><code>9798e88</code></a> [ty] Preserve enum exhaustiveness with custom <em>missing</em> methods (<a href="">#27700</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.2...0.16.3">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.2.10 to 1.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.4.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>Starting from this version, we are introducing the WebAssembly npm package.</p>
<p>Please refer to the documentation for details.</p>
<p><a href="https://tombi-toml.github.io/tombi/docs/wasm">https://tombi-toml.github.io/tombi/docs/wasm</a></p>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(validator): correct numeric bound comparisons by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2115</a></li>
<li>fix(docs): prevent playground loading flash by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2118</a></li>
<li>fix(glob): exclude VCS metadata from discovery by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2121</a></li>
<li>fix(schema): validate literal branches by instance type by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2123</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>style(docs): refine playground sidebar toggle by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2117</a></li>
<li>refactor(config): remove obsolete line width default by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2120</a></li>
<li>style(toml): standardize formatting by adding trailing commas in Cargo.toml files by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2122</a></li>
<li>style: normalize diagnostic and log message casing by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2124</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.3.5...v1.4.0">https://github.com/tombi-toml/tombi/compare/v1.3.5...v1.4.0</a></p>
<h2>v1.3.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(cli): stop LSP after exit notification by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2112</a></li>
<li>fix(docs): hide playground until ready by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2113</a></li>
<li>fix(npm): identify WASM package repositories by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2114</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.3.4...v1.3.5">https://github.com/tombi-toml/tombi/compare/v1.3.4...v1.3.5</a></p>
<h2>v1.3.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚨 Breaking Changes</h3>
<ul>
<li>fix(wasm): reject with standard errors by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2109</a></li>
</ul>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(npm): include WASM build output in published packages by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2110</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs(wasm): respect format diagnostic severity by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2111</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.3.3...v1.3.4">https://github.com/tombi-toml/tombi/compare/v1.3.3...v1.3.4</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>254fd09</code></a> fix(docs): recover from stale client chunks (<a href="">#2136</a>)</li>
<li><a href=""><code>c829886</code></a> fix(lsp): synchronize initial inlay hints (<a href="">#2135</a>)</li>
<li><a href=""><code>8d78cbd</code></a> docs: update Zed extension guidance (<a href="">#2134</a>)</li>
<li><a href=""><code>f6daff3</code></a> fix(docs): prevent table text size adjustment (<a href="">#2133</a>)</li>
<li><a href=""><code>2fcdd61</code></a> fix(playground): reload config before formatting (<a href="">#2131</a>)</li>
<li><a href=""><code>3e36943</code></a> chore: replace Copilot PR review with local review (<a href="">#2132</a>)</li>
<li><a href=""><code>dafac89</code></a> feat(docs): preserve playground workspace across navigation (<a href="">#2130</a>)</li>
<li><a href=""><code>2f0f037</code></a> perf(docs): make playground usable while Monaco loads (<a href="">#2129</a>)</li>
<li><a href=""><code>5bc6fca</code></a> fix(deps): update nanoid to 3.3.18 (<a href="">#2128</a>)</li>
<li><a href=""><code>7952676</code></a> fix(docs): respect base URL for JSX links (<a href="">#2125</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.2.10...v1.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.70 to 0.0.72
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.72</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-14.</p>
<h3>Preview features</h3>
<ul>
<li>Check PEP 723 scripts in isolation (<a href="">#27462</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Accept documented boolean and fractional inputs (<a href="">#27754</a>)</li>
<li>Pydantic: Accept enum members for lax string and integer fields (<a href="">#27751</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Improve assignability hints for protocols and <code>TypedDict</code> types (<a href="">#27717</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid treating augmented assignments as attribute definitions (<a href="">#27633</a>)</li>
<li>Diagnose invalid module-level <code>__getattr__</code> calls (<a href="">#27507</a>)</li>
<li>Fix overload argument expansion with unpacked positional arguments (<a href="">#27744</a>)</li>
<li>Fix specialization of generic <code>TypedDict</code> aliases (<a href="">#27760</a>)</li>
<li>Ignore generic declaration metadata in staticness checks (<a href="">#27692</a>)</li>
<li>Preserve tuple types containing <code>Never</code> (<a href="">#27580</a>)</li>
<li>Report deprecated unary operations (<a href="">#27584</a>)</li>
<li>Respect variance when inferring structural and callable types (<a href="">#27707</a>)</li>
<li>Support <code>TypeVarTuple</code> in call binding (<a href="">#26886</a>)</li>
<li>Treat generator-expression exceptions as eagerly evaluated (<a href="">#27735</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential narrowing of gradual string-literal unions (<a href="">#27742</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/Andrej730"><code>@​Andrej730</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<h2>Install ty 0.0.72</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.72/ty-installer.sh | sh
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.72</h2>
<p>Released on 2026-08-14.</p>
<h3>Preview features</h3>
<ul>
<li>Check PEP 723 scripts in isolation (<a href="">#27462</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Accept documented boolean and fractional inputs (<a href="">#27754</a>)</li>
<li>Pydantic: Accept enum members for lax string and integer fields (<a href="">#27751</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Improve assignability hints for protocols and <code>TypedDict</code> types (<a href="">#27717</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid treating augmented assignments as attribute definitions (<a href="">#27633</a>)</li>
<li>Diagnose invalid module-level <code>__getattr__</code> calls (<a href="">#27507</a>)</li>
<li>Fix overload argument expansion with unpacked positional arguments (<a href="">#27744</a>)</li>
<li>Fix specialization of generic <code>TypedDict</code> aliases (<a href="">#27760</a>)</li>
<li>Ignore generic declaration metadata in staticness checks (<a href="">#27692</a>)</li>
<li>Preserve tuple types containing <code>Never</code> (<a href="">#27580</a>)</li>
<li>Report deprecated unary operations (<a href="">#27584</a>)</li>
<li>Respect variance when inferring structural and callable types (<a href="">#27707</a>)</li>
<li>Support <code>TypeVarTuple</code> in call binding (<a href="">#26886</a>)</li>
<li>Treat generator-expression exceptions as eagerly evaluated (<a href="">#27735</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential narrowing of gradual string-literal unions (<a href="">#27742</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/Andrej730"><code>@​Andrej730</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<h2>0.0.71</h2>
<p>Released on 2026-08-12.</p>
<h3>Library support</h3>
<ul>
<li>Respect third-party keyword-only fields before Python 3.10 (<a href="">#27699</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>62ebbec</code></a> Bump version to 0.0.72 (<a href="">#4268</a>)</li>
<li><a href=""><code>fd1753d</code></a> Align Renovate config with preset (<a href="">#4266</a>)</li>
<li><a href=""><code>683e223</code></a> Bump version to 0.0.71 (<a href="">#4244</a>)</li>
<li><a href=""><code>ede66b4</code></a> Document unsound-yield in the migration guide (<a href="">#4239</a>)</li>
<li><a href=""><code>4c3d909</code></a> Validate the PGO pipeline in CI (<a href="">#4236</a>)</li>
<li><a href=""><code>df9bad1</code></a> Enable PGO for Linux ARM64 ty releases (<a href="">#4218</a>)</li>
<li><a href=""><code>0ed874c</code></a> Enable PGO for Windows x86-64 ty releases (<a href="">#4217</a>)</li>
<li><a href=""><code>8988165</code></a> Enable PGO for macOS ARM64 ty releases (<a href="">#4216</a>)</li>
<li><a href=""><code>c25c341</code></a> Enable PGO for Linux x86-64 ty releases (<a href="">#4213</a>)</li>
<li><a href=""><code>d95445f</code></a> Use Depot runners for release builds (<a href="">#4224</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.70...0.0.72">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocstrings-python` from 2.0.5 to 2.0.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/releases">mkdocstrings-python's releases</a>.</em></p>
<blockquote>
<h2>2.0.7</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.7">2.0.7</a> - 2026-08-17</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.6...2.0.7">Compare with 2.0.6</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Don't render environment paths in source block labels (<a href="">84ba73e</a> by Chris Wilson). <a href="">Issue-333</a>, <a href="">PR-338</a></li>
</ul>
<h2>2.0.6</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.6">2.0.6</a> - 2026-08-16</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.5...2.0.6">Compare with 2.0.5</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Don't pass unsupported options to Griffe parsers (<a href="">4b38b6b</a> by Timothée Mazzucotelli). <a href="">Issue-337</a></li>
<li>Increase stash key length from 1 to 2 (<a href="">6ff2749</a> by Jonas Haag). <a href="">PR-336</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/blob/main/CHANGELOG.md">mkdocstrings-python's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.7">2.0.7</a> - 2026-08-17</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.6...2.0.7">Compare with 2.0.6</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Don't render environment paths in source block labels (<a href="">84ba73e</a> by Chris Wilson). <a href="">Issue-333</a>, <a href="">PR-338</a></li>
</ul>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.6">2.0.6</a> - 2026-08-16</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.5...2.0.6">Compare with 2.0.5</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Don't pass unsupported options to Griffe parsers (<a href="">4b38b6b</a> by Timothée Mazzucotelli). <a href="">Issue-337</a></li>
<li>Increase stash key length from 1 to 2 (<a href="">6ff2749</a> by Jonas Haag). <a href="">PR-336</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>624974a</code></a> chore: Prepare release 2.0.7</li>
<li><a href=""><code>84ba73e</code></a> fix: Don't render environment paths in source block labels</li>
<li><a href=""><code>a025f49</code></a> chore: Prepare release 2.0.6</li>
<li><a href=""><code>3c782f5</code></a> ci: Fix type-checking issues</li>
<li><a href=""><code>bb49b15</code></a> tests: Re-add griffe as dev-dep to run API checks</li>
<li><a href=""><code>4b38b6b</code></a> fix: Don't pass unsupported options to Griffe parsers</li>
<li><a href=""><code>6ff2749</code></a> fix: Increase stash key length from 1 to 2</li>
<li><a href=""><code>0fa2d2e</code></a> chore: Update sponsors section in README (<a href="">#332</a>)</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/python/compare/2.0.5...2.0.7">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1bee67e478f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.