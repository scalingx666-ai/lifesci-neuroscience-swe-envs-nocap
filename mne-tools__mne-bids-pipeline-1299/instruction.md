# Issue

**Title:** [dependabot]: Bump the deps group with 4 updates

## Description

Bumps the deps group with 4 updates: [filelock](https://github.com/tox-dev/py-filelock), [lefthook](https://github.com/evilmartians/lefthook), [ruff](https://github.com/astral-sh/ruff) and [ty](https://github.com/astral-sh/ty).

Updates `filelock` from 3.32.3 to 3.32.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.32.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix: retry transient denials on open and claim read by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#705</a></li>
<li>🧪 test: deflake six scheduled-run failures by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#704</a></li>
<li>🧪 test: cover a reclaimed private record for real by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#706</a></li>
<li>🧪 test(fork): fork once the event loop has closed by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#714</a></li>
<li>🔧 chore: batch dependency updates weekly on Tuesday by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#713</a></li>
<li>escape the hostname every marker publishes by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#709</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.32.3...3.32.4">https://github.com/tox-dev/filelock/compare/3.32.3...3.32.4</a></p>
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
<p>3.32.4 (2026-08-23)</p>
<hr />
<ul>
<li><code>StrictSoftFileLock</code> always retries a claim read whose first attempt reports the claim as pending, so a first read
that itself outlasts the retry grace no longer fails closed on a claim it could have read. :pr:<code>705</code></li>
<li><code>WindowsFileLock</code> waits out a transient <code>STATUS_ACCESS_DENIED</code> from <code>NtCreateFile</code> for up to half a second
before raising <code>PermissionError</code>, since a peer unlinking the lock file as it releases can answer that for a moment; a
real denial still fails fast. :pr:<code>705</code></li>
<li>Every lock class now escapes the hostname it publishes, so a host whose <code>socket.gethostname()</code> carries a space, a
newline or a byte outside UTF-8 no longer writes a marker it reads back as malformed. Such a host used to lose a held
<code>SoftReadWriteLock</code> read slot to a peer and could not take a write slot or a <code>StrictSoftFileLock</code> at all. :pr:<code>709</code></li>
</ul>
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
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cb493d6</code></a> Release 3.32.4</li>
<li><a href=""><code>fe07a11</code></a> escape the hostname every marker publishes (<a href="">#709</a>)</li>
<li><a href=""><code>232732f</code></a> 🔧 chore: batch dependency updates weekly on Tuesday (<a href="">#713</a>)</li>
<li><a href=""><code>2966eb5</code></a> 🧪 test(fork): fork once the event loop has closed (<a href="">#714</a>)</li>
<li><a href=""><code>61511eb</code></a> build(deps): bump astral-sh/setup-uv from 10.0.0 to 10.0.1 (<a href="">#712</a>)</li>
<li><a href=""><code>f12a52f</code></a> build(deps): bump astral-sh/setup-uv from 9.0.0 to 10.0.0 (<a href="">#711</a>)</li>
<li><a href=""><code>54c7b6c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#710</a>)</li>
<li><a href=""><code>49f8035</code></a> 🧪 test: cover a reclaimed private record for real (<a href="">#706</a>)</li>
<li><a href=""><code>bb16d39</code></a> 🧪 test: deflake six scheduled-run failures (<a href="">#704</a>)</li>
<li><a href=""><code>13b82a6</code></a> 🐛 fix: retry transient denials on open and claim read (<a href="">#705</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.32.3...3.32.4">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.10 to 2.1.11
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.11</h2>
<h2>Changelog</h2>
<ul>
<li>e5b10ac3a2645784ee2e4260620c49c31b44992a deps: bump Go to 1.26.6 (<a href="">#1495</a>)</li>
<li>d4a259f460b7c1d8c512dd75eedc7068310ee961 fix: inherit terminal size for PTY commands (<a href="">#1498</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.11 (2026-08-21)</h2>
<ul>
<li>fix: inherit terminal size for PTY commands (<a href="">#1498</a>) by <a href="https://github.com/mariokresic"><code>@​mariokresic</code></a></li>
<li>docs: correct Lefthook commit message configuration (<a href="">#1499</a>) by <a href="https://github.com/codersjj"><code>@​codersjj</code></a></li>
<li>docs: hide contributors regenerate tip from the site (<a href="">#1500</a>) by <a href="https://github.com/MikevPeeren"><code>@​MikevPeeren</code></a></li>
<li>docs: clarify signed-off commit example (<a href="">#1492</a>) by <a href="https://github.com/nightcityblade"><code>@​nightcityblade</code></a></li>
<li>deps: bump Go to 1.26.6 (<a href="">#1495</a>) by <a href="https://github.com/quaacxlok"><code>@​quaacxlok</code></a></li>
<li>docs: fix em notice by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>docs: update docmd (<a href="">#1481</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>docs: fix EM mention HTML by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>docs: clarify remote script folders (<a href="">#1477</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>docs: document script args (<a href="">#1479</a>) by <a href="https://github.com/lntutor"><code>@​lntutor</code></a></li>
<li>docs: update em logo by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c145646</code></a> 2.1.11: pty terminal size fix</li>
<li><a href=""><code>d4a259f</code></a> fix: inherit terminal size for PTY commands (<a href="">#1498</a>)</li>
<li><a href=""><code>db7ca05</code></a> docs: correct Lefthook commit message configuration (<a href="">#1499</a>)</li>
<li><a href=""><code>fd88b10</code></a> docs: hide contributors regenerate tip from the site (<a href="">#1500</a>)</li>
<li><a href=""><code>7ccb1d8</code></a> docs: clarify signed-off commit example (<a href="">#1492</a>)</li>
<li><a href=""><code>e5b10ac</code></a> deps: bump Go to 1.26.6 (<a href="">#1495</a>)</li>
<li><a href=""><code>95ce21a</code></a> docs: fix em notice</li>
<li><a href=""><code>fc65f86</code></a> docs: update docmd (<a href="">#1481</a>)</li>
<li><a href=""><code>3a37be2</code></a> docs: fix EM mention HTML</li>
<li><a href=""><code>54e5ef5</code></a> docs: clarify remote script folders (<a href="">#1477</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.10...v2.1.11">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.3 to 0.16.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.4</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-20.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-use-pathlib</code>] Add autofix for <code>PTH116</code> (<a href="">#26460</a>)</li>
<li>[<code>refurb</code>] Restrict <code>delete-full-slice</code> to lists (<code>FURB131</code>) (<a href="">#27711</a>)</li>
<li>[<code>refurb</code>] Skip <code>FURB101</code> and <code>FURB103</code> when the <code>open</code> argument is a file descriptor (<a href="">#27643</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>InvalidInstruction</code> on Windows CPUs that do not support <code>POPCNT</code> (<a href="">#27803</a>)</li>
<li>[<code>pyflakes</code>] Emit semantic syntax errors in string type definitions as <code>F722</code> (<a href="">#27835</a>)</li>
<li>[<code>pylint</code>] Allow <code>os._exit</code> imports in <code>import-private-name</code> (<code>PLC2701</code>) (<a href="">#27738</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[syntax-errors] Align mixed t-string/bytes error message with CPython 3.14 (<a href="">#27766</a>)</li>
<li>[<code>ruff</code>] Add <code>ctypes.LittleEndianStructure</code> and related types to existing exception (<code>RUF012</code>) (<a href="">#27753</a>)</li>
<li>[syntax-errors] Detect duplicate keyword arguments (<a href="">#17804</a>)</li>
<li>[syntax-errors] Detect parameters declared <code>nonlocal</code> (<a href="">#27628</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Offer display-only fixes and mark safe fixes preferred (<a href="">#27807</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27779</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add default indicator to rules table (<a href="">#27724</a>)</li>
<li>Fix broken link to Python docs (<a href="">#27757</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix s390x stacker assembly in release builds (<a href="">#27776</a>)</li>
<li>Guarantee minimum stack size when parsing a module, standalone expression, and suites (<a href="">#25464</a>)</li>
<li>Reduce configuration deserialization code size (<a href="">#27924</a>)</li>
<li>Check packed AST index bounds (<a href="">#27849</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AbhinavMir"><code>@​AbhinavMir</code></a></li>
<li><a href="https://github.com/eduardorittner"><code>@​eduardorittner</code></a></li>
<li><a href="https://github.com/royb3"><code>@​royb3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/rosstitmarsh"><code>@​rosstitmarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.4</h2>
<p>Released on 2026-08-20.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-use-pathlib</code>] Add autofix for <code>PTH116</code> (<a href="">#26460</a>)</li>
<li>[<code>refurb</code>] Restrict <code>delete-full-slice</code> to lists (<code>FURB131</code>) (<a href="">#27711</a>)</li>
<li>[<code>refurb</code>] Skip <code>FURB101</code> and <code>FURB103</code> when the <code>open</code> argument is a file descriptor (<a href="">#27643</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>InvalidInstruction</code> on Windows CPUs that do not support <code>POPCNT</code> (<a href="">#27803</a>)</li>
<li>[<code>pyflakes</code>] Emit semantic syntax errors in string type definitions as <code>F722</code> (<a href="">#27835</a>)</li>
<li>[<code>pylint</code>] Allow <code>os._exit</code> imports in <code>import-private-name</code> (<code>PLC2701</code>) (<a href="">#27738</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[syntax-errors] Align mixed t-string/bytes error message with CPython 3.14 (<a href="">#27766</a>)</li>
<li>[<code>ruff</code>] Add <code>ctypes.LittleEndianStructure</code> and related types to existing exception (<code>RUF012</code>) (<a href="">#27753</a>)</li>
<li>[syntax-errors] Detect duplicate keyword arguments (<a href="">#17804</a>)</li>
<li>[syntax-errors] Detect parameters declared <code>nonlocal</code> (<a href="">#27628</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Offer display-only fixes and mark safe fixes preferred (<a href="">#27807</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27779</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add default indicator to rules table (<a href="">#27724</a>)</li>
<li>Fix broken link to Python docs (<a href="">#27757</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix s390x stacker assembly in release builds (<a href="">#27776</a>)</li>
<li>Guarantee minimum stack size when parsing a module, standalone expression, and suites (<a href="">#25464</a>)</li>
<li>Reduce configuration deserialization code size (<a href="">#27924</a>)</li>
<li>Check packed AST index bounds (<a href="">#27849</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AbhinavMir"><code>@​AbhinavMir</code></a></li>
<li><a href="https://github.com/eduardorittner"><code>@​eduardorittner</code></a></li>
<li><a href="https://github.com/royb3"><code>@​royb3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/rosstitmarsh"><code>@​rosstitmarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/zaniebot"><code>@​zaniebot</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>11c76bf</code></a> Bump 0.16.4 (<a href="">#27937</a>)</li>
<li><a href=""><code>d53c8c5</code></a> Isolate playground builds from deployment credentials (<a href="">#27839</a>)</li>
<li><a href=""><code>cab001e</code></a> Disable uv preview for releases and pre-commit hooks (<a href="">#27939</a>)</li>
<li><a href=""><code>f8d575f</code></a> [ty] Clarify writing guidance for human readers (<a href="">#27912</a>)</li>
<li><a href=""><code>ca45fae</code></a> Set <code>--preview</code> and <code>--default-index</code> for the <code>uv-lock</code> hook (<a href="">#27935</a>)</li>
<li><a href=""><code>4827bf7</code></a> Export <code>UV_DEFAULT_INDEX</code> in <code>release.sh</code> (<a href="">#27934</a>)</li>
<li><a href=""><code>d1087a4</code></a> [ty] Handle assignment expressions in string annotations (<a href="">#27921</a>)</li>
<li><a href=""><code>680cce4</code></a> [ty] Optimize inherited recursive protocol comparisons (<a href="">#27922</a>)</li>
<li><a href=""><code>974d3cb</code></a> Upgrade ecosystem-analyzer and mypy_primer to the latest upstream pins (<a href="">#27932</a>)</li>
<li><a href=""><code>b169b40</code></a> Install cargo tools locked (<a href="">#27929</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.3...0.16.4">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.72 to 0.0.74
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.74</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-22.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid duplicate bindings in multi-target assignments (<a href="">#27938</a>)</li>
<li>Avoid panic on unpacked kwargs in string annotations (<a href="">#27963</a>)</li>
<li>Fix stack overflow in recursive <code>TypedDict</code> dictionary compatibility (<a href="">#27951</a>)</li>
<li>Handle assignment expressions in string annotations (<a href="">#27921</a>)</li>
<li>Handle dynamic classes in string annotations (<a href="">#27883</a>)</li>
<li>Preserve string annotation context in lambda defaults and <code>TypedDict</code> types (<a href="">#27914</a>)</li>
<li>Skip invalid subscript arguments in string annotations (<a href="">#27917</a>)</li>
<li>Skip invalid subscript operands in string annotations (<a href="">#27882</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add <code>untrustedWorkspace</code> option to the LSP (<a href="">#27828</a>)</li>
<li>Add executable discovery to the server command (<a href="">#27806</a>)</li>
<li>Handle file-valued workspace folders from Zed (<a href="">#27836</a>)</li>
<li>Skip scripts with an invalid PEP 723 configuration (<a href="">#27505</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27778</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update mypy/pyright comparison table (<a href="">#4165</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add an opt-in <code>unsound-assignment</code> rule for variables (<a href="">#27874</a>)</li>
<li>Fix variadic signature display (<a href="">#27869</a>)</li>
<li>Highlight declarations in invalid-assignment diagnostics (<a href="">#27872</a>)</li>
<li>Improve <code>LiteralString</code> suggestions in string annotations (<a href="">#27931</a>)</li>
<li>Use <code>invalid-type-form</code> for non-generic class annotations (<a href="">#27889</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add bounded constraint solution projections (<a href="">#27949</a>)</li>
<li>Fix invariant gradual tuple materialization ranges (<a href="">#27946</a>)</li>
<li>Guard recursive constructor bindings by receiver (<a href="">#27958</a>)</li>
<li>Preserve all alternatives in bounded intersections (<a href="">#27898</a>)</li>
<li>Preserve keyword safety for unpacked callables (<a href="">#27517</a>)</li>
<li>Preserve source protocol members and classify finite aliases (<a href="">#27772</a>)</li>
<li>Preserve type-variable order when reloading constraints (<a href="">#27904</a>)</li>
<li>Propagate narrowing through statically known branches (<a href="">#27752</a>)</li>
<li>Recognize ABC metaclass methods on protocols (<a href="">#27897</a>)</li>
<li>Support <code>__slots__</code> (<a href="">#27730</a>)</li>
</ul>
<h3>Performance</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.74</h2>
<p>Released on 2026-08-22.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid duplicate bindings in multi-target assignments (<a href="">#27938</a>)</li>
<li>Avoid panic on unpacked kwargs in string annotations (<a href="">#27963</a>)</li>
<li>Fix stack overflow in recursive <code>TypedDict</code> dictionary compatibility (<a href="">#27951</a>)</li>
<li>Handle assignment expressions in string annotations (<a href="">#27921</a>)</li>
<li>Handle dynamic classes in string annotations (<a href="">#27883</a>)</li>
<li>Preserve string annotation context in lambda defaults and <code>TypedDict</code> types (<a href="">#27914</a>)</li>
<li>Skip invalid subscript arguments in string annotations (<a href="">#27917</a>)</li>
<li>Skip invalid subscript operands in string annotations (<a href="">#27882</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add <code>untrustedWorkspace</code> option to the LSP (<a href="">#27828</a>)</li>
<li>Add executable discovery to the server command (<a href="">#27806</a>)</li>
<li>Handle file-valued workspace folders from Zed (<a href="">#27836</a>)</li>
<li>Skip scripts with an invalid PEP 723 configuration (<a href="">#27505</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27778</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update mypy/pyright comparison table (<a href="">#4165</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add an opt-in <code>unsound-assignment</code> rule for variables (<a href="">#27874</a>)</li>
<li>Fix variadic signature display (<a href="">#27869</a>)</li>
<li>Highlight declarations in invalid-assignment diagnostics (<a href="">#27872</a>)</li>
<li>Improve <code>LiteralString</code> suggestions in string annotations (<a href="">#27931</a>)</li>
<li>Use <code>invalid-type-form</code> for non-generic class annotations (<a href="">#27889</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add bounded constraint solution projections (<a href="">#27949</a>)</li>
<li>Fix invariant gradual tuple materialization ranges (<a href="">#27946</a>)</li>
<li>Guard recursive constructor bindings by receiver (<a href="">#27958</a>)</li>
<li>Preserve all alternatives in bounded intersections (<a href="">#27898</a>)</li>
<li>Preserve keyword safety for unpacked callables (<a href="">#27517</a>)</li>
<li>Preserve source protocol members and classify finite aliases (<a href="">#27772</a>)</li>
<li>Preserve type-variable order when reloading constraints (<a href="">#27904</a>)</li>
<li>Propagate narrowing through statically known branches (<a href="">#27752</a>)</li>
<li>Recognize ABC metaclass methods on protocols (<a href="">#27897</a>)</li>
<li>Support <code>__slots__</code> (<a href="">#27730</a>)</li>
</ul>
<h3>Performance</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>00199f0</code></a> Bump version to 0.0.74 (<a href="">#4351</a>)</li>
<li><a href=""><code>5769062</code></a> Update mypy/pyright comparison table (<a href="">#4165</a>)</li>
<li><a href=""><code>4fcb060</code></a> Remove Zulip from the PGO training (<a href="">#4336</a>)</li>
<li><a href=""><code>a7a7064</code></a> Use the versions bot's ruleset bypass when merging (<a href="">#4333</a>)</li>
<li><a href=""><code>01b0fab</code></a> Update prek dependencies (<a href="">#4325</a>)</li>
<li><a href=""><code>deef42f</code></a> Update dependency python to 3.14 (<a href="">#4326</a>)</li>
<li><a href=""><code>6d35edf</code></a> Update astral-sh/setup-uv action to v10 (<a href="">#4327</a>)</li>
<li><a href=""><code>4bd2833</code></a> Bump version to 0.0.73 (<a href="">#4322</a>)</li>
<li><a href=""><code>93d0d4f</code></a> Disable known GitHub cache clients in release workflows (<a href="">#4317</a>)</li>
<li><a href=""><code>ec4806b</code></a> Harden release workflow permissions and shell inputs (<a href="">#4319</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.72...0.0.74">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `064cf51a0df4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.