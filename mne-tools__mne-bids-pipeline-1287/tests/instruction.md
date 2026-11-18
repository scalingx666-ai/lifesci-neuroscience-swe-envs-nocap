# Issue

**Title:** [dependabot]: Bump the deps group with 4 updates

## Description

Bumps the deps group with 4 updates: [filelock](https://github.com/tox-dev/py-filelock), [ruff](https://github.com/astral-sh/ruff), [tombi](https://github.com/tombi-toml/tombi) and [ty](https://github.com/astral-sh/ty).

Updates `filelock` from 3.32.0 to 3.32.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.32.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Fix test failures on NetBSD (<a href="">#689</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#693</a></li>
<li>🧪 test(soft-rw): deflake writer phase-2 peer-marker test by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#694</a></li>
<li>hand back the claim when a heartbeat thread fails to start by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#691</a></li>
<li>🧪 test(unix): deflake sticky-bit concurrent-unlink on graalpy by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#695</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.32.1...3.32.2">https://github.com/tox-dev/filelock/compare/3.32.1...3.32.2</a></p>
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
<p>3.31.1 (2026-07-20)</p>
<hr />
<ul>
<li>A <code>SoftFileLease</code> acquired on one thread keeps its claim when another thread fails to acquire the same lease object,
so its heartbeat carries on refreshing the marker instead of being torn down and letting a peer take the live claim. :pr:<code>680</code></li>
</ul>
<hr />
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9a6cc43</code></a> Release 3.32.2</li>
<li><a href=""><code>56879c7</code></a> 🧪 test(unix): deflake sticky-bit concurrent-unlink on graalpy (<a href="">#695</a>)</li>
<li><a href=""><code>ecf5be0</code></a> hand back the claim when a heartbeat thread fails to start (<a href="">#691</a>)</li>
<li><a href=""><code>ee70d2e</code></a> 🧪 test(soft-rw): deflake writer phase-2 peer-marker test (<a href="">#694</a>)</li>
<li><a href=""><code>1eb14dd</code></a> Fix test failures on NetBSD (<a href="">#689</a>) (<a href="">#693</a>)</li>
<li><a href=""><code>d81e859</code></a> build(deps): bump astral-sh/setup-uv from 8.3.2 to 9.0.0 (<a href="">#692</a>)</li>
<li><a href=""><code>6fbc905</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#690</a>)</li>
<li><a href=""><code>34d1c38</code></a> build(deps): bump pypa/gh-action-pypi-publish from 1.14.0 to 1.14.1 (<a href="">#688</a>)</li>
<li><a href=""><code>bf13ec7</code></a> Release 3.32.1</li>
<li><a href=""><code>887f114</code></a> build(deps): bump actions/checkout from 7.0.0 to 7.0.1 (<a href="">#687</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.32.0...3.32.2">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.0 to 0.16.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.1</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-30.</p>
<h3>Preview features</h3>
<ul>
<li>Add an option to opt out of human-readable names (<a href="">#27160</a>)</li>
<li>[<code>flake8-pytest-style</code>] Make fixes safe by default and unsafe only when comments are present (<code>PT018</code>) (<a href="">#27201</a>)</li>
<li>[<code>pyupgrade</code>] Skip fix when a defaulted <code>TypeVar</code> precedes a non-defaulted one (<code>UP040</code>, <code>UP046</code>, <code>UP047</code>) (<a href="">#27133</a>)</li>
<li>[<code>ruff</code>] Fix false positive with unpacked arguments (<code>RUF065</code>) (<a href="">#26959</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Bump <code>gen-lsp-types</code> to gracefully handle unknown enumeration values in LSP messages (<a href="">#27230</a>)</li>
<li>[<code>flake8-bugbear</code>] Mark <code>range</code> as immutable (<code>B008</code>) (<a href="">#27247</a>)</li>
<li>[<code>flake8-comprehensions</code>] NFKC-normalize keyword names in <code>C408</code> fix (<a href="">#26813</a>)</li>
<li>[<code>flake8-return</code>] Fix false positive when variable is read in <code>finally</code> clause (<code>RET504</code>) (<a href="">#25441</a>)</li>
<li>[<code>pydocstyle</code>] Skip section detection inside RST directive bodies (<code>D214</code>, <code>D405</code>, <code>D413</code>) (<a href="">#23635</a>)</li>
<li>[<code>refurb</code>] Parenthesize <code>yield</code> arguments in the <code>FURB192</code> fix (<a href="">#27192</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Mark <code>PT022</code> fixes as unsafe (<a href="">#26440</a>)</li>
<li>[<code>refurb</code>] Mark fixes that remove unknown separators as unsafe (<code>FURB105</code>) (<a href="">#27200</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Fix indexing of excluded nested Ruff workspaces (<a href="">#27303</a>)</li>
<li>Lint TOML files in the LSP (<a href="">#26862</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Cover <code>pycon</code> Markdown formatting (<a href="">#27153</a>)</li>
<li>[<code>flake8-bandit</code>] Document <code>TYPE_CHECKING</code> exception (<code>S101</code>) (<a href="">#27004</a>)</li>
<li>[<code>flake8-import-conventions</code>] Document that <code>extend-aliases</code> can override default aliases (<a href="">#27191</a>)</li>
<li>[<code>pylint</code>] Add missing fix safety gotchas for <code>non-augmented-assignment</code> (<code>PLR6104</code>) (<a href="">#27250</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Reduce syntax error noise by swallowing dedents like indents (<a href="">#27170</a>)</li>
<li>Vendor latest annotate-snippets (<a href="">#27033</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/bxff"><code>@​bxff</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/Avasam"><code>@​Avasam</code></a></li>
<li><a href="https://github.com/epage"><code>@​epage</code></a></li>
<li><a href="https://github.com/LHMQ878"><code>@​LHMQ878</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.1</h2>
<p>Released on 2026-07-30.</p>
<h3>Preview features</h3>
<ul>
<li>Add an option to opt out of human-readable names (<a href="">#27160</a>)</li>
<li>[<code>flake8-pytest-style</code>] Make fixes safe by default and unsafe only when comments are present (<code>PT018</code>) (<a href="">#27201</a>)</li>
<li>[<code>pyupgrade</code>] Skip fix when a defaulted <code>TypeVar</code> precedes a non-defaulted one (<code>UP040</code>, <code>UP046</code>, <code>UP047</code>) (<a href="">#27133</a>)</li>
<li>[<code>ruff</code>] Fix false positive with unpacked arguments (<code>RUF065</code>) (<a href="">#26959</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Bump <code>gen-lsp-types</code> to gracefully handle unknown enumeration values in LSP messages (<a href="">#27230</a>)</li>
<li>[<code>flake8-bugbear</code>] Mark <code>range</code> as immutable (<code>B008</code>) (<a href="">#27247</a>)</li>
<li>[<code>flake8-comprehensions</code>] NFKC-normalize keyword names in <code>C408</code> fix (<a href="">#26813</a>)</li>
<li>[<code>flake8-return</code>] Fix false positive when variable is read in <code>finally</code> clause (<code>RET504</code>) (<a href="">#25441</a>)</li>
<li>[<code>pydocstyle</code>] Skip section detection inside RST directive bodies (<code>D214</code>, <code>D405</code>, <code>D413</code>) (<a href="">#23635</a>)</li>
<li>[<code>refurb</code>] Parenthesize <code>yield</code> arguments in the <code>FURB192</code> fix (<a href="">#27192</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Mark <code>PT022</code> fixes as unsafe (<a href="">#26440</a>)</li>
<li>[<code>refurb</code>] Mark fixes that remove unknown separators as unsafe (<code>FURB105</code>) (<a href="">#27200</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Fix indexing of excluded nested Ruff workspaces (<a href="">#27303</a>)</li>
<li>Lint TOML files in the LSP (<a href="">#26862</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Cover <code>pycon</code> Markdown formatting (<a href="">#27153</a>)</li>
<li>[<code>flake8-bandit</code>] Document <code>TYPE_CHECKING</code> exception (<code>S101</code>) (<a href="">#27004</a>)</li>
<li>[<code>flake8-import-conventions</code>] Document that <code>extend-aliases</code> can override default aliases (<a href="">#27191</a>)</li>
<li>[<code>pylint</code>] Add missing fix safety gotchas for <code>non-augmented-assignment</code> (<code>PLR6104</code>) (<a href="">#27250</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Reduce syntax error noise by swallowing dedents like indents (<a href="">#27170</a>)</li>
<li>Vendor latest annotate-snippets (<a href="">#27033</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/bxff"><code>@​bxff</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/Avasam"><code>@​Avasam</code></a></li>
<li><a href="https://github.com/epage"><code>@​epage</code></a></li>
<li><a href="https://github.com/LHMQ878"><code>@​LHMQ878</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>80790b3</code></a> Bump 0.16.1 (<a href="">#27330</a>)</li>
<li><a href=""><code>63830f3</code></a> [ty] Borrow from constraint set storage less often (<a href="">#27328</a>)</li>
<li><a href=""><code>f40dca9</code></a> [ty] Preserve forwarded expanded-variadic diagnostic sources (<a href="">#27266</a>)</li>
<li><a href=""><code>0d80497</code></a> Lint TOML files in the LSP (<a href="">#26862</a>)</li>
<li><a href=""><code>d91586b</code></a> Update prek dependencies (<a href="">#27293</a>)</li>
<li><a href=""><code>7da4b8b</code></a> [ty] Respect bounds and constraints in generic materializations (<a href="">#27228</a>)</li>
<li><a href=""><code>b20daf7</code></a> [ty] refactor: add helper function to send partial results (<a href="">#27249</a>)</li>
<li><a href=""><code>4d4c8fa</code></a> [ty] Emit diagnostic when specializing a non-generic class (<a href="">#26883</a>)</li>
<li><a href=""><code>7c3e2db</code></a> [ty] Fix enum class container assignability (<a href="">#27318</a>)</li>
<li><a href=""><code>d5ef97f</code></a> [<code>flake8-return</code>] Fix false positive when variable is read in <code>finally</code> claus...</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.0...0.16.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.2.4 to 1.2.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.2.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🦅 New Features</h3>
<ul>
<li>feat(docs): synchronize code tab selections by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2053</a></li>
</ul>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(docs): preserve interactions across navigation by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2051</a></li>
<li>fix(docs): restore typecheck by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2052</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>feat(lsp): add multi-line string completion suggestions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2055</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.5...v1.2.6">https://github.com/tombi-toml/tombi/compare/v1.2.5...v1.2.6</a></p>
<h2>v1.2.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🦅 New Features</h3>
<ul>
<li>feat(intellij): download tombi when unavailable by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2033</a></li>
<li>feat(installer): add PowerShell installer by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2037</a></li>
<li>feat(formatter): add key quote style option by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2047</a></li>
</ul>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(docs): match overscroll background to theme by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2026</a></li>
<li>fix(deps): update packages flagged by OSV scanner by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2027</a></li>
<li>fix(parser): prevent stack overflows from deeply nested values by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2029</a></li>
<li>fix(deps): resolve OSV scanner vulnerabilities by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2032</a></li>
<li>fix: restore README package badges by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2039</a></li>
<li>fix(vscode): restore extension packaging with minimatch 10 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2040</a></li>
<li>fix: replace retired VS Code Marketplace badge by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2041</a></li>
<li>fix(zed): disable unsupported doctests by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2044</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>chore: normalize line endings by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2030</a></li>
<li>chore(ci): update actions/checkout to v7 by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#2028</a></li>
<li>fix(docs): improve search result highlighting by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2031</a></li>
<li>Revert &quot;feat(intellij): download tombi when unavailable&quot; by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2036</a></li>
<li>feat(intellij): Register Marketplace error reporter by <a href="https://github.com/InSyncWithFoo"><code>@​InSyncWithFoo</code></a> in <a href="">tombi-toml/tombi#2035</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.4...v1.2.5">https://github.com/tombi-toml/tombi/compare/v1.2.4...v1.2.5</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6024f16</code></a> feat(lsp): add multi-line string completion suggestions (<a href="">#2055</a>)</li>
<li><a href=""><code>1359447</code></a> feat(docs): synchronize code tab selections (<a href="">#2053</a>)</li>
<li><a href=""><code>53a7296</code></a> fix(docs): restore typecheck (<a href="">#2052</a>)</li>
<li><a href=""><code>555ace5</code></a> fix(docs): preserve interactions across navigation (<a href="">#2051</a>)</li>
<li><a href=""><code>14feb0d</code></a> docs: update installer stable version to 1.2.5</li>
<li><a href=""><code>447bbe8</code></a> feat(formatter): add key quote style option (<a href="">#2047</a>)</li>
<li><a href=""><code>0afeb82</code></a> fix(zed): disable unsupported doctests (<a href="">#2044</a>)</li>
<li><a href=""><code>8ca8b32</code></a> fix: replace retired VS Code Marketplace badge (<a href="">#2041</a>)</li>
<li><a href=""><code>83eefd2</code></a> fix(vscode): update vsce for minimatch compatibility (<a href="">#2040</a>)</li>
<li><a href=""><code>b37f96c</code></a> fix: restore README package badges (<a href="">#2039</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.2.4...v1.2.6">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.64 to 0.0.66
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.66</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-03.</p>
<h3>LSP server</h3>
<ul>
<li>Index <code>with</code>-statement targets as symbols (<a href="">#27256</a>)</li>
<li>Trigger signature help after completing callable with parentheses (<a href="">#27084</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Recognize models installed on extra search paths (<a href="">#27429</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Detect <code>__aenter__</code> and <code>__aexit__</code> that do not return awaitables (<a href="">#27414</a>)</li>
<li>Diagnose dataclass fields after inherited defaults (<a href="">#27327</a>)</li>
<li>Emit diagnostic when specializing a non-generic class (<a href="">#26883</a>)</li>
<li>Improve error context for incompatible callable signatures (<a href="">#27422</a>)</li>
<li>Preserve forwarded expanded-variadic diagnostic sources (<a href="">#27266</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid over-materializing user-defined <code>TypeIs</code> return types (<a href="">#26864</a>)</li>
<li>Fix enum class container assignability (<a href="">#27318</a>)</li>
<li>Hide stub-only helpers from implicit builtin lookup (<a href="">#27423</a>)</li>
<li>Move <code>Unknown</code> out of the experimental <code>ty_extensions</code> API (<a href="">#27430</a>)</li>
<li>Preserve <code>TypeVarTuple</code> context during <code>Generic</code> recovery (<a href="">#27381</a>)</li>
<li>Preserve exact numeric types in covariant collections (<a href="">#27311</a>)</li>
<li>Reject <code>ClassVar</code> and <code>Final</code> qualifiers in <code>NamedTuple</code> fields (<a href="">#27380</a>)</li>
<li>Reject out-of-scope <code>ParamSpec</code> components (<a href="">#27378</a>)</li>
<li>Reject specializing non-generic subclasses (<a href="">#27377</a>)</li>
<li>Respect bounds and constraints in generic materializations (<a href="">#27228</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#27401</a>). <a href="https://github.com/python/typeshed/compare/b00c387c669cb50d5d388d77b74c2e832e147fe8...1b116673774d062a4af7b0a0b3d05533a6be55d0">Typeshed diff</a></li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/Punisheroot"><code>@​Punisheroot</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/cheparity"><code>@​cheparity</code></a></li>
<li><a href="https://github.com/BitWeaverDev"><code>@​BitWeaverDev</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ribru17"><code>@​ribru17</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<h2>Install ty 0.0.66</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.66</h2>
<p>Released on 2026-08-03.</p>
<h3>LSP server</h3>
<ul>
<li>Index <code>with</code>-statement targets as symbols (<a href="">#27256</a>)</li>
<li>Trigger signature help after completing callable with parentheses (<a href="">#27084</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Recognize models installed on extra search paths (<a href="">#27429</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Detect <code>__aenter__</code> and <code>__aexit__</code> that do not return awaitables (<a href="">#27414</a>)</li>
<li>Diagnose dataclass fields after inherited defaults (<a href="">#27327</a>)</li>
<li>Emit diagnostic when specializing a non-generic class (<a href="">#26883</a>)</li>
<li>Improve error context for incompatible callable signatures (<a href="">#27422</a>)</li>
<li>Preserve forwarded expanded-variadic diagnostic sources (<a href="">#27266</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid over-materializing user-defined <code>TypeIs</code> return types (<a href="">#26864</a>)</li>
<li>Fix enum class container assignability (<a href="">#27318</a>)</li>
<li>Hide stub-only helpers from implicit builtin lookup (<a href="">#27423</a>)</li>
<li>Move <code>Unknown</code> out of the experimental <code>ty_extensions</code> API (<a href="">#27430</a>)</li>
<li>Preserve <code>TypeVarTuple</code> context during <code>Generic</code> recovery (<a href="">#27381</a>)</li>
<li>Preserve exact numeric types in covariant collections (<a href="">#27311</a>)</li>
<li>Reject <code>ClassVar</code> and <code>Final</code> qualifiers in <code>NamedTuple</code> fields (<a href="">#27380</a>)</li>
<li>Reject out-of-scope <code>ParamSpec</code> components (<a href="">#27378</a>)</li>
<li>Reject specializing non-generic subclasses (<a href="">#27377</a>)</li>
<li>Respect bounds and constraints in generic materializations (<a href="">#27228</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#27401</a>). <a href="https://github.com/python/typeshed/compare/b00c387c669cb50d5d388d77b74c2e832e147fe8...1b116673774d062a4af7b0a0b3d05533a6be55d0">Typeshed diff</a></li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/Punisheroot"><code>@​Punisheroot</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/cheparity"><code>@​cheparity</code></a></li>
<li><a href="https://github.com/BitWeaverDev"><code>@​BitWeaverDev</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ribru17"><code>@​ribru17</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<h2>0.0.65</h2>
<p>Released on 2026-07-29.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3e28e58</code></a> Bump version to 0.0.66 (<a href="">#4166</a>)</li>
<li><a href=""><code>87de836</code></a> Bump version to 0.0.65 (<a href="">#4113</a>)</li>
<li><a href=""><code>d784bad</code></a> README: Add link to Stable milestone (<a href="">#4112</a>)</li>
<li><a href=""><code>b4c1978</code></a> Update actions/setup-python action to v7 (<a href="">#4110</a>)</li>
<li><a href=""><code>8d216a3</code></a> Update actions/checkout action to v7.0.1 (<a href="">#4107</a>)</li>
<li><a href=""><code>06f44e9</code></a> Update dependency prek to v0.4.10 (<a href="">#4108</a>)</li>
<li><a href=""><code>b3665fd</code></a> Update prek dependencies (<a href="">#4109</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.64...0.0.66">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86ee81a608e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.