# Issue

**Title:** [dependabot]: Bump the deps group with 22 updates

## Description

Bumps the deps group with 22 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.32.6` | `4.0.1` |
| [jupyter-server-proxy](https://github.com/jupyterhub/jupyter-server-proxy) | `4.5.0` | `4.6.0` |
| [pandas](https://github.com/pandas-dev/pandas) | `3.0.5` | `3.0.6` |
| [threadpoolctl](https://github.com/joblib/threadpoolctl) | `3.6.0` | `3.7.0` |
| [anyio](https://github.com/agronholm/anyio) | `4.14.2` | `4.15.1` |
| [cyclopts](https://github.com/BrianPugh/cyclopts) | `4.25.2` | `4.25.3` |
| [edfio](https://github.com/the-siesta-group/edfio) | `0.4.16` | `0.4.17` |
| [fsspec](https://github.com/fsspec/filesystem_spec) | `2026.7.0` | `2026.9.0` |
| [idna](https://github.com/kjd/idna) | `3.19` | `3.20` |
| [jh2](https://github.com/jawah/h2) | `5.0.14` | `5.0.15` |
| [jupyter-server](https://github.com/jupyter-server/jupyter_server) | `2.21.0` | `2.21.1` |
| [lazy-loader](https://github.com/scientific-python/lazy-loader) | `0.5` | `0.6` |
| [multidict](https://github.com/aio-libs/multidict) | `6.8.0` | `6.9.1` |
| [platformdirs](https://github.com/tox-dev/platformdirs) | `4.11.8` | `4.11.12` |
| [portalocker](https://github.com/wolph/portalocker) | `4.3.2` | `4.4.0` |
| [propcache](https://github.com/aio-libs/propcache) | `0.5.2` | `0.5.4` |
| [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) | `11.0.2` | `12.0.1` |
| [pyparsing](https://github.com/pyparsing/pyparsing) | `3.3.2` | `3.3.3` |
| [qh3](https://github.com/jawah/qh3) | `1.9.4` | `2.0.3` |
| [tornado](https://github.com/tornadoweb/tornado) | `6.5.9` | `6.5.10` |
| [urllib3](https://github.com/urllib3/urllib3) | `2.7.0` | `2.8.0` |
| [yarl](https://github.com/aio-libs/yarl) | `1.24.5` | `1.25.1` |

Updates `filelock` from 3.32.6 to 4.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.0.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>fix: reject invalid poll_interval before sleep by <a href="https://github.com/Pitchfork-and-Torch"><code>@​Pitchfork-and-Torch</code></a> in <a href="">tox-dev/filelock#739</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Pitchfork-and-Torch"><code>@​Pitchfork-and-Torch</code></a> made their first contribution in <a href="">tox-dev/filelock#739</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.0.0...4.0.1">https://github.com/tox-dev/filelock/compare/4.0.0...4.0.1</a></p>
<h2>4.0.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(soft-rw): replace the state mutex with a generation log by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#738</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.32.7...4.0.0">https://github.com/tox-dev/filelock/compare/3.32.7...4.0.0</a></p>
<h2>3.32.7</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Fix final symlink test on musl by <a href="https://github.com/lprnmns"><code>@​lprnmns</code></a> in <a href="">tox-dev/filelock#737</a></li>
<li>📝 docs: say acquire() falls back to the lock's blocking attribute by <a href="https://github.com/hxperl"><code>@​hxperl</code></a> in <a href="">tox-dev/filelock#733</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/hxperl"><code>@​hxperl</code></a> made their first contribution in <a href="">tox-dev/filelock#733</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.32.6...3.32.7">https://github.com/tox-dev/filelock/compare/3.32.6...3.32.7</a></p>
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
<p>4.0.3 (2026-09-23)</p>
<hr />
<ul>
<li>Importing filelock on CPython 3.10 or 3.11 no longer makes new threads fail with <code>RuntimeError: Cannot install a trace function while another trace function is being installed</code> under coverage or a debugger. filelock skips its fork-safety
audit hook there, so forking from inside a thread's own lock-state transition no longer raises immediately on those
versions. :pr:<code>747</code></li>
</ul>
<hr />
<p>4.0.2 (2026-09-23)</p>
<hr />
<ul>
<li>Concurrent <code>acquire()</code> and <code>release()</code> on a <code>thread_local=False</code> lock no longer leak the OS lock, close a
descriptor twice, drop a lease token, or leave a false deadlock after a cross-thread release (:issue:<code>744</code>). :pr:<code>745</code></li>
<li>:class:<code>~filelock.AsyncReadWriteLock</code> and :class:<code>~filelock.AsyncSoftReadWriteLock</code> now give each <code>asyncio</code> task its
own hold, so tasks sharing one instance no longer enter the write lock together. :pr:<code>746</code></li>
<li>Correct the async cache example to create its data directory and clarify automatic creation of lock-file parent directories. :pr:<code>740</code></li>
<li>Exclude sphinx-llm 1.1.0 from documentation dependencies because its Markdown builder emits unknown-node warnings. :pr:<code>742</code></li>
</ul>
<hr />
<p>4.0.1 (2026-09-19)</p>
<hr />
<ul>
<li><code>poll_interval</code> is now validated at construction, on the setter, and on <code>acquire()</code>: a negative, non-finite, or
non-numeric value raises :class:<code>ValueError</code>/:class:<code>TypeError</code> immediately instead of failing inside <code>time.sleep</code>. :pr:<code>739</code></li>
</ul>
<hr />
<p>4.0.0 (2026-09-17)</p>
<hr />
<ul>
<li>The :class:<code>~filelock.SoftReadWriteLock</code> on-disk protocol is a generation log under <code>&lt;path&gt;.rw</code>, and a process
running an earlier release does not see it: an old and a new participant on one lock path do not exclude each
other. Stop every participant, upgrade them all, then restart them; the new code ignores leftover <code>.state</code>,
<code>.write</code> and <code>.readers/</code> files, and you can delete them. The filesystem must provide no-replace hard links, as
it must for :class:<code>~filelock.StrictSoftFileLock</code>, so a runtime without <code>os.link</code> raises
:class:<code>~filelock.SoftFileLockProtocolError</code> on acquire. Constructing a singleton again with a different
<code>on_compromise</code>, or with <code>poll_interval</code> at or above <code>stale_threshold</code>, now raises :class:<code>ValueError</code>. :pr:<code>735</code></li>
<li>:class:<code>~filelock.SoftReadWriteLock</code> exposes :attr:<code>~filelock.SoftReadWriteLock.generation</code> as a fencing token for
the protected resource and reports a lost hold through <code>on_compromise</code> and
:attr:<code>~filelock.SoftReadWriteLock.compromise</code>. :pr:<code>735</code></li>
<li>:class:<code>~filelock.SoftReadWriteLock</code> no longer deadlocks when a holder dies on another host mid-transition, and</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b5016c4</code></a> Release 4.0.1</li>
<li><a href=""><code>6ee6db6</code></a> fix: reject invalid poll_interval before sleep (<a href="">#739</a>)</li>
<li><a href=""><code>7e57436</code></a> Release 4.0.0</li>
<li><a href=""><code>f974328</code></a> 🐛 fix(soft-rw): replace the state mutex with a generation log (<a href="">#738</a>)</li>
<li><a href=""><code>20929f7</code></a> Release 3.32.7</li>
<li><a href=""><code>35f07c4</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#736</a>)</li>
<li><a href=""><code>e860d39</code></a> 📝 docs: say acquire() falls back to the lock's blocking attribute (<a href="">#733</a>)</li>
<li><a href=""><code>c530efe</code></a> Fix final symlink test on musl (<a href="">#737</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.32.6...4.0.1">compare view</a></li>
</ul>
</details>
<br />

Updates `jupyter-server-proxy` from 4.5.0 to 4.6.0
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4d49cb9</code></a> Bump to 4.6.0</li>
<li><a href=""><code>f141bcd</code></a> Merge pull request <a href="">#618</a> from minrk/cl46</li>
<li><a href=""><code>b4ca9b9</code></a> changelog for 4.6.0</li>
<li><a href=""><code>a7858d0</code></a> Merge pull request <a href="">#610</a> from minrk/bump-meta</li>
<li><a href=""><code>7e9a9ae</code></a> Restore re import dropped during merge conflict resolution.</li>
<li><a href=""><code>842752f</code></a> Merge branch 'main' into bump-meta</li>
<li><a href=""><code>8215f00</code></a> Merge pull request <a href="">#617</a> from jupyterhub/pre-commit-ci-update-config</li>
<li><a href=""><code>b6719a2</code></a> Merge pull request <a href="">#609</a> from minrk/allow-exclude</li>
<li><a href=""><code>af27d7d</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>10f0b0e</code></a> Revert &quot;debug logs&quot;</li>
<li>Additional commits viewable in <a href="https://github.com/jupyterhub/jupyter-server-proxy/compare/v4.5.0...v4.6.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pandas` from 3.0.5 to 3.0.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>pandas 3.0.6</h2>
<p>We are pleased to announce the release of pandas 3.0.6.
This is a patch release in the 3.0.x series and includes some regression fixes and bug fixes. We recommend that all users of the 3.0.x series upgrade to this version. This is also the first release to support Python 3.15.</p>
<p>See the <a href="https://pandas.pydata.org/docs/whatsnew/v3.0.6.html">full whatsnew</a> for a list of all the changes.</p>
<p>Pandas 3.0 supports Python 3.11 and higher.
The release can be installed from PyPI:</p>
<pre><code>python -m pip install --upgrade pandas==3.0.*
</code></pre>
<p>Or from conda-forge</p>
<pre><code>conda install -c conda-forge pandas=3.0
</code></pre>
<p>Please report any issues with the release on the <a href="https://github.com/pandas-dev/pandas/issues">pandas issue tracker</a>.</p>
<p>Thanks to all the contributors who made this release possible.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2905718</code></a> RLS: 3.0.6</li>
<li><a href=""><code>3188ced</code></a> [backport 3.0.x]  BUG: read_csv(sep=None) raised TypeError instead of falling...</li>
<li><a href=""><code>f097905</code></a> DOC: cleanup 3.0.6 whatsnew + mention Python 3.15 support (<a href="">#68965</a>) (<a href="">#68969</a>)</li>
<li><a href=""><code>4f68223</code></a> [backport 3.0.x] BUG: fix setting with bool column mask into 1-column DataFra...</li>
<li><a href=""><code>e3df0e8</code></a> [backport 3.0.x] BUG: full-slice setitem into a pyarrow-backed array shared m...</li>
<li><a href=""><code>b7735f6</code></a> Backport PR <a href="">#66117</a> on branch 3.0.x (BUG: interpolate leaving NAs unfilled for...</li>
<li><a href=""><code>bca0b77</code></a> [backport 3.0.x] BUG: read_csv leaked the string-intern table when a column f...</li>
<li><a href=""><code>bca1e5d</code></a> [backport 3.0.x] BUG: prevent external mutation of RangeIndex._data (CoW) (<a href="">#6</a>...</li>
<li><a href=""><code>c95b42c</code></a> [3.0.x] CI: skip cython-lint on pre-commit.ci (<a href="">#68910</a>)</li>
<li><a href=""><code>9cbd884</code></a> [backport 3.0.x] Backport of some already merged regression fixes (<a href="">#68447</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v3.0.5...v3.0.6">compare view</a></li>
</ul>
</details>
<br />

Updates `threadpoolctl` from 3.6.0 to 3.7.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/joblib/threadpoolctl/blob/master/CHANGES.md">threadpoolctl's changelog</a>.</em></p>
<blockquote>
<h1>3.7.0 (2026-09-15)</h1>
<ul>
<li>
<p>Fixed an intermittent <code>OSError</code> on Windows when DLLs are loaded or unloaded
concurrently during library discovery (for example when importing conda-forge
OpenCV). On Python 3.14+, discovery uses <code>ctypes.util.dllist</code> when available.
If <code>dllist</code> raises <code>OSError</code>, threadpoolctl emits a <code>RuntimeWarning</code> instead
of crashing so the failure can be reported upstream with a minimal
reproducer. Older Pythons use a Toolhelp snapshot enumerator, with graceful
per-module fallbacks.
<a href="">joblib/threadpoolctl#219</a></p>
</li>
<li>
<p>Added the ability to check whether a limiting API affects just the current
thread or the whole process. Mainly aimed at debugging and diagnostics, and
somewhat unreliable, it is therefore enabled by default only for command-line
usage.
<a href="">joblib/threadpoolctl#213</a></p>
</li>
<li>
<p>Only warn about simultaneous <code>libomp</code> and <code>libiomp</code> usage on Linux, where the
incompatibility is known to cause crashes.
<a href="">joblib/threadpoolctl#222</a></p>
</li>
<li>
<p>Fixed a deadlock triggered by getting or setting MKL's number of threads from
parallel threads when using MKL with libiomp (Intel threading) on Linux.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>Going forward, setting the number of threads will only have a thread-local
impact if feasible (for example, at minimum the underlying library must
support this option, and many don't.)
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>For MKL, setting the number of threads is now thread-local, i.e. limiting the
number of threads won't impact MKL's thread pool size when using MKL in other
Python threads.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>For OpenBLAS compiled with OpenMP on Linux and macOS, setting the number of
threads is now thread-local, i.e. won't impact OpenBLAS thread pool size in
other Python threads. On Windows behavior is likely process-wide, but this may
depend on how OpenBLAS was compiled with OpenMP.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>Fix OpenBLAS detection for conda package on Windows
<a href="">joblib/threadpoolctl#240</a></p>
</li>
<li>
<p>Fixed a deadlock on Linux when using threadpoolctl from multiple threads.
<a href="">joblib/threadpoolctl#243</a></p>
<ul>
<li>Start using Python 3.14's built-in support for listing shared libraries.</li>
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
<li><a href=""><code>75e1860</code></a> Release 3.7.0 (<a href="">#247</a>)</li>
<li><a href=""><code>473f239</code></a> Display debugging info in CI inspection script (<a href="">#245</a>)</li>
<li><a href=""><code>318125e</code></a> Avoid ctypes callbacks when listing libraries on Linux. (<a href="">#242</a>)</li>
<li><a href=""><code>f05893f</code></a> FIX intermittent Windows module enumeration failure (<a href="">#219</a>)</li>
<li><a href=""><code>c686683</code></a> Fix threading-related deadlocks, and also add support for Python's built-in l...</li>
<li><a href=""><code>ba03124</code></a> FIX Fix OpenBLAS detection for conda package on Windows (<a href="">#240</a>)</li>
<li><a href=""><code>9ac1881</code></a> MNT Add faulthandler to empirical observation (<a href="">#241</a>)</li>
<li><a href=""><code>1ac9590</code></a> Document using limiting APIs for Python thread pools (<a href="">#234</a>)</li>
<li><a href=""><code>bcbee28</code></a> Add missing PR to changelog</li>
<li><a href=""><code>261389f</code></a> CI Fix compilation issue with OpenMP inside conda env (<a href="">#237</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/joblib/threadpoolctl/compare/3.6.0...3.7.0">compare view</a></li>
</ul>
</details>
<br />

Updates `anyio` from 4.14.2 to 4.15.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/agronholm/anyio/releases">anyio's releases</a>.</em></p>
<blockquote>
<h2>4.15.1</h2>
<ul>
<li>Implemented a compatibility fix for supporting direct access of <code>anyio.*</code> submodules from the main package even when those submodules were not directly imported first (<!-- raw HTML omitted --><a href="">#1311</a> &lt;<a href="">agronholm/anyio#1311</a><!-- raw HTML omitted -->)</li>
</ul>
<h2>4.15.0</h2>
<ul>
<li>
<p>Added support for the newer keyword-only arguments on <code>anyio.Path</code> methods to match the standard library <code>pathlib.Path</code>:</p>
<ul>
<li><code>follow_symlinks</code> on <code>exists()</code> (Python 3.12+)</li>
<li><code>follow_symlinks</code> on <code>is_dir()</code> (Python 3.13+)</li>
<li><code>follow_symlinks</code> on <code>is_file()</code> (Python 3.13+)</li>
<li><code>follow_symlinks</code> on <code>owner()</code> (Python 3.13+)</li>
<li><code>follow_symlinks</code> on <code>group()</code> (Python 3.13+)</li>
<li><code>newline</code> on <code>read_text()</code> (Python 3.13+)</li>
</ul>
<p>(<a href="">#1286</a>, <a href="">#1293</a>; PR by <a href="https://github.com/jaideeppyne"><code>@​jaideeppyne</code></a>)</p>
</li>
<li>
<p>Added <code>amap</code>, <code>gather</code>, and <code>as_completed</code> utility functions to simplify common patterns (<a href="">#1173</a>; PR by <a href="https://github.com/Graeme22"><code>@​Graeme22</code></a>)</p>
</li>
<li>
<p>Added <code>--anyio-mode</code> command-line option as an alternative to the <code>anyio_mode</code> ini setting, and fix the pytest plugin's auto mode detection to recognize the mode when set via either mechanism(e.g: <code>pytest_asyncio</code>). (<a href="">#1242</a>; PR by <a href="https://github.com/EmmanuelNiyonshuti"><code>@​EmmanuelNiyonshuti</code></a>)</p>
</li>
<li>
<p>Added the <code>anyio.Future</code> synchronization primitive which behaves similar to <code>asyncio.Future</code>, allowing tasks to wait for a value (or exception) from another task (<a href="">#1146</a>; PR by <a href="https://github.com/Vizonex"><code>@​Vizonex</code></a>)</p>
</li>
<li>
<p>Added guidance for managing multiple memory object stream producers and consumers with cloned streams (<a href="">#330</a>; PR by <a href="https://github.com/nightcityblade"><code>@​nightcityblade</code></a>)</p>
</li>
<li>
<p>Added <code>StapledObjectStream.send_nowait()</code> that delegates to the underlying <code>ObjectSendStream</code>, if it implements it (<a href="">#1241</a>; PR by <a href="https://github.com/davidbrochart"><code>@​davidbrochart</code></a>)</p>
</li>
<li>
<p>Added the <code>move_on_at()</code> and <code>fail_at()</code> functions to complement <code>move_on_after()</code> and <code>fail_after()</code></p>
</li>
<li>
<p>Changed the default name for a task spawned with <code>TaskGroup.create_task(func())</code> to match the default task name for the analogous task spawned with <code>TaskGroup.start_soon(func)</code> or <code>TaskGroup.start(func)</code> in more situations. Previously, the default name of a <code>TaskGroup.create_task</code> task never included the module name. (The default name for a task spawned with <code>TaskGroup.start_soon</code> or <code>TaskGroup.start</code> typically includes the module name.) (<a href="">#1234</a>; PR by <a href="https://github.com/gschaffner"><code>@​gschaffner</code></a>)</p>
</li>
<li>
<p>Changed the <code>anyio</code> and <code>anyio.abc</code> modules to lazily (much like <code>810</code>) import the necessary submodules. This is done by parsing the AST of the module and building a lookup table from the <code>if TYPE_CHECKING:</code> block. A fallback mode has been provided for installations where the source code is unavailable (e.g. PyInstaller). (<a href="">#1169</a>)</p>
</li>
<li>
<p>Fixed free-threading compatibility issues arising from the fact that on Python 3.14 free-threading builds, newly created threads inherit the current context by default, causing AnyIO to behave erroneously in relation to <code>start_blocking_portal()</code> and <code>anyio.to_thread.run_sync()</code> (<a href="">#1224</a>; PR by <a href="https://github.com/EmmanuelNiyonshuti"><code>@​EmmanuelNiyonshuti</code></a>)</p>
</li>
<li>
<p>Fixed <code>SpooledTemporaryFile.readinto()</code> and <code>readinto1()</code> reading twice before rollover, so the destination buffer was overwritten by the second read and the file position advanced twice, silently losing data (<a href="">#1215</a>; PR by <a href="https://github.com/c-tonneslan"><code>@​c-tonneslan</code></a>)</p>
</li>
<li>
<p>Added a <code>reason</code> parameter to <code>fail_after</code> (and the new <code>fail_at</code>) allowing for added exception context when raising <code>TimeoutError</code> (<a href="">#1227</a>; PR by <a href="https://github.com/Graeme22"><code>@​Graeme22</code></a>)</p>
</li>
<li>
<p>Fixed the default <code>TaskHandle.name</code> missing part of the task name for tasks started with <code>TaskGroup.start</code> on Trio (<a href="">#1231</a>; PR by <a href="https://github.com/gschaffner"><code>@​gschaffner</code></a>)</p>
</li>
<li>
<p>Fixed <code>anyio.run</code> leaking, or at least, delaying collection of loop and root_task due to the root task being cached in a <code>RunVar</code>. (<a href="">#1203</a>; PR by <a href="https://github.com/tapetersen"><code>@​tapetersen</code></a>)</p>
</li>
<li>
<p>Fixed <code>anyio.Path.with_stem()</code> silently producing a wrong path (e.g. <code>Path(&quot;.txt&quot;)</code>) instead of raising <code>ValueError</code> when given an empty stem on a path with a non-empty suffix, unlike <code>pathlib.PurePath.with_stem</code> (<a href="">#1200</a>; PR by <a href="https://github.com/Sanjays2402"><code>@​Sanjays2402</code></a>)</p>
</li>
<li>
<p>Fixed <code>UNIXSocketStream.aclose()</code> raising <code>asyncio.InvalidStateError</code> when a concurrent receive or send operation had just been cancelled on the asyncio backend (<a href="">#1267</a>; PR by <a href="https://github.com/alloutflo"><code>@​alloutflo</code></a>)</p>
</li>
<li>
<p>Fixed the pytest plugin importing the deprecated <code>_pytest.python.CallSpec2</code> alias, which triggers <code>PytestRemovedIn10Warning</code> on <code>pytest&gt;=9.2</code> and crashes pytest at startup when <code>filterwarnings = error</code> is configured (<a href="">#1271</a>; PR by <a href="https://github.com/matthewfeickert"><code>@​matthewfeickert</code></a>)</p>
</li>
<li>
<p>Fixed an asyncio worker thread race that could raise <code>RuntimeError</code> when the event loop closed between checking its state and scheduling the worker result (<a href="">#1265</a>; PR by <a href="https://github.com/hansu650"><code>@​hansu650</code></a>)</p>
</li>
<li>
<p>Fixed <code>CapacityLimiter</code> on the asyncio backend over-granting tokens when <code>total_tokens</code> was raised while the limiter was over-subscribed (<a href="">#1223</a>; PR by <a href="https://github.com/zelinewang"><code>@​zelinewang</code></a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ffcd154</code></a> Bumped up the version</li>
<li><a href=""><code>0ecf5ed</code></a> Added a workaround for third party code accessing unimported submodules (<a href="">#1309</a>)</li>
<li><a href=""><code>9283662</code></a> Bumped up the version</li>
<li><a href=""><code>d137692</code></a> Improved the instructions for AI agents</li>
<li><a href=""><code>033fc52</code></a> Shield TemporaryDirectory cleanup from cancellation (<a href="">#1304</a>)</li>
<li><a href=""><code>942e9a6</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1305</a>)</li>
<li><a href=""><code>b825c3b</code></a> Fixed pyproject.toml changes not triggering the test suite</li>
<li><a href=""><code>9727dc5</code></a> Fixed start inconsistencies between trio and asyncio (<a href="">#1198</a>)</li>
<li><a href=""><code>b05fe6d</code></a> Fixed wrong type in move_on_after (<a href="">#1297</a>)</li>
<li><a href=""><code>44d0c93</code></a> Fixed asyncio task group coroutine cleanup (<a href="">#1275</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/agronholm/anyio/compare/4.14.2...4.15.1">compare view</a></li>
</ul>
</details>
<br />

Updates `cyclopts` from 4.25.2 to 4.25.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/BrianPugh/cyclopts/releases">cyclopts's releases</a>.</em></p>
<blockquote>
<h2>v4.25.3</h2>
<h2>Bug Fixes</h2>
<ul>
<li>Fix nested json-object parsing by routing JSON-object tokens through the <code>Argument</code> layer (<a href="">#953</a>) by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#954</a></li>
<li>Recognize a JSON-object token for types whose fields consume all tokens by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#955</a></li>
<li>Explain unhashable element types when converting to <code>set</code>/<code>frozenset</code> by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#956</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v4.25.2...v4.25.3">https://github.com/BrianPugh/cyclopts/compare/v4.25.2...v4.25.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>83213cc</code></a> Merge pull request <a href="">#956</a> from BrianPugh/fix-set-unhashable-element-diagnostic</li>
<li><a href=""><code>38f420c</code></a> test: cover frozenset in the unhashable-element diagnostic test</li>
<li><a href=""><code>fcabba2</code></a> fix: match Python 3.14's reworded unhashable-type error</li>
<li><a href=""><code>1ae3f52</code></a> fix: explain unhashable element types when converting to set/frozenset</li>
<li><a href=""><code>3b2765c</code></a> Merge pull request <a href="">#955</a> from BrianPugh/fix-convert-json-token-consume-all</li>
<li><a href=""><code>1cca9d6</code></a> fix: recognize a JSON-object token for types whose fields consume all tokens</li>
<li><a href=""><code>72a0c63</code></a> Merge pull request <a href="">#954</a> from BrianPugh/fix-list-of-model-nested-collection-953</li>
<li><a href=""><code>4b06e0a</code></a> fix: validate JSON-object elements and honor explicit null in nested fields</li>
<li><a href=""><code>4b81d98</code></a> test: cover JSON-object element routing across sources, containers, and error...</li>
<li><a href=""><code>2d77dac</code></a> fix: route JSON-object tokens through the Argument layer (<a href="">#953</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/BrianPugh/cyclopts/compare/v4.25.2...v4.25.3">compare view</a></li>
</ul>
</details>
<br />

Updates `edfio` from 0.4.16 to 0.4.17
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/the-siesta-group/edfio/blob/main/CHANGELOG.md">edfio's changelog</a>.</em></p>
<blockquote>
<h2>[0.4.17] - 2026-09-21</h2>
<h3>Fixed</h3>
<ul>
<li>Always use four digits for the birthdate year in the local patient identification header (<a href="">#118</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fbc2b17</code></a> Update CHANGELOG.md for v0.4.17</li>
<li><a href=""><code>cc4a98e</code></a> Merge pull request <a href="">#118</a> from the-siesta-group/birthdate</li>
<li><a href=""><code>df296d3</code></a> always use 4 digits to encode birthdate year</li>
<li><a href=""><code>95cca1a</code></a> Support scm versioning from git archives (<a href="">#115</a>)</li>
<li><a href=""><code>93505c0</code></a> Test with python 3.15 (<a href="">#113</a>)</li>
<li>See full diff in <a href="https://github.com/the-siesta-group/edfio/compare/v0.4.16...v0.4.17">compare view</a></li>
</ul>
</details>
<br />

Updates `fsspec` from 2026.7.0 to 2026.9.0
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f76baa</code></a> changelog (<a href="">#2166</a>)</li>
<li><a href=""><code>695f831</code></a> Add age-based cleanup for simplecache (<a href="">#2118</a>)</li>
<li><a href=""><code>42aa468</code></a> Mirror <code>readinto</code> from the pyarrow stream onto <code>ArrowFile</code> (<a href="">#2111</a>)</li>
<li><a href=""><code>4a4e6ae</code></a> Make the SFTP host key policy configurable (<a href="">#2126</a>)</li>
<li><a href=""><code>a0ce6db</code></a> Normalize paths in AsyncFileSystemWrapper like the wrapped filesystem (<a href="">#2159</a>)</li>
<li><a href=""><code>c5fea6d</code></a> Fix cat_ranges on whole-file caches after <a href="">#2154</a> (<a href="">#2163</a>)</li>
<li><a href=""><code>9efb18b</code></a> Patch HAS_CPYTHON_API where _fast_slice reads it (<a href="">#2164</a>)</li>
<li><a href=""><code>27bcd35</code></a> feat(AdaptiveReadaheadCache): introducing a new cache-type adaptive (<a href="">#2093</a>)</li>
<li><a href=""><code>a681aca</code></a> Ignore a leading slash in TarFileSystem paths (<a href="">#2148</a>)</li>
<li><a href=""><code>57c55f8</code></a> Make names relative in DirFileSystem.walk(detail=True) (<a href="">#2160</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/fsspec/filesystem_spec/compare/2026.7.0...2026.9.0">compare view</a></li>
</ul>
</details>
<br />

Updates `idna` from 3.19 to 3.20
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/kjd/idna/releases">idna's releases</a>.</em></p>
<blockquote>
<h2>v3.20</h2>
<ul>
<li>Update to Unicode 18.0.0.</li>
<li>Better enforcement of the domain length limit in the incremental
codec.</li>
<li>Add support for Python 3.15.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/kjd/idna/blob/master/HISTORY.md">idna's changelog</a>.</em></p>
<blockquote>
<h2>3.20 (2026-09-17)</h2>
<ul>
<li>Update to Unicode 18.0.0.</li>
<li>Better enforcement of the domain length limit in the incremental
codec.</li>
<li>Add support for Python 3.15.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d55e65e</code></a> Release 3.20</li>
<li><a href=""><code>0c0824a</code></a> Pre-release 3.20rc0</li>
<li><a href=""><code>bd7c316</code></a> Note Python 3.15 support in the 3.20 changelog</li>
<li><a href=""><code>b6cce85</code></a> Merge pull request <a href="">#276</a> from kjd/unicode-18</li>
<li><a href=""><code>9a4bc59</code></a> Update to Unicode 18.0.0</li>
<li><a href=""><code>dfab5a0</code></a> Merge branch 'python-3.15'</li>
<li><a href=""><code>417c354</code></a> Read the latest Unicode version from the DerivedAge.txt header instead of the...</li>
<li><a href=""><code>cd17392</code></a> Merge pull request <a href="">#274</a> from kjd/fix-decode-length-check</li>
<li><a href=""><code>c5796d7</code></a> Skip the decode round-trip check for domains past encode's length limit</li>
<li><a href=""><code>d6ee690</code></a> Update to Python 3.15 release candidate in CI and add trove classifier</li>
<li>Additional commits viewable in <a href="https://github.com/kjd/idna/compare/v3.19...v3.20">compare view</a></li>
</ul>
</details>
<br />

Updates `jh2` from 5.0.14 to 5.0.15
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/h2/releases">jh2's releases</a>.</em></p>
<blockquote>
<h2>Version 5.0.15</h2>
<h2>5.0.15 (2026-09-21)</h2>
<ul>
<li>General performance improvement. Up to 5% in typical workloads, especially with CPython 3.11+</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/h2/blob/master/CHANGELOG.rst">jh2's changelog</a>.</em></p>
<blockquote>
<h2>5.0.15 (2026-09-21)</h2>
<ul>
<li>General performance improvement. Up to 5% in typical workloads, especially with CPython 3.11+</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3b08a9e</code></a> chore: last minute adjustment post mem leak finding</li>
<li><a href=""><code>4e368c2</code></a> Merge pull request <a href="">#59</a> from jawah/release-5.0.15</li>
<li><a href=""><code>5acd603</code></a> test: skip known pypy edge failures</li>
<li><a href=""><code>6d4e2f5</code></a> test: skip when tracemalloc isn't available (pypy)</li>
<li><a href=""><code>2a9f6c4</code></a> fix: improve soundness+perf of buf implementation</li>
<li><a href=""><code>66120a4</code></a> docs: write changelog for 5.0.15</li>
<li><a href=""><code>22b73e8</code></a> chore: update CI to incl abi3 cp311 alt build</li>
<li><a href=""><code>1858ee3</code></a> perf: more efficient private BytesQueueBuffer + allow abi3 cp311 alt build</li>
<li>See full diff in <a href="https://github.com/jawah/h2/compare/v5.0.14...v5.0.15">compare view</a></li>
</ul>
</details>
<br />

Updates `jupyter-server` from 2.21.0 to 2.21.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/releases">jupyter-server's releases</a>.</em></p>
<blockquote>
<h2>v2.21.1</h2>
<h2>2.21.1</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.21.0...00d45c80eeb0f50f191b236ee47cc1d82a7db9ca">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Fix compatibility with Tornado v6.5.9+ Jupyter <a href="">#1703</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/andrii-i"><code>@​andrii-i</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Fix broken link, link to actually useful resources on OWASP <a href="">#1704</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/jtpio"><code>@​jtpio</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-08-27&amp;to=2026-09-15&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/andrii-i"><code>@​andrii-i</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aandrii-i+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>) | <a href="https://github.com/jtpio"><code>@​jtpio</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ajtpio+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>)</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/blob/main/CHANGELOG.md">jupyter-server's changelog</a>.</em></p>
<blockquote>
<h2>2.21.1</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.21.0...00d45c80eeb0f50f191b236ee47cc1d82a7db9ca">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Fix compatibility with Tornado v6.5.9+ Jupyter <a href="">#1703</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/andrii-i"><code>@​andrii-i</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Fix broken link, link to actually useful resources on OWASP <a href="">#1704</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/jtpio"><code>@​jtpio</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-08-27&amp;to=2026-09-15&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/andrii-i"><code>@​andrii-i</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aandrii-i+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>) | <a href="https://github.com/jtpio"><code>@​jtpio</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ajtpio+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-08-27..2026-09-15&amp;type=Issues">activity</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ca88f7e</code></a> Publish 2.21.1</li>
<li><a href=""><code>00d45c8</code></a> Fix compatibility with Tornado v6.5.9+ Jupyter (<a href="">#1703</a>)</li>
<li><a href=""><code>d23e8f8</code></a> Fix broken link, link to actually useful resources on OWASP (<a href="">#1704</a>)</li>
<li><a href=""><code>d7f459e</code></a> Bump to 2.22.0.dev0</li>
<li>See full diff in <a href="https://github.com/jupyter-server/jupyter_server/compare/v2.21.0...v2.21.1">compare view</a></li>
</ul>
</details>
<br />

Updates `lazy-loader` from 0.5 to 0.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scientific-python/lazy-loader/releases">lazy-loader's releases</a>.</em></p>
<blockquote>
<h2>v0.6</h2>
<h1>lazy-loader 0.6</h1>
<p>We're happy to announce the release of lazy-loader 0.6!</p>
<h2>Enhancements</h2>
<ul>
<li>improve perf, dogfood (<a href="">#173</a>).</li>
</ul>
<h2>Bug Fixes</h2>
<ul>
<li>Guard against import machinery masking out attributes (<a href="">#171</a>).</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Support for Python 3.15 (<a href="">#176</a>).</li>
<li>Update release process (<a href="">#177</a>).</li>
</ul>
<h2>Contributors</h2>
<p>3 authors added to this release (alphabetically):</p>
<ul>
<li><a href="https://github.com/benedikt-bartscher"><code>@​benedikt-bartscher</code></a></li>
<li>Jarrod Millman (<a href="https://github.com/jarrodmillman"><code>@​jarrodmillman</code></a>)</li>
<li>Stefan van der Walt (<a href="https://github.com/stefanv"><code>@​stefanv</code></a>)</li>
</ul>
<p>4 reviewers added to this release (alphabetically):</p>
<ul>
<li>Brigitta Sipőcz (<a href="https://github.com/bsipocz"><code>@​bsipocz</code></a>)</li>
<li>Chris Markiewicz (<a href="https://github.com/effigies"><code>@​effigies</code></a>)</li>
<li>Jarrod Millman (<a href="https://github.com/jarrodmillman"><code>@​jarrodmillman</code></a>)</li>
<li>Stefan van der Walt (<a href="https://github.com/stefanv"><code>@​stefanv</code></a>)</li>
</ul>
<p><em>These lists are automatically generated, and may not be complete or may contain duplicates.</em></p>
<h2>v0.6rc0</h2>
<h1>lazy-loader 0.6rc0</h1>
<p>We're happy to announce the release of lazy-loader 0.6rc0!</p>
<h2>Enhancements</h2>
<ul>
<li>improve perf, dogfood (<a href="">#173</a>).</li>
</ul>
<h2>Bug Fixes</h2>
<ul>
<li>Guard against import machinery masking out attributes (<a href="">#171</a>).</li>
</ul>
<h2>Maintenance</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/scientific-python/lazy-loader/blob/main/CHANGELOG.md">lazy-loader's changelog</a>.</em></p>
<blockquote>
<h1>lazy-loader 0.6</h1>
<p>We're happy to announce the release of lazy-loader 0.6!</p>
<h2>Enhancements</h2>
<ul>
<li>improve perf, dogfood (<a href="">#173</a>).</li>
</ul>
<h2>Bug Fixes</h2>
<ul>
<li>Guard against import machinery masking out attributes (<a href="">#171</a>).</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Support for Python 3.15 (<a href="">#176</a>).</li>
<li>Update release process (<a href="">#177</a>).</li>
</ul>
<h2>Contributors</h2>
<p>3 authors added to this release (alphabetically):</p>
<ul>
<li><a href="https://github.com/benedikt-bartscher"><code>@​benedikt-bartscher</code></a></li>
<li>Jarrod Millman (<a href="https://github.com/jarrodmillman"><code>@​jarrodmillman</code></a>)</li>
<li>Stefan van der Walt (<a href="https://github.com/stefanv"><code>@​stefanv</code></a>)</li>
</ul>
<p>4 reviewers added to this release (alphabetically):</p>
<ul>
<li>Brigitta Sipőcz (<a href="https://github.com/bsipocz"><code>@​bsipocz</code></a>)</li>
<li>Chris Markiewicz (<a href="https://github.com/effigies"><code>@​effigies</code></a>)</li>
<li>Jarrod Millman (<a href="https://github.com/jarrodmillman"><code>@​jarrodmillman</code></a>)</li>
<li>Stefan van der Walt (<a href="https://github.com/stefanv"><code>@​stefanv</code></a>)</li>
</ul>
<p><em>These lists are automatically generated, and may not be complete or may contain
duplicates.</em></p>
<h1>lazy-loader 0.6rc0</h1>
<p>We're happy to announce the release of lazy-loader 0.6rc0!</p>
<h2>Enhancements</h2>
<ul>
<li>improve perf, dogfood (<a href="">#173</a>).</li>
</ul>
<h2>Bug Fixes</h2>
<ul>
<li>Guard against import machinery masking out attributes (<a href="">#171</a>).</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Support for Python 3.15 (<a href="">#176</a>).</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9245da7</code></a> Designate 0.6 release</li>
<li><a href=""><code>7c3de07</code></a> Update release process (<a href="">#177</a>)</li>
<li><a href=""><code>c64c5cc</code></a> Bump version</li>
<li><a href=""><code>71a8e7e</code></a> Designate 0.6rc0 release</li>
<li><a href=""><code>12a026b</code></a> Support for Python 3.15 (<a href="">#176</a>)</li>
<li><a href=""><code>f9661ca</code></a> Bump the actions group with 2 updates (<a href="">#174</a>)</li>
<li><a href=""><code>bdcafab</code></a> Bump the actions group with 2 updates (<a href="">#170</a>)</li>
<li><a href=""><code>eca7bad</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#169</a>)</li>
<li><a href=""><code>9a6bf11</code></a> Improve performance (<a href="">#173</a>)</li>
<li><a href=""><code>079b62e</code></a> Guard against import machinery masking out attributes (<a href="">#171</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/scientific-python/lazy-loader/compare/v0.5...v0.6">compare view</a></li>
</ul>
</details>
<br />

Updates `multidict` from 6.8.0 to 6.9.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/aio-libs/multidict/releases">multidict's releases</a>.</em></p>
<blockquote>
<h2>6.9.1</h2>
<h2>Bug fixes</h2>
<ul>
<li>
<p>Fixed the C extension reading freed memory on free-threaded builds when a
list handed to :py:meth:<code>~multidict.MultiDict.update</code>,
:py:meth:<code>~multidict.MultiDict.extend</code>, :py:meth:<code>~multidict.MultiDict.merge</code>
or the :py:class:<code>~multidict.MultiDict</code> and :py:class:<code>~multidict.CIMultiDict</code>
constructors, a <code>[key, value]</code> item inside any iterable handed to them, or a
list tested with <code>in</code> against :py:meth:<code>~multidict.MultiDict.items</code>, is
changed by another thread; a call that catches the list shrinking under it
now raises :py:exc:<code>RuntimeError</code> -- by :user:<code>rodrigobnogueira</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
<a href="">#1437</a>.</p>
</li>
<li>
<p>Fixed a data race on the free-threaded build where a retired hash table's
reader count used relaxed atomics, letting a lock-free <code>get()</code>/<code>getone()</code>/
<code>__getitem__()</code> read race a concurrent free of that table. The reader-exit
decrement and the drain's free check now use release/acquire ordering
instead -- by :user:<code>asvetlov</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
<a href="">#1481</a>.</p>
</li>
<li>
<p>Fixed a free-threaded build bug where two threads calling <code>update()</code>,
<code>merge()</code>, or <code>__setitem__()</code> on the same key at the same time could lose
the key entirely instead of just racing on which value wins. A decref of the
replaced value could transiently suspend the writer's critical section,
letting a second writer for the same key observe the first writer's
in-progress entry as absent and, once both settled, mistake it for a stale
duplicate and delete it. Every such decref is now deferred until the writer
has released its critical section, so the window can no longer open.
<code>setdefault()</code> had an unrelated instance of the same blind spot (it could
insert a duplicate rather than recognizing an in-flight key), fixed alongside
it -- by :user:<code>asvetlov</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
<a href="">#1483</a>.</p>
</li>
<li>
<p>Fixed a free-threaded build bug where <code>getall()</code> and the <code>items()</code>/
<code>keys()</code>/<code>values()</code> equality path could raise <code>KeyError</code> or report a
present, never-deleted key as missing. A concurrent <code>update()</code>/<code>extend()</code>/
<code>__setitem__()</code> call can have its critical section transiently suspended
(a decref triggering a blocking allocator call) while an entry is marked as
part of its own bookkeeping; a reader landing in that window used to treat
the mark as &quot;not found&quot; instead of &quot;still there, in flight&quot; -- by
:user:<code>asvetlov</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/aio-libs/multidict/blob/master/CHANGES.rst">multidict's changelog</a>.</em></p>
<blockquote>
<h1>6.9.1</h1>
<p><em>(2026-09-21)</em></p>
<h2>Bug fixes</h2>
<ul>
<li>
<p>Fixed the C extension reading freed memory on free-threaded builds when a
list handed to :py:meth:<code>~multidict.MultiDict.update</code>,
:py:meth:<code>~multidict.MultiDict.extend</code>, :py:meth:<code>~multidict.MultiDict.merge</code>
or the :py:class:<code>~multidict.MultiDict</code> and :py:class:<code>~multidict.CIMultiDict</code>
constructors, a <code>[key, value]</code> item inside any iterable handed to them, or a
list tested with <code>in</code> against :py:meth:<code>~multidict.MultiDict.items</code>, is
changed by another thread; a call that catches the list shrinking under it
now raises :py:exc:<code>RuntimeError</code> -- by :user:<code>rodrigobnogueira</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
:issue:<code>1437</code>.</p>
</li>
<li>
<p>Fixed a data race on the free-threaded build where a retired hash table's
reader count used relaxed atomics, letting a lock-free <code>get()</code>/<code>getone()</code>/
<code>__getitem__()</code> read race a concurrent free of that table. The reader-exit
decrement and the drain's free check now use release/acquire ordering
instead -- by :user:<code>asvetlov</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
:issue:<code>1481</code>.</p>
</li>
<li>
<p>Fixed a free-threaded build bug where two threads calling <code>update()</code>,
<code>merge()</code>, or <code>__setitem__()</code> on the same key at the same time could lose
the key entirely instead of just racing on which value wins. A decref of the
replaced value could transiently suspend the writer's critical section,
letting a second writer for the same key observe the first writer's
in-progress entry as absent and, once both settled, mistake it for a stale
duplicate and delete it. Every such decref is now deferred until the writer
has released its critical section, so the window can no longer open.
<code>setdefault()</code> had an unrelated instance of the same blind spot (it could
insert a duplicate rather than recognizing an in-flight key), fixed alongside
it -- by :user:<code>asvetlov</code>.</p>
<p><em>Related issues and pull requests on GitHub:</em>
:issue:<code>1483</code>.</p>
</li>
<li>
<p>Fixed a free-threaded build bug where <code>getall()</code> and the <code>items()</code>/
<code>keys()</code>/<code>values()</code> equality path could raise <code>KeyError</code> or report a
present, never-deleted key as missing. A concurrent <code>update()</code>/<code>extend()</code>/
<code>__setitem__()</code> call can have its critical section transiently suspended
(a decref triggering a blocking allocator call) while an entry is marked as</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14424830031f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.