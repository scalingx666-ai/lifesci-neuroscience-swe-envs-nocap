# Issue

**Title:** [dependabot]: Bump the deps group with 7 updates

## Description

Bumps the deps group with 7 updates:

| Package | From | To |
| --- | --- | --- |
| [matplotlib](https://github.com/matplotlib/matplotlib) | `3.10.9` | `3.11.1` |
| [packaging](https://github.com/pypa/packaging) | `26.2` | `26.3` |
| [pandas](https://github.com/pandas-dev/pandas) | `3.0.3` | `3.0.5` |
| [pyarrow](https://github.com/apache/arrow) | `25.0.0` | `25.0.1` |
| [ruff](https://github.com/astral-sh/ruff) | `0.16.1` | `0.16.2` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.2.6` | `1.2.10` |
| [ty](https://github.com/astral-sh/ty) | `0.0.66` | `0.0.70` |

Updates `matplotlib` from 3.10.9 to 3.11.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: v3.11.1</h2>
<p>This is the first bugfix release of the 3.11.x series.</p>
<p>This release contains several bug-fixes and adjustments:</p>
<ul>
<li>Fix tight layout of multiple subplots with <code>sharey=True</code></li>
<li>Fix <code>NoNorm</code> cursor formatting for <code>uint8</code> images</li>
<li>Fix occasional misalignment in reported mouse position (also fix a bug with canvas height)</li>
<li>Fix clipped Axis labels on 3D plots with tight layout</li>
<li>Fix inverted Axis on 3D plots</li>
<li>Fix restoring 'auto' aspect in 3D axes after switching from 'equal'</li>
<li>Fix missing glyphs when subsetting Type 1 fonts in PDF</li>
<li>Fix oversized embedding of Type 42 fonts in PDF/PostScript files</li>
</ul>
<p>As well as several documentation and typing improvements and corrections.</p>
<h2>REL: v3.11.0</h2>
<p>The largest change within this release is a complete overhaul of text and font processing. Through the use of <a href="https://github.com/HOST-Oman/libraqm/">libraqm</a>, <a href="https://harfbuzz.github.io/">HarfBuzz</a>, <a href="https://github.com/Tehreer/SheenBidi">SheenBidi</a>, and an updated release of <a href="https://freetype.org/">FreeType</a>, all text should now support modern font features, enabling full internationalization in all languages. Not all features of these libraries are supported yet, but we expect this work to enable further improvements in an easier manner.</p>
<p>Outside of text handling, there are several improvements to 3D Axes, performance, new accessible colour sequences, flexible figure management, and more. <a href="https://matplotlib.org/3.11.0/release/prev_whats_new/whats_new_3.11.0.html">See the release notes for more information</a>.</p>
<h2>REL: v3.11.0rc2</h2>
<p>This is the second release candidate for the meso release 3.11.0.</p>
<p>This release candidate fixes some problems with downstream packages, removes some missed deprecations, and corrects some additional minor bugs.</p>
<h2>REL: v3.11.0rc1</h2>
<p>After an extended development stretch, we are pleased to announce the first release candidate of Matplotlib 3.11.0.</p>
<p>The largest change within this release is a complete overhaul of text and font processing. Through the use of <a href="https://github.com/HOST-Oman/libraqm/">libraqm</a>, <a href="https://harfbuzz.github.io/">HarfBuzz</a>, <a href="https://github.com/Tehreer/SheenBidi">SheenBidi</a>, and an updated release of <a href="https://freetype.org/">FreeType</a>, all text should now support modern font features, enabling full internationalization in all languages. Not all features of these libraries are supported yet, but we expect this work to enable further improvements in an easier manner. Due to the update to the font rendering stack, we cannot guarantee that text will be bit-for-bit perfect with previous releases, so if you are using Matplotlib for testing, it may be necessary to introduce/raise a tolerance within your tests.</p>
<p>Outside of text handling, there are several improvements to 3D Axes, performance, new accessible colour sequences, flexible figure management, and more. Final release notes are still being curated, but you may browse <a href="https://matplotlib.org/3.11.0/release/next_whats_new">the list of new features</a>, <a href="https://matplotlib.org/3.11.0/api/next_api_changes.html">API changes</a>, and <a href="https://github.com/matplotlib/matplotlib/milestone/96?closed=1https://github.com/matplotlib/matplotlib/milestone/96?closed=1">all issues/pull requests on the milestone</a>.</p>
<p>As a note for downstream packagers, the font libraries have only been tested against the versions bundled with the wheels. It may be possible to expand the range of requirements, or that a requirement is too broad. Please report any issues you have building against external dependencies.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3c1757a</code></a> REL: v3.11.1</li>
<li><a href=""><code>792c6b5</code></a> DOC: Prepare for 3.11.1</li>
<li><a href=""><code>aaff9f6</code></a> Merge branch 'v3.11.0-doc' into v3.11.x</li>
<li><a href=""><code>d4f4527</code></a> Merge pull request <a href="">#32052</a> from meeseeksmachine/auto-backport-of-pr-32038-on-v...</li>
<li><a href=""><code>6ad4bcf</code></a> Merge pull request <a href="">#32050</a> from meeseeksmachine/auto-backport-of-pr-31304-on-v...</li>
<li><a href=""><code>7fb74d3</code></a> Merge pull request <a href="">#32051</a> from meeseeksmachine/auto-backport-of-pr-32037-on-v...</li>
<li><a href=""><code>c624aec</code></a> Backport PR <a href="">#32038</a>: Fix occasional misalignment in reported mouse position (a...</li>
<li><a href=""><code>8eda2b7</code></a> Backport PR <a href="">#32037</a>: Bump the actions group with 3 updates</li>
<li><a href=""><code>a0e7ae5</code></a> Backport PR <a href="">#31304</a>: Fix restoring 'auto' aspect in 3D axes after switching fr...</li>
<li><a href=""><code>9001323</code></a> Merge pull request <a href="">#32047</a> from meeseeksmachine/auto-backport-of-pr-32025-on-v...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.9...v3.11.1">compare view</a></li>
</ul>
</details>
<br />

Updates `packaging` from 26.2 to 26.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/releases">packaging's releases</a>.</em></p>
<blockquote>
<h2>26.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Features</h3>
<ul>
<li>Add a public <code>VersionRange</code> API and <code>SpecifierSet.to_range()</code>, representing the versions a specifier set accepts as an interval set that supports intersection, union, difference, complement, set relations, membership tests, and filtering. <code>VersionRange.to_specifier_set()</code> converts a range back to a <code>SpecifierSet</code> where a PEP 440 form exists. (<a href="">#1267</a>, <a href="">#1270</a>, <a href="">#1298</a>)</li>
<li>PEP 808: accept <code>Metadata-Version: 2.6</code>. (<a href="">#1194</a>)</li>
<li>Add a <code>limit</code> argument to <code>parse_tag()</code> for compressed tag sets. (<a href="">#1220</a>)</li>
<li>Add a <code>prefer_sdist_predicate</code> argument to <code>Pylock.select()</code> to prefer source distributions over wheels for selected packages. (<a href="">#1334</a>)</li>
<li>Add <code>pure_python_tags()</code> to generate the pure-Python tags for a Python version without touching the running platform. (<a href="">#1346</a>)</li>
<li>Add <code>SpecifierSet.is_subset()</code>, <code>SpecifierSet.is_superset()</code>, and <code>SpecifierSet.is_disjoint()</code>, which compare the versions two specifier sets accept. (<a href="">#1313</a>)</li>
</ul>
<h3>Behavior adaptations</h3>
<ul>
<li>Drop support for Python 3.8; packaging now requires Python 3.9 or later. (<a href="">#1157</a>)</li>
<li>Prefer native <code>linux_*</code> platform tags over <code>manylinux</code> and <code>musllinux</code> tags on Linux. (<a href="">#160</a>)</li>
</ul>
<h3>Fixes for versions and specifiers</h3>
<ul>
<li>Raise <code>InvalidVersion</code> instead of <code>TypeError</code> when <code>Version</code> is given a non-string. (<a href="">#1319</a>)</li>
<li>Raise <code>InvalidVersion</code> for non-string pre-release letters passed to <code>Version.from_parts</code>. (<a href="">#1241</a>)</li>
<li>Fix an <code>AttributeError</code> when hashing internally trimmed versions. (<a href="">#1242</a>)</li>
<li>Fix <code>SpecifierSet.is_unsatisfiable</code> for post-release boundary intersections. (<a href="">#1257</a>)</li>
</ul>
<h3>Fixes for requirements and markers</h3>
<ul>
<li>Make <code>Requirement.__hash__</code> consistent with <code>__eq__</code> for trailing-zero-equivalent specifiers (e.g. <code>foo==1.0.0</code> and <code>foo==1.0.0.0</code>), so equal requirements hash equal and deduplicate in sets and dicts. (<a href="">#1232</a>)</li>
<li>Normalize requested extra names before comparing or hashing requirements. (<a href="">#644</a>)</li>
<li>Preserve a <code>Requirement</code>'s specifier <code>prereleases</code> override across a pickle round trip. (<a href="">#1204</a>)</li>
<li>Raise <code>InvalidRequirement</code> instead of <code>InvalidSpecifier</code> when a requirement contains an invalid specifier. (<a href="">#1332</a>)</li>
<li>Clarify the error for post-release prefix wildcards like <code>==1.0.post1.*</code>. (<a href="">#1299</a>)</li>
<li>Preserve quoting semantics when serializing marker values, so round-tripped markers parse back to the same marker. (<a href="">#1213</a>)</li>
<li>Keep the parentheses of a nested group when serializing markers. (<a href="">#1316</a>)</li>
<li>Normalize <code>extra</code> and <code>dependency_groups</code> values in nested markers at parse time. (<a href="">#1246</a>, <a href="">#1310</a>)</li>
<li>Raise <code>UndefinedComparison</code> when a set-valued variable like <code>extras</code> is used outside the membership form. (<a href="">#1265</a>)</li>
<li>Raise <code>UndefinedEnvironmentName</code> (a <code>KeyError</code> subclass) for missing environment keys during marker evaluation. (<a href="">#1276</a>)</li>
<li>Wrap malformed string literal errors in <code>InvalidMarker</code> / <code>InvalidRequirement</code> instead of leaking a low-level error. (<a href="">#1249</a>)</li>
<li>Reject requirements and markers with a trailing line break. (<a href="">#1345</a>)</li>
</ul>
<h3>Fixes for metadata and licenses</h3>
<ul>
<li>Collect all <code>from_email</code> validation errors into one <code>ExceptionGroup</code> instead of raising the first. (<a href="">#1268</a>)</li>
<li>Accept the UTF-8 charset case-insensitively in email payloads. (<a href="">#1330</a>)</li>
<li>Reject malformed <code>Description-Content-Type</code> values. (<a href="">#1329</a>)</li>
<li>Don't rewrite user values that contain <code>{field}</code> placeholders in error messages. (<a href="">#1327</a>)</li>
<li>Route multipart email payloads to <code>unparsed</code> instead of asserting. (<a href="">#1247</a>)</li>
<li>Make <code>InvalidMetadata</code> and <code>CyclicDependencyGroup</code> picklable. (<a href="">#1328</a>)</li>
<li>Fold every line boundary <code>str.splitlines</code> recognizes when writing a header with <code>RFC822Message</code>. (<a href="">#1356</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/blob/main/CHANGELOG.rst">packaging's changelog</a>.</em></p>
<blockquote>
<p>26.3 - 2026-08-03</p>
<pre><code>
Features:
<ul>
<li>Add a public :class:<code>~packaging.ranges.VersionRange</code> API and<br />
:meth:<code>SpecifierSet.to_range() &amp;lt;packaging.specifiers.SpecifierSet.to_range&amp;gt;</code>,<br />
representing the versions a specifier set accepts as an interval set that<br />
supports intersection, union, difference, complement, set relations,<br />
membership tests, and filtering.<br />
:meth:<code>~packaging.ranges.VersionRange.to_specifier_set</code> converts a range back<br />
to a :class:<code>~packaging.specifiers.SpecifierSet</code> where a PEP 440 form exists.<br />
(:pull:<code>1267</code>, :pull:<code>1270</code>, :pull:<code>1298</code>)</li>
<li>PEP 808: accept <code>Metadata-Version: 2.6</code>. (:pull:<code>1194</code>)</li>
<li>Add a <code>limit</code> argument to <code>parse_tag()</code> for compressed tag sets.<br />
(:issue:<code>1220</code>)</li>
<li>Add a <code>prefer_sdist_predicate</code> argument to <code>Pylock.select()</code> to prefer<br />
source distributions over wheels for selected packages. (:pull:<code>1334</code>)</li>
<li>Add :func:<code>~packaging.tags.pure_python_tags</code> to generate the pure-Python<br />
tags for a Python version without touching the running platform.<br />
(:pull:<code>1346</code>)</li>
<li>Add :meth:<code>SpecifierSet.is_subset() &amp;lt;packaging.specifiers.SpecifierSet.is_subset&amp;gt;</code>, :meth:<code>~packaging.specifiers.SpecifierSet.is_superset</code>,<br />
and :meth:<code>~packaging.specifiers.SpecifierSet.is_disjoint</code>, which compare the<br />
versions two specifier sets accept. (:pull:<code>1313</code>)</li>
</ul>
<p>Behavior adaptations:</p>
<ul>
<li>Drop support for Python 3.8; packaging now requires Python 3.9 or later.<br />
(:pull:<code>1157</code>)</li>
<li>Prefer native <code>linux_*</code> platform tags over <code>manylinux</code> and <code>musllinux</code><br />
tags on Linux. (:issue:<code>160</code>)</li>
</ul>
<p>Fixes for versions and specifiers:</p>
<ul>
<li>Raise <code>InvalidVersion</code> instead of <code>TypeError</code> when <code>Version</code> is given a<br />
non-string. (:pull:<code>1319</code>)</li>
<li>Raise <code>InvalidVersion</code> for non-string pre-release letters passed to<br />
<code>Version.from_parts</code>. (:pull:<code>1241</code>)</li>
<li>Fix an <code>AttributeError</code> when hashing internally trimmed versions.<br />
(:pull:<code>1242</code>)</li>
<li>Fix <code>SpecifierSet.is_unsatisfiable</code> for post-release boundary<br />
intersections. (:pull:<code>1257</code>)</li>
</ul>
<p>Fixes for requirements and markers:</p>
<ul>
<li>Make <code>Requirement.__hash__</code> consistent with <code>__eq__</code> for<br />
trailing-zero-equivalent specifiers (e.g. <code>foo==1.0.0</code> and<br />
<code>foo==1.0.0.0</code>), so equal requirements hash equal and deduplicate in<br />
sets and dicts. (:pull:<code>1232</code>)<br />
&lt;/tr&gt;&lt;/table&gt;<br />
</code></pre></li>
</ul>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>929fd4b</code></a> Bump for release</li>
<li><a href=""><code>f300ebf</code></a> chore(deps): bump the pre-commit group with 5 updates (<a href="">#1357</a>)</li>
<li><a href=""><code>f91d975</code></a> ci(downstream): bump hatchling to 1.31.0 and fix its pytest rootdir (<a href="">#1361</a>)</li>
<li><a href=""><code>b1a7124</code></a> chore(deps): bump the github-actions group with 7 updates (<a href="">#1358</a>)</li>
<li><a href=""><code>2d873eb</code></a> fix(metadata): fold every line boundary when writing headers (<a href="">#1356</a>)</li>
<li><a href=""><code>413d006</code></a> docs: changelog for 26.3 (<a href="">#1343</a>)</li>
<li><a href=""><code>4eb0753</code></a> docs(metadata): explain selective field validation (<a href="">#1342</a>)</li>
<li><a href=""><code>77e9ed4</code></a> feat(tags): add pure Python tag generator (<a href="">#1346</a>)</li>
<li><a href=""><code>7cea5e8</code></a> ci: drop 3.13t on Windows (3.13.14t may fail to build, run takes 9 minutes) (...</li>
<li><a href=""><code>45a8b34</code></a> docs: add missing versionadded/versionchanged directives (<a href="">#1344</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/packaging/compare/26.2...26.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pandas` from 3.0.3 to 3.0.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>pandas 3.0.5</h2>
<p>We are pleased to announce the release of pandas 3.0.5.
This is a patch release in the 3.0.x series and includes some regression fixes and bug fixes. We recommend that all users of the 3.0.x series upgrade to this version.</p>
<p>See the <a href="https://pandas.pydata.org/docs/whatsnew/v3.0.5.html">full whatsnew</a> for a list of all the changes.</p>
<p>Pandas 3.0 supports Python 3.11 and higher.
The release can be installed from PyPI:</p>
<pre><code>python -m pip install --upgrade pandas==3.0.*
</code></pre>
<p>Or from conda-forge</p>
<pre><code>conda install -c conda-forge pandas=3.0
</code></pre>
<p>Please report any issues with the release on the <a href="https://github.com/pandas-dev/pandas/issues">pandas issue tracker</a>.</p>
<p>Thanks to all the contributors who made this release possible.</p>
<h2>pandas 3.0.4</h2>
<p>We are pleased to announce the release of pandas 3.0.4.
This is a patch release in the 3.0.x series and includes some regression fixes and bug fixes. We recommend that all users of the 3.0.x series upgrade to this version.</p>
<p>See the <a href="https://pandas.pydata.org/docs/whatsnew/v3.0.4.html">full whatsnew</a> for a list of all the changes.</p>
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
<li><a href=""><code>e68db09</code></a> RLS: 3.0.5</li>
<li><a href=""><code>0697623</code></a> Backport PR <a href="">#66428</a>: DOC: update whatsnew for 3.0.5 (<a href="">#66430</a>)</li>
<li><a href=""><code>5d846d0</code></a> Backport PR <a href="">#66090</a> on branch 3.0.x (BLD: exclude numpy 2.5.0 when building wh...</li>
<li><a href=""><code>bef7a2b</code></a> Backport PR <a href="">#66169</a> on branch 3.0.x (CI: Fix pyarrow-nightly job (stale nightl...</li>
<li><a href=""><code>8188eb1</code></a> RLS: 3.0.4 (<a href="">#66079</a>)</li>
<li><a href=""><code>bd35f15</code></a> [3.0.x] BUG: fix CoW issue in eval() (<a href="">#66072</a>)</li>
<li><a href=""><code>6195872</code></a> [backport 3.0.x] BUG: anchor whole alternation in Series.str.match for PyArro...</li>
<li><a href=""><code>70313be</code></a> Backport PR <a href="">#66051</a> on branch 3.0.x (BUG: fix regression in DataFrame setitem ...</li>
<li><a href=""><code>57ed3e2</code></a> [backport 3.0.x] Bump pypa/cibuildwheel from 3.4.1 to 4.1.0 (<a href="">#65934</a>) (<a href="">#66026</a>)</li>
<li><a href=""><code>f9693fc</code></a> [backport 3.0.x] BUG(pandas 3.0 regression): drop(index=...) doesn't accept N...</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v3.0.3...v3.0.5">compare view</a></li>
</ul>
</details>
<br />

Updates `pyarrow` from 25.0.0 to 25.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/apache/arrow/releases">pyarrow's releases</a>.</em></p>
<blockquote>
<h2>Apache Arrow 25.0.1</h2>
<p>Release Notes URL: <a href="https://arrow.apache.org/release/25.0.1.html">https://arrow.apache.org/release/25.0.1.html</a></p>
<h2>Apache Arrow 25.0.1 RC1</h2>
<p>Release Notes: Release Candidate: 25.0.1 RC1</p>
<h2>Apache Arrow 25.0.1 RC0</h2>
<p>Release Notes: Release Candidate: 25.0.1 RC0</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>beccec0</code></a> MINOR: [Release] Update versions for 25.0.1</li>
<li><a href=""><code>7bdf01a</code></a> MINOR: [Release] Update .deb/.rpm changelogs for 25.0.1</li>
<li><a href=""><code>91dbae1</code></a> MINOR: [Release] Update CHANGELOG.md for 25.0.1</li>
<li><a href=""><code>849d463</code></a> <a href="">GH-50808</a>: [Python] Narrow Feather deprecation to V1 format (<a href="">#50685</a>)</li>
<li><a href=""><code>e70ebf5</code></a> <a href="">GH-50600</a>: [Release] Pin Python version in Conda verification</li>
<li><a href=""><code>f5037be</code></a> <a href="">GH-50578</a>: [C++][FlightRPC][ODBC] Always return SQL_NO_DATA from GetMoreResult...</li>
<li><a href=""><code>1491589</code></a> <a href="">GH-50503</a>: [Parquet] Remove SVE128 unpack (<a href="">#50611</a>)</li>
<li><a href=""><code>d1eaaed</code></a> <a href="">GH-50326</a>: [Python] Convert arrays to Python objects without per-element Scala...</li>
<li><a href=""><code>fe14135</code></a> <a href="">GH-50428</a>: [C++] Better mimalloc configuration on macOS (<a href="">#50549</a>)</li>
<li><a href=""><code>8fb632a</code></a> <a href="">GH-50383</a>: [Release] Remove deprecated -f flag on conda create environment (<a href="">#5</a>...</li>
<li>See full diff in <a href="https://github.com/apache/arrow/compare/apache-arrow-25.0.0...apache-arrow-25.0.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.1 to 0.16.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.2</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-06.</p>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Avoid false positives on <code>singledispatch</code> functions (<code>PYI041</code>) (<a href="">#27335</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Register formatting capabilities dynamically to exclude TOML files (<a href="">#27332</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MeGaGiGaGon"><code>@​MeGaGiGaGon</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/epage"><code>@​epage</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<h2>Install ruff 0.16.2</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ruff 0.16.2</h2>
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
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-apple-darwin.tar.gz">ruff-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-x86_64-apple-darwin.tar.gz">ruff-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-pc-windows-msvc.zip">ruff-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-i686-pc-windows-msvc.zip">ruff-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-x86_64-pc-windows-msvc.zip">ruff-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-unknown-linux-gnu.tar.gz">ruff-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-i686-unknown-linux-gnu.tar.gz">ruff-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-powerpc64-unknown-linux-gnu.tar.gz">ruff-powerpc64-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64 Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-powerpc64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-powerpc64le-unknown-linux-gnu.tar.gz">ruff-powerpc64le-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64LE Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-powerpc64le-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-riscv64gc-unknown-linux-gnu.tar.gz">ruff-riscv64gc-unknown-linux-gnu.tar.gz</a></td>
<td>RISCV Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-riscv64gc-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-s390x-unknown-linux-gnu.tar.gz">ruff-s390x-unknown-linux-gnu.tar.gz</a></td>
<td>S390x Linux</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.16.2/ruff-s390x-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.2</h2>
<p>Released on 2026-08-06.</p>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Avoid false positives on <code>singledispatch</code> functions (<code>PYI041</code>) (<a href="">#27335</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Register formatting capabilities dynamically to exclude TOML files (<a href="">#27332</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MeGaGiGaGon"><code>@​MeGaGiGaGon</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/epage"><code>@​epage</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5b48a04</code></a> Bump 0.16.2 (<a href="">#27555</a>)</li>
<li><a href=""><code>1b9e5fc</code></a> Update Swatinem/rust-cache action to v2.9.2 (<a href="">#27568</a>)</li>
<li><a href=""><code>c4e86fc</code></a> [ty] Add helper extension methods for half-range and equality constraints (<a href="">#2</a>...</li>
<li><a href=""><code>17a00de</code></a> [ty] Reuse primer commands in memory reports (<a href="">#27553</a>)</li>
<li><a href=""><code>6ea296b</code></a> [ty] Normalize type labels in structured docstrings (<a href="">#26923</a>)</li>
<li><a href=""><code>2fc445f</code></a> [ty] Diagnose invalid <strong>getattr</strong> calls (<a href="">#27502</a>)</li>
<li><a href=""><code>22c7823</code></a> [ty] Enable (but downrank) auto-import completion suggestions from stub-only ...</li>
<li><a href=""><code>05160d5</code></a> [ty] Diagnose invalid descriptor <code>__get__</code> calls (<a href="">#27400</a>)</li>
<li><a href=""><code>baea3d0</code></a> [ty] Expose strict analysis options in the playground (<a href="">#27543</a>)</li>
<li><a href=""><code>c88946e</code></a> [ty] Bump ecosystem-analyzer for strict project settings (<a href="">#27542</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.1...0.16.2">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.2.6 to 1.2.10
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.2.10</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>📦 Dependencies</h3>
<ul>
<li>fix(deps): update js-yaml to 4.3.1 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2074</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.9...v1.2.10">https://github.com/tombi-toml/tombi/compare/v1.2.9...v1.2.10</a></p>
<h2>v1.2.9</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🦅 New Features</h3>
<ul>
<li>feat(validator): select best union diagnostics by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2073</a></li>
</ul>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(schema): preserve constraints across type projections by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2072</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: explain TOML version overrides by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2071</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.8...v1.2.9">https://github.com/tombi-toml/tombi/compare/v1.2.8...v1.2.9</a></p>
<h2>v1.2.8</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(cargo): resolve completion paths from file URIs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2069</a></li>
</ul>
<h3>📦 Dependencies</h3>
<ul>
<li>fix: update vulnerable npm dependencies by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2064</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: add schemas[*].strict to the configuration index by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2063</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.7...v1.2.8">https://github.com/tombi-toml/tombi/compare/v1.2.7...v1.2.8</a></p>
<h2>v1.2.7</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🦅 New Features</h3>
<ul>
<li>feat(config): support per-schema strict mode by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2061</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: improve config file load error reporting by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2062</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.6...v1.2.7">https://github.com/tombi-toml/tombi/compare/v1.2.6...v1.2.7</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7f7da7a</code></a> fix(deps): update js-yaml to 4.3.1 (<a href="">#2074</a>)</li>
<li><a href=""><code>b0e8268</code></a> docs: update installer stable version to 1.2.9</li>
<li><a href=""><code>16c283b</code></a> feat(validator): select best union diagnostics (<a href="">#2073</a>)</li>
<li><a href=""><code>9978e56</code></a> fix(schema): preserve constraints across type projections (<a href="">#2072</a>)</li>
<li><a href=""><code>a2603be</code></a> docs: explain TOML version overrides (<a href="">#2071</a>)</li>
<li><a href=""><code>24f64da</code></a> docs: update installer stable version to 1.2.8</li>
<li><a href=""><code>c2d413c</code></a> fix(cargo): resolve completion paths from file URIs (<a href="">#2069</a>)</li>
<li><a href=""><code>e36e2e7</code></a> Revert &quot;fix(ci): make Pages deployment retries resilient (<a href="">#2065</a>)&quot; (<a href="">#2066</a>)</li>
<li><a href=""><code>be36728</code></a> fix(ci): make Pages deployment retries resilient (<a href="">#2065</a>)</li>
<li><a href=""><code>c8f0983</code></a> fix: update vulnerable npm dependencies (<a href="">#2064</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.2.6...v1.2.10">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.66 to 0.0.70
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.70</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-10.</p>
<h3>LSP server</h3>
<ul>
<li>Enable and downrank auto-import completions from stub-only modules (<a href="">#27433</a>)</li>
<li>Fix signature help at end of file (<a href="">#27622</a>)</li>
<li>Normalize type labels in structured docstrings (<a href="">#26923</a>)</li>
<li>Preserve typing-only completion ranking in <code>TYPE_CHECKING</code> blocks (<a href="">#27549</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Avoid deadlock when scheduling watch checks (<a href="">#27605</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add an opt-in <code>unsound-return-statement</code> lint (<a href="">#27561</a>)</li>
<li>Add an opt-in <code>unsound-yield</code> lint (<a href="">#27593</a>)</li>
<li>Diagnose invalid <code>__getattr__</code> calls (<a href="">#27502</a>)</li>
<li>Diagnose invalid descriptor <code>__get__</code> calls (<a href="">#27400</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Consider object members in protocol comparisons (<a href="">#27532</a>)</li>
<li>Exclude quantified constraints from semantic type walks (<a href="">#27613</a>)</li>
<li>Expand <code>Generator</code> aliases when evaluating return, send, and yield types (<a href="">#27577</a>)</li>
<li>Infer precise <code>TypedDict</code> key-membership truthiness (<a href="">#27579</a>)</li>
<li>Infer variance through <code>type[T]</code> (<a href="">#27534</a>)</li>
<li>Preserve contextual inference for declarations in loops (<a href="">#27594</a>)</li>
<li>Recognize overlapping <code>NewType</code> types and their underlying values (<a href="">#27522</a>)</li>
<li>Require <code>ClassVar</code> declarations for protocol members (<a href="">#27530</a>)</li>
<li>Stabilize recursive gradual type alias materialization (<a href="">#27563</a>)</li>
<li>Support <code>Annotated</code> inside <code>type[...]</code> (<a href="">#27629</a>)</li>
<li>Validate augmented assignment stores (<a href="">#27545</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
</ul>
<h2>Install ty 0.0.70</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.70</h2>
<p>Released on 2026-08-10.</p>
<h3>LSP server</h3>
<ul>
<li>Enable and downrank auto-import completions from stub-only modules (<a href="">#27433</a>)</li>
<li>Fix signature help at end of file (<a href="">#27622</a>)</li>
<li>Normalize type labels in structured docstrings (<a href="">#26923</a>)</li>
<li>Preserve typing-only completion ranking in <code>TYPE_CHECKING</code> blocks (<a href="">#27549</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Avoid deadlock when scheduling watch checks (<a href="">#27605</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add an opt-in <code>unsound-return-statement</code> lint (<a href="">#27561</a>)</li>
<li>Add an opt-in <code>unsound-yield</code> lint (<a href="">#27593</a>)</li>
<li>Diagnose invalid <code>__getattr__</code> calls (<a href="">#27502</a>)</li>
<li>Diagnose invalid descriptor <code>__get__</code> calls (<a href="">#27400</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Consider object members in protocol comparisons (<a href="">#27532</a>)</li>
<li>Exclude quantified constraints from semantic type walks (<a href="">#27613</a>)</li>
<li>Expand <code>Generator</code> aliases when evaluating return, send, and yield types (<a href="">#27577</a>)</li>
<li>Infer precise <code>TypedDict</code> key-membership truthiness (<a href="">#27579</a>)</li>
<li>Infer variance through <code>type[T]</code> (<a href="">#27534</a>)</li>
<li>Preserve contextual inference for declarations in loops (<a href="">#27594</a>)</li>
<li>Recognize overlapping <code>NewType</code> types and their underlying values (<a href="">#27522</a>)</li>
<li>Require <code>ClassVar</code> declarations for protocol members (<a href="">#27530</a>)</li>
<li>Stabilize recursive gradual type alias materialization (<a href="">#27563</a>)</li>
<li>Support <code>Annotated</code> inside <code>type[...]</code> (<a href="">#27629</a>)</li>
<li>Validate augmented assignment stores (<a href="">#27545</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
</ul>
<h2>0.0.69</h2>
<p>Released on 2026-08-06.</p>
<h3>Core type checking</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bf8c9f3</code></a> Bump version to 0.0.70 (<a href="">#4228</a>)</li>
<li><a href=""><code>340b882</code></a> Document the unsound-return-statement rule (<a href="">#4211</a>)</li>
<li><a href=""><code>1dca844</code></a> Bump version to 0.0.69 (<a href="">#4202</a>)</li>
<li><a href=""><code>557a078</code></a> Link to actual docs page rather than README in issue creation menu &quot;Documenta...</li>
<li><a href=""><code>23a6000</code></a> Bump version to 0.0.68 (<a href="">#4199</a>)</li>
<li><a href=""><code>dc3b7af</code></a> Update typing FAQ for numeric tower displays (<a href="">#4198</a>)</li>
<li><a href=""><code>261fd8f</code></a> Bump version to 0.0.67 (<a href="">#4192</a>)</li>
<li><a href=""><code>91ded4e</code></a> release: use self-repo references (<a href="">#4190</a>)</li>
<li><a href=""><code>83bd8c8</code></a> Update bug report issue template (<a href="">#4189</a>)</li>
<li><a href=""><code>7ce0eee</code></a> Update prek dependencies (<a href="">#4178</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.66...0.0.70">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51a1b8dd12af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.