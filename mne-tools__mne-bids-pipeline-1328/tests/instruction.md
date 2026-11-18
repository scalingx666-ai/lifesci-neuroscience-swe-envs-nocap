# Issue

**Title:** [dependabot]: Bump the deps group with 25 updates

## Description

Bumps the deps group with 25 updates:

| Package | From | To |
| --- | --- | --- |
| [pandas](https://github.com/pandas-dev/pandas) | `3.0.6` | `3.1.0` |
| [prek](https://github.com/j178/prek) | `0.5.6` | `0.5.7` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.7` | `9.8.0` |
| [bracex](https://github.com/facelessuser/bracex) | `3.1` | `3.2` |
| [certifi](https://github.com/certifi/python-certifi) | `2026.10.19` | `2026.10.23` |
| [coverage](https://github.com/coveragepy/coveragepy) | `7.16.2` | `7.17.0` |
| [cyclopts](https://github.com/BrianPugh/cyclopts) | `5.2.0` | `5.3.1` |
| [griffelib](https://github.com/mkdocstrings/griffe) | `2.4.0` | `2.4.1` |
| [hedtools](https://github.com/hed-standard/hed-python) | `1.2.0` | `1.3.0` |
| [importlib-metadata](https://github.com/python/importlib_metadata) | `9.0.1` | `10.1.0` |
| [inflect](https://github.com/jaraco/inflect) | `7.5.0` | `7.6.0` |
| [jsonpointer](https://github.com/stefankoegl/python-json-pointer) | `3.4` | `3.6` |
| [mkdocs-autorefs](https://github.com/mkdocstrings/autorefs) | `1.4.4` | `1.4.5` |
| [msgpack](https://github.com/msgpack/msgpack-python) | `1.2.3` | `1.2.4` |
| [multidict](https://github.com/aio-libs/multidict) | `7.1.0` | `7.2.1` |
| [pip](https://github.com/pypa/pip) | `26.2.1` | `26.2.2` |
| [pycparser](https://github.com/eliben/pycparser) | `3.11` | `3.12` |
| [python-dateutil](https://github.com/dateutil/dateutil) | `2.9.0.post0` | `3.0.0` |
| [qh3](https://github.com/jawah/qh3) | `2.0.4` | `2.1.0` |
| [setuptools](https://github.com/pypa/setuptools) | `84.2.0` | `84.2.1` |
| [tornado](https://github.com/tornadoweb/tornado) | `6.5.10` | `6.6` |
| [urllib3-future](https://github.com/jawah/urllib3.future) | `2.25.902` | `2.25.903` |
| [wassima](https://github.com/jawah/wassima) | `2.1.4` | `2.1.5` |
| [wcmatch](https://github.com/facelessuser/wcmatch) | `11.1` | `11.2` |
| [zipp](https://github.com/jaraco/zipp) | `4.1.1` | `4.1.2` |

Updates `pandas` from 3.0.6 to 3.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>pandas 3.1.0</h2>
<p>We are pleased to announce the release of pandas 3.1.0.
This release includes some new features, bug fixes, and performance improvements. We recommend that all users upgrade to this version.</p>
<p>Highlights include:</p>
<ul>
<li><a href="https://pandas.pydata.org/docs/whatsnew/v3.1.0.html#new-method-dataframe-select">New <code>DataFrame.select()</code> and updated <code>DataFrame.filter()</code> method</a></li>
<li><a href="https://pandas.pydata.org/docs/whatsnew/v3.1.0.html#whatsnew-310-enhancements-read-csv">Faster <code>pd.read_csv()</code>, with parallel reads of large files</a></li>
</ul>
<p>See the <a href="https://pandas.pydata.org/docs/whatsnew/v3.1.0.html">detailed release notes</a> for a list of all the changes.</p>
<p>The release can be installed from PyPI:</p>
<pre><code>python -m pip install --upgrade pandas
</code></pre>
<p>Or from conda-forge</p>
<pre><code>conda install -c conda-forge pandas
</code></pre>
<p>Please report any issues with the release on the <a href="https://github.com/pandas-dev/pandas/issues">pandas issue tracker</a>.</p>
<p>Thanks to all the contributors who made this release possible.</p>
<h2>pandas 3.1.0rc0</h2>
<p>We are pleased to announce a release candidate for pandas 3.1.0.</p>
<p>See the <a href="https://pandas.pydata.org/docs/dev/whatsnew/v3.1.0.html">whatsnew</a> for a list of all the changes.</p>
<p>The release can be installed from PyPI:</p>
<pre><code>python -m pip install --upgrade --pre pandas==3.1.0rc0
</code></pre>
<p>Or from conda-forge</p>
<pre><code>conda install -c conda-forge/label/pandas_rc pandas==3.1.0rc0
</code></pre>
<p>Please report any issues with the release candidate on the <a href="https://github.com/pandas-dev/pandas/issues">pandas issue tracker</a>.</p>
<p>Thanks to all the contributors who made this release possible.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c6f4676</code></a> RLS: 3.1.0</li>
<li><a href=""><code>dd69475</code></a> Backport PR <a href="">#71468</a> on branch 3.1.x (DOC: 3.1 whatsnew: add some structure to ...</li>
<li><a href=""><code>4ccc19a</code></a> Backport PR <a href="">#71465</a> on branch 3.1.x (DOC: update announce (contributor listing...</li>
<li><a href=""><code>24dae63</code></a> [backport 3.1.x] DOC: cleanup 3.1.0 whatsnew (<a href="">#71408</a>) (<a href="">#71466</a>)</li>
<li><a href=""><code>8519ca6</code></a> [backport 3.1.x] CI: temporary pin dateutil to &lt;3 (<a href="">#71461</a>) (<a href="">#71464</a>)</li>
<li><a href=""><code>2126193</code></a> Backport PR <a href="">#71387</a> on branch 3.1.x (BUG: fix string regex operations with $ e...</li>
<li><a href=""><code>4700f5d</code></a> Backport PR <a href="">#71442</a> on branch 3.1.x (BUG: parallel read_csv raising released m...</li>
<li><a href=""><code>08efb14</code></a> Backport PR <a href="">#71456</a> on branch 3.1.x (TST: Fix <code>test_reduce_array</code> until reduct...</li>
<li><a href=""><code>ee8dcb7</code></a> Backport PR <a href="">#71429</a> on branch 3.1.x (DOC: add dedicated 3.1 whatsnew section f...</li>
<li><a href=""><code>d93e32c</code></a> Backport PR <a href="">#71383</a> on branch 3.1.x (BUG: fix string regex operations with Pyt...</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v3.0.6...v3.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `prek` from 0.5.6 to 0.5.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/releases">prek's releases</a>.</em></p>
<blockquote>
<h2>0.5.7</h2>
<h2>Release Notes</h2>
<p>Released on 2026-10-21.</p>
<h3>Enhancements</h3>
<ul>
<li>Support system Rust toolchains without rustup (<a href="">#2887</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Use blocking file checks for CPU-heavy builtin hooks (<a href="">#2910</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Update CA root crates and uv for the eMudhra intermediate CA compromise (<a href="">#2919</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
</ul>
<h2>Install prek 0.5.7</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.7/prek-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://github.com/j178/prek/releases/download/v0.5.7/prek-installer.ps1 | iex&quot;
</code></pre>
<h3>Install prebuilt binaries via Homebrew</h3>
<pre lang="sh"><code>brew install prek
</code></pre>
<h2>Download prek 0.5.7</h2>
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
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-aarch64-apple-darwin.tar.gz">prek-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-x86_64-apple-darwin.tar.gz">prek-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-aarch64-pc-windows-msvc.zip">prek-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-x86_64-pc-windows-msvc.zip">prek-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://github.com/j178/prek/releases/download/v0.5.7/prek-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/j178/prek/blob/main/CHANGELOG.md">prek's changelog</a>.</em></p>
<blockquote>
<h2>0.5.7</h2>
<p>Released on 2026-10-21.</p>
<h3>Enhancements</h3>
<ul>
<li>Support system Rust toolchains without rustup (<a href="">#2887</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Use blocking file checks for CPU-heavy builtin hooks (<a href="">#2910</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Update CA root crates and uv for the eMudhra intermediate CA compromise (<a href="">#2919</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/shaanmajid"><code>@​shaanmajid</code></a></li>
<li><a href="https://github.com/j178"><code>@​j178</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8569a4a</code></a> Bump version to 0.5.7 (<a href="">#2920</a>)</li>
<li><a href=""><code>c290bac</code></a> Bump certifi from 2026.7.22 to 2026.10.19 (<a href="">#2921</a>)</li>
<li><a href=""><code>40287b8</code></a> Temporarily skip Aliyun uv download in CI (<a href="">#2922</a>)</li>
<li><a href=""><code>062c8a0</code></a> Update CA root crates and uv for the eMudhra intermediate CA compromise (<a href="">#2919</a>)</li>
<li><a href=""><code>5b66378</code></a> Log download and archive extraction stages (<a href="">#2917</a>)</li>
<li><a href=""><code>c369353</code></a> Share tar extraction across compression formats (<a href="">#2916</a>)</li>
<li><a href=""><code>1c82a0d</code></a> Move managed Rust toolchain discovery into the installer (<a href="">#2914</a>)</li>
<li><a href=""><code>2bf1958</code></a> Support system Rust toolchains without rustup (<a href="">#2887</a>)</li>
<li><a href=""><code>812e80f</code></a> Move shared hook helpers and rename run to concurrency (<a href="">#2911</a>)</li>
<li><a href=""><code>615a001</code></a> Use blocking file checks for CPU-heavy builtin hooks (<a href="">#2910</a>)</li>
<li>See full diff in <a href="https://github.com/j178/prek/compare/v0.5.6...v0.5.7">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.7 to 9.8.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.8.0</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs reaches end of life on May 5, 2027.</strong> Critical fixes and security updates continue until that date.</p>
<p>We're continuing our work with <a href="https://zensical.org/">Zensical</a>, a maintained successor built by the team behind Material for MkDocs. It carries forward what we've learned from building documentation tools with this community, with Markdown authoring, a familiar design, and full control over your content. Zensical is Open Source and MIT-licensed.</p>
<p>You can evaluate Zensical alongside MkDocs using your existing <code>mkdocs.yml</code>. Check plugin compatibility and compare your pages, navigation, search, and customizations before switching. The <code>classic</code> theme variant preserves the appearance of Material for MkDocs. See the <a href="https://zensical.org/docs/compatibility/mkdocs/migration/">migration guide</a> for the steps and current compatibility details.</p>
<p><a href="https://zensical.org/upcoming-changes/">Upcoming changes on November 5</a></p>
</blockquote>
<p><strong>This is primarily a security release.</strong> It raises dependency minimums to address known vulnerabilities. We recommend upgrading to this release and updating your dependency lockfiles.</p>
<p><strong>Python 3.11 or newer is now required.</strong> Python 3.8–3.10 are no longer supported.</p>
<ul>
<li>Updated Node build-time dependencies to fix vulnerabilities</li>
<li>Updated Python dependency minimums and required Python 3.11</li>
<li>Removed RSS from recommended dependencies</li>
<li>Updated project status and maintenance links</li>
<li>Updated CLI notice with end-of-life and migration guidance</li>
<li>Removed redirects from recommended dependencies</li>
</ul>
<p>Previous dependency ranges allowed versions with known vulnerabilities. The new minimums cover core Python dependencies and the optional <code>git</code> and <code>imaging</code> extras, including GitPython 3.2.1 or newer for the <code>git</code> extra.</p>
<p>Recent releases of <code>mkdocs-rss-plugin</code> and <code>mkdocs-redirects</code> depend on ProperDocs, a separate static site generator that Material for MkDocs does not require. Removing these plugins from the <code>recommended</code> extra keeps its dependency footprint smaller and leaves the choice of additional tools to each project. If your project uses RSS feeds or redirects, declare the relevant plugin explicitly in your own dependencies.</p>
<p>The CLI notice now gives the May 5, 2027 end-of-life date and links to the <a href="https://zensical.org/docs/compatibility/mkdocs/migration/">Zensical migration guide</a>. It also clarifies that third-party ProperDocs migration notices do not represent a recommendation from the Material for MkDocs team. Package metadata now marks the project as inactive and includes maintenance and migration links.</p>
<p>Selected Python security advisories addressed by the new minimums:</p>
<table>
<thead>
<tr>
<th>Dependency</th>
<th>Affected versions</th>
<th>New minimum</th>
<th>Advisory</th>
</tr>
</thead>
<tbody>
<tr>
<td>Jinja2</td>
<td><code>&lt;=3.1.5</code></td>
<td><code>3.1.6</code></td>
<td><a href="https://github.com/advisories/GHSA-cpwx-vrp4-4pq7">CVE-2025-27516</a></td>
</tr>
<tr>
<td>Markdown</td>
<td><code>&lt;3.8.1</code></td>
<td><code>3.8.1</code></td>
<td><a href="https://github.com/advisories/GHSA-5wmx-573v-2qwq">CVE-2025-69534</a></td>
</tr>
<tr>
<td>Pygments</td>
<td><code>&lt;2.20.0</code></td>
<td><code>2.20.0</code></td>
<td><a href="https://github.com/advisories/GHSA-5239-wwwm-4pmq">CVE-2026-4539</a></td>
</tr>
<tr>
<td>PyMdown Extensions</td>
<td><code>&lt;=11.0.0</code></td>
<td><code>11.0.1</code></td>
<td><a href="https://github.com/advisories/GHSA-gm37-52c6-37mw">CVE-2026-67422</a></td>
</tr>
<tr>
<td>Requests</td>
<td><code>&lt;2.33.0</code></td>
<td><code>2.33.0</code></td>
<td><a href="https://github.com/advisories/GHSA-gc5v-m9x4-r6x2">CVE-2026-25645</a></td>
</tr>
<tr>
<td>Pillow</td>
<td><code>&lt;13.0.0</code></td>
<td><code>13.0.0</code></td>
<td><a href="https://github.com/advisories/GHSA-p8hx-v2p6-rp84">CVE-2026-96636</a></td>
</tr>
<tr>
<td>CairoSVG</td>
<td><code>&lt;=2.9.0</code></td>
<td><code>2.9.1</code></td>
<td><a href="https://github.com/advisories/GHSA-c3jg-qh8m-j3h2">CVE-2026-107378</a></td>
</tr>
<tr>
<td>GitPython</td>
<td><code>&lt;=3.2.0</code></td>
<td><code>3.2.1</code></td>
<td><a href="https://github.com/advisories/GHSA-83vg-56qc-22m7">CVE-2026-114145</a></td>
</tr>
</tbody>
</table>
<p>Pillow and CairoSVG apply to the <code>imaging</code> extra; GitPython applies to the <code>git</code> extra.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.8.0 (2026-10-24)</p>
<p>This is primarily a security release. It raises dependency minimums to
address known vulnerabilities. We recommend upgrading to this release and
updating your dependency lockfiles.</p>
<p>Python 3.11 or newer is now required. Python 3.8–3.10 are no longer supported.</p>
<ul>
<li>Updated Node build-time dependencies to fix vulnerabilities</li>
<li>Updated Python dependency minimums and required Python 3.11</li>
<li>Removed RSS from recommended dependencies</li>
<li>Updated project status and maintenance links</li>
<li>Updated CLI notice with end-of-life and migration guidance</li>
<li>Removed redirects from recommended dependencies</li>
</ul>
<p>Previous dependency ranges allowed versions with known vulnerabilities. The new
minimums cover core Python dependencies and the optional git and imaging
extras, including GitPython 3.2.1 or newer for the git extra.</p>
<p>Recent releases of mkdocs-rss-plugin and mkdocs-redirects depend on ProperDocs,
a separate static site generator that Material for MkDocs does not require.
Removing these plugins from the recommended extra keeps its dependency
footprint smaller and leaves the choice of additional tools to each project.
If your project uses RSS feeds or redirects, declare the relevant plugin
explicitly in your own dependencies.</p>
<p>The CLI notice now gives the May 5, 2027 end-of-life date and links to the
Zensical migration guide:
<a href="https://zensical.org/docs/compatibility/mkdocs/migration/">https://zensical.org/docs/compatibility/mkdocs/migration/</a></p>
<p>It also clarifies that third-party ProperDocs migration notices do not represent
a recommendation from the Material for MkDocs team. Package metadata now marks
the project as inactive and includes maintenance and migration links.</p>
<p>Selected Python security advisories addressed by the new minimums:</p>
<p>Jinja2: affected &lt;=3.1.5; new minimum 3.1.6 (CVE-2025-27516)
<a href="https://github.com/advisories/GHSA-cpwx-vrp4-4pq7">https://github.com/advisories/GHSA-cpwx-vrp4-4pq7</a></p>
<p>Markdown: affected &lt;3.8.1; new minimum 3.8.1 (CVE-2025-69534)
<a href="https://github.com/advisories/GHSA-5wmx-573v-2qwq">https://github.com/advisories/GHSA-5wmx-573v-2qwq</a></p>
<p>Pygments: affected &lt;2.20.0; new minimum 2.20.0 (CVE-2026-4539)
<a href="https://github.com/advisories/GHSA-5239-wwwm-4pmq">https://github.com/advisories/GHSA-5239-wwwm-4pmq</a></p>
<p>PyMdown Extensions: affected &lt;=11.0.0; new minimum 11.0.1 (CVE-2026-67422)
<a href="https://github.com/advisories/GHSA-gm37-52c6-37mw">https://github.com/advisories/GHSA-gm37-52c6-37mw</a></p>
<p>Requests: affected &lt;2.33.0; new minimum 2.33.0 (CVE-2026-25645)
<a href="https://github.com/advisories/GHSA-gc5v-m9x4-r6x2">https://github.com/advisories/GHSA-gc5v-m9x4-r6x2</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f72ad6</code></a> Merge pull request <a href="">#8615</a> from squidfunk/fix/security</li>
<li><a href=""><code>85a048d</code></a> Documentation</li>
<li><a href=""><code>10c572e</code></a> Prepare 9.8.0 release</li>
<li><a href=""><code>dd8a7ef</code></a> Cleaned up unused assets</li>
<li><a href=""><code>8771cef</code></a> Updated README</li>
<li><a href=""><code>7c9a1cc</code></a> Updated changelog</li>
<li><a href=""><code>3ce9310</code></a> Removed redirects from recommended dependencies</li>
<li><a href=""><code>0b77e8f</code></a> Updated CLI notice with end-of-life and migration guidance</li>
<li><a href=""><code>66e4f9c</code></a> Updated project status and maintenance links</li>
<li><a href=""><code>1ed13d2</code></a> Removed RSS from recommended dependencies</li>
<li>Additional commits viewable in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.7...9.8.0">compare view</a></li>
</ul>
</details>
<br />

Updates `bracex` from 3.1 to 3.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/bracex/releases">bracex's releases</a>.</em></p>
<blockquote>
<h2>3.2</h2>
<ul>
<li><strong>NEW</strong>: Drop Python 3.10 support.</li>
<li><strong>FIX</strong>: Fix some division that could cause 1 off issues with limit checking.</li>
<li><strong>FIX</strong>: Fix issues related to large range numbers and truncation when compared to Bash (<a href="https://github.com/Rexyysilent"><code>@​Rexyysilent</code></a>).</li>
<li><strong>FIX</strong>: Fix commas dropped or added when rebuilding invalid brace groups.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1f32d69</code></a> Fix commas dropped from unclosed brace groups (<a href="">#51</a>)</li>
<li><a href=""><code>6c23658</code></a> Drop support for Python 3.10</li>
<li><a href=""><code>90aa726</code></a> Fix large range numbers and truncation when compared to Bash</li>
<li><a href=""><code>2e6dc46</code></a> Update changelog and bump version</li>
<li><a href=""><code>a229ecd</code></a> Remove unnecessary explicit dependencies for docs</li>
<li><a href=""><code>159987a</code></a> Count integer ranges without floating point rounding (<a href="">#49</a>)</li>
<li><a href=""><code>bd85996</code></a> Update version</li>
<li>See full diff in <a href="https://github.com/facelessuser/bracex/compare/3.1...3.2">compare view</a></li>
</ul>
</details>
<br />

Updates `certifi` from 2026.10.19 to 2026.10.23
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b60466c</code></a> 2026.10.23 (<a href="">#445</a>)</li>
<li>See full diff in <a href="https://github.com/certifi/python-certifi/compare/2026.10.19...2026.10.23">compare view</a></li>
</ul>
</details>
<br />

Updates `coverage` from 7.16.2 to 7.17.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/releases">coverage's releases</a>.</em></p>
<blockquote>
<h2>7.17.0</h2>
<h2>Version 7.17.0 — 2026-10-22</h2>
<ul>
<li>Dropped support for Python 3.10.</li>
<li>Binary wheels are now provided for iOS and Android. This allows the use of the optimized C tracer on mobile platforms.</li>
<li>Fix: three or more levels of nested <code>with</code> statements could make a <code>with</code> line look like a branch with an exit that can never happen. Using the sys.monitoring core, these phantom branches were reported as partial. Other cores hid the problem but still counted the phantom branches in the total. Closes <a href="">issue 1987</a>.</li>
<li>Fix: a comment or string that merely mentioned <code>if True:</code> or <code>while True:</code> could mark its line as a branch that is known to be partial, so a branch that never ran was reported as taken. These built-in patterns now only match at the start of the statement. Closes <a href="">issue 2314</a>.</li>
<li>Fix: region detection missed functions defined in unusual places, such as <code>else</code> and <code>except</code> clauses. This is now fixed.</li>
<li>Fix: recent versions of the lcov tool complain if the same function name appears more than once in a report. Python can have multiple same-named functions in a few ways, for example, getters/setters or conditionally defined functions. These are now disambiguated by adding a <code>@&lt;line number&gt;</code> suffix to the function name. Fixes <em>issue 2335</em>.</li>
<li>Fix: The “Can’t combine statement coverage data with branch data” error now names the two data files it couldn’t combine. The <a href="https://coverage.readthedocs.io/en/latest/messages.html#error-cant-combine">error description</a> in the docs now lists common causes and how to find the process that wrote the file.</li>
<li>Fix: at coverage totals close to 0 or 100, the XML report could get incorrect <code>line-rate</code> values like <code>8.333e-05</code> or <code>1</code>. This is now fixed, closing <a href="">issue 2293</a> and <a href="">issue 2294</a>.</li>
<li>Fix: a parallel data file saved more than once kept the hash of its first save in its file name. Combining could then skip it as a duplicate of another file that had the same data at that point, and delete it, losing the data recorded after the first save. Each save now updates the hash. This had been a problem since 7.13.1. Fixes <a href="">issue 2338</a>.</li>
<li>Fixes for obscure but legal file names:
<ul>
<li>File names (and plugin names) can contain control characters, which are legal in POSIX paths but unsafe in reports: in XML 1.0 they make the document non-well-formed, and in a terminal they act as escape sequences (colors, title/clipboard sequences, cursor moves that forge output). Now the XML report, the text and Markdown summary reports, and <code>coverage debug data</code> replace non-printable characters in names. Printable names are unchanged.</li>
<li>A file pattern (from <code>include</code>, <code>omit</code>, or a <code>[paths]</code> alias) containing a newline sent the glob-to-regex translation into an infinite loop, hanging the process. Newlines in patterns are now handled like any other character.</li>
</ul>
</li>
<li>Fixes in the implementation of the C tracer:
<ul>
<li>If a plugin’s <code>dynamic_source_filename</code> method raised an exception, lines in that function could be recorded as belonging to a different file. Also fixed some minor memory leaks in the C tracer.</li>
<li>The refcount of <code>None</code> was mismanaged during function calls, including comprehensions. This was unlikely to cause an actual problem, but is now fixed. Thanks, Andrew Dalke.</li>
<li>The C tracer held borrowed references to dictionary values, which was unsafe on free-threaded Python. Now it takes its own references.</li>
<li>An internal error while recording a new file could be reported as a confusing <code>SystemError</code> instead of the actual exception.</li>
</ul>
</li>
<li>Performance: the text summary report (<code>coverage report</code>) held on to every file’s parsed source until it finished, so its memory use grew with the size of the project: ten times or more what 7.14 used on large projects. Now it keeps only what it needs to print. Fixes <a href="">issue 2277</a>.</li>
<li>Performance: HTML reports should be about 5% faster to produce.</li>
<li>Kept the political banner in the README. Closes <a href="">issue 2344</a>.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.17.0">coverage 7.17.0</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.17.0</code></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.17.0 — 2026-10-22</h2>
<ul>
<li>
<p>Dropped support for Python 3.10.</p>
</li>
<li>
<p>Binary wheels are now provided for iOS and Android. This allows the use of
the optimized C tracer on mobile platforms.</p>
</li>
<li>
<p>Fix: three or more levels of nested <code>with</code> statements could make a <code>with</code>
line look like a branch with an exit that can never happen. Using the
sys.monitoring core, these phantom branches were reported as partial. Other
cores hid the problem but still counted the phantom branches in the total.
Closes <code>issue 1987</code>_.</p>
</li>
<li>
<p>Fix: a comment or string that merely mentioned <code>if True:</code> or
<code>while True:</code> could mark its line as a branch that is known to be partial,
so a branch that never ran was reported as taken.  These built-in patterns
now only match at the start of the statement. Closes <code>issue 2314</code>_.</p>
</li>
<li>
<p>Fix: region detection missed functions defined in unusual places, such as
<code>else</code> and <code>except</code> clauses. This is now fixed.</p>
</li>
<li>
<p>Fix: recent versions of the lcov tool complain if the same function name
appears more than once in a report. Python can have multiple same-named
functions in a few ways, for example, getters/setters or conditionally
defined functions. These are now disambiguated by adding a <code>@&lt;line number&gt;</code>
suffix to the function name. Fixes <code>issue 2335</code>.</p>
</li>
<li>
<p>Fix: The &quot;Can't combine statement coverage data with branch data&quot; error now
names the two data files it couldn't combine. The :ref:<code>error description &lt;error_cant_combine&gt;</code> in the docs now lists common causes and how to find the
process that wrote the file.</p>
</li>
<li>
<p>Fix: at coverage totals close to 0 or 100, the XML report could get incorrect
<code>line-rate</code> values like <code>8.333e-05</code> or <code>1</code>. This is now fixed, closing
<code>issue 2293</code>_ and <code>issue 2294</code>_.</p>
</li>
<li>
<p>Fix: a parallel data file saved more than once kept the hash of its first
save in its file name. Combining could then skip it as a duplicate of another
file that had the same data at that point, and delete it, losing the data
recorded after the first save. Each save now updates the hash. This had been
a problem since 7.13.1. Fixes <code>issue 2338</code>_.</p>
</li>
<li>
<p>Fixes for obscure but legal file names:</p>
<ul>
<li>File names (and plugin names) can contain control characters, which are
legal in POSIX paths but unsafe in reports: in XML 1.0 they make the
document non-well-formed, and in a terminal they act as escape sequences
(colors, title/clipboard sequences, cursor moves that forge output). Now
the XML report, the text and Markdown summary reports, and ``coverage debug</li>
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
<li><a href=""><code>393ac71</code></a> docs: prep for 7.17.0</li>
<li><a href=""><code>14257d3</code></a> test: check that 100% files haven't lost coverage</li>
<li><a href=""><code>db056ac</code></a> docs: keep the ukraine banner <a href="">#2344</a></li>
<li><a href=""><code>6033660</code></a> fix: update the data file hash when a parallel data file is saved again (<a href="">#2339</a>)</li>
<li><a href=""><code>99024b5</code></a> fix: clamp rate in XML report to prevent false 1.0/0.0 rounding and scientifi...</li>
<li><a href=""><code>ff62a02</code></a> refactor: remove unused caching branches</li>
<li><a href=""><code>24d0b67</code></a> fix: KeyError for a with statement at the end of a finally clause (<a href="">#2336</a>)</li>
<li><a href=""><code>934f5b8</code></a> chore: upgrade pip==26.2.2 certifi==2026.10.19</li>
<li><a href=""><code>f95c980</code></a> fix: triply nested <code>with</code> statements don't cause false branch misses <a href="">#1987</a></li>
<li><a href=""><code>6aaa858</code></a> docs: more changelog gardening</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.16.2...7.17.0">compare view</a></li>
</ul>
</details>
<br />

Updates `cyclopts` from 5.2.0 to 5.3.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/BrianPugh/cyclopts/releases">cyclopts's releases</a>.</em></p>
<blockquote>
<h2>v5.3.1</h2>
<h2>Bug Fixes</h2>
<ul>
<li>respect explicit delimiters for path environment values by <a href="https://github.com/Don-Yin"><code>@​Don-Yin</code></a> in <a href="">BrianPugh/cyclopts#1021</a></li>
<li>validate <code>Parameter(name=&quot;*&quot;)</code> behind a <code>type</code> alias at setup time by <a href="https://github.com/Rahul-cs50"><code>@​Rahul-cs50</code></a> in <a href="">BrianPugh/cyclopts#1030</a></li>
<li>resolve subscripted generic type aliases (<a href="">#1028</a>) by <a href="https://github.com/yash-bitla"><code>@​yash-bitla</code></a> in <a href="">BrianPugh/cyclopts#1031</a></li>
<li>bind config values to a meta app's own parameters (regressed in v4.0.0) by <a href="https://github.com/BrianPugh"><code>@​BrianPugh</code></a> in <a href="">BrianPugh/cyclopts#1027</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Don-Yin"><code>@​Don-Yin</code></a> made their first contribution in <a href="">BrianPugh/cyclopts#1021</a></li>
<li><a href="https://github.com/Rahul-cs50"><code>@​Rahul-cs50</code></a> made their first contribution in <a href="">BrianPugh/cyclopts#1030</a></li>
<li><a href="https://github.com/yash-bitla"><code>@​yash-bitla</code></a> made their first contribution in <a href="">BrianPugh/cyclopts#1031</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/BrianPugh/cyclopts/compare/v5.3.0...v5.3.1">https://github.com/BrianPugh/cyclopts/compare/v5.3.0...v5.3.1</a></p>
<h2>v5.3.0</h2>
<h2>Features</h2>
<ul>
<li><code>Number</code> validator supports <code>Decimal</code> and <code>Fraction</code>. <a href="">#988</a></li>
</ul>
<h2>Bug Fixes</h2>
<h3>Config &amp; Environment Variables</h3>
<ul>
<li>Empty config containers now bind for <code>dict</code>, <code>list</code>, <code>tuple</code>, <code>set</code> and dataclass parameters (<code>Any</code> parameters keep the container as-is). <a href="">#993</a>, <a href="">#1006</a></li>
<li>A config <code>null</code> is rejected for types that don't allow <code>None</code>. <a href="">#1004</a></li>
<li>A config array is rejected for single-value types, including a pydantic <code>Model | bool</code> (previously bound <code>True</code>). <a href="">#1005</a>, <a href="">#1014</a></li>
<li>A JSON <code>config.Env</code> value containing spaces stays one token. <a href="">#997</a></li>
<li>Symlinked configuration filenames are preserved. <a href="https://github.com/ac1982"><code>@​ac1982</code></a> <a href="">#995</a></li>
</ul>
<h3>JSON Parsing</h3>
<ul>
<li><code>dict[str, X]</code> parameters accept a JSON object from the CLI or an env var. <a href="">#1001</a></li>
<li>A JSON object for a nested pydantic model field no longer crashes with <code>IndexError</code>. <a href="">#999</a></li>
<li>An explicit empty JSON object reports the missing required fields. <a href="">#992</a></li>
<li>Errors from config/env JSON list elements name the real parameter instead of <code>--json</code>. <a href="">#998</a></li>
</ul>
<h3>Unions With a Class Member</h3>
<ul>
<li><code>Foo | bool</code> supports keyed fields and bare flags, and lists <code>--x</code>/<code>--no-x</code> in help and shell completion. <a href="">#991</a>, <a href="">#1013</a></li>
<li><code>Foo | dict[str, int]</code> no longer silently drops unknown keys; its dict fallback keeps typed keys and input order. <a href="">#1015</a>, <a href="">#1019</a></li>
</ul>
<h3>Other</h3>
<ul>
<li>~3.5 ms faster startup and per-invocation overhead. <a href="">#989</a></li>
<li>A mistyped command given with <code>--help</code> raises <code>UnknownCommandError</code>. <a href="https://github.com/BreytMN"><code>@​BreytMN</code></a> <a href="">#994</a></li>
<li><code>Parameter</code> metadata is honored on dict value types. <a href="https://github.com/saadkhantareen"><code>@​saadkhantareen</code></a> <a href="">#1008</a></li>
<li>Pydantic models with <code>validate_by_alias=False</code> accept the field name on pydantic 2.14. <a href="">#1010</a></li>
<li>The <code>Parameter(name=&quot;*&quot;)</code> no-default error names the class instead of <code>Annotated</code>. <a href="">#996</a></li>
<li><code>resolve_returncode</code> and <code>ConsumeMultipleError</code> are declared in <code>__init__.pyi</code>. <a href="https://github.com/tarrific"><code>@​tarrific</code></a> <a href="">#1018</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/ac1982"><code>@​ac1982</code></a> made their first contribution in <a href="">#995</a></li>
<li><a href="https://github.com/BreytMN"><code>@​BreytMN</code></a> made their first contribution in <a href="">#994</a></li>
<li><a href="https://github.com/saadkhantareen"><code>@​saadkhantareen</code></a> made their first contribution in <a href="">#1008</a></li>
<li><a href="https://github.com/tarrific"><code>@​tarrific</code></a> made their first contribution in <a href="">#1018</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5c217f9</code></a> Merge pull request <a href="">#1027</a> from BrianPugh/fix/meta-app-config-params</li>
<li><a href=""><code>eea85d9</code></a> Merge pull request <a href="">#1031</a> from yash-bitla/fix-generic-type-alias-1028</li>
<li><a href=""><code>3357a6b</code></a> fix: resolve generic type alias whose value ignores its type parameter</li>
<li><a href=""><code>f98cbb2</code></a> fix: validate Parameter(name=&quot;*&quot;) behind a <code>type</code> alias at setup time</li>
<li><a href=""><code>79bcb1d</code></a> fix: resolve subscripted generic type aliases (<a href="">#1028</a>)</li>
<li><a href=""><code>3b873e9</code></a> docs: trim meta-app config docs and docstring</li>
<li><a href=""><code>5675265</code></a> docs: note that config binds meta app parameters</li>
<li><a href=""><code>9a66ebb</code></a> test: pin that unknown config keys still error with a meta app</li>
<li><a href=""><code>263ff68</code></a> docs: document the app-frame invariant in _meta_arguments</li>
<li><a href=""><code>44f9d15</code></a> fix: bind config values to a meta app's own parameters</li>
<li>Additional commits viewable in <a href="https://github.com/BrianPugh/cyclopts/compare/v5.2.0...v5.3.1">compare view</a></li>
</ul>
</details>
<br />

Updates `griffelib` from 2.4.0 to 2.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/griffe/releases">griffelib's releases</a>.</em></p>
<blockquote>
<h2>2.4.1</h2>
<h2><a href="https://github.com/mkdocstrings/griffe/releases/tag/2.4.1">2.4.1</a> - 2026-10-22</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/griffe/compare/2.4.0...2.4.1">Compare with 2.4.0</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Load symbols gated behing <code>__getattr__</code> during dynamic analysis (<a href="">3faeeb1</a> by Timothée Mazzucotelli).</li>
</ul>
<h3>Code Refactoring</h3>
<ul>
<li>Stop checking attribute values (<a href="">0670d03</a> by Timothée Mazzucotelli). <a href="">Issue-506</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/griffe/blob/main/CHANGELOG.md">griffelib's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/griffe/releases/tag/2.4.1">2.4.1</a> - 2026-10-22</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/griffe/compare/2.4.0...2.4.1">Compare with 2.4.0</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Load symbols gated behing <code>__getattr__</code> during dynamic analysis (<a href="">3faeeb1</a> by Timothée Mazzucotelli).</li>
</ul>
<h3>Code Refactoring</h3>
<ul>
<li>Stop checking attribute values (<a href="">0670d03</a> by Timothée Mazzucotelli). <a href="">Issue-506</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a74c9d0</code></a> chore: Prepare release 2.4.1</li>
<li><a href=""><code>0670d03</code></a> refactor: Stop checking attribute values</li>
<li><a href=""><code>f3f2605</code></a> docs: Add back <code>pymdownx.blocks.tab</code> Markdown extension</li>
<li><a href=""><code>da6f966</code></a> docs: Add periods to docstrings</li>
<li><a href=""><code>9d51e51</code></a> docs: Single block license headers</li>
<li><a href=""><code>5b833a9</code></a> docs: Fix code tree with annotations</li>
<li><a href=""><code>731b3c5</code></a> docs: Various improvements</li>
<li><a href=""><code>3faeeb1</code></a> fix: Load symbols gated behing <code>__getattr__</code> during dynamic analysis</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/griffe/compare/2.4.0...2.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `hedtools` from 1.2.0 to 1.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/hed-standard/hed-python/releases">hedtools's releases</a>.</em></p>
<blockquote>
<h2>Release 1.3.0: October 23, 2026</h2>
<p>This release implements HED specification 4.0.0 (reserved tags, column names and padded values, tag-extension rules, value-text and character sets, BIDS date-times, compound units) and bundles HED 8.5.0. Many annotations that passed under 1.2.0 now give errors, and tabular validation reports issues differently: read the upgrade notes first. Runtime dependencies and supported Python versions (3.10 and later) are unchanged.</p>
<h2>Upgrade notes</h2>
<p>These changes can alter validation results or break code written against 1.2.0.</p>
<ul>
<li><strong>Tabular validation runs in stages and stops at the first stage with an error.</strong> A file's column names are checked first, then its sidecar, then each column's distinct values, then each distinct <code>HED</code>-column string, and only then the assembled rows (group-level, onset and temporal checks). Warnings never stop the run. A file whose sidecar has errors now reports only the sidecar's issues, once each, rather than once per row; fix them and run again to see later checks.</li>
<li><strong>A bad value is reported once, not once per row.</strong> An issue found in a column value or a <code>HED</code>-column string is reported at the first row that holds it, with a new <code>row_count</code> key giving the number of rows. Code that counts issues will see much smaller numbers.</li>
<li><strong><code>SpreadsheetValidator.validate</code> has a new signature:</strong> <code>validate(source, sidecar=None, extra_def_dicts=None, name=None, error_handler=None, row_offset=None, validate_sidecar=True)</code>. The second positional argument is now the sidecar; passing a definition dictionary there raises <code>TypeError</code>.</li>
<li><strong>New errors for annotations that used to pass.</strong> In particular: a repeated, padded or blank column name and a padded value in an annotated column (<code>TABULAR_INVALID</code>); a padded sidecar key (<code>SIDECAR_INVALID</code>); an extension term with no letter such as <code>Item/Blech/3</code> (<code>TAG_EXTENSION_INVALID</code>); <code>#</code> after an extension in a sidecar (<code>PLACEHOLDER_INVALID</code>); <code>(Delay/3 s)</code> without an inner group (<code>TEMPORAL_TAG_ERROR</code>); a double quote anywhere in a HED string (<code>CHARACTER_INVALID</code>); a date-time that is not a BIDS Datetime or not a real date (<code>VALUE_INVALID</code>); unit names in the wrong case such as <code>Milliseconds</code> (<code>UNITS_INVALID</code>). Details below.</li>
<li><strong><code>NaN</code> in a TSV file is a value, not a missing cell.</strong> Only an empty cell and <code>n/a</code> are missing. <code>NaN</code>, <code>NA</code>, <code>NULL</code>, <code>None</code> and the other pandas default NA strings are now validated like any other value.</li>
<li><strong>Column names are used exactly as written.</strong> They are never trimmed, and a sidecar key or column selector must match a column name exactly. A blank column name no longer raises <code>HedFileError</code> when the file is loaded; validation reports it as <code>TABULAR_INVALID</code>. Text files are read without CSV quoting, so a double quote is an ordinary character.</li>
<li><strong>Changed error codes.</strong> <code>SchemaAttributeErrors.SCHEMA_MISSING_EXTRA_VALUE</code> is now an alias whose value is the string <code>&quot;SCHEMA_MISSING_EXTRA&quot;</code>, so code comparing issue codes to the literal <code>&quot;SCHEMA_MISSING_EXTRA_VALUE&quot;</code> must change. The warnings <code>SCHEMA_ANNOTATION_PREFIX_MISSING</code>, <code>SCHEMA_ANNOTATION_EXTERNAL_MISSING</code> and <code>SCHEMA_ANNOTATION_SOURCE_MISSING</code> are replaced by <code>SCHEMA_ANNOTATION_INVALID</code>. A tilde is <code>CHARACTER_INVALID</code> instead of <code>TILDES_UNSUPPORTED</code>. Extending a reserved tag (<code>Onset/Blah</code>) is <code>TAG_EXTENSION_INVALID</code> instead of <code>TEMPORAL_TAG_ERROR</code>. A schema listed twice in one merge group fails with <code>SCHEMA_LOAD_FAILED</code> instead of <code>SCHEMA_LIBRARY_INVALID</code>.</li>
<li><strong><code>Sidecar.validate</code> no longer reports <code>REQUIRED_TAG_MISSING</code></strong>, because a sidecar string is only part of a row. The check runs on the assembled row.</li>
<li><strong>Removed functions and data files</strong> are listed under &quot;Removed&quot; below.</li>
</ul>
<h2>New features</h2>
<h3>Schemas</h3>
<ul>
<li>HED 8.5.0 is bundled, with the libraries score 1.2.0, score 2.2.0 and lang 1.2.0, so they load offline. <code>load_schema_version()</code> with no version now loads 8.5.0. The bundled partnered libraries (lang 1.0.0 to 1.2.0, score 1.1.0 to 2.2.0) are stored unmerged, which shrinks the package; they load the same as the merged releases.</li>
<li>Schema merge groups follow HED specification 3.1.2.4. <code>load_schema_version</code> resolves each namespace of a version list as a merge group: all libraries must share one standard partner, an unpartnered library must be alone in its namespace, and the partner standard version may be listed beside its libraries. The rules are checked from the schema headers before any file is parsed, and the standard schema is loaded at most once per group. Libraries in one group may declare the same element if the declarations agree; it carries a comma-separated <code>inLibrary</code> value. The merged schema's Sources, Prefixes and External annotations combine every library's rows with the partner's.</li>
<li><code>load_schema</code> and <code>from_string</code> take a new <code>xml_folder</code> argument, searched first for the standard partner of an unmerged partnered library.</li>
<li><code>HedSchema.unmerged_libraries</code>: the libraries in a schema that were loaded from an unmerged file.</li>
<li><code>anyUnits</code> (HED 8.5.0, <code>Quantity/#</code>): the placeholder accepts a unit from any unit class, listed or derived; a listed unit wins over a derived form (<code>dB</code> is the decibel). <code>value_as_default_unit</code> converts to the default unit of the class that matched.</li>
<li><code>HedTag.default_unit</code> resolves a <code>defaultUnits</code> value that is a derived form of a listed unit (such as <code>mA</code> in HED 8.5.0) to the unit it derives from.</li>
</ul>
<h3>Validation</h3>
<ul>
<li>Public staged-validation methods on <code>SpreadsheetValidator</code>: <code>validate_column_names</code>, <code>validate_column_structure</code>, <code>validate_value_column</code>, <code>validate_categorical_column</code>, <code>validate_padded_values</code>, <code>validate_hed_column</code> (with <code>full_string=</code> for callers that never assemble rows) and <code>validate_assembled</code>. <code>SpreadsheetValidator(hed_schema, def_dicts=None)</code> takes definitions for these calls.</li>
<li>The <code>ColumnSource</code> protocol (<code>hed.models.column_source</code>): validation reads a table through <code>column_names()</code>, <code>distinct_values()</code>, <code>column_mapper()</code> and <code>as_base_input()</code>, so tables other than files (for example NWB tables through ndx-hed) get the same checks. <code>BaseInput</code> implements it; <code>ListColumnSource</code> wraps plain lists; <code>hed.models.distinct_values</code> builds the value-to-rows map; <code>check_column_names</code> applies the column-name rules.</li>
<li><code>BaseInput.validate</code>, <code>TabularInput.validate</code> and <code>SpreadsheetValidator.validate</code> take <code>validate_sidecar=</code> (skip a sidecar you already validated) and <code>row_offset=</code> (<code>0</code> reports 0-based data rows; the default is still 1-based file lines counting the header).</li>
<li><code>row_count</code> on issues; <code>get_printable_issue_string</code> and <code>get_printable_issue_string_html</code> add <code>[first of N rows with this value]</code> when N &gt; 1.</li>
<li><code>HedValidator.run_full_string_checks(hed_string, *, required_tags=True, unique_tags=True)</code> can skip the row-wide checks when validating part of a row.</li>
<li>New read-only properties <code>BaseInput.duplicate_columns</code>, <code>BaseInput.padded_columns</code> and <code>BaseInput.blank_columns</code>. Repeated names are read from the raw header, before pandas renames the second copy.</li>
<li>One character table shared with the specification: <code>hed/validator/data/character_sets.json</code>, read by <code>hed.validator.util.character_sets</code> (<code>CharacterSets.load()</code>, <code>code_point()</code>). From standard schema 8.5.0, and in libraries partnered with 8.5.0 or later, a value class's <code>allowedCharacter</code> declaration defines its characters; earlier schemas use the file's per-class defaults.</li>
<li>The <code>value-text</code> character set: from standard schema 8.5.0, a textClass value (<code>Description/#</code>, <code>Label/#</code>, <code>Parameter-value/#</code>, ...) may not contain <code>(</code>, <code>)</code>, <code>#</code> or <code>~</code> (<code>CHARACTER_INVALID</code>).</li>
<li><code>CHARACTER_INVALID</code> and <code>VALUE_INVALID</code> messages name the character, its code point, its index and the allowed set, and the issues carry new <code>char_set</code> and <code>code_point</code> keys.</li>
</ul>
<h3>Schema tools</h3>
<ul>
<li>Schema compliance (<code>check_compliance</code>, <code>hedpy schema validate</code>):
<ul>
<li>New error <code>SCHEMA_RESERVED_INVALID</code>: a standard schema must define the reserved tags with their required attributes, and a reserved tag may have no child other than <code>#</code>.</li>
<li>New <code>SCHEMA_LIBRARY_INVALID</code> reasons: an unmerged partnered library may not declare a Properties section (j); a merged one's must equal its partner's (k); no library element may carry <code>reserved</code> (l), define a tag with a reserved name (m), or root a node under a reserved tag (n).</li>
<li>A unit already accepted as an SI-modified or plural form of another unit of its class (<code>uV</code> beside <code>V</code>) is <code>SCHEMA_DUPLICATE_NODE</code>, for standard schemas 8.5.0 and later and the libraries partnered with them.</li>
<li>Unit class rules: a <code>#</code> with more than one <code>unitClass</code>, or with a <code>unitClass</code> but not <code>valueClass=numericClass</code> (8.5.0 and later), is <code>SCHEMA_ATTRIBUTE_VALUE_INVALID</code>; <code>anyUnits</code> may list no units or <code>defaultUnits</code>; one unit string derived by two classes is <code>SCHEMA_DUPLICATE_NODE</code>.</li>
</ul>
</li>
<li><code>hed_validate_schemas --require-ids</code> and <code>hedpy schema validate --require-ids</code> list every element without a hedId and fail; <code>hed_validate_schemas</code> accepts <code>.json</code> schema files; <code>hedpy schema add-ids</code> works (it crashed with an argument error in 1.2.0).</li>
<li><code>hedpy schema convert</code> (<code>hed_update_schemas</code>) drops a spreadsheet row whose element is gone from the schema when its hedId is listed under <code>retired_ids</code> in hed-schemas <code>library_data.json</code>, and never reassigns a retired hedId. New helper <code>hed.schema.schema_io.hed_id_util.remove_retired_rows</code>.</li>
<li><code>SchemaComparer</code>: a removed unit the newer schema still derives is reported as Patch with the derivation (<code>Unit uV removed from electricPotentialUnits; still derivable as u + V</code>); for a partnered library, changes are marked with <code>origin</code> and the partner's changes are printed in a separate <code>From the partner standard schema</code> block; a prologue or epilogue change lists the removed and added lines; <code>compare_differences</code> takes <code>use_markdown=</code> (default True) and its markdown follows the hed-schemas <code>PRERELEASE_CHANGES.md</code> layout.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/hed-standard/hed-python/blob/main/CHANGELOG.md">hedtools's changelog</a>.</em></p>
<blockquote>
<h1>Release 1.3.0 October 23, 2026</h1>
<p>This release implements HED specification 4.0.0 (reserved tags, column names and padded values, tag-extension rules, value-text and character sets, BIDS date-times, compound units) and bundles HED 8.5.0. Many annotations that passed under 1.2.0 now give errors, and tabular validation reports issues differently: read the upgrade notes first. Runtime dependencies and supported Python versions (3.10 and later) are unchanged.</p>
<h2>Upgrade notes</h2>
<p>These changes can alter validation results or break code written against 1.2.0.</p>
<ul>
<li><strong>Tabular validation runs in stages and stops at the first stage with an error.</strong> A file's column names are checked first, then its sidecar, then each column's distinct values, then each distinct <code>HED</code>-column string, and only then the assembled rows (group-level, onset and temporal checks). Warnings never stop the run. A file whose sidecar has errors now reports only the sidecar's issues, once each, rather than once per row; fix them and run again to see later checks.</li>
<li><strong>A bad value is reported once, not once per row.</strong> An issue found in a column value or a <code>HED</code>-column string is reported at the first row that holds it, with a new <code>row_count</code> key giving the number of rows. Code that counts issues will see much smaller numbers.</li>
<li><strong><code>SpreadsheetValidator.validate</code> has a new signature:</strong> <code>validate(source, sidecar=None, extra_def_dicts=None, name=None, error_handler=None, row_offset=None, validate_sidecar=True)</code>. The second positional argument is now the sidecar; passing a definition dictionary there raises <code>TypeError</code>.</li>
<li><strong>New errors for annotations that used to pass.</strong> In particular: a repeated, padded or blank column name and a padded value in an annotated column (<code>TABULAR_INVALID</code>); a padded sidecar key (<code>SIDECAR_INVALID</code>); an extension term with no letter such as <code>Item/Blech/3</code> (<code>TAG_EXTENSION_INVALID</code>); <code>#</code> after an extension in a sidecar (<code>PLACEHOLDER_INVALID</code>); <code>(Delay/3 s)</code> without an inner group (<code>TEMPORAL_TAG_ERROR</code>); a double quote anywhere in a HED string (<code>CHARACTER_INVALID</code>); a date-time that is not a BIDS Datetime or not a real date (<code>VALUE_INVALID</code>); unit names in the wrong case such as <code>Milliseconds</code> (<code>UNITS_INVALID</code>). Details below.</li>
<li><strong><code>NaN</code> in a TSV file is a value, not a missing cell.</strong> Only an empty cell and <code>n/a</code> are missing. <code>NaN</code>, <code>NA</code>, <code>NULL</code>, <code>None</code> and the other pandas default NA strings are now validated like any other value.</li>
<li><strong>Column names are used exactly as written.</strong> They are never trimmed, and a sidecar key or column selector must match a column name exactly. A blank column name no longer raises <code>HedFileError</co...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c061f3702fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.