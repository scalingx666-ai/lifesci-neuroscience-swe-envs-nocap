# Issue

**Title:** [dependabot]: Bump the deps group with 20 updates

## Description

Bumps the deps group with 20 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `4.1.1` | `4.2.4` |
| [prek](https://github.com/j178/prek) | `0.5.5` | `0.5.6` |
| [mkdocstrings-python](https://github.com/mkdocstrings/python) | `2.0.9` | `2.0.10` |
| [certifi](https://github.com/certifi/python-certifi) | `2026.7.22` | `2026.10.19` |
| [fonttools](https://github.com/fonttools/fonttools) | `4.66.1` | `4.67.0` |
| [griffelib](https://github.com/mkdocstrings/griffe) | `2.3.2` | `2.4.0` |
| [jsonpointer](https://github.com/stefankoegl/python-json-pointer) | `3.2.1` | `3.4` |
| [markdown](https://github.com/Python-Markdown/markdown) | `3.11` | `3.11.2` |
| [mistune](https://github.com/lepture/mistune) | `3.3.4` | `3.4.0` |
| [mkdocstrings](https://github.com/mkdocstrings/mkdocstrings) | `1.0.7` | `1.0.8` |
| [more-itertools](https://github.com/more-itertools/more-itertools) | `11.1.0` | `11.2.1` |
| [pillow](https://github.com/python-pillow/Pillow) | `12.3.0` | `13.0.0` |
| [platformdirs](https://github.com/tox-dev/platformdirs) | `4.13.0` | `4.13.5` |
| [pluggy](https://github.com/pytest-dev/pluggy) | `1.6.0` | `1.7.0` |
| [portalocker](https://github.com/wolph/portalocker) | `4.4.0` | `4.4.1` |
| [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) | `12.2` | `12.3` |
| [pywinpty](https://github.com/andfoy/pywinpty) | `3.0.5` | `3.1.0` |
| [setuptools](https://github.com/pypa/setuptools) | `84.0.0` | `84.2.0` |
| verspec | `0.2.0` | `0.2.1` |
| [wrapt](https://github.com/GrahamDumpleton/wrapt) | `2.5.0` | `2.5.1` |

Updates `filelock` from 4.1.1 to 4.2.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.2.4</h2>
<ul>
<li>Keep GitHub Release notes free of extra blank lines while retaining the PyPI and version comparison links. <a href="">#863</a></li>
</ul>
<p><a href="https://pypi.org/project/filelock/4.2.4/">PyPI release</a></p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.2.3...4.2.4">https://github.com/tox-dev/filelock/compare/4.2.3...4.2.4</a></p>
<h2>4.2.3</h2>
<ul>
<li>Creating a lock on a Python 3.15 interpreter without <code>types.LazyImportType</code> no longer triggers <code>AttributeError</code> at
exit. <a href="">#860</a></li>
<li>Handle <code>EFTYPE</code> when a no-follow open refuses a symlink in a soft reader/writer lock's protocol tree, so heartbeat
reports lost ownership rather than a transient refresh error.</li>
</ul>
<p><a href="https://pypi.org/project/filelock/4.2.3/">PyPI release</a></p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.2.2...4.2.3">https://github.com/tox-dev/filelock/compare/4.2.2...4.2.3</a></p>
<h2>4.2.2</h2>
<ul>
<li>Fix a lock on a relative path that stayed held after a later <code>with lock:</code> ended, when an earlier <code>acquire()</code> had
failed because the working directory no longer exists. That call still raises <code>FileNotFoundError</code>, and it now
leaves the lock's hold count unchanged. <a href="">#856</a></li>
</ul>
<p><a href="https://pypi.org/project/filelock/4.2.2/">PyPI release</a></p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.2.1...4.2.2">https://github.com/tox-dev/filelock/compare/4.2.1...4.2.2</a></p>
<h2>4.2.1</h2>
<ul>
<li>On a singleton wrapper, <code>close&gt;</code> and
<code>close&gt;</code> end only the holds that tasks acquired
through that wrapper. A reader that arrives during <code>close()</code> gets the closed error instead of joining the ending hold.
After synchronous code closes or force-releases the shared lock, the wrappers refuse to admit readers into the ended
hold, and <code>close()</code> on such a wrapper returns.
Closing one wrapper no longer ends a task's nested hold taken through another wrapper on the same path. <a href="">#832</a></li>
<li><code>ReadWriteLock</code> locks again after a <code>release()</code> that an exception from a signal handler interrupted.
The async read-write wrappers stop admitting readers into such a level. The async read-write locks forget a hold whose
backend release failed after the backend let go, and they free the memory of each acquire that times out or is canceled.
<code>AsyncFileLock</code> returns from <code>release()</code> after a few hundred acquires gave up behind a waiting one. An exception from a signal handler delivered while an <code>AsyncFileLock</code> call joins
its queue no longer blocks every later call on that lock. <a href="">#833</a></li>
<li>Fix <code>ReadWriteLock</code> acting on <code>-journal</code>, <code>-wal</code> or <code>-shm</code> files another process puts beside its
database: a write could land in another file, a reader could get in beside a writer, and an acquire could fail. SQLite
now opens the database by name only in a directory no other account can write, and through a private hard link
elsewhere. On Windows the directory's access control list decides. Where hard links are unavailable, keep the database
in a directory other accounts cannot write, such as one under <code>%LOCALAPPDATA%</code>. The lock removes link directories
through a checked descriptor rather than by name, reads a link directory's name only when the locking account owns it,
and leaves alone a directory with other content renamed onto a link directory's name. A database whose schema takes more
than a few kilobytes to load raises <code>ValueError</code> instead of running past the acquire timeout. <a href="">#834</a></li>
<li>Fix five bugs in opening the lock file. <code>UnixFileLock</code> no longer truncates a file it did not create,
such as one renamed to the lock path, and no longer applies <code>mode</code> to it. An <code>on_acquired</code> hook that writes holder
metadata now truncates the file itself. A lease (Linux) or an oplock (Windows) on the lock file or a soft lock's marker
no longer holds <code>acquire()</code> past its <code>timeout</code> or <code>blocking=False</code>, and an oplock no longer holds <code>release()</code>;</li>
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
<p>4.2.4 (2026-10-19)</p>
<hr />
<ul>
<li>Keep GitHub Release notes free of extra blank lines while retaining the PyPI and version comparison links. :pr:<code>863</code></li>
</ul>
<hr />
<p>4.2.3 (2026-10-19)</p>
<hr />
<ul>
<li>Creating a lock on a Python 3.15 interpreter without <code>types.LazyImportType</code> no longer triggers <code>AttributeError</code> at
exit. :pr:<code>860</code></li>
<li>Handle <code>EFTYPE</code> when a no-follow open refuses a symlink in a soft reader/writer lock's protocol tree, so heartbeat
reports lost ownership rather than a transient refresh error.</li>
</ul>
<hr />
<p>4.2.2 (2026-10-18)</p>
<hr />
<ul>
<li>Fix a lock on a relative path that stayed held after a later <code>with lock:</code> ended, when an earlier <code>acquire()</code> had
failed because the working directory no longer exists. That call still raises :class:<code>FileNotFoundError</code>, and it now
leaves the lock's hold count unchanged. :pr:<code>856</code></li>
</ul>
<hr />
<p>4.2.1 (2026-10-17)</p>
<hr />
<ul>
<li>On a singleton wrapper, :meth:<code>AsyncReadWriteLock.close() &lt;filelock.AsyncReadWriteLock.close&gt;</code> and
:meth:<code>AsyncSoftReadWriteLock.close() &lt;filelock.AsyncSoftReadWriteLock.close&gt;</code> end only the holds that tasks acquired
through that wrapper. A reader that arrives during <code>close()</code> gets the closed error instead of joining the ending hold.
After synchronous code closes or force-releases the shared lock, the wrappers refuse to admit readers into the ended
hold, and <code>close()</code> on such a wrapper returns.
Closing one wrapper no longer ends a task's nested hold taken through another wrapper on the same path. :pr:<code>832</code></li>
<li>:class:<code>~filelock.ReadWriteLock</code> locks again after a <code>release()</code> that an exception from a signal handler interrupted.
The async read-write wrappers stop admitting readers into such a level. The async read-write locks forget a hold whose
backend release failed after the backend let go, and they free the memory of each acquire that times out or is canceled.
:class:<code>~filelock.AsyncFileLock</code> returns from <code>release()</code> after a few hundred acquires gave up behind a waiting one. An exception from a signal handler delivered while an :class:<code>~filelock.AsyncFileLock</code> call joins
its queue no longer blocks every later call on that lock. :pr:<code>833</code></li>
<li>Fix :class:<code>~filelock.ReadWriteLock</code> acting on <code>-journal</code>, <code>-wal</code> or <code>-shm</code> files another process puts beside its
database: a write could land in another file, a reader could get in beside a writer, and an acquire could fail. SQLite
now opens the database by name only in a directory no other account can write, and through a private hard link
elsewhere. On Windows the directory's access control list decides. Where hard links are unavailable, keep the database</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>22f0776</code></a> Release 4.2.4</li>
<li><a href=""><code>9d278ed</code></a> Document GitHub Release note cleanup (<a href="">#863</a>)</li>
<li><a href=""><code>3c33798</code></a> 🐛 fix(release): trim GitHub release notes (<a href="">#862</a>)</li>
<li><a href=""><code>e737924</code></a> Release 4.2.3</li>
<li><a href=""><code>84dc80c</code></a> 👷 ci: collect required checks (<a href="">#857</a>)</li>
<li><a href=""><code>cb8b57e</code></a> fix(api): guard lazy import exit hook (<a href="">#861</a>)</li>
<li><a href=""><code>dd341ac</code></a> Handle NetBSD EFTYPE for replaced soft-RW protocol directories (<a href="">#859</a>)</li>
<li><a href=""><code>db47f34</code></a> Release 4.2.2</li>
<li><a href=""><code>caaff8a</code></a> fix(api): keep the hold count when the lock path cannot be resolved (<a href="">#856</a>)</li>
<li><a href=""><code>60331bb</code></a> Release 4.2.1</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/4.1.1...4.2.4">compare view</a></li>
</ul>
</details>
<br />

Updates `prek` from 0.5.5 to 0.5.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/releases">prek's releases</a>.</em></p>
<blockquote>
<h2>0.5.6</h2>
<h2>Release Notes</h2>
<p>Released on 2026-10-19.</p>
<h3>Enhancements</h3>
<ul>
<li>Add builtin hook <code>check-commit-trailers</code> (<a href="">#2885</a>)</li>
<li>Add builtin hook <code>check-signed-commit</code> (<a href="">#2725</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Enable PGO for native release builds (<a href="">#2890</a>)</li>
<li>Reduce hook process launches with balanced batches (<a href="">#2907</a>)</li>
<li>Resolve hook commands before batching (<a href="">#2840</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Accept UTF-8 BOM in <code>check-json</code> (<a href="">#2879</a>)</li>
<li>Preserve unquoted dotted revisions in <code>prek update</code> (<a href="">#2853</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document standalone installer options (<a href="">#2859</a>)</li>
<li>Update benchmarks for prek 0.5.5 (<a href="">#2786</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Enable ICF for release builds (<a href="">#2891</a>)</li>
<li>Update uv to 0.13.0 (<a href="">#2856</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ebuildy"><code>@​ebuildy</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
<li><a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a></li>
</ul>
<h2>Install prek 0.5.6</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.6/prek-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://github.com/j178/prek/releases/download/v0.5.6/prek-installer.ps1 | iex&quot;
</code></pre>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/blob/main/CHANGELOG.md">prek's changelog</a>.</em></p>
<blockquote>
<h2>0.5.6</h2>
<p>Released on 2026-10-19.</p>
<h3>Enhancements</h3>
<ul>
<li>Add builtin hook <code>check-commit-trailers</code> (<a href="">#2885</a>)</li>
<li>Add builtin hook <code>check-signed-commit</code> (<a href="">#2725</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Enable PGO for native release builds (<a href="">#2890</a>)</li>
<li>Reduce hook process launches with balanced batches (<a href="">#2907</a>)</li>
<li>Resolve hook commands before batching (<a href="">#2840</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Accept UTF-8 BOM in <code>check-json</code> (<a href="">#2879</a>)</li>
<li>Preserve unquoted dotted revisions in <code>prek update</code> (<a href="">#2853</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document standalone installer options (<a href="">#2859</a>)</li>
<li>Update benchmarks for prek 0.5.5 (<a href="">#2786</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Enable ICF for release builds (<a href="">#2891</a>)</li>
<li>Update uv to 0.13.0 (<a href="">#2856</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ebuildy"><code>@​ebuildy</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
<li><a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ee8a6cc</code></a> Bump version to 0.5.6 (<a href="">#2909</a>)</li>
<li><a href=""><code>3611681</code></a> Reduce hook process launches with balanced batches (<a href="">#2907</a>)</li>
<li><a href=""><code>1af6b80</code></a> Use PR head commits for CI change detection</li>
<li><a href=""><code>29455ef</code></a> Update dependency zensical to &gt;=0.0.69 (<a href="">#2896</a>)</li>
<li><a href=""><code>1fd9308</code></a> Update dependency prefix-dev/pixi to v0.81.0 (<a href="">#2905</a>)</li>
<li><a href=""><code>140ab6b</code></a> Update docker.io/astral/uv Docker tag to v0.13.0 (<a href="">#2906</a>)</li>
<li><a href=""><code>3574ba3</code></a> Update dependency cargo-zigbuild to &gt;=0.23.4 (<a href="">#2895</a>)</li>
<li><a href=""><code>7c23eae</code></a> Update Rust crate async_zip to 0.0.22 (<a href="">#2898</a>)</li>
<li><a href=""><code>09f486d</code></a> Update Rust crate indoc to v2.0.8 (<a href="">#2899</a>)</li>
<li><a href=""><code>4d67721</code></a> Update Rust crate tokio-util to v0.7.20 (<a href="">#2901</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/j178/prek/compare/v0.5.5...v0.5.6">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocstrings-python` from 2.0.9 to 2.0.10
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/releases">mkdocstrings-python's releases</a>.</em></p>
<blockquote>
<h2>2.0.10</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.10">2.0.10</a> - 2026-10-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.9...2.0.10">Compare with 2.0.9</a><!-- raw HTML omitted --></p>
<h3>Build</h3>
<ul>
<li>Drop support for Python 3.10 (<a href="">aad7fc6</a> by Timothée Mazzucotelli).</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Prefix code anchor/span IDs in signatures to avoid collisions (<a href="">35cde4c</a> by Timothée Mazzucotelli). <a href="">Issue-200</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/blob/main/CHANGELOG.md">mkdocstrings-python's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.10">2.0.10</a> - 2026-10-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.9...2.0.10">Compare with 2.0.9</a><!-- raw HTML omitted --></p>
<h3>Build</h3>
<ul>
<li>Drop support for Python 3.10 (<a href="">aad7fc6</a> by Timothée Mazzucotelli).</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Prefix code anchor/span IDs in signatures to avoid collisions (<a href="">35cde4c</a> by Timothée Mazzucotelli). <a href="">Issue-200</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f561c84</code></a> chore: Prepare release 2.0.10</li>
<li><a href=""><code>aad7fc6</code></a> build: Drop support for Python 3.10</li>
<li><a href=""><code>35cde4c</code></a> fix: Prefix code anchor/span IDs in signatures to avoid collisions</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/python/compare/2.0.9...2.0.10">compare view</a></li>
</ul>
</details>
<br />

Updates `certifi` from 2026.7.22 to 2026.10.19
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>662df63</code></a> Restore unaffected emSign roots (<a href="">#439</a>) (<a href="">#440</a>)</li>
<li><a href=""><code>5cb238c</code></a> Remove emsign (<a href="">#437</a>)</li>
<li><a href=""><code>69494a7</code></a> Bump actions/download-artifact from 8.0.1 to 8.0.2 (<a href="">#436</a>)</li>
<li><a href=""><code>029c7b0</code></a> Bump actions/upload-artifact from 7.0.1 to 7.0.2 (<a href="">#435</a>)</li>
<li><a href=""><code>9d0a8f1</code></a> Add support for Python 3.15 (<a href="">#432</a>)</li>
<li><a href=""><code>db472ab</code></a> Bump pypa/gh-action-pypi-publish from 1.14.1 to 1.14.2 (<a href="">#431</a>)</li>
<li>See full diff in <a href="https://github.com/certifi/python-certifi/compare/2026.07.22...2026.10.19">compare view</a></li>
</ul>
</details>
<br />

Updates `fonttools` from 4.66.1 to 4.67.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/releases">fonttools's releases</a>.</em></p>
<blockquote>
<h2>4.67.0</h2>
<ul>
<li>[varLib] Support decreasing design-space axis mappings, via a new keyword-only <code>allow_decreasing</code> argument to <code>models.normalizeValue</code> (<a href="">#3970</a>, <a href="">#4217</a>, <a href="">#4243</a>).</li>
<li>[designspaceLib] Allow partial DesignSpace v5 axis subsets: omitted range attributes on an <code>&lt;axis-subset&gt;</code> are taken from the parent axis, as the spec says (<a href="">#4205</a>).</li>
<li>[designspaceLib] Fix <code>DesignSpaceDocument.normalize()</code> for mapped axes: axis bounds and rule conditions are now normalized from their original values (<a href="">#4218</a>).</li>
<li>[designspaceLib] <code>splitInterpolable</code> and <code>splitVariableFonts</code> now warn when a source or instance is dropped because it lies outside the document's own axes, instead of silently discarding it (<a href="">#4244</a>).</li>
<li>[varLib.instancer] Add support for instancing variable COLRv1 fonts (<a href="">#2699</a>, <a href="">#4279</a>).</li>
<li>[varLib.instancer] Apply VVAR vertical-origin deltas to <code>VORG</code>, and use OpenType rounding for instanced advances and vertical origins (<a href="">#4221</a>).</li>
<li>[varLib.instancer] Keep a universal FeatureVariations record when pinning removes its last condition but other axes remain (<a href="">#4247</a>).</li>
<li>[varLib.instancer] Preserve ppem <code>Device</code> corrections in GDEF, BASE, GPOS and JSTF instead of asserting on them (<a href="">#4290</a>).</li>
<li>[varLib.instancer] Allow requesting an axis's original range on VARC fonts (<a href="">#4280</a>).</li>
<li>[varLib.instancer, subset] Fold, remove or remap MATH <code>VariationIndex</code> devices when instancing, subsetting the GDEF store or optimizing it (<a href="">#4288</a>).</li>
<li>[varLib] Raise <code>ValueError: Missing required table fvar</code> from <code>varLib.mutator</code> and the instancer CLI on a static font, instead of a bare <code>KeyError</code> (<a href="">#3751</a>, <a href="">#4300</a>).</li>
<li>[featureVars] When adding <code>rvrn</code>, also shift lookup indices inside existing FeatureVariations (<a href="">#4233</a>). Handle null <code>ConditionSet</code> and <code>FeatureTableSubstitution</code> offsets when building, subsetting and instancing (<a href="">#4234</a>, <a href="">#4235</a>). Keep <code>FeatureTableSubstitution</code> records sorted after merging new ones into an existing record (<a href="">#4248</a>).</li>
<li>[ttLib] Fix FeatureParams (<code>size</code>, <code>ssXX</code>, <code>cvXX</code>) in FeatureVariations alternate feature tables, which failed to compile and round-trip (<a href="">#3623</a>, <a href="">#4278</a>).</li>
<li>[ttLib] Fully decode lazily loaded ligatures, <code>SinglePos</code> and <code>PairPos</code> arrays during recursive decompilation, so <code>reorderGlyphs()</code> on a lazy font no longer corrupts or asserts on them (<a href="">#4231</a>, <a href="">#4232</a>).</li>
<li>[VARC] Update the variation-store binary format to follow <a href="">harfbuzz/boring-expansion-spec#175</a>: <code>SparseVarRegionList.RegionCount</code> is uint32, sparse axes use Offset32 and <code>MultiVarData</code> items are stored in an INDEX. VARC fonts built with earlier fontTools versions must be rebuilt (<a href="">#4219</a>).</li>
<li>[VARC] Several fixes: derive component conditions from <code>conditionIndex</code> (<a href="">#4237</a>), set the implicit <code>scaleY</code> when importing XML (<a href="">#4238</a>), report the font's current coordinates for components that reset unspecified axes (<a href="">#4239</a>), and keep inherited coordinates when drawing CFF2 VARC components (<a href="">#4236</a>).</li>
<li>[varLib] <code>buildMultiVarData</code> accepts flattened per-region vector tuples (<a href="">#4245</a>).</li>
<li>[otConverters] Bounds-check CFF2 INDEX count and <code>offSize</code> on read, raising <code>TTLibError</code> instead of allocating huge lazy lists (<a href="">#4220</a>).</li>
<li>[ttLib] Handle empty packed deltas when <code>OPTIMIZE_FONT_SPEED</code> is set (<a href="">#4241</a>).</li>
<li>[scaleUpem] Scale per-glyph <code>VORG</code> origins (<a href="">#4222</a>); fix VARC scaling for static fonts and condition variations (<a href="">#4223</a>); don't mutate the shared default CFF <code>FontMatrix</code> (<a href="">#4251</a>, <a href="">#4252</a>).</li>
<li>[cmap] Fix format 2 compilation when all codes are single-byte (<a href="">#1524</a>, <a href="">#4211</a>) or all single-byte codes map to <code>.notdef</code> (<a href="">#4215</a>). Formats 2 and 4 now reject glyph IDs above 65535 instead of wrapping them (<a href="">#4226</a>). Split format 14 default UVS ranges longer than 256 codepoints (<a href="">#4229</a>). Empty format 12 and 13 subtables round-trip (<a href="">#4246</a>).</li>
<li>[glyf] Use unsigned instruction lengths, so programs of 32768-65535 bytes compile and decompile correctly (<a href="">#4227</a>). Keep instructions in zero-contour glyphs (<a href="">#4228</a>).</li>
<li>[pens] Fix cubic off-curve detection in <code>TTGlyphPointPen</code> across contour starts (<a href="">#4224</a>). <code>Glyph.drawPoints()</code> now raises <code>NotImplementedError</code> for an all-off-curve cubic contour, which the point pen protocol cannot express (<a href="">#3191</a>, <a href="">#4225</a>). <code>RoundingPen</code> passes the all-off-curve <code>None</code> sentinel through (<a href="">#4311</a>, <a href="">#4312</a>).</li>
<li>[CFF2] Preserve operands when a blend has zero regions (<a href="">#4240</a>).</li>
<li>[cffLib] Read CFF font names as Latin-1, matching how they are written (<a href="">#4253</a>). Deleting a CFF dict attribute now actually removes it (<a href="">#2725</a>, <a href="">#4264</a>).</li>
<li>[CFF2ToCFF] Fix conversion of fonts with local subroutines (<a href="">#4258</a>). A CFF2 table with a single FontDict is now converted to a name-keyed CFF font that keeps its glyph names (<a href="">#3890</a>, <a href="">#4265</a>).</li>
<li>[subset] Handle a null GDEF variation store (<a href="">#4230</a>).</li>
<li>[merge] Support merging fonts that both have a MATH table (<a href="">#3823</a>, <a href="">#4257</a>).</li>
<li>[feaLib] Reject the same mark class used twice in one anchor list (<a href="">#3628</a>, <a href="">#4255</a>). Don't crash on value records whose devices are all NULL (<a href="">#2396</a>, <a href="">#4261</a>). Pad a short OS/2 <code>Vendor</code> with spaces (<a href="">#4259</a>).</li>
<li>[feaLib] Raise <code>FeatureLibError</code> with a location, instead of a bare Python error, for: a BASE script list without a matching tag list (<a href="">#4263</a>), a <code>UnicodeRange</code> bit outside 0-127 (<a href="">#4266</a>), a name string that cannot be decoded (<a href="">#4267</a>), a STAT axis <code>location</code> with no or too many values (<a href="">#4268</a>), and a non-ASCII OS/2 <code>Vendor</code> (<a href="">#4269</a>).</li>
<li>[name] Fix the BCP 47 tags of some Mac and Windows language IDs, e.g. <code>es</code> was mapped to Mac Estonian (<a href="">#3733</a>, <a href="">#4256</a>). <code>getDebugName</code> prefers the Windows English name over the Mac one (<a href="">#3969</a>, <a href="">#4273</a>).</li>
<li>[post] Don't crash on a format 2.0 table with <code>numGlyphs</code> set to 0 (<a href="">#3060</a>, <a href="">#4274</a>).</li>
<li>[VDMX] Recompute <code>numRecs</code> and <code>numRatios</code> when compiling (<a href="">#4293</a>).</li>
<li>[Silf] Fix compiling a <code>Silf</code> table that was decompiled from binary (<a href="">#4294</a>).</li>
<li>[woff2] Preserve <code>minorVersion</code> when copying flavor data (<a href="">#4249</a>, <a href="">#4250</a>).</li>
<li>[ttGlyphSet] Compute glyph width lazily for glyf variable fonts without HVAR, so <code>.width</code> is correct before drawing (<a href="">#3964</a>, <a href="">#4260</a>).</li>
<li>[varLib.interpolatable] Respect designspace source layers (<a href="">#3951</a>, <a href="">#4275</a>); fix <code>--json</code> output with SciPy (<a href="">#3870</a>, <a href="">#4276</a>).</li>
<li>[misc.psLib] Fix tokenizing of escaped parentheses in PostScript strings (<a href="">#4207</a>).</li>
<li>[svgLib] Raise <code>ValueError</code> instead of <code>IndexError</code> on a truncated path command (<a href="">#4254</a>).</li>
<li>[misc.transform] Preserve the direction of the remaining axis when decomposing a transform whose first column is zero (<a href="">#4242</a>).</li>
<li>[misc.textTools] <code>Tag.__ne__</code> returns <code>NotImplemented</code> for unsupported types (<a href="">#4305</a>, <a href="">#4306</a>).</li>
<li>[misc.dictTools] <code>hashdict</code> rejects in-place union (<code>|=</code>) (<a href="">#4313</a>, <a href="">#4314</a>).</li>
<li>[misc.xmlReader] Close owned input streams when parsing fails (<a href="">#4298</a>).</li>
<li>[misc.filesystem] <code>WriteZipFS.close()</code> can be called more than once (<a href="">#4309</a>, <a href="">#4310</a>).</li>
<li>[EBDT] Keep EBDT/CBDT glyph metrics after probing a missing attribute (<a href="">#3806</a>, <a href="">#4216</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/blob/main/NEWS.rst">fonttools's changelog</a>.</em></p>
<blockquote>
<h2>4.67.0 (released 2026-10-14)</h2>
<ul>
<li>[varLib] Support decreasing design-space axis mappings, via a new keyword-only
<code>allow_decreasing</code> argument to <code>models.normalizeValue</code> (<a href="">#3970</a>, <a href="">#4217</a>, <a href="">#4243</a>).</li>
<li>[designspaceLib] Allow partial DesignSpace v5 axis subsets: omitted range attributes
on an <code>&lt;axis-subset&gt;</code> are taken from the parent axis, as the spec says (<a href="">#4205</a>).</li>
<li>[designspaceLib] Fix <code>DesignSpaceDocument.normalize()</code> for mapped axes: axis
bounds and rule conditions are now normalized from their original values (<a href="">#4218</a>).</li>
<li>[designspaceLib] <code>splitInterpolable</code> and <code>splitVariableFonts</code> now warn when a
source or instance is dropped because it lies outside the document's own axes,
instead of silently discarding it (<a href="">#4244</a>).</li>
<li>[varLib.instancer] Add support for instancing variable COLRv1 fonts (<a href="">#2699</a>, <a href="">#4279</a>).</li>
<li>[varLib.instancer] Apply VVAR vertical-origin deltas to <code>VORG</code>, and use OpenType
rounding for instanced advances and vertical origins (<a href="">#4221</a>).</li>
<li>[varLib.instancer] Keep a universal FeatureVariations record when pinning removes
its last condition but other axes remain (<a href="">#4247</a>).</li>
<li>[varLib.instancer] Preserve ppem <code>Device</code> corrections in GDEF, BASE, GPOS and JSTF
instead of asserting on them (<a href="">#4290</a>).</li>
<li>[varLib.instancer] Allow requesting an axis's original range on VARC fonts (<a href="">#4280</a>).</li>
<li>[varLib.instancer, subset] Fold, remove or remap MATH <code>VariationIndex</code> devices
when instancing, subsetting the GDEF store or optimizing it (<a href="">#4288</a>).</li>
<li>[varLib] Raise <code>ValueError: Missing required table fvar</code> from <code>varLib.mutator</code>
and the instancer CLI on a static font, instead of a bare <code>KeyError</code> (<a href="">#3751</a>, <a href="">#4300</a>).</li>
<li>[featureVars] When adding <code>rvrn</code>, also shift lookup indices inside existing
FeatureVariations (<a href="">#4233</a>). Handle null <code>ConditionSet</code> and
<code>FeatureTableSubstitution</code> offsets when building, subsetting and instancing
(<a href="">#4234</a>, <a href="">#4235</a>). Keep <code>FeatureTableSubstitution</code> records sorted after merging new
ones into an existing record (<a href="">#4248</a>).</li>
<li>[ttLib] Fix FeatureParams (<code>size</code>, <code>ssXX</code>, <code>cvXX</code>) in FeatureVariations
alternate feature tables, which failed to compile and round-trip (<a href="">#3623</a>, <a href="">#4278</a>).</li>
<li>[ttLib] Fully decode lazily loaded ligatures, <code>SinglePos</code> and <code>PairPos</code> arrays
during recursive decompilation, so <code>reorderGlyphs()</code> on a lazy font no longer
corrupts or asserts on them (<a href="">#4231</a>, <a href="">#4232</a>).</li>
<li>[VARC] Update the variation-store binary format to follow
<a href="">harfbuzz/boring-expansion-spec#175</a>: <code>SparseVarRegionList.RegionCount</code> is uint32,
sparse axes use Offset32 and <code>MultiVarData</code> items are stored in an INDEX. VARC
fonts built with earlier fontTools versions must be rebuilt (<a href="">#4219</a>).</li>
<li>[VARC] Several fixes: derive component conditions from <code>conditionIndex</code> (<a href="">#4237</a>),
set the implicit <code>scaleY</code> when importing XML (<a href="">#4238</a>), report the font's current
coordinates for components that reset unspecified axes (<a href="">#4239</a>), and keep inherited
coordinates when drawing CFF2 VARC components (<a href="">#4236</a>).</li>
<li>[varLib] <code>buildMultiVarData</code> accepts flattened per-region vector tuples (<a href="">#4245</a>).</li>
<li>[otConverters] Bounds-check CFF2 INDEX count and <code>offSize</code> on read, raising
<code>TTLibError</code> instead of allocating huge lazy lists (<a href="">#4220</a>).</li>
<li>[ttLib] Handle empty packed deltas when <code>OPTIMIZE_FONT_SPEED</code> is set (<a href="">#4241</a>).</li>
<li>[scaleUpem] Scale per-glyph <code>VORG</code> origins (<a href="">#4222</a>); fix VARC scaling for static
fonts and condition variations (<a href="">#4223</a>); don't mutate the shared default CFF
<code>FontMatrix</code> (<a href="">#4251</a>, <a href="">#4252</a>).</li>
<li>[cmap] Fix format 2 compilation when all codes are single-byte (<a href="">#1524</a>, <a href="">#4211</a>) or</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>16f88cb</code></a> Release 4.67.0</li>
<li><a href=""><code>5049c83</code></a> Update NEWS.rst [skip ci]</li>
<li><a href=""><code>fdfd15f</code></a> Merge pull request <a href="">#4314</a> from xiehuanyi/fix/hashdict-inplace-union-20261014</li>
<li><a href=""><code>87ee7d3</code></a> Merge pull request <a href="">#4312</a> from xiehuanyi/fix/roundingpen-offcurve-none-20261014</li>
<li><a href=""><code>e6e65d3</code></a> [dictTools] Reject in-place union on hashdict</li>
<li><a href=""><code>10cfefe</code></a> Merge pull request <a href="">#4310</a> from xiehuanyi/fix/writezipfs-idempotent-close-20261014</li>
<li><a href=""><code>06157e4</code></a> Merge pull request <a href="">#4300</a> from CAOShurong/codex/3751-missing-fvar</li>
<li><a href=""><code>2940a2e</code></a> Merge pull request <a href="">#4298</a> from xiehuanyi/fix-xml-reader-failure-cleanup</li>
<li><a href=""><code>821805d</code></a> Merge pull request <a href="">#4306</a> from xiehuanyi/fix/tag-notimplemented-comparison-202...</li>
<li><a href=""><code>85538d6</code></a> [roundingPen] Preserve all-off-curve quadratic sentinel</li>
<li>Additional commits viewable in <a href="https://github.com/fonttools/fonttools/compare/4.66.1...4.67.0">compare view</a></li>
</ul>
</details>
<br />

Updates `griffelib` from 2.3.2 to 2.4.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/griffe/releases">griffelib's releases</a>.</em></p>
<blockquote>
<h2>2.4.0</h2>
<h2><a href="https://github.com/mkdocstrings/griffe/releases/tag/2.4.0">2.4.0</a> - 2026-10-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/griffe/compare/2.3.2...2.4.0">Compare with 2.3.2</a><!-- raw HTML omitted --></p>
<h3>Features</h3>
<ul>
<li>Expose <code>reference_path</code> in addition to <code>canonical_path</code> (<a href="">2f6b419</a> by Timothée Mazzucotelli). <a href="">Issue-448</a></li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Preserve standalone named expression parentheses (<a href="">dc6300d</a> by Alperen). <a href="">PR-488</a>, Co-authored-by: Timothée Mazzucotelli <a href="mailto:dev@pawamoy.fr">dev@pawamoy.fr</a></li>
<li>Propagate <code>public</code> value to inherited members (aliases) (<a href="">8b94205</a> by Timothée Mazzucotelli). <a href="">Issue-495</a>, <a href="">PR-503</a>, Co-authored-by: Sydney Duckworth <a href="mailto:sydduckworth@users.noreply.github.com">sydduckworth@users.noreply.github.com</a></li>
</ul>
<h3>Performance Improvements</h3>
<ul>
<li>
<p>Prune function bodies from source before building AST (<a href="">657ce96</a> by Timothée Mazzucotelli). <a href="">PR-489</a></p>
<p>This requires the <code>griffe[faster]</code> extra. Griffe is fast by default so this performance improvement will only be noticeable in projects with <em>a lot of Python code</em>.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/griffe/blob/main/CHANGELOG.md">griffelib's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/griffe/releases/tag/2.4.0">2.4.0</a> - 2026-10-19</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/griffe/compare/2.3.2...2.4.0">Compare with 2.3.2</a><!-- raw HTML omitted --></p>
<h3>Features</h3>
<ul>
<li>Expose <code>reference_path</code> in addition to <code>canonical_path</code> (<a href="">2f6b419</a> by Timothée Mazzucotelli). <a href="">Issue-448</a></li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Preserve standalone named expression parentheses (<a href="">dc6300d</a> by Alperen). <a href="">PR-488</a>, Co-authored-by: Timothée Mazzucotelli <a href="mailto:dev@pawamoy.fr">dev@pawamoy.fr</a></li>
<li>Propagate <code>public</code> value to inherited members (aliases) (<a href="">8b94205</a> by Timothée Mazzucotelli). <a href="">Issue-495</a>, <a href="">PR-503</a>, Co-authored-by: Sydney Duckworth <a href="mailto:sydduckworth@users.noreply.github.com">sydduckworth@users.noreply.github.com</a></li>
</ul>
<h3>Performance Improvements</h3>
<ul>
<li>
<p>Prune function bodies from source before building AST (<a href="">657ce96</a> by Timothée Mazzucotelli). <a href="">PR-489</a></p>
<p>This requires the <code>griffe[faster]</code> extra. Griffe is fast by default so this performance improvement will only be noticeable in projects with <em>a lot of Python code</em>.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ca60582</code></a> chore: Prepare release 2.4.0</li>
<li><a href=""><code>07bd484</code></a> Merge branch 'issue448'</li>
<li><a href=""><code>2f6b419</code></a> feat: Expose <code>reference_path</code> in addition to <code>canonical_path</code></li>
<li><a href=""><code>7c03941</code></a> ci: Stop installing Graphviz in CI</li>
<li><a href=""><code>dc6300d</code></a> fix: Preserve standalone named expression parentheses</li>
<li><a href=""><code>4701aa5</code></a> docs: clarify enum string representation</li>
<li><a href=""><code>657ce96</code></a> perf: Prune function bodies from source before building AST</li>
<li><a href=""><code>8b94205</code></a> fix: Propagate <code>public</code> value to inherited members (aliases)</li>
<li><a href=""><code>05adf03</code></a> chore: Lint</li>
<li><a href=""><code>219b1e1</code></a> chore: Add project URLs metadata to griffelib and griffecli</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/griffe/compare/2.3.2...2.4.0">compare view</a></li>
</ul>
</details>
<br />

Updates `jsonpointer` from 3.2.1 to 3.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/stefankoegl/python-json-pointer/releases">jsonpointer's releases</a>.</em></p>
<blockquote>
<h2>3.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Add <code>create</code> parameter to <code>set_pointer</code> for auto-creating missing paths by <a href="https://github.com/stefankoegl"><code>@​stefankoegl</code></a> in <a href="">stefankoegl/python-json-pointer#84</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/stefankoegl/python-json-pointer/compare/v3.3...v3.4">https://github.com/stefankoegl/python-json-pointer/compare/v3.3...v3.4</a></p>
<h2>3.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Preserve control-flow exceptions when joining pointer parts by <a href="https://github.com/muneikh"><code>@​muneikh</code></a> in <a href="">stefankoegl/python-json-pointer#91</a></li>
<li>Continue CLI batches after malformed JSON input by <a href="https://github.com/xingzhao-ji"><code>@​xingzhao-ji</code></a> in <a href="">stefankoegl/python-json-pointer#92</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/muneikh"><code>@​muneikh</code></a> made their first contribution in <a href="">stefankoegl/python-json-pointer#91</a></li>
<li><a href="https://github.com/xingzhao-ji"><code>@​xingzhao-ji</code></a> made their first contribution in <a href="">stefankoegl/python-json-pointer#92</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/stefankoegl/python-json-pointer/compare/v3.2.1...v3.3">https://github.com/stefankoegl/python-json-pointer/compare/v3.2.1...v3.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fb77107</code></a> bump version to 3.4</li>
<li><a href=""><code>677fb60</code></a> Merge pull request <a href="">#84</a> from stefankoegl/claude/cool-lamport-vayggt</li>
<li><a href=""><code>57a8e8d</code></a> bump version to 3.3</li>
<li><a href=""><code>ea7e2c4</code></a> Merge pull request <a href="">#92</a> from xingzhao-ji/fix-cli-malformed-json-batches</li>
<li><a href=""><code>9b78c3b</code></a> Raise JsonPointerException when appending to an immutable sequence</li>
<li><a href=""><code>15079d6</code></a> Make malformed-input continuation opt-in</li>
<li><a href=""><code>4b71780</code></a> Continue CLI batches after malformed JSON input</li>
<li><a href=""><code>86b82bf</code></a> Merge pull request <a href="">#91</a> from muneikh/fix-pointer-join-interruptions</li>
<li><a href=""><code>bd83197</code></a> Preserve control-flow exceptions when joining pointer parts</li>
<li><a href=""><code>ead884a</code></a> Add create option to set_pointer to create missing members (<a href="">#41</a>)</li>
<li>See full diff in <a href="https://github.com/stefankoegl/python-json-pointer/compare/v3.2.1...v3.4">compare view</a></li>
</ul>
</details>
<br />

Updates `markdown` from 3.11 to 3.11.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Python-Markdown/markdown/releases">markdown's releases</a>.</em></p>
<blockquote>
<h2>Release 3.11.2</h2>
<h3>Fixed</h3>
<ul>
<li>Sanitize attribute names in the <code>fenced_code</code> and <code>legacy_attrs</code> extensions so an
attribute name cannot break out of its tag and inject markup (<a href="">#1663</a>).</li>
<li>For backwards compatibility, revert the enforcement of CommonMark style
punctuation rules (<a href="">#1657</a>).</li>
</ul>
<h2>Release 3.11.1</h2>
<h3>Fixed</h3>
<ul>
<li>Update serializer to be non-recursive (<a href="">#1644</a>).</li>
<li>Improve ancestor handling in the inline <code>Treeprocessor</code> (<a href="">#1646</a>).</li>
<li>Keep a raw HTML comment inside an inline HTML element that closes in the
same paragraph, instead of splitting the paragraph around it (<a href="">#1643</a>).</li>
<li>Fix issue where inline HTML attributes were rejected if they had <code>&lt;</code> or <code>&gt;</code> in the attribute (<a href="">#1647</a>).</li>
<li>Fix issue where an unterminated end tag (<code>&lt;/foo</code>) could cause all remaining content to be dropped (<a href="">#1651</a>).</li>
<li>Complete rework of emphasis handling to improve nested emphasis handling better (<a href="">#1632</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Python-Markdown/markdown/blob/master/docs/changelog.md">markdown's changelog</a>.</em></p>
<blockquote>
<h2>[3.11.2] - 2026-10-19</h2>
<h3>Fixed</h3>
<ul>
<li>Sanitize attribute names in the <code>fenced_code</code> and <code>legacy_attrs</code> extensions so an
attribute name cannot break out of its tag and inject markup (<a href="">#1663</a>).</li>
<li>For backwards compatibility, revert the enforcement of CommonMark style
punctuation rules (<a href="">#1657</a>).</li>
</ul>
<h2>[3.11.1] - 2026-10-13</h2>
<h3>Fixed</h3>
<ul>
<li>Update serializer to be non-recursive (<a href="">#1644</a>).</li>
<li>Improve ancestor handling in the inline <code>Treeprocessor</code> (<a href="">#1646</a>).</li>
<li>Keep a raw HTML comment inside an inline HTML element that closes in the
same paragraph, instead of splitting the paragraph around it (<a href="">#1643</a>).</li>
<li>Fix issue where inline HTML attributes were rejected if they had <code>&lt;</code> or <code>&gt;</code> in the attribute (<a href="">#1647</a>).</li>
<li>Fix issue where an unterminated end tag (<code>&lt;/foo</code>) could cause all remaining content to be dropped (<a href="">#1651</a>).</li>
<li>Complete rework of emphasis handling to improve nested emphasis handling better (<a href="">#1632</a>).</li>
</ul>
<h2>[3.11.0] - 2026-09-25</h2>
<h3>Changed</h3>
<ul>
<li>Inline processors now resume searching after the previous match, improving
performance for repeated inline patterns (<a href="">#1619</a>).</li>
<li>Officially support Python 3.15 and drop support for Python 3.10</li>
<li>Walk backtick runs in <code>BacktickInlineProcessor</code> without a regex (<a href="">#1620</a>).</li>
<li>Switch static site generator for documentation from MkDocs to Zensical
(<a href="">#1627</a>, <a href="">#1635</a>, <a href="">#1637</a>, and <a href="">#1638</a>).</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Ensure removing Abbreviations does not raise an error (<a href="">#1634</a>).</li>
<li>Fix an issue with excessive backtracking when matching inline code blocks (<a href="">#1617</a>).</li>
<li><code>md_in_html</code> now honors tags added to <code>Markdown.block_level_elements</code> after
the extension is loaded (<a href="">#1246</a>).</li>
<li>Fix quadratic-time regex backtracking in <code>ReferenceProcessor</code> when a link
reference definition has no URL, e.g. a line consisting only of <code>[id]:</code>
followed by many trailing spaces (<a href="">#798</a>).</li>
<li>Document <code>attr_list</code> usage for <code>def_list</code> (<a href="">#1123</a>).</li>
</ul>
<h2>[3.10.3] - 2026-07-30</h2>
<h3>Fixed</h3>
<ul>
<li>Fix <code>SetextHeaderProcessor</code> regex to prevent mixed <code>=</code> and <code>-</code> chars in setext-style headers (<a...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01f31efcfcca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.