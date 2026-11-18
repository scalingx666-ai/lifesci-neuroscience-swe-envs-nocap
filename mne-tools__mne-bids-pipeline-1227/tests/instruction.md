# Issue

**Title:** [dependabot]: Bump the deps group with 8 updates

## Description

Bumps the deps group with 8 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.28.0` | `3.29.0` |
| [matplotlib](https://github.com/matplotlib/matplotlib) | `3.10.8` | `3.10.9` |
| [pyarrow](https://github.com/apache/arrow) | `23.0.1` | `24.0.0` |
| [pydantic](https://github.com/pydantic/pydantic) | `2.13.1` | `2.13.3` |
| [openneuro-py](https://github.com/openneuro-py/openneuro-py) | `2026.3.1` | `2026.4.1` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.9.18` | `0.9.22` |
| [ty](https://github.com/astral-sh/ty) | `0.0.31` | `0.0.32` |
| [pydantic-core](https://github.com/pydantic/pydantic) | `2.46.1` | `2.46.3` |

Updates `filelock` from 3.28.0 to 3.29.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.29.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(async): use single-thread executor for lock consistency by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#533</a></li>
<li>✨ feat(soft): enable stale lock detection on Windows by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#534</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.28.0...3.29.0">https://github.com/tox-dev/filelock/compare/3.28.0...3.29.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<hr />
<p>3.29.0 (2026-04-19)</p>
<hr />
<ul>
<li>✨ feat(soft): enable stale lock detection on Windows :pr:<code>534</code></li>
<li>🐛 fix(async): use single-thread executor for lock consistency :pr:<code>533</code></li>
<li>build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1 :pr:<code>530</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<hr />
<p>3.28.0 (2026-04-14)</p>
<hr />
<ul>
<li>🐛 fix(ci): unbreak release workflow, publish to PyPI again :pr:<code>529</code></li>
</ul>
<hr />
<p>3.26.1 (2026-04-09)</p>
<hr />
<ul>
<li>🐛 fix(asyncio): add <strong>exit</strong> to BaseAsyncFileLock and fix <strong>del</strong> loop handling :pr:<code>518</code> - by :user:<code>naarob</code></li>
<li>build(deps): bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 :pr:<code>525</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<hr />
<p>3.26.0 (2026-04-06)</p>
<hr />
<ul>
<li>✨ feat(soft): add PID inspection and lock breaking :pr:<code>524</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>523</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>build(deps): bump astral-sh/setup-uv from 7.6.0 to 8.0.0 :pr:<code>522</code> - by :user:<code>dependabot[bot]</code></li>
<li>Remove persist-credentials: false from release job :pr:<code>520</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>519</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>🔒 ci(workflows): add zizmor security auditing :pr:<code>517</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>516</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>514</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.25.2 (2026-03-11)</p>
<hr />
<ul>
<li>🐛 fix(unix): suppress EIO on close in Docker bind mounts :pr:<code>513</code></li>
</ul>
<hr />
<p>3.25.1 (2026-03-09)</p>
<hr />
<ul>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>510</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>🐛 fix(win): restore best-effort lock file cleanup on release :pr:<code>511</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>469b47f</code></a> Release 3.29.0</li>
<li><a href=""><code>e85d072</code></a> ✨ feat(soft): enable stale lock detection on Windows (<a href="">#534</a>)</li>
<li><a href=""><code>f5ee171</code></a> 🐛 fix(async): use single-thread executor for lock consistency (<a href="">#533</a>)</li>
<li><a href=""><code>2a95458</code></a> build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1 (<a href="">#530</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.28.0...3.29.0">compare view</a></li>
</ul>
</details>
<br />

Updates `matplotlib` from 3.10.8 to 3.10.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>v3.10.9</h2>
<p>This is a micro release of the v3.10.x series.
Highlights of this release include:</p>
<ul>
<li>Various minor bug and doc fixes</li>
<li>Security hardening validation of cyclers - Removing eval usage</li>
<li>Security hardening in Latex and PS calls - Removing shell escapes</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dd8d78b</code></a> REL: v3.10.9</li>
<li><a href=""><code>2fb1891</code></a> REL: Release prep v3.10.9</li>
<li><a href=""><code>d0e923a</code></a> Merge branch 'v3.10.8-doc' into v3.10.x</li>
<li><a href=""><code>1637932</code></a> Merge pull request <a href="">#31558</a> from meeseeksmachine/auto-backport-of-pr-31556-on-v...</li>
<li><a href=""><code>a83faac</code></a> Backport PR <a href="">#31556</a>: FIX: Inverted PyErr_Occurred check in enum type caster (_...</li>
<li><a href=""><code>a4f57ab</code></a> Merge pull request <a href="">#31545</a> from ksunden/backport-of-pr-31282-on-v3.10.x</li>
<li><a href=""><code>063288d</code></a> Merge pull request <a href="">#31544</a> from ksunden/backport-of-pr-31248-on-v3.10.x</li>
<li><a href=""><code>b2ed196</code></a> Backport PR <a href="">#31248</a>: SEC: Remove eval() from validate_cycler</li>
<li><a href=""><code>acc6024</code></a> Merge pull request <a href="">#31282</a> from scottshambaugh/tex_no_shell</li>
<li><a href=""><code>e3fb541</code></a> Merge pull request <a href="">#31078</a> from meeseeksmachine/auto-backport-of-pr-31075-on-v...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.8...v3.10.9">compare view</a></li>
</ul>
</details>
<br />

Updates `pyarrow` from 23.0.1 to 24.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/apache/arrow/releases">pyarrow's releases</a>.</em></p>
<blockquote>
<h2>Apache Arrow 24.0.0</h2>
<p>Release Notes URL: <a href="https://arrow.apache.org/release/24.0.0.html">https://arrow.apache.org/release/24.0.0.html</a></p>
<h2>Apache Arrow 24.0.0 RC0</h2>
<p>Release Notes: Release Candidate: 24.0.0 RC0</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>31b4b6c</code></a> MINOR: [Release] Update versions for 24.0.0</li>
<li><a href=""><code>06dbc17</code></a> MINOR: [Release] Update .deb/.rpm changelogs for 24.0.0</li>
<li><a href=""><code>a021d80</code></a> MINOR: [Release] Update CHANGELOG.md for 24.0.0</li>
<li><a href=""><code>2d6b12c</code></a> <a href="">GH-49716</a>: [C++] FixedShapeTensorType::Deserialize should strictly validate se...</li>
<li><a href=""><code>a74cb6a</code></a> <a href="">GH-49697</a>: [C++][CI] Check IPC file body bounds are in sync with decoder outco...</li>
<li><a href=""><code>871a0c6</code></a> <a href="">GH-49676</a>: [Python][Packaging] Fix gRPC docker image layer being too big for h...</li>
<li><a href=""><code>f9203b3</code></a> <a href="">GH-49586</a>: [C++][CI] StructToStructSubset test failure with libc++ 22.1.1 (<a href="">#49</a>...</li>
<li><a href=""><code>fe298b4</code></a> <a href="">GH-49628</a>: [Python][Interchange protocol] Suppress warnings for pandas 4.0.0 a...</li>
<li><a href=""><code>1f94910</code></a> <a href="">GH-49252</a>: [GLib] Deprecate Feather features (<a href="">#49673</a>)</li>
<li><a href=""><code>5ba5c3c</code></a> <a href="">GH-49671</a>: [CI][Docs] Don't run jobs for push by Dependabot (<a href="">#49672</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/apache/arrow/compare/apache-arrow-23.0.1...apache-arrow-24.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pydantic` from 2.13.1 to 2.13.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/releases">pydantic's releases</a>.</em></p>
<blockquote>
<h2>v2.13.3 2026-04-20</h2>
<h2>v2.13.3 (2026-04-20)</h2>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Handle <code>AttributeError</code> subclasses with <code>from_attributes</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13096</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.13.2...v2.13.3">https://github.com/pydantic/pydantic/compare/v2.13.2...v2.13.3</a></p>
<h2>v2.13.2 2026-04-17</h2>
<h2>v2.13.2 (2026-04-17)</h2>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Fix <code>ValidationInfo.field_name</code> missing with <code>model_validate_json()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13084</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.13.1...v2.13.2">https://github.com/pydantic/pydantic/compare/v2.13.1...v2.13.2</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/blob/main/HISTORY.md">pydantic's changelog</a>.</em></p>
<blockquote>
<h2>v2.13.3 (2026-04-20)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.3">GitHub release</a></p>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Handle <code>AttributeError</code> subclasses with <code>from_attributes</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13096</a></li>
</ul>
<h2>v2.13.2 (2026-04-17)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.2">GitHub release</a></p>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Fix <code>ValidationInfo.field_name</code> missing with <code>model_validate_json()</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13084</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9e9a111</code></a> Fix backported test</li>
<li><a href=""><code>1ec8c6a</code></a> Prepare release v2.13.3</li>
<li><a href=""><code>fb4f204</code></a> Handle <code>AttributeError</code> subclasses with <code>from_attributes</code></li>
<li><a href=""><code>ca3ddd1</code></a> Prepare release v2.13.2</li>
<li><a href=""><code>000e823</code></a> Fix <code>ValidationInfo.field_name</code> missing with <code>model_validate_json()</code></li>
<li>See full diff in <a href="https://github.com/pydantic/pydantic/compare/v2.13.1...v2.13.3">compare view</a></li>
</ul>
</details>
<br />

Updates `openneuro-py` from 2026.3.1 to 2026.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/openneuro-py/openneuro-py/releases">openneuro-py's releases</a>.</em></p>
<blockquote>
<h2>v2026.4.1</h2>
<h2>👁️ User-visible changes</h2>
<ul>
<li>Massively speed up download startup by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#310</a>, <a href="">openneuro-py/openneuro-py#316</a></li>
<li>Add a global progress bar by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#320</a></li>
<li>Improve error messages by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#321</a>, <a href="">openneuro-py/openneuro-py#318</a></li>
</ul>
<h2>⛑️ Code health</h2>
<ul>
<li>Migrate GraphQL queries from <code>requests</code> to <code>httpx</code> by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#314</a></li>
<li>Validate OpenNeuro GraphQL response by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#315</a></li>
<li>Bump package versions in lockfile by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#319</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.4.0...v2026.4.1">https://github.com/openneuro-py/openneuro-py/compare/v2026.4.0...v2026.4.1</a></p>
<h2>v2026.4.0</h2>
<!-- raw HTML omitted -->
<h2>👁️ User-visible changes</h2>
<ul>
<li>Support latest OpenNeuro API by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#308</a></li>
<li>Improve retry messages to show actual error reason by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#287</a></li>
<li>Big performance improvements when starting a download especially of bigger datasets by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#288</a>, <a href="">openneuro-py/openneuro-py#289</a></li>
<li>Fix a potential crash on download retry by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#286</a></li>
<li>Fix URL in welcome message by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#290</a></li>
<li>Ensure <code>max_concurrent_downloads</code> &gt;= 1 by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#291</a></li>
</ul>
<h2>⛑️ Code health</h2>
<ul>
<li>Update license entries in <code>pyproject.toml</code> to match new schema by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">openneuro-py/openneuro-py#285</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.3.1...v2026.4.0">https://github.com/openneuro-py/openneuro-py/compare/v2026.3.1...v2026.4.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d903fab</code></a> Add global progress bar (<a href="">#320</a>)</li>
<li><a href=""><code>81bca35</code></a> Provide actionable error message if a HEAD request fails (<a href="">#321</a>)</li>
<li><a href=""><code>c26b6c0</code></a> Bump package versions in lockfile (<a href="">#319</a>)</li>
<li><a href=""><code>2f5a594</code></a> Use dataset-relative paths in download error messages (<a href="">#318</a>)</li>
<li><a href=""><code>5a08c44</code></a> Validate OpenNeuro GraphQL response (<a href="">#315</a>)</li>
<li><a href=""><code>a08c86e</code></a> Allow more concurrent HEAD requests (<a href="">#316</a>)</li>
<li><a href=""><code>27ae8e1</code></a> Migrate GraphQL queries from <code>requests</code> to <code>httpx</code> (<a href="">#314</a>)</li>
<li><a href=""><code>f68b1aa</code></a> Massively speed up download startup by fetching file metadata in a single req...</li>
<li><a href=""><code>1454f82</code></a> Support latest OpenNeuro API (<a href="">#308</a>)</li>
<li><a href=""><code>b4ebb79</code></a> Bump types-tqdm from 4.67.3.20260402 to 4.67.3.20260408 (<a href="">#303</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.3.1...v2026.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.18 to 0.9.22
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.22</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>ci: manage install.sh stable version in release workflow by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1755</a></li>
<li>Handle key-value trailing commas by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1756</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Fix pyproject uv source child hover by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1757</a></li>
<li>Preserve TOML 1.0 inline table comments by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1760</a></li>
<li>refactor(lsp): extract source resolver for completion and goto_type_definition by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1761</a></li>
<li>fix(lsp): keep nested table key completions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1763</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Move workspace lint settings by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1758</a></li>
<li>refactor: simplify hover logic for source accessors by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1759</a></li>
<li>Fix clippy warnings by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1762</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.21...v0.9.22">https://github.com/tombi-toml/tombi/compare/v0.9.21...v0.9.22</a></p>
<h2>v0.9.21</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>fix: propagate root schema rules to subschemas by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1741</a></li>
<li>test: use config text in formatter schema tests by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1743</a></li>
<li>Embed latest stable version in install.sh by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1742</a></li>
<li>Fix formatter handling for comment prefixes by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1746</a></li>
<li>Prefer subschema schema ordering overrides by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1748</a></li>
<li>Fix Zed binary fallback after download failure by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1749</a></li>
<li>Refine hover schema order handling by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1750</a></li>
<li>fix(lsp): resolve trailing-space completion for dot/equal triggers (<a href="">#1751</a>) by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1752</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Fix workspace lint config for cargo check by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1754</a></li>
</ul>
<h3>👒 Dependencies</h3>
<ul>
<li>build(deps-dev): bump the npm_and_yarn group across 2 directories with 1 update by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">tombi-toml/tombi#1739</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: restore docs deploy build by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1738</a></li>
<li>style: format rust sources by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1747</a></li>
<li>docs: add built-in schema usage guide by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1753</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.20...v0.9.21">https://github.com/tombi-toml/tombi/compare/v0.9.20...v0.9.21</a></p>
<h2>v0.9.20</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d51e969</code></a> Merge pull request <a href="">#1763</a> from tombi-toml/ya7010/reuse-partial-keys</li>
<li><a href=""><code>8304a3e</code></a> fix: update table schema key completion logic to return true on errors</li>
<li><a href=""><code>5bcd54e</code></a> fix(lsp): keep nested table key completions</li>
<li><a href=""><code>b977d88</code></a> Merge pull request <a href="">#1761</a> from tombi-toml/ya7010/pr1726-gap-422</li>
<li><a href=""><code>8a33ffa</code></a> chore: resolve all cargo clippy warnings across workspace</li>
<li><a href=""><code>9749e3f</code></a> Merge remote-tracking branch 'origin/main' into ya7010/pr1726-gap-422</li>
<li><a href=""><code>0cbcc17</code></a> Merge pull request <a href="">#1762</a> from tombi-toml/ya7010/fix-clippy</li>
<li><a href=""><code>4a811f7</code></a> refactor(lsp): share schema_visits and restrict remaining_keys visibility</li>
<li><a href=""><code>4f81e00</code></a> fix: address clippy review comments</li>
<li><a href=""><code>f0b0fa0</code></a> fix: resolve clippy warnings</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.18...v0.9.22">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.31 to 0.0.32
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.32</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-20.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic when <code>__get__</code> uses <code>Concatenate</code> <code>self</code>-type and wraps a <code>__call__</code> (<a href="">#24692</a>)</li>
<li>Avoid panicking on overloaded <code>Callable</code> type context (<a href="">#24661</a>)</li>
<li>Expand class bases in per-base lint checks (<a href="">#24695</a>, <a href="">#24699</a>)</li>
<li>Fix stack overflow for binary operator inference involving recursive types (<a href="">#24551</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Dim out unreachable code in IDEs (<a href="">#24580</a>)</li>
<li>Do not suggest argument completion when typing the value of a keyword argument (<a href="">#24669</a>)</li>
<li>Retrieve the docstring from the overload implementation if an <code>@overload</code>-decorated function has no docstring (<a href="">#23920</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Allow <code>if</code> statements in TypedDict bodies (<a href="">#24702</a>)</li>
<li>Disallow <code>@disjoint_base</code> on TypedDicts and Protocols (<a href="">#24671</a>)</li>
<li>Do not consider a subclass of a <code>@dataclass_transform</code>-decorated class to have dataclass-like semantics if it has <code>type</code> in its MRO (<a href="">#24679</a>)</li>
<li>Reject using properties with <code>Never</code> setters or deleters (<a href="">#24510</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24646</a>). <a href="https://github.com/python/typeshed/compare/f8f0794d0fe249c06dc9f31a004d85be6cca6ced...c03c2b926422c82ab680d27f3ad2491845000802">Typeshed diff</a></li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Show error context for assignability diagnostics (<a href="">#24309</a>)</li>
<li>Use partially qualified names when reporting diagnostics regarding bad calls to methods (<a href="">#24560</a>)</li>
<li>Reduce source code context window to zero (<a href="">#24689</a>)</li>
<li>Merge same-file annotations if there is only a single line separating them (<a href="">#24694</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Memoize binary operator return types (<a href="">#24700</a>)</li>
<li>Gate protocol compatibility on member count (<a href="">#24684</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/JelleZijlstra"><code>@​JelleZijlstra</code></a></li>
<li><a href="https://github.com/kc0506"><code>@​kc0506</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.32</h2>
<p>Released on 2026-04-20.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic when <code>__get__</code> uses <code>Concatenate</code> <code>self</code>-type and wraps a <code>__call__</code> (<a href="">#24692</a>)</li>
<li>Avoid panicking on overloaded <code>Callable</code> type context (<a href="">#24661</a>)</li>
<li>Expand class bases in per-base lint checks (<a href="">#24695</a>, <a href="">#24699</a>)</li>
<li>Fix stack overflow for binary operator inference involving recursive types (<a href="">#24551</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Dim out unreachable code in IDEs (<a href="">#24580</a>)</li>
<li>Do not suggest argument completion when typing the value of a keyword argument (<a href="">#24669</a>)</li>
<li>Retrieve the docstring from the overload implementation if an <code>@overload</code>-decorated function has no docstring (<a href="">#23920</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Allow <code>if</code> statements in TypedDict bodies (<a href="">#24702</a>)</li>
<li>Disallow <code>@disjoint_base</code> on TypedDicts and Protocols (<a href="">#24671</a>)</li>
<li>Do not consider a subclass of a <code>@dataclass_transform</code>-decorated class to have dataclass-like semantics if it has <code>type</code> in its MRO (<a href="">#24679</a>)</li>
<li>Reject using properties with <code>Never</code> setters or deleters (<a href="">#24510</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24646</a>). <a href="https://github.com/python/typeshed/compare/f8f0794d0fe249c06dc9f31a004d85be6cca6ced...c03c2b926422c82ab680d27f3ad2491845000802">Typeshed diff</a></li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Show error context for assignability diagnostics (<a href="">#24309</a>)</li>
<li>Use partially qualified names when reporting diagnostics regarding bad calls to methods (<a href="">#24560</a>)</li>
<li>Reduce source code context window to zero (<a href="">#24689</a>)</li>
<li>Merge same-file annotations if there is only a single line separating them (<a href="">#24694</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Memoize binary operator return types (<a href="">#24700</a>)</li>
<li>Gate protocol compatibility on member count (<a href="">#24684</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/JelleZijlstra"><code>@​JelleZijlstra</code></a></li>
<li><a href="https://github.com/kc0506"><code>@​kc0506</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4d1e1fc</code></a> Bump version to 0.0.32 (<a href="">#3302</a>)</li>
<li><a href=""><code>a537bde</code></a> Update PyO3/maturin-action action to v1.51.0 (<a href="">#3300</a>)</li>
<li><a href=""><code>81e4125</code></a> Update actions/upload-artifact action to v7.0.1 (<a href="">#3296</a>)</li>
<li><a href=""><code>a9dd1cb</code></a> Update docker/build-push-action action to v7.1.0 (<a href="">#3299</a>)</li>
<li><a href=""><code>ef0a7dd</code></a> Update actions/github-script action to v9 (<a href="">#3301</a>)</li>
<li><a href=""><code>74f0583</code></a> Update astral-sh/setup-uv action to v8.1.0 (<a href="">#3298</a>)</li>
<li><a href=""><code>82799cc</code></a> Update prek dependencies (<a href="">#3297</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.31...0.0.32">compare view</a></li>
</ul>
</details>
<br />

Updates `pydantic-core` from 2.46.1 to 2.46.3
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/pydantic/pydantic/commits">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10ecf7f9a70f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.