# Issue

**Title:** [dependabot]: Bump the deps group with 9 updates

## Description

Bumps the deps group with 9 updates:

| Package | From | To |
| --- | --- | --- |
| [bokeh](https://github.com/bokeh/bokeh) | `3.8.2` | `3.9.0` |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.25.0` | `3.25.2` |
| [nibabel](https://github.com/nipy/nibabel) | `5.4.0` | `5.4.2` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.1.2` | `2.1.4` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.5` | `0.15.6` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.9.0` | `0.9.4` |
| [ty](https://github.com/astral-sh/ty) | `0.0.21` | `0.0.22` |
| [mike](https://github.com/jimporter/mike) | `2.1.3` | `2.1.4` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.4` | `9.7.5` |

Updates `bokeh` from 3.8.2 to 3.9.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.9.0/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2026-03-11      3.9:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14584</a> <code>Div</code> from <code>bokeh.models.dom</code> raisese ValueError in <code>show</code> call</li>
<li><a href="">#14724</a> Bokeh protocol doesn't use binary encoding in <code>pull-doc-reply</code> message</li>
<li><a href="">#14569</a> [component: bokehjs] Adjust overlay in case of 1D box zoom</li>
<li><a href="">#14799</a> [component: build] Compilation failing with whitespace in path</li>
<li><a href="">#13578</a> [component: tests] Unit tests are failing due to changes in pytest-asyncio</li>
<li><a href="">#14568</a> [component: bokehjs] [BUG] Wheel Zoom Tool and Categorical Axis Range</li>
<li><a href="">#14817</a> MyPy can crash on Bokeh 3.9.0.dev9 code</li>
<li><a href="">#14776</a> [component: bokehjs] Don't add BBox if an axis has fixed position</li>
<li><a href="">#14815</a> [component: bokehjs] Bounds using FactorRanges aren't respected in the first visualization</li>
<li><a href="">#14881</a> Default compression level seems too high</li>
<li><a href="">#14894</a> NoChannelsConfiguredError breaks CI after PR <a href="">#14309</a></li>
<li><a href="">#10706</a> [component: bokehjs] [BUG] DataCube not respecting 'target' arg on initial creation</li>
<li><a href="">#14404</a> bokeh info should handle missing npm more gracefully</li>
<li><a href="">#14502</a> Legends fail to export using bokeh.io.export_svgs</li>
<li><a href="">#14549</a> [component: bokehjs] Updating Div text from hover causes infinite loop</li>
<li><a href="">#14616</a> Add <code>is_silenced</code> function to the public API</li>
<li><a href="">#14645</a> [component: bokehjs] <code>CategoricalSlider</code> shows 'undefined' for some categories when a certain number of categories is given</li>
<li><a href="">#14690</a> [component: bokehjs] Bokehjs test/devtools server examples error on Windows</li>
<li><a href="">#14700</a> [component: tests] Regression test for <a href="">#11339</a> fails randomly since Chrome version upgrade.</li>
<li><a href="">#14709</a> [component: build] ESM minified bundles don't work due to bad imports</li>
<li><a href="">#14730</a> CI sometimes fails on MacOS with &quot;The template is not valid&quot;</li>
<li><a href="">#14744</a> [component: bokehjs] Use <code>outline_width</code> in <code>Legend</code></li>
<li><a href="">#14750</a> [component: bokehjs] Block glyph doesn't account for reversed axes</li>
<li><a href="">#14756</a> [component: build] Build CI job failing</li>
</ul>
</li>
<li>
<p>features:</p>
<ul>
<li><a href="">#14417</a> [component: bokehjs] Cannot scroll or wrap large number of tabs</li>
<li><a href="">#14742</a> [FEATURE] Add padding to step</li>
<li><a href="">#14772</a> [component: bokehjs] Add support for property value editing in <code>Examiner</code> component</li>
<li><a href="">#14779</a> Add support for displaying contents with Markdown syntax</li>
<li><a href="">#14607</a> Enhancements for <code>bokeh settings</code></li>
<li><a href="">#14716</a> [component: bokehjs] [Feature Request] Native Text/Glyph Outline Support (Inspired by Matplotlib PathEffects)</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14346</a> Redesign <code>Dropdown</code> widget to use <code>Menu</code> model</li>
<li><a href="">#14698</a> Use auto_box_zoom as the default tool</li>
<li><a href="">#14786</a> [component: build] Replace <code>ts-node</code> and <code>tsconfig-paths</code> with <code>tsc</code>, ES modules and imports maps</li>
<li><a href="">#14789</a> [component: build] Migrate to eslint 9.x</li>
<li><a href="">#14793</a> Enhance performance of bitset in CDS view</li>
<li><a href="">#14795</a> [component: bokehjs] Enhance performance of indices map in CDS view</li>
<li><a href="">#14782</a> [component: build] Drop <code>baseUrl</code> from <code>tsconfig.json</code> files</li>
<li><a href="">#14802</a> [component: bokehjs] Enhance performance of _value_record_references in has_props</li>
<li><a href="">#14804</a> Pandas 3.0 compatibility</li>
<li><a href="">#14810</a> [component: bokehjs] Use ES2026 <code>UInt8Array.{to,from}Base64</code> if available</li>
<li><a href="">#14816</a> Adapt to new CoW behavior in Pandas 3.0</li>
<li><a href="">#14822</a> Allow to disable linking layouts cross panels in  <code>Tabs</code></li>
<li><a href="">#14824</a> [component: bokehjs] Perform inplace byte swap for big endian conversion</li>
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
<li><a href=""><code>daae451</code></a> Deployment updates for release 3.9.0</li>
<li><a href=""><code>14f5d6f</code></a> Update <code>switcher.json</code> for 3.9 release (<a href="">#14920</a>)</li>
<li><a href=""><code>897960e</code></a> Merge deployment staging branch staging-3.9.0rc1</li>
<li><a href=""><code>bd1eaf0</code></a> Deployment updates for release 3.9.0rc1</li>
<li><a href=""><code>b0c83f8</code></a> Revert &quot;Resolve models' and their properties' typing issues (<a href="">#14798</a>)&quot; (<a href="">#14898</a>)</li>
<li><a href=""><code>f4c0d97</code></a> Fix conda channel configuration by using Miniforge + mamba (<a href="">#14892</a>)</li>
<li><a href=""><code>8416793</code></a> Add old sri hash tables (<a href="">#14886</a>)</li>
<li><a href=""><code>fa2ec20</code></a> Add 3.8.x release notes (<a href="">#14885</a>)</li>
<li><a href=""><code>f58aa17</code></a> Update release notes for Bokeh 3.9 (<a href="">#14866</a>)</li>
<li><a href=""><code>f7fd188</code></a> Lower the default compression level to 2 (<a href="">#14883</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/bokeh/bokeh/compare/3.8.2...3.9.0">compare view</a></li>
</ul>
</details>
<br />

Updates `filelock` from 3.25.0 to 3.25.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.25.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(unix): suppress EIO on close in Docker bind mounts by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#513</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.25.1...3.25.2">https://github.com/tox-dev/filelock/compare/3.25.1...3.25.2</a></p>
<h2>3.25.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>📝 docs(logo): add branded project logo by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#507</a></li>
<li>🐛 fix(win): restore best-effort lock file cleanup on release by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#511</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.25.0...3.25.1">https://github.com/tox-dev/filelock/compare/3.25.0...3.25.1</a></p>
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
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>508</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>📝 docs(logo): add branded project logo :pr:<code>507</code></li>
</ul>
<hr />
<p>3.25.0 (2026-03-01)</p>
<hr />
<ul>
<li>✨ feat(async): add AsyncReadWriteLock :pr:<code>506</code></li>
<li>Standardize .github files to .yaml suffix</li>
<li>build(deps): bump actions/download-artifact from 7 to 8 :pr:<code>503</code> - by :user:<code>dependabot[bot]</code></li>
<li>build(deps): bump actions/upload-artifact from 6 to 7 :pr:<code>502</code> - by :user:<code>dependabot[bot]</code></li>
<li>Move SECURITY.md to .github/SECURITY.md</li>
<li>Add security policy</li>
<li>Add permissions to check workflow :pr:<code>500</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>499</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.24.3 (2026-02-19)</p>
<hr />
<ul>
<li>🐛 fix(unix): handle ENOENT race on FUSE/NFS during acquire :pr:<code>495</code></li>
<li>🐛 fix(ci): add trailing blank line after changelog entries :pr:<code>492</code></li>
</ul>
<hr />
<p>3.24.2 (2026-02-16)</p>
<hr />
<ul>
<li>🐛 fix(rw): close sqlite3 cursors and skip SoftFileLock Windows race :pr:<code>491</code></li>
<li>🐛 fix(test): resolve flaky write non-starvation test :pr:<code>490</code></li>
<li>📝 docs: restructure using Diataxis framework :pr:<code>489</code></li>
</ul>
<hr />
<p>3.24.1 (2026-02-15)</p>
<hr />
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5b9872c</code></a> Release 3.25.2</li>
<li><a href=""><code>42b740a</code></a> 🐛 fix(unix): suppress EIO on close in Docker bind mounts (<a href="">#513</a>)</li>
<li><a href=""><code>d8b04b5</code></a> Release 3.25.1</li>
<li><a href=""><code>0633386</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#510</a>)</li>
<li><a href=""><code>7f2247d</code></a> 🐛 fix(win): restore best-effort lock file cleanup on release (<a href="">#511</a>)</li>
<li><a href=""><code>5ae1c4e</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#508</a>)</li>
<li><a href=""><code>bcffcfe</code></a> 📝 docs(logo): add branded project logo (<a href="">#507</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.25.0...3.25.2">compare view</a></li>
</ul>
</details>
<br />

Updates `nibabel` from 5.4.0 to 5.4.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nipy/nibabel/releases">nibabel's releases</a>.</em></p>
<blockquote>
<h2>5.4.1</h2>
<h2>Release notes</h2>
<p>Bug-fix release in the 5.4.x series.</p>
<p>This release addresses test failures on shallow clones or when run with <code>python -m pytest</code> in Python 3.14+.</p>
<h2>Bug fixes</h2>
<ul>
<li>Adjust tests to not depend on how pytest is run, or deep clones (<a href="">#1478</a>) (CM)</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Consolidate environment management for development tasks to ensure tox and pre-commit stay in sync. (<a href="">#1475</a>) (CM, reviewed by Rémi Gau)</li>
<li>Update pre-commit and ruff configurations (<a href="">#1467</a>) (Rémi Gau, reviewed by CM)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> made their first contribution in <a href="">nipy/nibabel#1467</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/nipy/nibabel/compare/5.4.0...5.4.1">https://github.com/nipy/nibabel/compare/5.4.0...5.4.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nipy/nibabel/blob/master/Changelog">nibabel's changelog</a>.</em></p>
<blockquote>
<h1>5.4.2 (Wednesday 11 March 2026)</h1>
<p>Bug-fix release in the 5.4.x series.</p>
<p>This release fixes an issue with automated deployment to PyPI.</p>
<h1>5.4.1 (Tuesday 10 March 2026)</h1>
<p>Bug-fix release in the 5.4.x series.</p>
<p>This release addresses test failures on shallow clones or when run with
<code>python -m pytest</code> in Python 3.14+.</p>
<h2>Bug fixes</h2>
<ul>
<li>Adjust tests to not depend on how pytest is run, or deep clones (pr/1478) (CM)</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Consolidate environment management for development tasks to ensure tox and
pre-commit stay in sync. (pr/1475) (CM, reviewed by Rémi Gau)</li>
<li>Update pre-commit and ruff configurations (pr/1467) (Rémi Gau, reviewed by CM)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>513f421</code></a> rel: 5.4.2</li>
<li><a href=""><code>cc4fa26</code></a> chore(ci): Use non-slim runner for package deployment</li>
<li><a href=""><code>553a3d4</code></a> doc: Add missing changelog entries</li>
<li><a href=""><code>5054e90</code></a> rel: 5.4.1</li>
<li><a href=""><code>9f78e47</code></a> Merge pull request <a href="">#1478</a> from effigies/fix/python-m-pytest</li>
<li><a href=""><code>d8653ec</code></a> test: Skip removalschedule tests on shallow checkouts</li>
<li><a href=""><code>719b5f9</code></a> fix: Ignore executable name in checking for usage output</li>
<li><a href=""><code>84a6956</code></a> chore(ci): Add <code>python -m pytest</code> test</li>
<li><a href=""><code>db76723</code></a> Merge pull request <a href="">#1475</a> from effigies/chore/consistency</li>
<li><a href=""><code>94df062</code></a> chore: Use uv more consistently</li>
<li>Additional commits viewable in <a href="https://github.com/nipy/nibabel/compare/5.4.0...5.4.2">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.2 to 2.1.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.4</h2>
<h2>Changelog</h2>
<ul>
<li>21479f941dcf73bd826cd169088983320fdc31d6 fix: bring back {lefthook_job_name} template (<a href="">#1347</a>)</li>
<li>c586f14d15cbef841c988420da6e21d903859764 fix: separate more commands' non-option args with -- (<a href="">#1339</a>)</li>
<li>8dcd4aef558c1676d0ac724e220d241a71e6a861 pkg: fix scripts (<a href="">#1348</a>)</li>
<li>2fac7285db9090f0e88478fdcb50353452250655 pkg: make it easier to read (<a href="">#1340</a>)</li>
<li>32af36b1b832891df7dfb7411b4c2e273aefc3d7 pkg: refactor packaging (2) (<a href="">#1346</a>)</li>
<li>5354773b454a8c5e7a916d909782661bc6b1f896 pkg: refactor packaging scripts (<a href="">#1308</a>)</li>
</ul>
<h2>v2.1.3</h2>
<h2>Changelog</h2>
<ul>
<li>044ebf3a8c36f323d3ca32f4d1c42dc22cfd3cb9 chore(ci): switch artifact attestations gen to actions/attest v4 (<a href="">#1338</a>)</li>
<li>73d1680f6bd934ee2d18071ae14df2338a2ee670 chore: describe ENV variables usage in CLI help output (<a href="">#1337</a>)</li>
<li>a9cb6568acb08dfde150b9753afe815abb030e84 chore: small code improvements (<a href="">#1336</a>)</li>
<li>9478fd55f0cd485cd4bbe62187357f27239c43c2 deps: March 2026 (<a href="">#1330</a>)</li>
<li>5afae26dc3a03503ceb0f66be4a8c61aca084662 feat: update minimum go version (<a href="">#1331</a>)</li>
<li>8da90752970ad6733c27cee44e15b3349856b12a fix: support git debug versions (<a href="">#1334</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.4 (2026-03-12)</h2>
<ul>
<li>pkg: fix scripts (<a href="">#1348</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: bring back {lefthook_job_name} template (<a href="">#1347</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>pkg: refactor packaging (2) (<a href="">#1346</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: separate more commands' non-option args with -- (<a href="">#1339</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>docs: change logo to point to landing page instead of itself (<a href="">#1343</a>) by <a href="https://github.com/igas"><code>@​igas</code></a></li>
<li>pkg: make it easier to read (<a href="">#1340</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>pkg: refactor packaging scripts (<a href="">#1308</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
</ul>
<h2>2.1.3 (2026-03-07)</h2>
<ul>
<li>chore: switch artifact attestations gen to actions/attest v4 (<a href="">#1338</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>chore: describe ENV variables usage in CLI help output (<a href="">#1337</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: support git debug versions (<a href="">#1334</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>deps: March 2026 (<a href="">#1330</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>feat: update minimum go version (<a href="">#1331</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>83ec3a9</code></a> 2.1.4: bring back {lefthook_job_name}</li>
<li><a href=""><code>8dcd4ae</code></a> pkg: fix scripts (<a href="">#1348</a>)</li>
<li><a href=""><code>21479f9</code></a> fix: bring back {lefthook_job_name} template (<a href="">#1347</a>)</li>
<li><a href=""><code>32af36b</code></a> pkg: refactor packaging (2) (<a href="">#1346</a>)</li>
<li><a href=""><code>c586f14</code></a> fix: separate more commands' non-option args with -- (<a href="">#1339</a>)</li>
<li><a href=""><code>e021d4d</code></a> docs: change logo to point to landing page istead of itself (<a href="">#1343</a>)</li>
<li><a href=""><code>2fac728</code></a> pkg: make it easier to read (<a href="">#1340</a>)</li>
<li><a href=""><code>5354773</code></a> pkg: refactor packaging scripts (<a href="">#1308</a>)</li>
<li><a href=""><code>c32f9a4</code></a> 2.1.3: update dependencies</li>
<li><a href=""><code>044ebf3</code></a> chore(ci): switch artifact attestations gen to actions/attest v4 (<a href="">#1338</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.2...v2.1.4">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.5 to 0.15.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.6</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-12.</p>
<h3>Preview features</h3>
<ul>
<li>Add support for <code>lazy</code> import parsing (<a href="">#23755</a>)</li>
<li>Add support for star-unpacking of comprehensions (PEP 798) (<a href="">#23788</a>)</li>
<li>Reject semantic syntax errors for lazy imports (<a href="">#23757</a>)</li>
<li>Drop a few rules from the preview default set (<a href="">#23879</a>)</li>
<li>[<code>airflow</code>] Flag <code>Variable.get()</code> calls outside of task execution context (<code>AIR003</code>) (<a href="">#23584</a>)</li>
<li>[<code>airflow</code>] Flag runtime-varying values in DAG/task constructor arguments (<code>AIR304</code>) (<a href="">#23631</a>)</li>
<li>[<code>flake8-bugbear</code>] Implement <code>delattr-with-constant</code> (<code>B043</code>) (<a href="">#23737</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Add <code>TID254</code> to enforce lazy imports (<a href="">#23777</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Allow users to ban lazy imports with <code>TID254</code> (<a href="">#23847</a>)</li>
<li>[<code>isort</code>] Retain <code>lazy</code> keyword when sorting imports (<a href="">#23762</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP006</code>) (<a href="">#23260</a>)</li>
<li>[<code>refurb</code>] Support <code>newline</code> parameter in <code>FURB101</code> for Python 3.13+ (<a href="">#23754</a>)</li>
<li>[<code>ruff</code>] Add <code>os-path-commonprefix</code> (<code>RUF071</code>) (<a href="">#23814</a>)</li>
<li>[<code>ruff</code>] Add unsafe fix for os-path-commonprefix (<code>RUF071</code>) (<a href="">#23852</a>)</li>
<li>[<code>ruff</code>] Limit <code>RUF036</code> to typing contexts; make it unsafe for non-typing-only (<a href="">#23765</a>)</li>
<li>[<code>ruff</code>] Use starred unpacking for <code>RUF017</code> in Python 3.15+ (<a href="">#23789</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>--add-noqa</code> creating unwanted leading whitespace (<a href="">#23773</a>)</li>
<li>Fix <code>--add-noqa</code> breaking shebangs (<a href="">#23577</a>)</li>
<li>[formatter] Fix lambda body formatting for multiline calls and subscripts (<a href="">#23866</a>)</li>
<li>[formatter] Preserve required annotation parentheses in annotated assignments (<a href="">#23865</a>)</li>
<li>[formatter] Preserve type-expression parentheses in the formatter (<a href="">#23867</a>)</li>
<li>[<code>flake8-annotations</code>] Fix stack overflow in <code>ANN401</code> on quoted annotations with escape sequences (<a href="">#23912</a>)</li>
<li>[<code>pep8-naming</code>] Check naming conventions in <code>match</code> pattern bindings (<code>N806</code>, <code>N815</code>, <code>N816</code>) (<a href="">#23899</a>)</li>
<li>[<code>perflint</code>] Fix comment duplication in fixes (<code>PERF401</code>, <code>PERF403</code>) (<a href="">#23729</a>)</li>
<li>[<code>pyupgrade</code>] Properly trigger <code>super</code> change in nested class (<code>UP008</code>) (<a href="">#22677</a>)</li>
<li>[<code>ruff</code>] Avoid syntax errors in <code>RUF036</code> fixes (<a href="">#23764</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-bandit</code>] Flag <code>S501</code> with <code>requests.request</code> (<a href="">#23873</a>)</li>
<li>[<code>flake8-executable</code>] Fix WSL detection in non-Docker containers (<a href="">#22879</a>)</li>
<li>[<code>flake8-print</code>] Ignore <code>pprint</code> calls with <code>stream=</code> (<a href="">#23787</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update docs for Markdown code block formatting (<a href="">#23871</a>)</li>
<li>[<code>flake8-bugbear</code>] Fix misleading description for <code>B904</code> (<a href="">#23731</a>)</li>
</ul>
<h3>Contributors</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.6</h2>
<p>Released on 2026-03-12.</p>
<h3>Preview features</h3>
<ul>
<li>Add support for <code>lazy</code> import parsing (<a href="">#23755</a>)</li>
<li>Add support for star-unpacking of comprehensions (PEP 798) (<a href="">#23788</a>)</li>
<li>Reject semantic syntax errors for lazy imports (<a href="">#23757</a>)</li>
<li>Drop a few rules from the preview default set (<a href="">#23879</a>)</li>
<li>[<code>airflow</code>] Flag <code>Variable.get()</code> calls outside of task execution context (<code>AIR003</code>) (<a href="">#23584</a>)</li>
<li>[<code>airflow</code>] Flag runtime-varying values in DAG/task constructor arguments (<code>AIR304</code>) (<a href="">#23631</a>)</li>
<li>[<code>flake8-bugbear</code>] Implement <code>delattr-with-constant</code> (<code>B043</code>) (<a href="">#23737</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Add <code>TID254</code> to enforce lazy imports (<a href="">#23777</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Allow users to ban lazy imports with <code>TID254</code> (<a href="">#23847</a>)</li>
<li>[<code>isort</code>] Retain <code>lazy</code> keyword when sorting imports (<a href="">#23762</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP006</code>) (<a href="">#23260</a>)</li>
<li>[<code>refurb</code>] Support <code>newline</code> parameter in <code>FURB101</code> for Python 3.13+ (<a href="">#23754</a>)</li>
<li>[<code>ruff</code>] Add <code>os-path-commonprefix</code> (<code>RUF071</code>) (<a href="">#23814</a>)</li>
<li>[<code>ruff</code>] Add unsafe fix for os-path-commonprefix (<code>RUF071</code>) (<a href="">#23852</a>)</li>
<li>[<code>ruff</code>] Limit <code>RUF036</code> to typing contexts; make it unsafe for non-typing-only (<a href="">#23765</a>)</li>
<li>[<code>ruff</code>] Use starred unpacking for <code>RUF017</code> in Python 3.15+ (<a href="">#23789</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>--add-noqa</code> creating unwanted leading whitespace (<a href="">#23773</a>)</li>
<li>Fix <code>--add-noqa</code> breaking shebangs (<a href="">#23577</a>)</li>
<li>[formatter] Fix lambda body formatting for multiline calls and subscripts (<a href="">#23866</a>)</li>
<li>[formatter] Preserve required annotation parentheses in annotated assignments (<a href="">#23865</a>)</li>
<li>[formatter] Preserve type-expression parentheses in the formatter (<a href="">#23867</a>)</li>
<li>[<code>flake8-annotations</code>] Fix stack overflow in <code>ANN401</code> on quoted annotations with escape sequences (<a href="">#23912</a>)</li>
<li>[<code>pep8-naming</code>] Check naming conventions in <code>match</code> pattern bindings (<code>N806</code>, <code>N815</code>, <code>N816</code>) (<a href="">#23899</a>)</li>
<li>[<code>perflint</code>] Fix comment duplication in fixes (<code>PERF401</code>, <code>PERF403</code>) (<a href="">#23729</a>)</li>
<li>[<code>pyupgrade</code>] Properly trigger <code>super</code> change in nested class (<code>UP008</code>) (<a href="">#22677</a>)</li>
<li>[<code>ruff</code>] Avoid syntax errors in <code>RUF036</code> fixes (<a href="">#23764</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-bandit</code>] Flag <code>S501</code> with <code>requests.request</code> (<a href="">#23873</a>)</li>
<li>[<code>flake8-executable</code>] Fix WSL detection in non-Docker containers (<a href="">#22879</a>)</li>
<li>[<code>flake8-print</code>] Ignore <code>pprint</code> calls with <code>stream=</code> (<a href="">#23787</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update docs for Markdown code block formatting (<a href="">#23871</a>)</li>
<li>[<code>flake8-bugbear</code>] Fix misleading description for <code>B904</code> (<a href="">#23731</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e4c7f35</code></a> Bump 0.15.6 (<a href="">#23919</a>)</li>
<li><a href=""><code>edfe6c1</code></a> [ty] Narrow type context during collection literal inference (<a href="">#23844</a>)</li>
<li><a href=""><code>dd16d68</code></a> Exclude broken symlink in ecosystem check (<a href="">#23921</a>)</li>
<li><a href=""><code>3f94c6a</code></a> Fix stack overflow in ANN401 on quoted annotations with escape sequences (<a href="">#23</a>...</li>
<li><a href=""><code>91fc7bd</code></a> [ty] Fix false-positive diagnostics for PEP-604 union annotations on attribut...</li>
<li><a href=""><code>04229cf</code></a> [ty] Initial test suite for PEP-728 <code>TypedDict</code> features (<a href="">#23832</a>)</li>
<li><a href=""><code>728b9d6</code></a> [<code>pep8-naming</code>] Check naming conventions in <code>match</code> pattern bindings (<code>N806</code>,...</li>
<li><a href=""><code>88d1eec</code></a> [ty] Ensure a <code>type[]</code> type <code>T</code> is always considered assignable to a union th...</li>
<li><a href=""><code>37cdd61</code></a> Fix lambda body formatting for multiline calls and subscripts (<a href="">#23866</a>)</li>
<li><a href=""><code>a25a4df</code></a> [ty] Disambiguate duplicate-looking overloaded callables in union display (<a href="">#2</a>...</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.5...0.15.6">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.0 to 0.9.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>style: toml format by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1572</a></li>
<li>fix: avoid LSP startup lock contention on hover by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1574</a></li>
<li>feat: implement common JSON Schema compliance TODOs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1573</a></li>
<li>test: add JSON Schema dialect regression CI coverage by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1575</a></li>
<li>docs: define JSON Schema compliance policy by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1576</a></li>
<li>refactor: log deprecated schema keywords during ValueSchema construction by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1577</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.3...v0.9.4">https://github.com/tombi-toml/tombi/compare/v0.9.3...v0.9.4</a></p>
<h2>v0.9.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>feat: preserve JSON Schema content annotations by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1563</a></li>
<li>feat: detect unsupported JSON Schema vocabularies by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1564</a></li>
<li>feat: support JSON Schema anchor and dynamicRef resolution by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1565</a></li>
<li>feat: add recursiveAnchor/recursiveRef compatibility and linter tests by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1567</a></li>
<li>feat: support JSON Schema format vocabularies by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1568</a></li>
<li>feat: honor 2019-09 format vocabulary assertion by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1569</a></li>
<li>fix: avoid false additional-key warnings for pyproject license-files by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1570</a></li>
<li>chore: apply cargo clippy --fix across workspace by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1571</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.2...v0.9.3">https://github.com/tombi-toml/tombi/compare/v0.9.2...v0.9.3</a></p>
<h2>v0.9.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>refactor: centralize hashmap usage via tombi-hashmap by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1560</a></li>
<li>feat: implement draft-2019-09 keywords (dependentRequired, dependentSchemas, minContains, maxContains) by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1561</a></li>
<li>feat: add string format validation, hover and completion for x-tombi-string-formats by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1562</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.1...v0.9.2">https://github.com/tombi-toml/tombi/compare/v0.9.1...v0.9.2</a></p>
<h2>v0.9.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>feat: support json schema dialect. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1544</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b443d51</code></a> Merge pull request <a href="">#1577</a> from tombi-toml/refactor/schema-deprecation-debug-log</li>
<li><a href=""><code>ec89497</code></a> refactor: remove unused deprecated keyword warning formatter</li>
<li><a href=""><code>b193e29</code></a> refactor: move keyword dialect debug logger to keyword_support</li>
<li><a href=""><code>4e3cef3</code></a> refactor: log deprecated schema keywords during ValueSchema construction</li>
<li><a href=""><code>6f0457e</code></a> Merge pull request <a href="">#1576</a> from tombi-toml/docs/json-schema-compliance-policy</li>
<li><a href=""><code>4bcaeed</code></a> docs: define JSON Schema compliance policy</li>
<li><a href=""><code>5163e39</code></a> Merge pull request <a href="">#1575</a> from tombi-toml/test/json-schema-dialect-regression-ci</li>
<li><a href=""><code>bcf202a</code></a> test: remove duplicated dialect regression cases</li>
<li><a href=""><code>7940853</code></a> chore: remove compliance report and deprecated keyword usage tasks from JSON ...</li>
<li><a href=""><code>b8b3d69</code></a> ci: remove duplicated dialect regression test step</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.0...v0.9.4">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.21 to 0.0.22
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.22</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-12.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix issue where variables could be inferred as <code>Divergent</code> if they were assigned using tuple unpacking in loops (<a href="">#23812</a>)</li>
<li>Allow <code>error = &quot;all&quot;</code> in a root <code>pyproject.toml</code> file to be overridden using <code>tool.ty.overrides</code> in a subdirectory's <code>pyproject.toml</code> file (<a href="">#23712</a>)</li>
<li>Only unsoundly upcast <code>type[]</code> types to their constructor <code>Callable</code> type during assignability checks, not during redundancy/subtyping checks (<a href="">#23834</a>, <a href="">#23901</a>)</li>
<li>Fix stack overflow that could occur with certain recursive protocols (<a href="">#23870</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Improve syntax highlighting by fixing <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens">semantic token</a> classification for generic class members in annotations (<a href="">#23811</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Add <code>ty explain &lt;RULE&gt;</code> CLI command (<a href="">#23766</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add validation for type parameters with defaults after <code>TypeVarTuple</code> parameters (<a href="">#23807</a>)</li>
<li>Allow subtypes of <code>LiteralString</code> to be narrowed using equality checks (<a href="">#23794</a>)</li>
<li>Detect invalid partially stringified PEP-604 unions (<a href="">#23285</a>)</li>
<li>Disambiguate duplicate-looking overloaded callables in union display (<a href="">#23907</a>)</li>
<li>Don't promote module-literal types to <code>types.ModuleType</code> (<a href="">#23786</a>)</li>
<li>Improve type context support for <code>__setitem__</code> dunder calls (<a href="">#23800</a>)</li>
<li>Infer <code>t | {&quot;foo&quot;: int}</code> as <code>TD</code> if <code>t</code> is an instance of a TypedDict <code>td</code> with a <code>foo: int</code> key (<a href="">#23806</a>)</li>
<li>Narrow <code>T</code> to <code>T &amp; str</code> rather than <code>str</code> if <code>T</code> is a constrained TypeVar with <code>str</code> as one of its constraints (<a href="">#23850</a>)</li>
<li>Promote <code>None</code> to <code>None | Unknown</code> in invariant contexts (<a href="">#23790</a>)</li>
<li>Reject <code>type[Callable]</code> in type annotations (<a href="">#23753</a>)</li>
<li>Support enum member access through enum instances and members (<a href="">#23772</a>)</li>
<li>Eagerly narrow the type associated with keys of heterogeneous dict literals even when a dict literal appears as a subexpression inside a list or tuple literals (<a href="">#23569</a>)</li>
<li>Ensure that <code>T &amp; ~S</code> is always inferred as a subtype of <code>U</code> during generic inference if <code>T</code> is understood as a subtype of <code>U</code> (<a href="">#23728</a>)</li>
<li>Optimize and improve cycle recovery by preventing &quot;tainted&quot; unions in cycle normalization (<a href="">#23563</a>)</li>
</ul>
<h3>Installer</h3>
<ul>
<li>Prefer downloading releases from Astral's mirror over GitHub (<a href="">#2980</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.22</h2>
<p>Released on 2026-03-12.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix issue where variables could be inferred as <code>Divergent</code> if they were assigned using tuple unpacking in loops (<a href="">#23812</a>)</li>
<li>Allow <code>error = &quot;all&quot;</code> in a root <code>pyproject.toml</code> file to be overridden using <code>tool.ty.overrides</code> in a subdirectory's <code>pyproject.toml</code> file (<a href="">#23712</a>)</li>
<li>Only unsoundly upcast <code>type[]</code> types to their constructor <code>Callable</code> type during assignability checks, not during redundancy/subtyping checks (<a href="">#23834</a>, <a href="">#23901</a>)</li>
<li>Fix stack overflow that could occur with certain recursive protocols (<a href="">#23870</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Improve syntax highlighting by fixing <a href="https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens">semantic token</a> classification for generic class members in annotations (<a href="">#23811</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Add <code>ty explain &lt;RULE&gt;</code> CLI command (<a href="">#23766</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add validation for type parameters with defaults after <code>TypeVarTuple</code> parameters (<a href="">#23807</a>)</li>
<li>Allow subtypes of <code>LiteralString</code> to be narrowed using equality checks (<a href="">#23794</a>)</li>
<li>Detect invalid partially stringified PEP-604 unions (<a href="">#23285</a>)</li>
<li>Disambiguate duplicate-looking overloaded callables in union display (<a href="">#23907</a>)</li>
<li>Don't promote module-literal types to <code>types.ModuleType</code> (<a href="">#23786</a>)</li>
<li>Improve type context support for <code>__setitem__</code> dunder calls (<a href="">#23800</a>)</li>
<li>Infer <code>t | {&quot;foo&quot;: int}</code> as <code>TD</code> if <code>t</code> is an instance of a TypedDict <code>td</code> with a <code>foo: int</code> key (<a href="">#23806</a>)</li>
<li>Narrow <code>T</code> to <code>T &amp; str</code> rather than <code>str</code> if <code>T</code> is a constrained TypeVar with <code>str</code> as one of its constraints (<a href="">#23850</a>)</li>
<li>Promote <code>None</code> to <code>None | Unknown</code> in invariant contexts (<a href="">#23790</a>)</li>
<li>Reject <code>type[Callable]</code> in type annotations (<a href="">#23753</a>)</li>
<li>Support enum member access through enum instances and members (<a href="">#23772</a>)</li>
<li>Eagerly narrow the type associated with keys of heterogeneous dict literals even when a dict literal appears as a subexpression inside a list or tuple literals (<a href="">#23569</a>)</li>
<li>Ensure that <code>T &amp; ~S</code> is always inferred as a subtype of <code>U</code> during generic inference if <code>T</code> is understood as a subtype of <code>U</code> (<a href="">#23728</a>)</li>
<li>Optimize and improve cycle recovery by preventing &quot;tainted&quot; unions in cycle normalization (<a href="">#23563</a>)</li>
</ul>
<h3>Installer</h3>
<ul>
<li>Prefer downloading releases from Astral's mirror over GitHub (<a href="">#2980</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/oconnor663"><code>@​oconnor663</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>eda1e71</code></a> Bump version to 0.0.22 (<a href="">#3031</a>)</li>
<li><a href=""><code>b4abf2b</code></a> Update Artifact GitHub Actions dependencies (<a href="">#2996</a>)</li>
<li><a href=""><code>842b8b5</code></a> Update PyO3/maturin-action action to v1.50.1 (<a href="">#2995</a>)</li>
<li><a href=""><code>6c04a8e</code></a> Update prek dependencies (<a href="">#2994</a>)</li>
<li><a href=""><code>1557849</code></a> installers: Download releases from Astral's mirror first (<a href="">#2980</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.21...0.0.22">compare view</a></li>
</ul>
</details>
<br />

Updates `mike` from 2.1.3 to 2.1.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jimporter/mike/releases">mike's releases</a>.</em></p>
<blockquote>
<h2>v2.1.4</h2>
<h3>Bug fixes</h3>
<ul>
<li>Use built-in <code>importlib</code> in Python 3.10 and greater</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jimporter/mike/blob/master/CHANGES.md">mike's changelog</a>.</em></p>
<blockquote>
<h2>v2.1.4 (2026-03-07)</h2>
<h3>Bug fixes</h3>
<ul>
<li>Use built-in <code>importlib</code> in Python 3.10 and greater</li>
</ul>
<hr />
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fd2c5dc</code></a> Update version to 2.1.4</li>
<li><a href=""><code>6bad205</code></a> Update copyright year</li>
<li><a href=""><code>9e5f876</code></a> Remove deprecated license classifier</li>
<li><a href=""><code>80c47ab</code></a> Be more consistent with newlines in CHANGES.md</li>
<li><a href=""><code>11d4160</code></a> Use built-in <code>importlib</code> in Python 3.10 and greater</li>
<li><a href=""><code>bdda184</code></a> Improve selection of unit test suites on command line</li>
<li><a href=""><code>d8a9b49</code></a> Add CI for Python 3.14 and remove  old workarounds</li>
<li><a href=""><code>97deaed</code></a> Update copyright</li>
<li><a href=""><code>64298e2</code></a> Update Python version for linting</li>
<li><a href=""><code>e6f523a</code></a> Test Python 3.12 and 3.13</li>
<li>Additional commits viewable in <a href="https://github.com/jimporter/mike/compare/v2.1.3...v2.1.4">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.4 to 9.7.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.5</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Limited version range of mkdocs to &lt;2</li>
<li>Updated MkDocs 2.0 incompatibility warning (clarify relation with MkDocs)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.5 (2026-03-10)</p>
<ul>
<li>Limited version range of mkdocs to &lt;2</li>
<li>Updated MkDocs 2.0 incompatibility warning (clarify relation with MkDocs)</li>
</ul>
<p>mkdocs-material-9.7.4 (2026-03-03)</p>
<ul>
<li>Hardened social cards plugin by switching to sandboxed environment</li>
<li>Updated MkDocs 2.0 incompatibility warning</li>
</ul>
<p>mkdocs-material-9.7.3 (2026-02-24)</p>
<ul>
<li>Fixed <a href="">#8567</a>: Print MkDocs 2.0 incompatibility warning to stderr</li>
</ul>
<p>mkdocs-material-9.7.2 (2026-02-18)</p>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to 'mkdocs build' about impending MkDocs 2.0 incompatibility</li>
</ul>
<p>mkdocs-material-9.7.1 (2025-12-...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17ae14582864`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.