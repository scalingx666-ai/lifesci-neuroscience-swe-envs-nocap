# Issue

**Title:** [dependabot]: Bump the deps group with 17 updates

## Description

Bumps the deps group with 17 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `4.0.6` | `4.0.12` |
| [mne-icalabel](https://github.com/mne-tools/mne-icalabel) | `0.9.0` | `0.10.0` |
| [prek](https://github.com/j178/prek) | `0.5.4` | `0.5.5` |
| [black](https://github.com/psf/black) | `26.5.1` | `26.10.0` |
| [aiohttp](https://github.com/aio-libs/aiohttp) | `3.14.3` | `3.14.4` |
| [charset-normalizer](https://github.com/jawah/charset_normalizer) | `3.5.1` | `3.5.2` |
| [cyclopts](https://github.com/BrianPugh/cyclopts) | `5.0.0` | `5.1.1` |
| [edfio](https://github.com/the-siesta-group/edfio) | `0.4.17` | `0.4.18` |
| [fonttools](https://github.com/fonttools/fonttools) | `4.66.0` | `4.66.1` |
| [markupsafe](https://github.com/pallets/markupsafe) | `3.0.3` | `3.0.4` |
| [platformdirs](https://github.com/tox-dev/platformdirs) | `4.12.1` | `4.12.3` |
| [pytz](https://github.com/stub42/pytz) | `2026.4` | `2026.5` |
| [qh3](https://github.com/jawah/qh3) | `2.0.3` | `2.0.4` |
| [rpds-py](https://github.com/crate-py/rpds) | `2026.6.3` | `2026.9.1` |
| [tzdata](https://github.com/python/tzdata) | `2026.4` | `2026.5` |
| [urllib3-future](https://github.com/jawah/urllib3.future) | `2.25.901` | `2.25.902` |
| [zipp](https://github.com/jaraco/zipp) | `4.1.0` | `4.1.1` |

Updates `filelock` from 4.0.6 to 4.0.12
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.0.12</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>fix: support older SQLite read locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#771</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.0.11...4.0.12">https://github.com/tox-dev/filelock/compare/4.0.11...4.0.12</a></p>
<h2>4.0.11</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>docs: select an existing tox environment in contributing guide by <a href="https://github.com/raghav-sharma-ai"><code>@​raghav-sharma-ai</code></a> in <a href="">tox-dev/filelock#767</a></li>
<li>fix(read-write): handle NetBSD fd limits by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#768</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/raghav-sharma-ai"><code>@​raghav-sharma-ai</code></a> made their first contribution in <a href="">tox-dev/filelock#767</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.0.10...4.0.11">https://github.com/tox-dev/filelock/compare/4.0.10...4.0.11</a></p>
<h2>4.0.10</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>♻️ refactor(util): test helpers via public locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#764</a></li>
<li>🐛 fix(singleton): reject conflicting async and lease options by <a href="https://github.com/kokotatan"><code>@​kokotatan</code></a> in <a href="">tox-dev/filelock#765</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/kokotatan"><code>@​kokotatan</code></a> made their first contribution in <a href="">tox-dev/filelock#765</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.0.9...4.0.10">https://github.com/tox-dev/filelock/compare/4.0.9...4.0.10</a></p>
<h2>4.0.9</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>📝 docs(util): correct write and break guarantees by <a href="https://github.com/pralav-25"><code>@​pralav-25</code></a> in <a href="">tox-dev/filelock#762</a></li>
<li>🐛 fix(read-write): close db fd after connect by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#763</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/pralav-25"><code>@​pralav-25</code></a> made their first contribution in <a href="">tox-dev/filelock#762</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/4.0.8...4.0.9">https://github.com/tox-dev/filelock/compare/4.0.8...4.0.9</a></p>
<h2>4.0.8</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(read-write): refuse cross-thread write release by <a href="https://github.com/feiiiiii5"><code>@​feiiiiii5</code></a> in <a href="">tox-dev/filelock#761</a></li>
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
<p>4.0.12 (2026-10-05)</p>
<hr />
<ul>
<li>Fix read-lock acquisition on SQLite versions older than 3.33.0 by using <code>sqlite_master</code> for the schema probe. :pr:<code>769</code></li>
</ul>
<hr />
<p>4.0.11 (2026-10-05)</p>
<hr />
<ul>
<li><code>ReadWriteLock</code> and <code>AsyncReadWriteLock</code> use a validated private hard link when <code>/dev/fd</code> has no entry for the
database descriptor, supporting NetBSD's static descriptor directory beyond descriptor 63. The temporary location must
share a filesystem with the database. The symlink refusal test accepts NetBSD's error wording.</li>
</ul>
<hr />
<p>4.0.10 (2026-10-03)</p>
<hr />
<ul>
<li>Reusing a singleton <code>AsyncFileLock</code> with another <code>loop</code>, <code>executor</code> or <code>run_in_executor</code>, or a singleton
<code>SoftFileLease</code> with another <code>lease_duration</code>, <code>heartbeat_interval</code> or <code>on_compromise</code>, now raises
<code>ValueError</code> instead of returning the lock with its original options. :pr:<code>765</code></li>
</ul>
<hr />
<p>4.0.9 (2026-10-01)</p>
<hr />
<ul>
<li><code>ReadWriteLock</code> and <code>AsyncReadWriteLock</code> close the descriptor that checks the database path once SQLite has
connected, so on PyPy a dropped lock leaves no descriptor open until garbage collection runs. :pr:<code>763</code></li>
<li><code>ReadWriteLock</code> and <code>AsyncReadWriteLock</code> refuse a symlink at the database path instead of following it, so a
user who can create names in a shared lock directory cannot point the lock at another file (GHSA-j8f7-rjxc-mr56).</li>
</ul>
<hr />
<p>4.0.8 (2026-10-01)</p>
<hr />
<ul>
<li><code>ReadWriteLock.release()</code> and <code>SoftReadWriteLock.release()</code> from a thread that does not hold the write lock now
raise <code>RuntimeError</code> instead of dropping the holder's lock and letting a second writer in. :pr:<code>761</code></li>
</ul>
<hr />
<p>4.0.7 (2026-09-29)</p>
<hr />
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>09b36c4</code></a> Release 4.0.12</li>
<li><a href=""><code>33e2d11</code></a> fix: support older SQLite read locks</li>
<li><a href=""><code>822d32b</code></a> Release 4.0.11</li>
<li><a href=""><code>47f036d</code></a> fix(read-write): handle NetBSD fd limits</li>
<li><a href=""><code>2e0abe5</code></a> docs: select an existing tox environment in contributing guide (<a href="">#767</a>)</li>
<li><a href=""><code>1f0632b</code></a> Release 4.0.10</li>
<li><a href=""><code>c9c65ab</code></a> 🐛 fix(singleton): reject conflicting async and lease options (<a href="">#765</a>)</li>
<li><a href=""><code>bc2405b</code></a> ♻️ refactor(util): test helpers via public locks (<a href="">#764</a>)</li>
<li><a href=""><code>7b00bb8</code></a> Release 4.0.9</li>
<li><a href=""><code>4944624</code></a> 🐛 fix(read-write): close db fd after connect (<a href="">#763</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/4.0.6...4.0.12">compare view</a></li>
</ul>
</details>
<br />

Updates `mne-icalabel` from 0.9.0 to 0.10.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mne-tools/mne-icalabel/releases">mne-icalabel's releases</a>.</em></p>
<blockquote>
<h2>v0.10.0</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: don't warn about missing CAR when average reference is a projection by <a href="https://github.com/Leonard013"><code>@​Leonard013</code></a> in <a href="">mne-tools/mne-icalabel#316</a></li>
<li>Fix Torch ICLabel with a float64 default dtype by <a href="https://github.com/viranovskaya"><code>@​viranovskaya</code></a> in <a href="">mne-tools/mne-icalabel#325</a></li>
<li>Bump actions/setup-python from 6 to 7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mne-tools/mne-icalabel#318</a></li>
<li>Modernize packaging: src layout, setuptools_scm, dependency groups, uv by <a href="https://github.com/mscheltienne"><code>@​mscheltienne</code></a> in <a href="">mne-tools/mne-icalabel#332</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Leonard013"><code>@​Leonard013</code></a> made their first contribution in <a href="">mne-tools/mne-icalabel#316</a></li>
<li><a href="https://github.com/viranovskaya"><code>@​viranovskaya</code></a> made their first contribution in <a href="">mne-tools/mne-icalabel#325</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/mne-tools/mne-icalabel/compare/v0.9.0...v0.10.0">https://github.com/mne-tools/mne-icalabel/compare/v0.9.0...v0.10.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c79317d</code></a> Prepare 0.10.0 release (<a href="">#333</a>)</li>
<li><a href=""><code>845e27c</code></a> Modernize packaging: src layout, setuptools_scm, dependency groups, uv (<a href="">#332</a>)</li>
<li><a href=""><code>a9bbf92</code></a> Bump actions/setup-python from 6 to 7 (<a href="">#318</a>)</li>
<li><a href=""><code>4d418b6</code></a> Fix Torch ICLabel with a float64 default dtype (<a href="">#325</a>)</li>
<li><a href=""><code>93d5945</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#331</a>)</li>
<li><a href=""><code>8376549</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#330</a>)</li>
<li><a href=""><code>cc3cccf</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#329</a>)</li>
<li><a href=""><code>3b67cfb</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#328</a>)</li>
<li><a href=""><code>7aefc4a</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#327</a>)</li>
<li><a href=""><code>19b456f</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#326</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/mne-tools/mne-icalabel/compare/v0.9.0...v0.10.0">compare view</a></li>
</ul>
</details>
<br />

Updates `prek` from 0.5.4 to 0.5.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/releases">prek's releases</a>.</em></p>
<blockquote>
<h2>0.5.5</h2>
<h2>Release Notes</h2>
<p>Released on 2026-10-05.</p>
<h3>Enhancements</h3>
<ul>
<li>Add Nushell completion generation (<a href="">#2785</a>)</li>
<li>Add <code>ppc64le</code> wheel and binary builds (<a href="">#2809</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid JSON imports when querying Python interpreters (<a href="">#2790</a>)</li>
<li>Avoid duplicate diffs after hooks rewrite files (<a href="">#2815</a>)</li>
<li>Batch file reads in shebang checks (<a href="">#2793</a>)</li>
<li>Check cached hook environments concurrently (<a href="">#2797</a>)</li>
<li>Overlap Git discovery with worktree status checks (<a href="">#2821</a>)</li>
<li>Query staged additions only for case conflicts (<a href="">#2802</a>)</li>
<li>Reduce worker overhead in XML and pygrep checks (<a href="">#2789</a>)</li>
<li>Reuse Git worktree state during hook startup (<a href="">#2787</a>)</li>
<li>Reuse intent-to-add paths when saving unstaged changes (<a href="">#2788</a>)</li>
<li>Run Git queries concurrently for case-conflict checks (<a href="">#2792</a>)</li>
<li>Share Bun and Deno version queries across environments (<a href="">#2795</a>)</li>
<li>Share Lua runtime probes across hook environments (<a href="">#2796</a>)</li>
<li>Share Ruby version queries across hook environments (<a href="">#2794</a>)</li>
<li>Share mise version queries across hook environments (<a href="">#2798</a>)</li>
<li>Skip site initialization in Python interpreter probes (<a href="">#2822</a>)</li>
<li>Skip untracked files in destroyed symlink checks (<a href="">#2799</a>)</li>
<li>Skip unused file input for always-run hooks (<a href="">#2813</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Preserve staged and unstaged changes on conflicted stash restore (<a href="">#2803</a>)</li>
<li>Default missing <code>core.fileMode</code> in shebang checks (<a href="">#2832</a>)</li>
<li>Match protected branch patterns from the start (<a href="">#2829</a>)</li>
<li>Normalize explicit paths in shebang index checks (<a href="">#2831</a>)</li>
<li>Preserve empty <code>trailing-whitespace</code> character sets (<a href="">#2830</a>)</li>
<li>Reject empty files in <code>check-json</code> (<a href="">#2826</a>)</li>
<li>Reject trailing data in <code>check-json</code> (<a href="">#2828</a>)</li>
<li>Round up file sizes in <code>check-added-large-files</code> (<a href="">#2827</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Redesign the prek badge and refresh logo details (<a href="">#2818</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/imphil"><code>@​imphil</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/blob/master/CHANGELOG.md">prek's changelog</a>.</em></p>
<blockquote>
<h2>0.5.5</h2>
<p>Released on 2026-10-05.</p>
<h3>Enhancements</h3>
<ul>
<li>Add Nushell completion generation (<a href="">#2785</a>)</li>
<li>Add <code>ppc64le</code> wheel and binary builds (<a href="">#2809</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid JSON imports when querying Python interpreters (<a href="">#2790</a>)</li>
<li>Avoid duplicate diffs after hooks rewrite files (<a href="">#2815</a>)</li>
<li>Batch file reads in shebang checks (<a href="">#2793</a>)</li>
<li>Check cached hook environments concurrently (<a href="">#2797</a>)</li>
<li>Overlap Git discovery with worktree status checks (<a href="">#2821</a>)</li>
<li>Query staged additions only for case conflicts (<a href="">#2802</a>)</li>
<li>Reduce worker overhead in XML and pygrep checks (<a href="">#2789</a>)</li>
<li>Reuse Git worktree state during hook startup (<a href="">#2787</a>)</li>
<li>Reuse intent-to-add paths when saving unstaged changes (<a href="">#2788</a>)</li>
<li>Run Git queries concurrently for case-conflict checks (<a href="">#2792</a>)</li>
<li>Share Bun and Deno version queries across environments (<a href="">#2795</a>)</li>
<li>Share Lua runtime probes across hook environments (<a href="">#2796</a>)</li>
<li>Share Ruby version queries across hook environments (<a href="">#2794</a>)</li>
<li>Share mise version queries across hook environments (<a href="">#2798</a>)</li>
<li>Skip site initialization in Python interpreter probes (<a href="">#2822</a>)</li>
<li>Skip untracked files in destroyed symlink checks (<a href="">#2799</a>)</li>
<li>Skip unused file input for always-run hooks (<a href="">#2813</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Preserve staged and unstaged changes on conflicted stash restore (<a href="">#2803</a>)</li>
<li>Default missing <code>core.fileMode</code> in shebang checks (<a href="">#2832</a>)</li>
<li>Match protected branch patterns from the start (<a href="">#2829</a>)</li>
<li>Normalize explicit paths in shebang index checks (<a href="">#2831</a>)</li>
<li>Preserve empty <code>trailing-whitespace</code> character sets (<a href="">#2830</a>)</li>
<li>Reject empty files in <code>check-json</code> (<a href="">#2826</a>)</li>
<li>Reject trailing data in <code>check-json</code> (<a href="">#2828</a>)</li>
<li>Round up file sizes in <code>check-added-large-files</code> (<a href="">#2827</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Redesign the prek badge and refresh logo details (<a href="">#2818</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/imphil"><code>@​imphil</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>77cca67</code></a> Bump version to 0.5.5 (<a href="">#2839</a>)</li>
<li><a href=""><code>f4e2695</code></a> Update Rust crate jsonc-parser to 0.34.0 (<a href="">#2838</a>)</li>
<li><a href=""><code>399e9d1</code></a> Update GitHub Actions (<a href="">#2837</a>)</li>
<li><a href=""><code>19e77d1</code></a> Update prek hooks (<a href="">#2771</a>)</li>
<li><a href=""><code>e261e0c</code></a> Update dependency uv to v0.12.19 (<a href="">#2835</a>)</li>
<li><a href=""><code>bc53e2c</code></a> Update Rust crate thiserror to v2.0.21 (<a href="">#2836</a>)</li>
<li><a href=""><code>4a981d2</code></a> Default missing core.fileMode in shebang checks (<a href="">#2832</a>)</li>
<li><a href=""><code>e031022</code></a> Preserve empty trailing-whitespace character sets (<a href="">#2830</a>)</li>
<li><a href=""><code>0b1871a</code></a> Normalize explicit paths in shebang index checks (<a href="">#2831</a>)</li>
<li><a href=""><code>9d4aede</code></a> Match protected branch patterns from the start (<a href="">#2829</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/j178/prek/compare/v0.5.4...v0.5.5">compare view</a></li>
</ul>
</details>
<br />

Updates `black` from 26.5.1 to 26.10.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/releases">black's releases</a>.</em></p>
<blockquote>
<h2>26.10.0</h2>
<h3>Stable style</h3>
<ul>
<li><code>--line-ranges</code> no longer inserts an empty line after a docstring when the range
covers only the docstring itself (<a href="">#5312</a>)</li>
<li>Fix <code># fmt: skip</code> on a bracketed ternary turning the surrounding tuple into a call
(<a href="">#5464</a>)</li>
<li>Fix crash when <code># fmt: skip</code> is placed on a one-line function or class with PEP 695
type parameters (<a href="">#5429</a>)</li>
<li>Fix an inline comment after the closing bracket of optional parentheses being moved
inside the parentheses when the parenthesized expression contains own-line comments
(<a href="">#5395</a>)</li>
<li>Fix unparseable output when <code># fmt: skip</code> is placed on a bracket of an <code>if</code>, <code>while</code>,
<code>for</code>, or <code>with</code> header (<a href="">#5401</a>, <a href="">#5405</a>)</li>
<li>Fix crash when formatting parenthesized expressions with multiple inline comments and
<code># fmt: skip</code> (<a href="">#5414</a>)</li>
<li>Fix parsing Jupyter notebook assignment magics when non-ASCII characters appear
earlier on the line (<a href="">#5381</a>)</li>
<li>Preserve blank lines that come immediately before a <code># fmt: on</code> comment (<a href="">#5300</a>)</li>
<li>Keep the parentheses around the target of an annotated assignment (e.g.
<code>(x): int = 5</code>), which prevent CPython from including the name in <code>__annotations__</code>
(<a href="">#5321</a>)</li>
<li>Stop treating a t-string in docstring position as a docstring (e.g. <code>t&quot;  spam  &quot;</code> as
the first statement of a module, class or function) (<a href="">#5287</a>)</li>
<li>Fix unparseable output for a t-string whose replacement field contains a quote (e.g.
<code>t'\'{a[&quot;b&quot;]}\''</code>) (<a href="">#5265</a>)</li>
<li>Fix unparseable output for a triple-quoted string whose body ends in an
already-escaped double quote (e.g. <code>'''\'''\&quot;'''</code>) (<a href="">#5262</a>)</li>
<li>Fix <code>--skip-magic-trailing-comma</code> dropping the trailing comma from a split
single-element tuple used as a lambda parameter default (<a href="">#5246</a>)</li>
<li>Fix unstable formatting when an inline comment sits on optional parentheses (e.g. a
parenthesized assert message) (<a href="">#5241</a>)</li>
<li>Fix <code>--skip-magic-trailing-comma</code> dropping the trailing comma of a one-element
subscript (<code>a[x,]</code>) when the line is long enough to be split and contains a power
operator (<a href="">#5272</a>)</li>
<li>Fix crash when a standalone comment sits between tokens of a comprehension or lambda
(<a href="">#5144</a>)</li>
<li>Fix inline comments on a bracket inside a comprehension being dropped (<a href="">#5330</a>)</li>
<li>Respect the magic trailing comma in a PEP 695 type parameter list containing a
<code>*TypeVarTuple</code> or <code>**ParamSpec</code> (<a href="">#5244</a>)</li>
<li>Fix crash when a comment-only <code># fmt: off</code>/<code># fmt: on</code> block is followed by a <code>with</code>
statement after another standalone comment (<a href="">#5189</a>)</li>
<li>Fix a crash when splitting <code>case case if ...</code> match patterns at very small line
lengths (<a href="">#5147</a>)</li>
<li>Fix multiline docstring indentation when leading tabs are used inside indented
docstrings (<a href="">#5148</a>)</li>
<li>Respect <code># fmt: skip</code> on a line that opens a bracket (e.g.
<code>from x import (  # fmt: skip</code>) when a standalone comment is among the bracket's
contents (<a href="">#5161</a>)</li>
<li>Fix an AST safety error when separate <code># type: ignore</code> comments in a parenthesized</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/blob/main/CHANGES.md">black's changelog</a>.</em></p>
<blockquote>
<h2>Version 26.10.0</h2>
<h3>Stable style</h3>
<ul>
<li><code>--line-ranges</code> no longer inserts an empty line after a docstring when the range
covers only the docstring itself (<a href="">#5312</a>)</li>
<li>Fix <code># fmt: skip</code> on a bracketed ternary turning the surrounding tuple into a call
(<a href="">#5464</a>)</li>
<li>Fix crash when <code># fmt: skip</code> is placed on a one-line function or class with PEP 695
type parameters (<a href="">#5429</a>)</li>
<li>Fix an inline comment after the closing bracket of optional parentheses being moved
inside the parentheses when the parenthesized expression contains own-line comments
(<a href="">#5395</a>)</li>
<li>Fix unparseable output when <code># fmt: skip</code> is placed on a bracket of an <code>if</code>, <code>while</code>,
<code>for</code>, or <code>with</code> header (<a href="">#5401</a>, <a href="">#5405</a>)</li>
<li>Fix crash when formatting parenthesized expressions with multiple inline comments and
<code># fmt: skip</code> (<a href="">#5414</a>)</li>
<li>Fix parsing Jupyter notebook assignment magics when non-ASCII characters appear
earlier on the line (<a href="">#5381</a>)</li>
<li>Preserve blank lines that come immediately before a <code># fmt: on</code> comment (<a href="">#5300</a>)</li>
<li>Keep the parentheses around the target of an annotated assignment (e.g.
<code>(x): int = 5</code>), which prevent CPython from including the name in <code>__annotations__</code>
(<a href="">#5321</a>)</li>
<li>Stop treating a t-string in docstring position as a docstring (e.g. <code>t&quot;  spam  &quot;</code> as
the first statement of a module, class or function) (<a href="">#5287</a>)</li>
<li>Fix unparseable output for a t-string whose replacement field contains a quote (e.g.
<code>t'\'{a[&quot;b&quot;]}\''</code>) (<a href="">#5265</a>)</li>
<li>Fix unparseable output for a triple-quoted string whose body ends in an
already-escaped double quote (e.g. <code>'''\'''\&quot;'''</code>) (<a href="">#5262</a>)</li>
<li>Fix <code>--skip-magic-trailing-comma</code> dropping the trailing comma from a split
single-element tuple used as a lambda parameter default (<a href="">#5246</a>)</li>
<li>Fix unstable formatting when an inline comment sits on optional parentheses (e.g. a
parenthesized assert message) (<a href="">#5241</a>)</li>
<li>Fix <code>--skip-magic-trailing-comma</code> dropping the trailing comma of a one-element
subscript (<code>a[x,]</code>) when the line is long enough to be split and contains a power
operator (<a href="">#5272</a>)</li>
<li>Fix crash when a standalone comment sits between tokens of a comprehension or lambda
(<a href="">#5144</a>)</li>
<li>Fix inline comments on a bracket inside a comprehension being dropped (<a href="">#5330</a>)</li>
<li>Respect the magic trailing comma in a PEP 695 type parameter list containing a
<code>*TypeVarTuple</code> or <code>**ParamSpec</code> (<a href="">#5244</a>)</li>
<li>Fix crash when a comment-only <code># fmt: off</code>/<code># fmt: on</code> block is followed by a <code>with</code>
statement after another standalone comment (<a href="">#5189</a>)</li>
<li>Fix a crash when splitting <code>case case if ...</code> match patterns at very small line
lengths (<a href="">#5147</a>)</li>
<li>Fix multiline docstring indentation when leading tabs are used inside indented
docstrings (<a href="">#5148</a>)</li>
<li>Respect <code># fmt: skip</code> on a line that opens a bracket (e.g.
<code>from x import (  # fmt: skip</code>) when a standalone comment is among the bracket's
contents (<a href="">#5161</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4f1883b</code></a> Prepare release 26.10.0 (<a href="">#5478</a>)</li>
<li><a href=""><code>93e5c82</code></a> Do not split a docstring on non-newline characters (<a href="">#5461</a>)</li>
<li><a href=""><code>2f3f992</code></a> Fix superlinear runtime growth with the number of input files (<a href="">#5450</a>)</li>
<li><a href=""><code>d078e8e</code></a> Refactor release process to be more automated and use immutable releases (<a href="">#5296</a>)</li>
<li><a href=""><code>6408e69</code></a> Preserve leaf line numbers in append_leaves to prevent pragma line collapse (...</li>
<li><a href=""><code>cf8560b</code></a> Add is_formatted output to GitHub Action (<a href="">#3526</a>) (<a href="">#5408</a>)</li>
<li><a href=""><code>9b65aa3</code></a> docs(contributing): fix two grammar typos in issue_triage.md (<a href="">#5426</a>)</li>
<li><a href=""><code>e1c4783</code></a> Fix --force-exclude for paths containing .. (<a href="">#5471</a>)</li>
<li><a href=""><code>34bfc69</code></a> Fix duplicated comments when string_processing rewrites a line (<a href="">#5449</a>)</li>
<li><a href=""><code>5fe7881</code></a> Fix preview blank lines after a stub method (<a href="">#5439</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/black/compare/26.5.1...26.10.0">compare view</a></li>
</ul>
</details>
<br />

Updates `aiohttp` from 3.14.3 to 3.14.4
Updates `charset-normalizer` from 3.5.1 to 3.5.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/releases">charset-normalizer's releases</a>.</em></p>
<blockquote>
<h2>Version 3.5.2</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.5.1...3.5.2">3.5.2</a> (2026-09-29)</h2>
<h3>Changed</h3>
<ul>
<li>Raised the Cython upper bound to <code>&lt;3.4</code> for native builds. The bound remains <code>&lt;3.3</code> for
<code>abi3</code> builds to preserve compatibility with the Python 3.7 Limited API.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Valid UTF-8 Chinese JSON incorrectly detected as PTCP154 due to excessive noise penalties
for uncommon CJK characters. (<a href="">#796</a>)</li>
<li>Supported encodings without aliases failing name resolution or being ignored in charset
declarations. (<a href="">#800</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md">charset-normalizer's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.5.1...3.5.2">3.5.2</a> (2026-09-29)</h2>
<h3>Changed</h3>
<ul>
<li>Raised the Cython upper bound to <code>&lt;3.4</code> for native builds. The bound remains <code>&lt;3.3</code> for
<code>abi3</code> builds to preserve compatibility with the Python 3.7 Limited API.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Valid UTF-8 Chinese JSON incorrectly detected as PTCP154 due to excessive noise penalties
for uncommon CJK characters. (<a href="">#796</a>)</li>
<li>Supported encodings without aliases failing name resolution or being ignored in charset
declarations. (<a href="">#800</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>935c29a</code></a> Release 3.5.2 (<a href="">#805</a>)</li>
<li><a href=""><code>9d3238a</code></a> test: disable traefik in downstream niquests</li>
<li><a href=""><code>b4c0368</code></a> docs: write changelog entry for 3.5.2</li>
<li><a href=""><code>717da31</code></a> chore: bump version to 3.5.2</li>
<li><a href=""><code>264895d</code></a> chore: update pypa/cibuildwheel and pypa/gh-action-pypi-publish</li>
<li><a href=""><code>41e28b6</code></a> chore: raise Cython upper bound to 3.3</li>
<li><a href=""><code>b130b7d</code></a> Fix valid UTF-8 Chinese JSON misdetected as PTCP154 (<a href="">#796</a>)</li>
<li><a href=""><code>f6afd31</code></a> Make the IANA_NO_ALIASES encodings resolvable by name (<a href="">#800</a>)</li>
<li>See full diff in <a href="https://github.com/jawah/charset_normalizer/compare/3.5.1...3.5.2">compare view</a></li>
</ul>
</details>
<br />

Updates `cyclopts` from 5.0.0 to 5.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/BrianPugh/cyclopts/releases">cyclopts's releases</a>.</em></p>
<blockquote>
<h2>v5.1.1</h2>
<h2>Bug Fixes</h2>
<ul>
<li>Accept <code>--flag=none</code> on a <code>bool | None</code> annotation by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#978</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.1.0...v5.1.1">https://github.com/BrianPugh/cyclopts/compare/v5.1.0...v5.1.1</a></p>
<h2>v5.1.0</h2>
<h2>Features</h2>
<ul>
<li>Support <code>bool</code> union'd with other types.
<ul>
<li>fix: support bare and negative flags on unions containing bool (e.g. bool | list[str]) by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#973</a></li>
<li>fix: show the specific choices/value error for bad values on unions with a bool flag by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#974</a></li>
<li>fix: support bool and other members alongside an enum.Flag in a union (e.g. bool | MyFlag) by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#975</a></li>
<li>fix: let --x.<!-- raw HTML omitted --> options select a non-Flag member of a union with an enum.Flag by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#977</a></li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.0.0...v5.1.0">https://github.com/BrianPugh/cyclopts/compare/v5.0.0...v5.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e15ac66</code></a> fix: accept --flag=none on a bool | None flag</li>
<li><a href=""><code>eecf050</code></a> Merge pull request <a href="">#977</a> from BrianPugh/fix/union-enum-flag-keyed-member</li>
<li><a href=""><code>8b1925b</code></a> test: pin that a keyless value on a Flag union follows member order</li>
<li><a href=""><code>dcea860</code></a> fix: let keyed options select a non-Flag member of a union with an enum.Flag</li>
<li><a href=""><code>f0c87c0</code></a> Merge pull request <a href="">#975</a> from BrianPugh/fix/bool-union-enum-flag-972</li>
<li><a href=""><code>d4c16d9</code></a> fix: don't drop --x.&lt;member&gt; options given alongside a value on a union with ...</li>
<li><a href=""><code>982e138</code></a> fix: let the other members of a union with an enum.Flag convert tokens</li>
<li><a href=""><code>d6937db</code></a> Merge pull request <a href="">#974</a> from BrianPugh/fix/bool-union-errors-972</li>
<li><a href=""><code>fee3b4b</code></a> fix: treat a validator rejection as the value member taking a bool-looking fi...</li>
<li><a href=""><code>4e4e8a9</code></a> fix: descend to the first scalar token when a bool word meets a nested value ...</li>
<li>Additional commits viewable in <a href="https://github.com/BrianPugh/cyclopts/compare/v5.0.0...v5.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `edfio` from 0.4.17 to 0.4.18
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/the-siesta-group/edfio/blob/main/CHANGELOG.md">edfio's changelog</a>.</em></p>
<blockquote>
<h2>[0.4.18] - 2026-10-01</h2>
<h3>Fixed</h3>
<ul>
<li>Avoid float precision issues in <code>Edf.is_continuous</code> by using <code>decimal.Decimal</code> (<a href="">#119</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b4f729c</code></a> Update CHANGELOG.md for v0.4.18</li>
<li><a href=""><code>8b8d8a8</code></a> Avoid precision issues in Edf.is_continuous (<a href="">#119</a>)</li>
<li>See full diff in <a href="https://github.com/the-siesta-group/edfio/compare/v0.4.17...v0.4.18">compare view</a></li>
</ul>
</details>
<br />

Updates `fonttools` from 4.66.0 to 4.66.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/releases">fonttools's releases</a>.</em></p>
<blockquote>
<h2>4.66.1</h2>
<ul>
<li>[designspaceLib] When splitting a DesignSpace v5 document with <code>makeNames=True</code> (as <code>varLib.build_many</code> does), family and style names set explicitly on an instance now take precedence over the ones computed from the STAT labels, in all languages, and a PostScript name is no longer made up from the labels for an instance that has its own style name (<a href="">#3131</a>, <a href="">#4206</a>, <a href="">#4208</a>).</li>
<li>[cmap] Decompiling a format 4 subtable whose <code>idRangeOffset</code> points outside <code>glyphIndexArray</code> now raises <code>TTLibError</code>. A negative index used to silently map the code point to the wrong glyph, and one past the end raised a bare <code>AssertionError</code> (<a href="">#4209</a>).</li>
<li>[cmap] Fix compiling a format 2 subtable when the lowest glyph ID in a lead-byte row is 32768 or higher, which failed with <code>struct.error</code> (<a href="">#4210</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/blob/main/NEWS.rst">fonttools's changelog</a>.</em></p>
<blockquote>
<h2>4.66.1 (released 2026-09-29)</h2>
<ul>
<li>[designspaceLib] When splitting a DesignSpace v5 document with <code>makeNames=True</code>
(as <code>varLib.build_many</code> does), family and style names set explicitly on an
instance now take precedence over the ones computed from the STAT labels, in
all languages, and a PostScript name is no longer made up from the labels for
an instance that has its own style name (<a href="">#3131</a>, <a href="">#4206</a>, <a href="">#4208</a>).</li>
<li>[cmap] Decompiling a format 4 subtable whose <code>idRangeOffset</code> points outside
<code>glyphIndexArray</code> now raises <code>TTLibError</code>. A negative index used to silently
map the code point to the wrong glyph, and one past the end raised a bare
<code>AssertionError</code> (<a href="">#4209</a>).</li>
<li>[cmap] Fix compiling a format 2 subtable when the lowest glyph ID in a lead-byte
row is 32768 or higher, which failed with <code>struct.error</code> (<a href="">#4210</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9e95795</code></a> Release 4.66.1</li>
<li><a href=""><code>8fc91fb</code></a> Update NEWS.rst [skip ci]</li>
<li><a href=""><code>82dc507</code></a> Merge pull request <a href="">#4209</a> from insaf021/cmap4-idrangeoffset-bounds</li>
<li><a href=""><code>a83553e</code></a> trim comments</li>
<li><a href=""><code>85049d3</code></a> Merge pull request <a href="">#4208</a> from fonttools/fix-split-stat-names-override</li>
<li><a href=""><code>1ad111d</code></a> Merge pull request <a href="">#4210</a> from youdie006/cmap-format2-high-gids</li>
<li><a href=""><code>c9e9d68</code></a> [cmap] fix format 2 compile for glyph IDs above 32767</li>
<li><a href=""><code>85625c5</code></a> raise TTLibError for out-of-range glyphIndexArray offset in cmap format 4</li>
<li><a href=""><code>879173e</code></a> [designspaceLib] Let explicit instance names win over STAT labels when splitting</li>
<li><a href=""><code>718b61b</code></a> Bump version: 4.66.0 → 4.66.1.dev0</li>
<li>See full diff in <a href="https://github.com/fonttools/fonttools/compare/4.66.0...4.66.1">compare view</a></li>
</ul>
</details>
<br />

Updates `markupsafe` from 3.0.3 to 3.0.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pallets/markupsafe/releases">markupsafe's releases</a>.</em></p>
<blockquote>
<h2>3.0.4</h2>
<p>This is the MarkupSafe 3.0.4 fix release, which fixes bugs but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/MarkupSafe/3.0.4/">https://pypi.org/project/MarkupSafe/3.0.4/</a>
Changes: <a href="https://markupsafe.palletsprojects.com/page/changes/#version-3-0-4">https://markupsafe.palletsprojects.com/page/changes/#version-3-0-4</a>
Milestone: <a href="https://github.com/pallets/markupsafe/milestone/17?closed=1">https://github.com/pallets/markupsafe/milestone/17?closed=1</a></p>
<ul>
<li>Build Python 3.15, armv7l, ppc64le, Android, and iOS wheels.</li>
<li>Improve performance of <code>striptags</code>. <a href="">#521</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pallets/markupsafe/blob/main/CHANGES.rst">markupsafe's changelog</a>.</em></p>
<blockquote>
<h2>Version 3.0.4</h2>
<p>Released 2026-10-02</p>
<ul>
<li>Build Python 3.15, armv7l, ppc64le, Android, and iOS wheels.</li>
<li>Improve performance of <code>striptags</code>. :issue:<code>521</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ece2607</code></a> release version 3.0.4</li>
<li><a href=""><code>620bc80</code></a> split archs</li>
<li><a href=""><code>73c3be1</code></a> fix wheel builds (<a href="">#536</a>)</li>
<li><a href=""><code>d8ae19e</code></a> fix wheel builds</li>
<li><a href=""><code>ff1eaff</code></a> Build Android and iOS wheels (<a href="">#516</a>)</li>
<li><a href=""><code>87e64f9</code></a> build Android and iOS wheels</li>
<li><a href=""><code>bc33c55</code></a> Build ppc64le wheels (<a href="">#518</a>)</li>
<li><a href=""><code>0ddd6ea</code></a> build ppc64le wheels</li>
<li><a href=""><code>3e07758</code></a> Build armv7l wheels (<a href="">#514</a>)</li>
<li><a href=""><code>39b9aae</code></a> build armv7l wheels</li>
<li>Additional commits viewable in <a href="https://github.com/pallets/markupsafe/compare/3.0.3...3.0.4">compare view</a></li>
</ul>
</details>
<br />

Updates `platformdirs` from 4.12.1 to 4.12.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/platformdirs/releases">platformdirs's releases</a>.</em></p>
<blockquote>
<h2>4.12.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Place root config and data files in the first site directory by <a href="https://github.com/PDGGK"><code>@​PDGGK</code></a> in <a href="">tox-dev/platformdirs#607</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/PDGGK"><code>@​PDGGK</code></a> made their first contribution in <a href="">tox-dev/platformdirs#607</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/platformdirs/compare/4.12.2...4.12.3">https://github.com/tox-dev/platformdirs/compare/4.12.2...4.12.3</a></p>
<h2>4.12.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(api): build site paths from site lists by <a href="https://github.com/9Kun"><code>@​9Kun</code></a> in <a href="">tox-dev/platformdirs#604</a></li>
<li>♻️ refactor(api): share use_site iteration by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/platformdirs#606</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/9Kun"><code>@​9Kun</code></a> made their first contribution in <a href="">tox-dev/platformdirs#604</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/platformdirs/compare/4.12.1...4.12.2">https://github.com/tox-dev/platformdirs/compare/4.12.1...4.12.2</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/platformdirs/blob/main/docs/changelog.rst">platformdirs's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<p>.. towncrier-draft-entries:: Unreleased</p>
<p>.. towncrier release notes start</p>
<hr />
<p>4.12.4 (2026-10-07)</p>
<hr />
<ul>
<li>Keep site directories readable by other users when root calls
:meth:<code>~platformdirs.api.PlatformDirsABC.place_config_file</code> or another <code>place_*_file</code> method with
:attr:<code>~platformdirs.api.PlatformDirsABC.use_site_for_root</code> - by :user:<code>darrenhuai</code>. :pr:<code>610</code></li>
<li>Make :func:<code>~platformdirs.user_runtime_dir</code> warn and fall back from an unreachable <code>XDG_RUNTIME_DIR</code> under
:attr:<code>~platformdirs.api.PlatformDirsABC.ensure_exists</code> instead of raising. :pr:<code>611</code></li>
</ul>
<hr />
<p>4.12.3 (2026-10-03)</p>
<hr />
<ul>
<li>Place files from <code>place_config_file</code> and <code>place_data_file</code> in the first site directory for root on Unix with
<code>use_site_for_root=True</code> and <code>multipath=True</code>, where <code>find_config_file</code> and <code>find_data_file</code> look for them.
:pr:<code>607</code></li>
</ul>
<hr />
<p>4.12.2 (2026-09-29)</p>
<hr />
<ul>
<li>Keep <code>os.pathsep</code> in <code>site_applications_path</code> under <code>multipath=True</code> on platforms with one applications
directory. :pr:<code>604</code></li>
</ul>
<hr />
<p>4.12.1 (2026-09-28)</p>
<hr />
<ul>
<li>Avoid <code>PytestAssertRewriteWarning</code> when importing <code>platformdirs</code> before invoking pytest. :pr:<code>601</code></li>
</ul>
<hr />
<p>4.12.0 (2026-09-26)</p>
<hr />
<ul>
<li>Add <code>place_*_file</code> methods that return a file path under a user directory and create its missing parents with mode
<code>0o700</code>. :pr:<code>585</code></li>
<li>Add <code>find_&lt;kind&gt;_file</code> and <code>find_&lt;kind&gt;_files</code> to look up an existing file across the user and site directories of
each kind that has an <code>iter_&lt;kind&gt;_paths</code> method. :pr:<code>586</code></li>
<li>Add :func:<code>platformdirs.testing.isolated_dirs</code> and the <code>platformdirs_isolated</code> pytest fixture to resolve every
directory under one test root. :pr:<code>590</code></li>
<li>Emit :class:<code>~platformdirs.RuntimeDirWarning</code> when the Unix :func:<code>~platformdirs.user_runtime_dir</code> falls back from</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>960ff63</code></a> Release 4.12.3</li>
<li><a href=""><code>8047ad5</code></a> Place root config and data files in the first site directory (<a href="">#607</a>)</li>
<li><a href=""><code>af2fc7f</code></a> Release 4.12.2</li>
<li><a href=""><code>bdafa67</code></a> ♻️ refactor(api): share use_site iteration (<a href="">#606</a>)</li>
<li><a href=""><code>d5ff75c</code></a> 🐛 fix(api): keep os.pathsep in site_applications_path (<a href="">#604</a>)</li>
<li><a href=""><code>d545744</code></a> build(deps): bump astral-sh/setup-uv from 10.1.0 to 10.2.0 in the all group (...</li>
<li><a href=""><code>9fd89a7</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#603</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/platformdirs/compare/4.12.1...4.12.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pytz` from 2026.4 to 2026.5
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>21be17f</code></a> Add Python 3.14 to test suite</li>
<li><a href=""><code>fddd01c</code></a> Bump version numbers to 2026.5 (2026e)</li>
<li><a href=""><code>8f05ab3</code></a> IANA 2026e</li>
<li><a href=""><code>d79605f</code></a> Squashed 'tz/' changes from d633fe7ed3..db07415c7d</li>
<li>See full diff in <a href="https://github.com/stub42/pytz/compare/release_2026.4...release_2026.5">compare view</a></li>
</ul>
</details>
<br />

Updates `qh3` from 2.0.3 to 2.0.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/qh3/releases">qh3's releases</a>.</em></p>
<blockquote>
<h2>Version 2.0.4</h2>
<h1>2.0.4 (2026-10-01)</h1>
<p><strong>Changed</strong></p>
<ul>
<li>Updated aws-lc-rs v1.18.0 to v1.18.1</li>
<li>Updated quinn-udp v0.6.1 to v0.6.3</li>
<li>Updated rustls v0.23.43 to v0.23.45</li>
</ul>
<p><strong>Misc</strong></p>
<ul>
<li>OCSP responses without the optional <code>nextUpdate</code> field now raise
<code>ValueError</code> instead of panicking. (private)</li>
<li>Hardened CRL parsing against panics. (private)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/qh3/blob/main/CHANGELOG.rst">qh3's changelog</a>.</em></p>
<blockquote>
<h1>2.0.4 (2026-10-01)</h1>
<p><strong>Changed</strong></p>
<ul>
<li>Updated aws-lc-rs v1.18.0 to v1.18.1</li>
<li>Updated quinn-udp v0.6.1 to v0.6.3</li>
<li>Updated rustls v0.23.43 to v0.23.45</li>
</ul>
<p><strong>Misc</strong></p>
<ul>
<li>OCSP responses without the optional <code>nextUpdate</code> field now raise
<code>ValueError</code> instead of panicking. (private)</li>
<li>Hardened CRL parsing against panics. (private)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8a80f8f</code></a> Merge pull request <a href="">#163</a> from jawah/release-2.0.4</li>
<li><a href=""><code>467559d</code></a> chore: bump version to 2.0.4</li>
<li><a href=""><code>da23ddc</code></a> fix: harden crl response parsing (private)</li>
<li><a href=""><code>20e5192</code></a> fix: harden ocsp re...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51b0df8e9aa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.