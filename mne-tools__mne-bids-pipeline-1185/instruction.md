# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.24.0` | `3.24.3` |
| [pyarrow](https://github.com/apache/arrow) | `23.0.0` | `23.0.1` |
| [rich](https://github.com/Textualize/rich) | `14.3.2` | `14.3.3` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.1` | `0.15.2` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.7.28` | `0.7.31` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.1` | `9.7.2` |

Updates `filelock` from 3.24.0 to 3.24.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.24.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(ci): add trailing blank line after changelog entries by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#492</a></li>
<li>🐛 fix(unix): handle ENOENT race on FUSE/NFS during acquire by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#495</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.24.2...3.24.3">https://github.com/tox-dev/filelock/compare/3.24.2...3.24.3</a></p>
<h2>3.24.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>📝 docs: restructure using Diataxis framework by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#489</a></li>
<li>🐛 fix(test): resolve flaky write non-starvation test by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#490</a></li>
<li>🐛 fix(rw): close sqlite3 cursors and skip SoftFileLock Windows race by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#491</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.24.1...3.24.2">https://github.com/tox-dev/filelock/compare/3.24.1...3.24.2</a></p>
<h2>3.24.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(soft): resolve Windows deadlock and test race condition by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#488</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.24.0...3.24.1">https://github.com/tox-dev/filelock/compare/3.24.0...3.24.1</a></p>
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
<ul>
<li>🐛 fix(soft): resolve Windows deadlock and test race condition :pr:<code>488</code></li>
</ul>
<hr />
<p>3.24.0 (2026-02-14)</p>
<hr />
<ul>
<li>✨ feat(lock): add lifetime parameter for lock expiration (<a href="">#68</a>) :pr:<code>486</code></li>
<li>✨ feat(lock): add cancel_check to acquire (<a href="">#309</a>) :pr:<code>487</code></li>
<li>🐛 fix(api): detect same-thread self-deadlock :pr:<code>481</code></li>
<li>✨ feat(mode): respect POSIX default ACLs (<a href="">#378</a>) :pr:<code>483</code></li>
<li>🐛 fix(win): eliminate lock file race in threaded usage :pr:<code>484</code></li>
<li>✨ feat(lock): add poll_interval to constructor :pr:<code>482</code></li>
<li>🐛 fix(unix): auto-fallback to SoftFileLock on ENOSYS :pr:<code>480</code></li>
</ul>
<hr />
<p>3.23.0 (2026-02-14)</p>
<hr />
<ul>
<li>📝 docs: move from Unlicense to MIT :pr:<code>479</code></li>
<li>📝 docs: add fasteners to similar libraries :pr:<code>478</code></li>
</ul>
<hr />
<p>3.22.0 (2026-02-14)</p>
<hr />
<ul>
<li>🐛 fix(soft): skip stale detection on Windows :pr:<code>477</code></li>
<li>✨ feat(soft): detect and break stale locks :pr:<code>476</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b34b3df</code></a> Release 3.24.3</li>
<li><a href=""><code>e266937</code></a> 🐛 fix(unix): handle ENOENT race on FUSE/NFS during acquire (<a href="">#495</a>)</li>
<li><a href=""><code>e65c3b8</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#493</a>)</li>
<li><a href=""><code>a67ae00</code></a> 🐛 fix(ci): add trailing blank line after changelog entries (<a href="">#492</a>)</li>
<li><a href=""><code>db3e05a</code></a> Release 3.24.2</li>
<li><a href=""><code>ab6b90e</code></a> 🐛 fix(rw): close sqlite3 cursors and skip SoftFileLock Windows race (<a href="">#491</a>)</li>
<li><a href=""><code>98b4ee9</code></a> 🐛 fix(test): resolve flaky write non-starvation test (<a href="">#490</a>)</li>
<li><a href=""><code>ef15f6b</code></a> 📝 docs: restructure using Diataxis framework (<a href="">#489</a>)</li>
<li><a href=""><code>0b2f65b</code></a> Release 3.24.1</li>
<li><a href=""><code>abccdba</code></a> 🐛 fix(soft): resolve Windows deadlock and test race condition (<a href="">#488</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.24.0...3.24.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pyarrow` from 23.0.0 to 23.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/apache/arrow/releases">pyarrow's releases</a>.</em></p>
<blockquote>
<h2>Apache Arrow 23.0.1</h2>
<p>Release Notes URL: <a href="https://arrow.apache.org/release/23.0.1.html">https://arrow.apache.org/release/23.0.1.html</a></p>
<h2>Apache Arrow 23.0.1 RC0</h2>
<p>Release Notes: Release Candidate: 23.0.1 RC0</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>82a374e</code></a> MINOR: [Release] Update versions for 23.0.1</li>
<li><a href=""><code>c1ae37c</code></a> MINOR: [Release] Update .deb/.rpm changelogs for 23.0.1</li>
<li><a href=""><code>8f6e557</code></a> MINOR: [Release] Update CHANGELOG.md for 23.0.1</li>
<li><a href=""><code>4e16a1a</code></a> <a href="">GH-49159</a>: [C++][Gandiva] Detect overflow in repeat() (<a href="">#49160</a>)</li>
<li><a href=""><code>985621d</code></a> <a href="">GH-48817</a> [R][C++] Bump C++20 in R build infrastructure (<a href="">#48819</a>)</li>
<li><a href=""><code>1bea06a</code></a> <a href="">GH-49024</a>: [CI] Update Debian version in <code>.env</code> (<a href="">#49032</a>)</li>
<li><a href=""><code>147bcd6</code></a> <a href="">GH-49156</a>: [Python] Require GIL for string comparison (<a href="">#49161</a>)</li>
<li><a href=""><code>e4f922b</code></a> <a href="">GH-49138</a>: [Packaging][Python] Remove nightly cython install from manylinux wh...</li>
<li><a href=""><code>f9376e4</code></a> <a href="">GH-49003</a>: [C++] Don't consider <code>out_of_range</code> an error in float parsing (<a href="">#49095</a>)</li>
<li><a href=""><code>ab2c0ad</code></a> <a href="">GH-49044</a>: [CI][Python] Fix test_download_tzdata_on_windows by adding required...</li>
<li>Additional commits viewable in <a href="https://github.com/apache/arrow/compare/apache-arrow-23.0.0...apache-arrow-23.0.1">compare view</a></li>
</ul>
</details>
<br />

Updates `rich` from 14.3.2 to 14.3.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/releases">rich's releases</a>.</em></p>
<blockquote>
<h2>The infinite Release</h2>
<p>Fixed a infinite loop in split_graphemes</p>
<h2>[14.3.3] - 2026-02-19</h2>
<h3>Fixed</h3>
<ul>
<li>Fixed infinite loop with <code>cells.split_graphemes</code> <a href="">Textualize/rich#4006</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/blob/master/CHANGELOG.md">rich's changelog</a>.</em></p>
<blockquote>
<h2>[14.3.3] - 2026-02-19</h2>
<h3>Fixed</h3>
<ul>
<li>Fixed infinite loop with <code>cells.split_graphemes</code> <a href="">Textualize/rich#4006</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce01188</code></a> Merge pull request <a href="">#4008</a> from Textualize/bump1433</li>
<li><a href=""><code>14a47c9</code></a> bump</li>
<li><a href=""><code>f54bfe0</code></a> Merge pull request <a href="">#4007</a> from Textualize/copilot/sub-pr-4006</li>
<li><a href=""><code>7338cb9</code></a> Merge pull request <a href="">#4006</a> from Textualize/fix-grapheme-stuck</li>
<li><a href=""><code>905b397</code></a> Update tests/test_cells.py</li>
<li><a href=""><code>b031dca</code></a> Update tests/test_cells.py</li>
<li><a href=""><code>f07a3fc</code></a> Add regression tests for VS16 after zero-width chars in split_graphemes</li>
<li><a href=""><code>b618ccc</code></a> spelling</li>
<li><a href=""><code>378c34b</code></a> Initial plan</li>
<li><a href=""><code>87e7ca2</code></a> refinements, and tests</li>
<li>Additional commits viewable in <a href="https://github.com/Textualize/rich/compare/v14.3.2...v14.3.3">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.1 to 0.15.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.2</h2>
<h2>Release Notes</h2>
<p>Released on 2026-02-19.</p>
<h3>Preview features</h3>
<ul>
<li>
<p>Expand the default rule set (<a href="">#23385</a>)</p>
<p>In preview, Ruff now enables a significantly expanded default rule set of 412 rules, up from the stable default set of 59 rules. The new rules are mostly a superset of the stable defaults, with the exception of these rules, which are removed from the preview defaults:</p>
<ul>
<li><a href="https://docs.astral.sh/ruff/rules/multiple-imports-on-one-line"><code>multiple-imports-on-one-line</code></a> (<code>E401</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/module-import-not-at-top-of-file"><code>module-import-not-at-top-of-file</code></a> (<code>E402</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/module-import-not-at-top-of-file"><code>module-import-not-at-top-of-file</code></a> (<code>E701</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/multiple-statements-on-one-line-semicolon"><code>multiple-statements-on-one-line-semicolon</code></a> (<code>E702</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/useless-semicolon"><code>useless-semicolon</code></a> (<code>E703</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/none-comparison"><code>none-comparison</code></a> (<code>E711</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/true-false-comparison"><code>true-false-comparison</code></a> (<code>E712</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/not-in-test"><code>not-in-test</code></a> (<code>E713</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/not-is-test"><code>not-is-test</code></a> (<code>E714</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/type-comparison"><code>type-comparison</code></a> (<code>E721</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/lambda-assignment"><code>lambda-assignment</code></a> (<code>E731</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-variable-name"><code>ambiguous-variable-name</code></a> (<code>E741</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-class-name"><code>ambiguous-class-name</code></a> (<code>E742</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-function-name"><code>ambiguous-function-name</code></a> (<code>E743</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-import-star"><code>undefined-local-with-import-star</code></a> (<code>F403</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-import-star-usage"><code>undefined-local-with-import-star-usage</code></a> (<code>F405</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-nested-import-star-usage"><code>undefined-local-with-nested-import-star-usage</code></a> (<code>F406</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/forward-annotation-syntax-error"><code>forward-annotation-syntax-error</code></a> (<code>F722</code>)</li>
</ul>
<p>If you use preview and prefer the old defaults, you can restore them with configuration like:</p>
<pre lang="toml"><code>
# ruff.toml
<p>[lint]
select = [&quot;E4&quot;, &quot;E7&quot;, &quot;E9&quot;, &quot;F&quot;]</p>
<h1>pyproject.toml</h1>
<p>[tool.ruff.lint]
select = [&quot;E4&quot;, &quot;E7&quot;, &quot;E9&quot;, &quot;F&quot;]
</code></pre></p>
<p>If you do give them a try, feel free to share your feedback in the <a href="https://github.com/astral-sh/ruff/discussions/23203">GitHub discussion</a>!</p>
</li>
<li>
<p>[<code>flake8-pyi</code>] Also check string annotations (<code>PYI041</code>) (<a href="">#19023</a>)</p>
</li>
</ul>
<h3>Bug fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.2</h2>
<p>Released on 2026-02-19.</p>
<h3>Preview features</h3>
<ul>
<li>
<p>Expand the default rule set (<a href="">#23385</a>)</p>
<p>In preview, Ruff now enables a significantly expanded default rule set of 412
rules, up from the stable default set of 59 rules. The new rules are mostly a
superset of the stable defaults, with the exception of these rules, which are
removed from the preview defaults:</p>
<ul>
<li><a href="https://docs.astral.sh/ruff/rules/multiple-imports-on-one-line"><code>multiple-imports-on-one-line</code></a> (<code>E401</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/module-import-not-at-top-of-file"><code>module-import-not-at-top-of-file</code></a> (<code>E402</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/module-import-not-at-top-of-file"><code>module-import-not-at-top-of-file</code></a> (<code>E701</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/multiple-statements-on-one-line-semicolon"><code>multiple-statements-on-one-line-semicolon</code></a> (<code>E702</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/useless-semicolon"><code>useless-semicolon</code></a> (<code>E703</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/none-comparison"><code>none-comparison</code></a> (<code>E711</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/true-false-comparison"><code>true-false-comparison</code></a> (<code>E712</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/not-in-test"><code>not-in-test</code></a> (<code>E713</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/not-is-test"><code>not-is-test</code></a> (<code>E714</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/type-comparison"><code>type-comparison</code></a> (<code>E721</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/lambda-assignment"><code>lambda-assignment</code></a> (<code>E731</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-variable-name"><code>ambiguous-variable-name</code></a> (<code>E741</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-class-name"><code>ambiguous-class-name</code></a> (<code>E742</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/ambiguous-function-name"><code>ambiguous-function-name</code></a> (<code>E743</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-import-star"><code>undefined-local-with-import-star</code></a> (<code>F403</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-import-star-usage"><code>undefined-local-with-import-star-usage</code></a> (<code>F405</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/undefined-local-with-nested-import-star-usage"><code>undefined-local-with-nested-import-star-usage</code></a> (<code>F406</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/forward-annotation-syntax-error"><code>forward-annotation-syntax-error</code></a> (<code>F722</code>)</li>
</ul>
<p>If you use preview and prefer the old defaults, you can restore them with
configuration like:</p>
<pre lang="toml"><code>
# ruff.toml
<p>[lint]
select = [&quot;E4&quot;, &quot;E7&quot;, &quot;E9&quot;, &quot;F&quot;]</p>
<h1>pyproject.toml</h1>
<p>[tool.ruff.lint]
select = [&quot;E4&quot;, &quot;E7&quot;, &quot;E9&quot;, &quot;F&quot;]
</code></pre></p>
<p>If you do give them a try, feel free to share your feedback in the <a href="https://github.com/astral-sh/ruff/discussions/23203">GitHub
discussion</a>!</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9d18ee9</code></a> Hard code workflow name and <code>cancel-in-progress</code> only for PRs (<a href="">#23431</a>)</li>
<li><a href=""><code>7cc15f0</code></a> Bump 0.15.2 (<a href="">#23430</a>)</li>
<li><a href=""><code>d1b5443</code></a> Add extension mapping to configuration file options (<a href="">#23384</a>)</li>
<li><a href=""><code>222574a</code></a> Expand the default rule set (<a href="">#23385</a>)</li>
<li><a href=""><code>1465b5d</code></a> [<code>flake8-async</code>] Fix <code>in_async_context</code> logic (<a href="">#23426</a>)</li>
<li><a href=""><code>410902f</code></a> [<code>pyupgrade</code>] Fix handling of <code>typing.{io,re}</code> (<code>UP035</code>) (<a href="">#23131</a>)</li>
<li><a href=""><code>729610a</code></a> [ty] Fall back to ambiguous for large control flow graphs (<a href="">#23399</a>)</li>
<li><a href=""><code>1425c18</code></a> [ty] Add code folding support</li>
<li><a href=""><code>97acaae</code></a> [ty] Fix stack overflow for self-referential <code>TypeOf</code> in annotations (<a href="">#23407</a>)</li>
<li><a href=""><code>1f380c8</code></a> [ty] Update tests <code>reveal_type</code> and <code>Never</code> (<a href="">#23418</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.1...0.15.2">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.7.28 to 0.7.31
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.7.31</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Add new comment treatment draft by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1500</a></li>
<li>feat: add auto line ending. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1501</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.30...v0.7.31">https://github.com/tombi-toml/tombi/compare/v0.7.30...v0.7.31</a></p>
<h2>v0.7.30</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix(lsp): update tests after schema loading API removal by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1497</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.29...v0.7.30">https://github.com/tombi-toml/tombi/compare/v0.7.29...v0.7.30</a></p>
<h2>v0.7.29</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs: add schema information to GetStatusResponse interface by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1490</a></li>
<li>remove: cc-sdd by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1492</a></li>
<li>feat: add new blog posts on Tombi architecture and workspace management by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1493</a></li>
<li>fix: enhance LSP diagnostics and schema handling by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1496</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.28...v0.7.29">https://github.com/tombi-toml/tombi/compare/v0.7.28...v0.7.29</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>74df128</code></a> Merge pull request <a href="">#1501</a> from tombi-toml/add_line_ending_auto</li>
<li><a href=""><code>8266278</code></a> fix(tests): trim whitespace in lexer test source strings</li>
<li><a href=""><code>c9bfc4b</code></a> refactor: update LineEnding definition in schema</li>
<li><a href=""><code>aa52b15</code></a> Update crates/tombi-config/src/types/line_ending.rs</li>
<li><a href=""><code>bac845b</code></a> fix: update assertion in formatter tests for improved clarity</li>
<li><a href=""><code>223766c</code></a> feat: introduce line ending handling in formatter and lexer</li>
<li><a href=""><code>e23eac3</code></a> Merge pull request <a href="">#1500</a> from tombi-toml/add_new_comment_treatment_draft</li>
<li><a href=""><code>0cb9160</code></a> Merge branch 'main' into add_new_comment_treatment_draft</li>
<li><a href=""><code>6e8280a</code></a> feat: add multi-line inline table test with trailing comments</li>
<li><a href=""><code>e555181</code></a> refactor: streamline comment handling in parser</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.7.28...v0.7.31">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.1 to 9.7.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.2</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to <code>mkdocs build</code> about impending MkDocs 2.0 incompatibility (doesn't affect strict mode)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.2 (2026-02-18)</p>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to 'mkdocs build' about impending MkDocs 2.0 incompatibility</li>
</ul>
<p>mkdocs-material-9.7.1 (2025-12-18)</p>
<ul>
<li>Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li>Fixed privacy plugin not picking up protocol-relative URLs</li>
<li>Fixed <a href="">#8542</a>: false positives and negatives captured in privacy plugin</li>
</ul>
<p>mkdocs-material-9.7.0 (2025-11-11)</p>
<p>⚠️ Material for MkDocs is now in maintenance mode</p>
<p>This is the last release of Material for MkDocs that will receive new features.
Going forward, the Material for MkDocs team focuses on Zensical, a next-gen
static site generator built from first principles. We will provide critical
bug fixes and security updates for Material for MkDocs for 12 months at least.</p>
<p>Read the full announcement on our blog:
<a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/</a></p>
<p>This release includes all features that were previously exclusive to the
Insiders edition. These features are now freely available to everyone.</p>
<p>Note on deprecated plugins: The projects and typeset plugins are included in
this release, but must be considered deprecated. Both plugins proved
unsustainable to maintain and represent architectural dead ends. They are
provided as-is without ongoing support.</p>
<p>Changes:</p>
<ul>
<li>Added support for pinned blog posts and author profiles</li>
<li>Added support for customizing pagination for blog index pages</li>
<li>Added support for customizing blog category sort order</li>
<li>Added support for staying on page when switching languages</li>
<li>Added support for disabling tags in table of contents</li>
<li>Added support for nested tags and shadow tags</li>
<li>Added support for footnote tooltips</li>
<li>Added support for instant previews</li>
<li>Added support for instant prefetching</li>
<li>Added support for custom social card layouts</li>
<li>Added support for custom social card background images</li>
<li>Added support for selectable rangs in code blocks</li>
<li>Added support for custom selectors for code annotations</li>
<li>Added support for configurable log level in privacy plugin</li>
<li>Added support for processing of external links in privacy plugin</li>
<li>Added support for automatic image optimization via optimize plugin</li>
<li>Added support for navigation paths (breadcrumbs)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e21a119</code></a> Updated changelog</li>
<li><a href=""><code>d5654b5</code></a> Prepare 9.7.2 release</li>
<li><a href=""><code>b18af2f</code></a> Opened up version ranges in optional dependencies</li>
<li><a href=""><code>39cdfbd</code></a> Added social card for blog post</li>
<li><a href=""><code>09ee7b1</code></a> Added blog post on MkDocs 2.0 (<a href="">#8564</a>)</li>
<li><a href=""><code>0d11a2d</code></a> Documentation (<a href="">#8560</a>)</li>
<li><a href=""><code>8fc61b5</code></a> Updated dependencies</li>
<li><a href=""><code>3f0eaca</code></a> Documentation</li>
<li><a href=""><code>eaba2dc</code></a> Re-enable publishing</li>
<li>See full diff in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.1...9.7.2">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5379b0bede4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.