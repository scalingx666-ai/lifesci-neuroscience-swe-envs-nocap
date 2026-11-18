# Issue

**Title:** [dependabot]: Bump the deps group with 25 updates

## Description

Bumps the deps group with 25 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `4.0.12` | `4.1.1` |
| [pyarrow](https://github.com/apache/arrow) | `25.0.1` | `26.0.0` |
| [pydantic](https://github.com/pydantic/pydantic) | `2.13.5` | `2.14.1` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.49.0` | `0.49.1` |
| [black](https://github.com/psf/black) | `26.10.0` | `26.10.1` |
| [aiohttp](https://github.com/aio-libs/aiohttp) | `3.14.4` | `3.14.5` |
| [backrefs](https://github.com/facelessuser/backrefs) | `8.0` | `8.1` |
| [bracex](https://github.com/facelessuser/bracex) | `3.0.1` | `3.1` |
| [cyclopts](https://github.com/BrianPugh/cyclopts) | `5.1.1` | `5.2.0` |
| griffelib | `2.3.0` | `2.3.2` |
| [iniconfig](https://github.com/pytest-dev/iniconfig) | `2.3.0` | `2.3.1` |
| [jsonpointer](https://github.com/stefankoegl/python-json-pointer) | `3.1.1` | `3.2.1` |
| [mkdocstrings](https://github.com/mkdocstrings/mkdocstrings) | `1.0.6` | `1.0.7` |
| [multidict](https://github.com/aio-libs/multidict) | `6.9.1` | `7.1.0` |
| [narwhals](https://github.com/narwhals-dev/narwhals) | `2.26.0` | `2.27.1` |
| [nbconvert](https://github.com/jupyter/nbconvert) | `7.17.1` | `7.17.2` |
| [platformdirs](https://github.com/tox-dev/platformdirs) | `4.12.3` | `4.13.0` |
| [pycparser](https://github.com/eliben/pycparser) | `3.0` | `3.11` |
| [pydantic-core](https://github.com/pydantic/pydantic) | `2.46.5` | `2.50.1` |
| [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) | `12.1` | `12.2` |
| [tomli](https://github.com/hukkin/tomli) | `2.4.1` | `2.5.0` |
| [toolz](https://github.com/pytoolz/toolz) | `1.1.0` | `1.2.0` |
| [typer](https://github.com/fastapi/typer) | `0.27.2` | `0.27.3` |
| verspec | `0.1.0` | `0.2.0` |
| [wcmatch](https://github.com/facelessuser/wcmatch) | `11.0.1` | `11.1` |

Updates `filelock` from 4.0.12 to 4.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.1.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>feat(python): default to Python 3.15 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#816</a></li>
<li>fix(rw): avoid macOS descriptor lookups by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#820</a></li>
<li>fix(tests): bound concurrent lock progress by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#819</a></li>
<li>test: make lock error checks deterministic by <a href="https://github.com/adenzhou1350"><code>@​adenzhou1350</code></a> in <a href="">tox-dev/filelock#817</a></li>
<li>fix(read-write): reject a hostile pid in _owner_is_gone by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#821</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/adenzhou1350"><code>@​adenzhou1350</code></a> made their first contribution in <a href="">tox-dev/filelock#817</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.1.0...4.1.1">https://github.com/tox-dev/filelock/compare/4.1.0...4.1.1</a></p>
<h2>4.1.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>ci: download coverage during tool setup by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#776</a></li>
<li>🐛 fix(api): validate timeout and poll_interval bounds by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#781</a></li>
<li>🐛 fix(read-write): accept inf and reject nan timeouts by <a href="https://github.com/darrenhuai"><code>@​darrenhuai</code></a> in <a href="">tox-dev/filelock#779</a></li>
<li>🐛 fix(soft-rw): ignore non-ASCII generation names by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#778</a></li>
<li>🐛 fix(soft): check start token in is_lock_held_by_us by <a href="https://github.com/lprnmns"><code>@​lprnmns</code></a> in <a href="">tox-dev/filelock#774</a></li>
<li>🐛 fix(soft): clean up marker when rollback close fails by <a href="https://github.com/harbinresearcher"><code>@​harbinresearcher</code></a> in <a href="">tox-dev/filelock#775</a></li>
<li>🐛 fix(read-write): clamp waits to threading.TIMEOUT_MAX by <a href="https://github.com/darrenhuai"><code>@​darrenhuai</code></a> in <a href="">tox-dev/filelock#780</a></li>
<li>🐛 fix(soft): treat truncated markers as malformed by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#782</a></li>
<li>🐛 fix(acquire): keep every acquire wait within the timeout by <a href="https://github.com/feiiiiii5"><code>@​feiiiiii5</code></a> in <a href="">tox-dev/filelock#777</a></li>
<li>📝 docs: fix hanging example and platform claims by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#783</a></li>
<li>🐛 fix(unix): keep peer marker on ENOSYS fallback by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#785</a></li>
<li>🐛 fix(async): clear the task hold after a canceled release by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#789</a></li>
<li>✨ feat(api): export lease types and has_fcntl by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#790</a></li>
<li>🐛 fix(strict): age private records by the filesystem clock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#792</a></li>
<li>🐛 fix(async): surface executor shutdown as an error by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#793</a></li>
<li>🐛 fix(soft): expire leases on the contender's clock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#796</a></li>
<li>🐛 fix(soft-rw): stop an acquire that close() overtook by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#798</a></li>
<li>🐛 fix(strict): record claims before linking them by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#787</a></li>
<li>🐛 fix(soft): restore a live marker a stale break moved aside by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#786</a></li>
<li>🐛 fix(api): chain errors on 3.10 without exceptiongroup by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#788</a></li>
<li>🐛 fix(soft): release a dropped SoftFileLease by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#791</a></li>
<li>🐛 fix(read-write): keep probe fds until the last connection closes by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#794</a></li>
<li>📦 build(sdist): ship docs and update SECURITY.md by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#812</a></li>
<li>🐛 fix(soft-rw): survive a removed generation log by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#795</a></li>
<li>🐛 fix(soft): tell PID namespaces apart in the marker host by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#797</a></li>
<li>🐛 fix(async): release from the finalizer and keep I/O off the loop by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#800</a></li>
<li>🐛 fix(strict): name what blocks the lock path by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#804</a></li>
<li>🐛 fix(read-write): reject WAL databases and link beside the db by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#805</a></li>
<li>🐛 fix(read-write): track read depth per thread by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#806</a></li>
<li>🐛 fix(soft): honour mode and tighten marker grammar by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#807</a></li>
<li>🧪 test: drop timing races from two runner-load flakes by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#809</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
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
<p>4.2.0 (2026-10-14)</p>
<hr />
<ul>
<li><code>import filelock</code> is about twice as fast: lock types other than :class:<code>~filelock.FileLock</code> load on first use. :pr:<code>831</code></li>
<li>Fix :class:<code>~filelock.StrictSoftFileLock</code> raising :class:<code>~filelock.SoftFileLockProtocolError</code> on Windows when a
contender read a claim whose owner was still finishing its unlink. :pr:<code>829</code></li>
</ul>
<hr />
<p>4.1.2 (2026-10-14)</p>
<hr />
<ul>
<li>Fix read-lock acquisition on SQLite versions older than 3.33.0 by using <code>sqlite_master</code> for the schema probe. :pr:<code>770</code></li>
<li>Raise <code>IsADirectoryError</code> (or <code>PermissionError</code> on Windows) for a directory lock path regardless of its write
permissions. :pr:<code>822</code></li>
<li>Fix a forked child hanging at exit on PyPy when the parent forked while an
:class:<code>~filelock.AsyncReadWriteLock</code> worker thread was between two operations. :pr:<code>828</code></li>
<li>Hash all cache keys in the lock filename recipe so short path-like keys stay in the chosen directory. The example also
accepts path-derived surrogate escapes and works before the cache directory exists. :pr:<code>824</code></li>
</ul>
<hr />
<p>4.1.1 (2026-10-11)</p>
<hr />
<ul>
<li>Bound the shared-lock contention test by worker progress so slow CI machines can finish the workload. :pr:<code>819</code></li>
<li>Avoid the macOS <code>/dev/fd</code> lookup implicated in a kernel panic by opening SQLite through a validated hard link.
The database directory must be writable and support hard links; alias creation failure raises <code>OSError</code>. :pr:<code>820</code></li>
<li>Ignore non-ASCII PID or start-time fields and out-of-range PIDs in <code>ReadWriteLock</code> hard-link directory names so forged
owners cannot abort acquisition. :pr:<code>821</code></li>
<li>Use Python 3.15 for development and automation. :pr:<code>816</code></li>
</ul>
<hr />
<p>4.1.0 (2026-10-09)</p>
<hr />
<ul>
<li>Import :data:<code>~filelock.OwnerMode</code>, :data:<code>~filelock.CompromiseReason</code> and :data:<code>~filelock.has_fcntl</code> from
<code>filelock</code>. :pr:<code>790</code></li>
<li>:class:<code>~filelock.AcquireReturnProxy</code> is generic in the lock type, so <code>with lock.acquire() as held:</code> types <code>held</code> as
the lock's own class. :pr:<code>803</code></li>
<li>A :class:<code>~filelock.Timeout</code> from a soft lock names a holder on another host or in another PID namespace, which no
contender ever reclaims. :pr:<code>815</code></li>
<li>:attr:<code>~filelock.SoftFileLock.is_lock_held_by_us</code> and :attr:<code>~filelock.MarkerSoftFileLock.is_lock_held_by_us</code> return</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5830a7e</code></a> Release 4.1.1</li>
<li><a href=""><code>a5fb607</code></a> fix(read-write): reject a hostile pid in _owner_is_gone (<a href="">#821</a>)</li>
<li><a href=""><code>4c6f32f</code></a> test: make lock error checks deterministic (<a href="">#817</a>)</li>
<li><a href=""><code>f11f523</code></a> fix(tests): bound concurrent lock progress (<a href="">#819</a>)</li>
<li><a href=""><code>5fd0c8f</code></a> fix(rw): avoid macOS descriptor lookups (<a href="">#820</a>)</li>
<li><a href=""><code>0c3aaab</code></a> feat(python): default to Python 3.15 (<a href="">#816</a>)</li>
<li><a href=""><code>6c0ecc2</code></a> Release 4.1.0</li>
<li><a href=""><code>df06bbd</code></a> 🐛 fix: close regressions since 4.0.12 (<a href="">#815</a>)</li>
<li><a href=""><code>0712045</code></a> 🐛 fix(read-write): refuse a database moved mid-acquire (<a href="">#808</a>)</li>
<li><a href=""><code>73fefc1</code></a> 📝 docs: point canonical and og:url at versioned pages (<a href="">#813</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/4.0.12...4.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pyarrow` from 25.0.1 to 26.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/apache/arrow/releases">pyarrow's releases</a>.</em></p>
<blockquote>
<h2>Apache Arrow 26.0.0</h2>
<p>Release Notes URL: <a href="https://arrow.apache.org/release/26.0.0.html">https://arrow.apache.org/release/26.0.0.html</a></p>
<h2>Apache Arrow 26.0.0 RC0</h2>
<p>Release Notes: Release Candidate: 26.0.0 RC0</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4461671</code></a> MINOR: [Release] Update versions for 26.0.0</li>
<li><a href=""><code>9d03a26</code></a> MINOR: [Release] Update .deb/.rpm changelogs for 26.0.0</li>
<li><a href=""><code>5ce3c95</code></a> MINOR: [Release] Update CHANGELOG.md for 26.0.0</li>
<li><a href=""><code>28e6c67</code></a> <a href="">GH-51687</a>: [C++] Skipt tests that require threads if ARROW_ENABLE_THREADING=OF...</li>
<li><a href=""><code>12409f8</code></a> <a href="">GH-51682</a>: [CI][C++] Add liburiparser-dev to system dependency image (<a href="">#51683</a>)</li>
<li><a href=""><code>1deceed</code></a> <a href="">GH-51675</a>: [Python][Packaging] Apply upstream fix to UriParser from vcpkg and ...</li>
<li><a href=""><code>cca44b5</code></a> <a href="">GH-51638</a>: [CI][C++][Parquet] Update expected JSON output in parquet-reader-te...</li>
<li><a href=""><code>5183e21</code></a> <a href="">GH-46901</a>: [C++][Compute] Add remainder and modulo kernels (<a href="">#48914</a>)</li>
<li><a href=""><code>f0d043c</code></a> MINOR: [Docs][C++] Fix doxygenfile path for arrow/flight/transport.h (<a href="">#51677</a>)</li>
<li><a href=""><code>17be9c7</code></a> <a href="">GH-51652</a>: [Python] Add NumPy StringDType to Arrow conversion (<a href="">#51157</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/apache/arrow/compare/apache-arrow-25.0.1...apache-arrow-26.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pydantic` from 2.13.5 to 2.14.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/releases">pydantic's releases</a>.</em></p>
<blockquote>
<h2>v2.14.1 2026-10-11</h2>
<h3>What's Changed</h3>
<h4>Performance</h4>
<ul>
<li>Avoid Python tuple allocation during model fields validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13955</a></li>
<li>Avoid unnecessary extra dict allocation in model validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13956</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Fix <code>arguments-v3</code> schema with variadic keywords by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13954</a></li>
<li>Fix <code>TypeError</code> on <code>ForwardRef</code> on Python 3.10.0 by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13964</a></li>
<li>Support <code>closed</code> and <code>extra_items</code> via inheritance in <code>TypedDict</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13967</a></li>
<li>Enforce the <code>max_digits</code> whole-digits limit in the Python <code>Decimal</code> validator by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13972</a></li>
<li>Reject out-of-range int inputs for <code>timedelta</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13973</a></li>
<li>Support named tuples in <code>Sequence</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13978</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.14.0...v2.14.1">https://github.com/pydantic/pydantic/compare/v2.14.0...v2.14.1</a></p>
<h2>v2.14.0 2026-10-08</h2>
<h3>What's Changed</h3>
<p>The highlights of the v2.14 release are available in the <a href="https://pydantic.dev/articles/pydantic-v2-14-release">blog post</a>.
Several minor changes (considered non-breaking changes according to our <a href="https://pydantic.dev/docs/validation/2.14/get-started/version-policy/#pydantic-v2">versioning policy</a>) are also included in this release. Make sure to look into them before upgrading.</p>
<p>This release drops support for Python 3.9 and adds support for Python 3.15.</p>
<h4>New Features</h4>
<ul>
<li>Add support for <code>multiple_of</code> constraint in <code>fraction</code> and <code>timedelta</code> core schemas by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13873</a></li>
<li>Add <code>__namespace__</code> parameter to <code>create_model()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13895</a></li>
</ul>
<h4>Changes</h4>
<ul>
<li>Add an <code>ordered-dict</code> core schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13796</a></li>
<li>Add a <code>counter</code> core schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13824</a></li>
<li>Do not mutate <code>model_config</code> attribute by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13825</a></li>
<li>Reject newlines in <code>NameEmail</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13897</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Call enum constructors in both validation modes by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13792</a></li>
<li>Fix documentation examples not raising and remove unused <code>string_sub_type</code> unused error code by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13821</a></li>
<li>Catch <code>OverflowError</code> during <code>ByteSize</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13850</a></li>
<li>Require <code>multiple_of</code> constraints to be positive by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13862</a></li>
<li>Always pop field name and model type stacks during schema generation by <a href="https://github.com/saquibjawedbit"><code>@​saquibjawedbit</code></a> in <a href="">#13859</a></li>
<li>Handle <code>TypeError</code> gracefully during docstring extraction by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13874</a></li>
<li>Fix config propagation of stdlib dataclasses and <code>TypedDict</code>s in JSON Schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13891</a></li>
<li>Don't apply <code>ser_json_timedelta</code> to all datetime types in serialization inference by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13892</a></li>
<li>Encode JSON Schema defaults with a consistent configuration by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13893</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/blob/main/HISTORY.md">pydantic's changelog</a>.</em></p>
<blockquote>
<!-- raw HTML omitted -->
<!-- raw HTML omitted -->
<!-- raw HTML omitted -->
<h2>v2.14.0 (2026-10-08)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.14.0">GitHub release</a></p>
<h3>What's Changed</h3>
<p>The highlights of the v2.14 release are available in the <a href="https://pydantic.dev/articles/pydantic-v2-14-release">blog post</a>.
Several minor changes (considered non-breaking changes according to our <a href="https://pydantic.dev/docs/validation/2.14/get-started/version-policy/#pydantic-v2">versioning policy</a>)
are also included in this release. Make sure to look into them before upgrading.</p>
<p>This release drops support for Python 3.9 and adds support for Python 3.15.</p>
<h4>New Features</h4>
<ul>
<li>Add support for <code>multiple_of</code> constraint in <code>fraction</code> and <code>timedelta</code> core schemas by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13873</a></li>
<li>Add <code>__namespace__</code> parameter to <code>create_model()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13895</a></li>
</ul>
<h4>Changes</h4>
<ul>
<li>Add an <code>ordered-dict</code> core schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13796</a></li>
<li>Add a <code>counter</code> core schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13824</a></li>
<li>Do not mutate <code>model_config</code> attribute by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13825</a></li>
<li>Reject newlines in <code>NameEmail</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13897</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Call enum constructors in both validation modes by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13792</a></li>
<li>Fix documentation examples not raising and remove unused <code>string_sub_type</code> unused error code by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13821</a></li>
<li>Catch <code>OverflowError</code> during <code>ByteSize</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13850</a></li>
<li>Require <code>multiple_of</code> constraints to be positive by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13862</a></li>
<li>Always pop field name and model type stacks during schema generation by <a href="https://github.com/saquibjawedbit"><code>@​saquibjawedbit</code></a> in <a href="">#13859</a></li>
<li>Handle <code>TypeError</code> gracefully during docstring extraction by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13874</a></li>
<li>Fix config propagation of stdlib dataclasses and <code>TypedDict</code>s in JSON Schema by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13891</a></li>
<li>Don't apply <code>ser_json_timedelta</code> to all datetime types in serialization inference by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13892</a></li>
<li>Encode JSON Schema defaults with a consistent configuration by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13893</a></li>
<li>Propagate <code>init</code> and <code>kw_only=False</code> from <code>Field()</code> to stdlib dataclass fields by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13898</a></li>
<li>Respect propagated extra config in the JSON Schema of stdlib dataclasses by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13899</a></li>
<li>Handle OS errors during <code>ZoneInfo</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13912</a></li>
<li>Handle exceptions during <code>Decimal</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13940</a></li>
<li>Rebuild incomplete types during serialization inference by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13922</a></li>
<li>Reject large exponents in <code>Fraction</code> validation by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13944</a></li>
<li>Avoid validating URL prefix multiple times in multi host URLs by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13945</a></li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/saquibjawedbit"><code>@​saquibjawedbit</code></a> made their first contribution in <a href="">#13859</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b2212c7</code></a> Prepare release v2.14.1</li>
<li><a href=""><code>968fb2b</code></a> Fix docs conversion table</li>
<li><a href=""><code>6adc8b3</code></a> Support named tuples in <code>Sequence</code> validation</li>
<li><a href=""><code>7637fbc</code></a> Reject out-of-range int inputs for <code>timedelta</code></li>
<li><a href=""><code>dfdbfcb</code></a> Enforce the <code>max_digits</code> whole-digits limit in the Python <code>Decimal</code> validator</li>
<li><a href=""><code>e2456d3</code></a> Support <code>closed</code> and <code>extra_items</code> via inheritance in <code>TypedDict</code></li>
<li><a href=""><code>317655d</code></a> Harden CI security</li>
<li><a href=""><code>3ba1dd4</code></a> Fix <code>TypeError</code> on <code>ForwardRef</code> on Python 3.10.0</li>
<li><a href=""><code>43681ab</code></a> Bump <code>samuelcolvin/check-python-version</code> action to v5.1</li>
<li><a href=""><code>d6bc53a</code></a> Avoid unnecessary extra dict allocation in model validation</li>
<li>Additional commits viewable in <a href="https://github.com/pydantic/pydantic/compare/v2.13.5...v2.14.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.49.0 to 0.49.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvista/releases">pyvista's releases</a>.</em></p>
<blockquote>
<h2>v0.49.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Fix import on IPython &lt; 8.8 (Google Colab) by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9285</a></li>
<li>Fix <code>add_mesh</code> raising <code>AttributeError</code> for <code>rgb</code> without scalars by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9289</a></li>
<li>Fix a named opacity raising when its name is as long as the lookup table by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9198</a></li>
<li>Fix stale tile after a scaled screenshot by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9182</a></li>
<li>Subdivide a mesh whose faces use 32-bit ids on vtk&lt;9.4 by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9300</a></li>
<li>Fix <code>concatenate</code> silently dropping images with mismatched offsets by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9338</a></li>
<li>Fix three gaps in the optional-format readers by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9196</a></li>
<li>Match GL probes to whether the process uses EGL or GLX by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/pyvista#9324</a></li>
<li>Fix rotated half-voxel shift in <code>points_to_cells</code> and <code>cells_to_points</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9340</a></li>
<li>Fix <code>MultiBlock.combine</code> raising on empty nested blocks, e.g. Exodus side sets by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9122</a></li>
<li>Restore <code>jupyter-server-proxy</code> in the <code>jupyter</code> extra by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9391</a></li>
<li>Add None typing to set_jupyter_backend by <a href="https://github.com/echedey-ls"><code>@​echedey-ls</code></a> in <a href="">pyvista/pyvista#9237</a></li>
</ul>
<h3>Documentation</h3>
<ul>
<li>DOC: Update DataObjectFilters.extract_surface param algorithm misdocumented by <a href="https://github.com/echedey-ls"><code>@​echedey-ls</code></a> in <a href="">pyvista/pyvista#9236</a></li>
<li>DOC: Unindent versionadded of Tube capping parameter in geometric_objects.py by <a href="https://github.com/echedey-ls"><code>@​echedey-ls</code></a> in <a href="">pyvista/pyvista#9267</a></li>
<li>Rename 'Docstring Examples' backreference heading to 'API Examples' by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9179</a></li>
<li>Use &quot;Readers &amp; Writers&quot; for the reader API section by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9304</a></li>
<li>Point API page edit buttons at main in the released docs by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9257</a></li>
<li>Stop linking stdlib and NumPy names to trimesh's docs by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9317</a></li>
<li>Fix blank frames in the texture gif example by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9269</a></li>
<li>Search the dataset gallery by name only by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9353</a></li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Gate the VTK GC tests at 9.7.1 by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9363</a></li>
<li>Pass the tox constraints file as a single uv option value by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#9385</a></li>
</ul>
<p>Backported to <code>release/0.49</code> in <a href="">pyvista/pyvista#9364</a> and <a href="">pyvista/pyvista#9394</a>.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/pyvista/compare/v0.49.0...v0.49.1">https://github.com/pyvista/pyvista/compare/v0.49.0...v0.49.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>24ff828</code></a> Release v0.49.1</li>
<li><a href=""><code>dbe2187</code></a> Backport to 0.49: restore <code>jupyter-server-proxy</code> in the <code>jupyter</code> extra (<a href="">#9394</a>)</li>
<li><a href=""><code>4266c65</code></a> Backport bug and doc fixes to 0.49 for the 0.49.1 patch release (<a href="">#9364</a>)</li>
<li><a href=""><code>38b67e2</code></a> DOC: Update DataObjectFilters.extract_surface param algorithm misdocumented (...</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvista/compare/v0.49.0...v0.49.1">compare view</a></li>
</ul>
</details>
<br />

Updates `black` from 26.10.0 to 26.10.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/releases">black's releases</a>.</em></p>
<blockquote>
<h2>26.10.1</h2>
<h3>Highlights</h3>
<p>This release fixes a security issue in Black's bundled GitHub Action. Repositories that
use the action are encouraged to update to the latest version of Black immediately. This
update is received automatically when using <code>psf/black@stable</code>, and is independent of
the version of Black installed by the action.</p>
<p>When the GitHub Action reads version specifiers from <code>tool.black.required-version</code>, it
now only accepts released versions of Black, as it already did for <code>black</code> requirements
in dependency lists. Other values, such as URL references, are now rejected. This issue
has been registered as <code>GHSA-cg8m-r9f2-5wm2</code>; a CVE identifier is pending.</p>
<h3>Stable style</h3>
<ul>
<li>Fix a long Jupyter notebook assignment magic (for example <code>x = !ls -la</code>) being wrapped
in parentheses, which IPython can no longer run; such cells are now left unchanged
(<a href="">#5481</a>)</li>
<li>Keep repeated lines outside the selected <code>--line-ranges</code> unchanged (<a href="">#5436</a>)</li>
<li>Fix <code>--line-ranges</code> formatting lines that follow a statement when formatting joins or
re-indents that statement (<a href="">#5484</a>)</li>
<li>Fix <code>--line-ranges</code> crashing with an internal error when an unselected statement has a
<code># fmt: skip</code> comment on the last line before a closing bracket (<a href="">#5477</a>)</li>
<li>Prevent moving an encoding declaration (for example <code># -*- coding: latin-1 -*-</code>) onto
the first two lines of a file (<a href="">#5487</a>)</li>
<li>Fix adding an extra trailing blank line inside a multi-line module docstring when its
last line is near the line length limit (<a href="">#5494</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Do not split short expressions on delimiters (such as binary operators, comparisons,
or comprehensions) inside brackets when preceded by a standalone comment (<a href="">#5455</a>)</li>
<li>Fix the unstable <code>string_processing</code> feature removing backslash-newline sequences from
raw strings, which changed their value (<a href="">#5482</a>)</li>
<li>Avoid adding unnecessary parentheses around unbreakable right-hand side expressions in
assignments (such as annotated assignments or subscript targets) (<a href="">#5473</a>)</li>
<li>Parenthesize expressions with parameter comments when they exceed the line length
under <code>--preview</code> (<a href="">#5442</a>)</li>
<li>Fix <code>wrap_long_dict_values_in_parens</code> dropping the parentheses around a right-hand
side that contains a dictionary, leaving a line over the length limit (<a href="">#5492</a>)</li>
<li>Fix the unstable <code>string_processing</code> feature adding a space after <code>*</code> or <code>**</code> in a PEP
695 type parameter (<code>* Ts = ...</code>) when it splits a string in the parameter's default
(<a href="">#5504</a>)</li>
<li>Avoid unnecessary line splits of trailers (such as indexing/subscripts) when an
earlier bracket split exceeds the line length only due to a trailing comment (<a href="">#5498</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Add <code>--cache-dir</code> to configure the cache directory from the command line (<a href="">#5433</a>)</li>
<li>Don't cache a file as formatted after formatting or checking it with <code>--line-ranges</code>,</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/blob/main/CHANGES.md">black's changelog</a>.</em></p>
<blockquote>
<h2>Version 26.10.1</h2>
<h3>Highlights</h3>
<p>This release fixes a security issue in Black's bundled GitHub Action. Repositories that
use the action are encouraged to update to the latest version of Black immediately. This
update is received automatically when using <code>psf/black@stable</code>, and is independent of
the version of Black installed by the action.</p>
<p>When the GitHub Action reads version specifiers from <code>tool.black.required-version</code>, it
now only accepts released versions of Black, as it already did for <code>black</code> requirements
in dependency lists. Other values, such as URL references, are now rejected. This issue
has been registered as <code>GHSA-cg8m-r9f2-5wm2</code>; a CVE identifier is pending.</p>
<h3>Stable style</h3>
<ul>
<li>Fix a long Jupyter notebook assignment magic (for example <code>x = !ls -la</code>) being wrapped
in parentheses, which IPython can no longer run; such cells are now left unchanged
(<a href="">#5481</a>)</li>
<li>Keep repeated lines outside the selected <code>--line-ranges</code> unchanged (<a href="">#5436</a>)</li>
<li>Fix <code>--line-ranges</code> formatting lines that follow a statement when formatting joins or
re-indents that statement (<a href="">#5484</a>)</li>
<li>Fix <code>--line-ranges</code> crashing with an internal error when an unselected statement has a
<code># fmt: skip</code> comment on the last line before a closing bracket (<a href="">#5477</a>)</li>
<li>Prevent moving an encoding declaration (for example <code># -*- coding: latin-1 -*-</code>) onto
the first two lines of a file (<a href="">#5487</a>)</li>
<li>Fix adding an extra trailing blank line inside a multi-line module docstring when its
last line is near the line length limit (<a href="">#5494</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Do not split short expressions on delimiters (such as binary operators, comparisons,
or comprehensions) inside brackets when preceded by a standalone comment (<a href="">#5455</a>)</li>
<li>Fix the unstable <code>string_processing</code> feature removing backslash-newline sequences from
raw strings, which changed their value (<a href="">#5482</a>)</li>
<li>Avoid adding unnecessary parentheses around unbreakable right-hand side expressions in
assignments (such as annotated assignments or subscript targets) (<a href="">#5473</a>)</li>
<li>Parenthesize expressions with parameter comments when they exceed the line length
under <code>--preview</code> (<a href="">#5442</a>)</li>
<li>Fix <code>wrap_long_dict_values_in_parens</code> dropping the parentheses around a right-hand
side that contains a dictionary, leaving a line over the length limit (<a href="">#5492</a>)</li>
<li>Fix the unstable <code>string_processing</code> feature adding a space after <code>*</code> or <code>**</code> in a PEP
695 type parameter (<code>* Ts = ...</code>) when it splits a string in the parameter's default
(<a href="">#5504</a>)</li>
<li>Avoid unnecessary line splits of trailers (such as indexing/subscripts) when an
earlier bracket split exceeds the line length only due to a trailing comment (<a href="">#5498</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Add <code>--cache-dir</code> to configure the cache directory from the command line (<a href="">#5433</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>258e7db</code></a> Prepare release 26.10.1 (<a href="">#5511</a>)</li>
<li><a href=""><code>ac1f715</code></a> Action: validate required-version better (<a href="">#5510</a>)</li>
<li><a href=""><code>fe241cc</code></a> Avoid splitting trailers when earlier bracket split exceeds length due to com...</li>
<li><a href=""><code>4fb2897</code></a> Bump actions/upload-artifact from 7.0.1 to 7.0.2 (<a href="">#5500</a>)</li>
<li><a href=""><code>6d0f557</code></a> Bump actions/download-artifact from 8.0.1 to 8.0.2 (<a href="">#5501</a>)</li>
<li><a href=""><code>c45f21d</code></a> Handle PEP 695 type parameter whitespace in whitespace() (<a href="">#5504</a>)</li>
<li><a href=""><code>8ec61a7</code></a> Skip UTF-8 BOM when reading .gitignore (<a href="">#5497</a>)</li>
<li><a href=""><code>c9b1148</code></a> Fix module docstring last_line_length when docstring ends with newline (<a href="">#5494</a>)</li>
<li><a href=""><code>eb88358</code></a> Parenthesize expressions with parameter comments in preview (<a href="">#3113</a>) (<a href="">#5442</a>)</li>
<li><a href=""><code>939fa93</code></a> Keep the parentheses around a right-hand side when a dict value's parentheses...</li>
<li>Additional commits viewable in <a href="https://github.com/psf/black/compare/26.10.0...26.10.1">compare view</a></li>
</ul>
</details>
<br />

Updates `aiohttp` from 3.14.4 to 3.14.5
Updates `backrefs` from 8.0 to 8.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/backrefs/releases">backrefs's releases</a>.</em></p>
<blockquote>
<h2>8.1</h2>
<ul>
<li><strong>NEW</strong>: Add official support for Python 3.15.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7f8d1d9</code></a> Remove requirement files as this is now contained in the toml file</li>
<li><a href=""><code>4a22f04</code></a> Officially support hatch and switch to using Hatch instead of tox (<a href="">#203</a>)</li>
<li>See full diff in <a href="https://github.com/facelessuser/backrefs/compare/8.0...8.1">compare view</a></li>
</ul>
</details>
<br />

Updates `bracex` from 3.0.1 to 3.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/bracex/releases">bracex's releases</a>.</em></p>
<blockquote>
<h2>3.1</h2>
<ul>
<li><strong>NEW</strong>: Add support for Python 3.15.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>995d575</code></a> Add support for Python 3.15 and Update build stuff (<a href="">#48</a>)</li>
<li><a href=""><code>6b28ef6</code></a> Docs: Remove duplicate words</li>
<li>See full diff in <a href="https://github.com/facelessuser/bracex/compare/3.0.1...3.1">compare view</a></li>
</ul>
</details>
<br />

Updates `cyclopts` from 5.1.1 to 5.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/BrianPugh/cyclopts/releases">cyclopts's releases</a>.</em></p>
<blockquote>
<h2>v5.2.0</h2>
<h2>Features</h2>
<ul>
<li>Add PowerShell shell completion support. By <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#987</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.1.1...v5.2.0">https://github.com/BrianPugh/cyclopts/compare/v5.1.1...v5.2.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8010079</code></a> Merge pull request <a href="">#987</a> from BrianPugh/feat/powershell-completion-static</li>
<li><a href=""><code>00207c4</code></a> Rename CYCLOPTS_COMPLETE_WORDS to CYCLOPTS_COMPLETION_WORDS</li>
<li><a href=""><code>28ed131</code></a> fix: align static PowerShell completion with cyclopts parsing</li>
<li><a href=""><code>42359dd</code></a> test: pass the PowerShell completion suite on Windows PowerShell 5.1</li>
<li><a href=""><code>863d6d2</code></a> feat: generate static PowerShell completion scripts; run Python only for comp...</li>
<li><a href=""><code>85ad7a5</code></a> fix: case-insensitive PowerShell completion and non-ASCII-safe profile paths</li>
<li><a href=""><code>365cefa</code></a> fix: complete each command's own help/version flags and keep PowerShell scrip...</li>
<li><a href=""><code>8f26f80</code></a> fix: complete PowerShell file names literally and store absolute -o paths in ...</li>
<li><a href=""><code>669cef9</code></a> fix: never alter existing rc/profile bytes when adding the completion loader</li>
<li><a href=""><code>22b0a10</code></a> docs: note that --shell powershell covers both editions and installs per edition</li>
<li>Additional commits viewable in <a href="https://github.com/BrianPugh/cyclopts/compare/v5.1.1...v5.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `griffelib` from 2.3.0 to 2.3.2

Updates `iniconfig` from 2.3.0 to 2.3.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/iniconfig/releases">iniconfig's releases</a>.</em></p>
<blockquote>
<h2>Version 2.3.1</h2>
<h2>Fixes</h2>
<ul>
<li>Parsing values with many continuation lines is now linear instead of quadratic in time (<a href="">#78</a>, regarding <a href="">#77</a>).</li>
<li>A leading UTF-8 BOM is now stripped when reading INI files. Files saved by Windows editors used to fail with <code>ParseError</code> (<a href="">#76</a>, thanks <a href="https://github.com/Pitchfork-and-Torch"><code>@​Pitchfork-and-Torch</code></a>).</li>
</ul>
<h2>Internal</h2>
<ul>
<li><code>iniconfig._parse.ParsedLine.value</code> is now a list of lines. This is private API.</li>
</ul>
<h2>Docs</h2>
<ul>
<li>The README example now uses <code>IniConfig.parse()</code> (<a href="">#79</a>, thanks <a href="https://github.com/MbappeWU"><code>@​MbappeWU</code></a>).</li>
<li>Fixed the issue tracker link (<a href="">#74</a>, thanks <a href="https://github.com/stefan6419846"><code>@​stefan6419846</code></a>).</li>
</ul>
<p><strong>Full diff:</strong> <a href="https://github.com/pytest-dev/iniconfig/compare/v2.3.0...v2.3.1">https://github.com/pytest-dev/iniconfig/compare/v2.3.0...v2.3.1</a></p>
<h2>What's Changed</h2>
<ul>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pytest-dev/iniconfig#71</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pytest-dev/iniconfig#72</a></li>
<li>Fix link to issues by <a href="https://github.com/stefan6419846"><code>@​stefan6419846</code></a> in <a href="">pytest-dev/iniconfig#74</a></li>
<li>parse_lines: keep values as list of lines, join once by <a href="https://github.com/RonnyPfannschmidt"><code>@​RonnyPfannschmidt</code></a> in <a href="">pytest-dev/iniconfig#78</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pytest-dev/iniconfig#73</a></li>
<li>test: expect sorted <strong>all</strong> after ruff autofix by <a href="https://github.com/RonnyPfannschmidt"><code>@​RonnyPfannschmidt</code></a> in <a href="">pytest-dev/iniconfig#80</a></li>
<li>docs: use parse API in the README example by <a href="https://github.com/MbappeWU"><code>@​MbappeWU</code></a> in <a href="">pytest-dev/iniconfig#79</a></li>
<li>Strip leading UTF-8 BOM when reading INI files by <a href="https://github.com/Pitchfork-and-Torch"><code>@​Pitchfork-and-Torch</code></a> in <a href="">pytest-dev/iniconfig#76</a></li>
<li>changelog: add BOM stripping (<a href="">#76</a>) to 2.3.1 by <a href="https://github.com/RonnyPfannschmidt"><code>@​RonnyPfannschmidt</code></a> in <a href="">pytest-dev/iniconfig#81</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/stefan6419846"><code>@​stefan6419846</code></a> made their first contribution in <a href="">pytest-dev/iniconfig#74</a></li>
<li><a href="https://github.com/MbappeWU"><code>@​MbappeWU</code></a> made their first contribution in <a href="">pytest-dev/iniconfig#79</a></li>
<li><a href="https://github.com/Pitchfork-and-Torch"><code>@​Pitchfork-and-Torch</code></a> made their first contribution in <a href="">pytest-dev/iniconfig#76</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pytest-dev/iniconfig/compare/v2.3.0...v2.3.1">https://github.com/pytest-dev/iniconfig/compare/v2.3.0...v2.3.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/iniconfig/blob/main/CHANGELOG">iniconfig's changelog</a>.</em></p>
<blockquote>
<h1>2.3.1</h1>
<ul>
<li>fix quadratic parse time for values with many continuation lines (<a href="">#78</a>, regarding <a href="">#77</a>)</li>
<li>strip a leading UTF-8 BOM when reading INI files, which previously raised <code>ParseError</code> (<a href="">#76</a>)</li>
<li>internal: <code>iniconfig._parse.ParsedLine.value</code> is now a list of lines</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>316fbfa</code></a> changelog: add BOM stripping (<a href="">#76</a>) to 2.3.1 (<a href="">#81</a>)</li>
<li><a href=""><code>d2dcb72</code></a> Strip leading UTF-8 BOM when reading INI files (<a href="">#76</a>)</li>
<li><a href=""><code>40d8c03</code></a> Merge pull request <a href="">#79</a> from MbappeWU/codex/docs-parse-inline-comments</li>
<li><a href=""><code>48359c3</code></a> Merge pull request <a href="">#80</a> from pytest-dev/claude/fix-iniconfig-test-eukh2n</li>
<li><a href=""><code>b153213</code></a> test: expect sorted <strong>all</strong> after ruff RUF022 autofix</li>
<li><a href=""><code>4fddfab</code></a> Merge pull request <a href="">#73</a> from pytest-dev/pre-commit-ci-update-config</li>
<li><a href=""><code>15852c2</code></a> [pre-commit.ci] auto fixes from pre-commit.com hooks</li>
<li><a href=""><code>2e68639</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>23c9e08</code></a> docs: use parse API in the README example</li>
<li><a href=""><code>e038536</code></a> Merge pull request <a href="https://redirect.github.com/pytest-...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d811935b8397`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.