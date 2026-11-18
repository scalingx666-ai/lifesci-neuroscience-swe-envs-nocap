# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.29.3` | `3.29.4` |
| [pytest](https://github.com/pytest-dev/pytest) | `9.0.3` | `9.1.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.17` | `0.15.18` |
| [tqdm](https://github.com/tqdm/tqdm) | `4.68.2` | `4.68.3` |
| [ty](https://github.com/astral-sh/ty) | `0.0.48` | `0.0.51` |

Updates `filelock` from 3.29.3 to 3.29.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.29.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>verify inode in break_lock_file before unlinking a stale lock by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#561</a></li>
<li>keep the read/write heartbeat alive on a transient touch error by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#562</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.3...3.29.4">https://github.com/tox-dev/filelock/compare/3.29.3...3.29.4</a></p>
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
<p>3.29.4 (2026-06-13)</p>
<hr />
<ul>
<li>keep the read/write heartbeat alive on a transient touch error :pr:<code>562</code> - by :user:<code>dxbjavid</code></li>
<li>verify inode in break_lock_file before unlinking a stale lock :pr:<code>561</code> - by :user:<code>dxbjavid</code></li>
</ul>
<hr />
<p>3.29.3 (2026-06-10)</p>
<hr />
<ul>
<li>🐛 fix(ci): restore release environment on tag job :pr:<code>559</code></li>
<li>validate pid range in _parse_lock_holder :pr:<code>556</code> - by :user:<code>dxbjavid</code></li>
<li>🔧 ci(release): publish to PyPI on tag push :pr:<code>557</code></li>
<li>build(deps): bump astral-sh/setup-uv from 8.1.0 to 8.2.0 :pr:<code>558</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<hr />
<p>3.29.2 (2026-06-10)</p>
<hr />
<ul>
<li>build(deps): bump actions/checkout from 6.0.2 to 6.0.3 :pr:<code>555</code> - by :user:<code>dependabot[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>554</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>check hostname in is_lock_held_by_us :pr:<code>553</code> - by :user:<code>dxbjavid</code></li>
<li>🔒 fix(soft): harden stale-lock breaking and self-heal malformed locks :pr:<code>551</code></li>
<li>open marker reads non-blocking to refuse attacker-placed fifo :pr:<code>549</code> - by :user:<code>dxbjavid</code></li>
</ul>
<hr />
<p>3.29.1 (2026-06-03)</p>
<hr />
<ul>
<li>🐛 fix(soft): refuse to follow symlinks when reading the lock file :pr:<code>548</code> - by :user:<code>dxbjavid</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>547</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>546</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>chore: improve filelock maintenance path :pr:<code>545</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>544</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>542</code> - by :user:<code>lphuc2250gma</code></li>
<li>docs: clarify per-thread scope of FileLock configuration :pr:<code>543</code> - by :user:<code>Gares95</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>541</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>docs: fix API docs of <code>release()</code> :pr:<code>540</code> - by :user:<code>MrAnno</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>539</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>538</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>537</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>build(deps): bump astral-sh/setup-uv from 8.0.0 to 8.1.0 :pr:<code>536</code> - by :user:<code>dependabot[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>535</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f3c11c0</code></a> Release 3.29.4</li>
<li><a href=""><code>5d663ee</code></a> keep the read/write heartbeat alive on a transient touch error (<a href="">#562</a>)</li>
<li><a href=""><code>406d0a2</code></a> verify inode in break_lock_file before unlinking a stale lock (<a href="">#561</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/py-filelock/compare/3.29.3...3.29.4">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.0.3 to 9.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.1.0</h2>
<h1>pytest 9.1.0 (2026-06-13)</h1>
<h2>Removals and backward incompatible breaking changes</h2>
<ul>
<li>
<p><a href="">#14533</a>: When using <code>--doctest-modules</code>, autouse fixtures with <code>module</code>, <code>package</code> or <code>session</code> scope that are defined inline in Python test modules (not plugins or conftests) will now possibly execute twice.</p>
<p>If this is undesirable, move the fixture definition to a <code>conftest.py</code> file if possible.</p>
<p>Technical explanation for those interested:
When using <!-- raw HTML omitted -->--doctest-modules<!-- raw HTML omitted -->, pytest possibly collects Python modules twice, once as <code>pytest.Module</code> and once as a <code>DoctestModule</code> (depending on the configuration).
Due to improvements in pytest's fixture implementation, if e.g. the <code>DoctestModule</code> collects a fixture, it is now visible to it only, and not to the <code>Module</code>.
This means that both need to register the fixtures independently.</p>
</li>
</ul>
<h2>Deprecations (removal in next major release)</h2>
<ul>
<li>
<p><a href="">#10819</a>: Added a deprecation warning for class-scoped fixtures defined as instance methods (without <code>@classmethod</code>). Such fixtures set attributes on a different instance than the test methods use, leading to unexpected behavior. Use <code>@classmethod</code> decorator instead -- by <code>yastcher</code>.</p>
<p>See <code>10819</code> and <code>14011</code>.</p>
</li>
<li>
<p><a href="">#12882</a>: Calling <code>request.getfixturevalue() &lt;pytest.FixtureRequest.getfixturevalue&gt;</code> during teardown to request a fixture that was not already requested is now deprecated and will become an error in pytest 10.</p>
<p>See <code>dynamic-fixture-request-during-teardown</code> for details.</p>
</li>
<li>
<p><a href="">#13409</a>: Using non-<code>~collections.abc.Collection</code> iterables (such as generators, iterators, or custom iterable objects) for the <code>argvalues</code> parameter in <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> and <code>metafunc.parametrize &lt;pytest.Metafunc.parametrize&gt;</code> is now deprecated.</p>
<p>These iterables get exhausted after the first iteration,
leading to tests getting unexpectedly skipped in cases such as running <code>pytest.main()</code> multiple times,
using class-level parametrize decorators,
or collecting tests multiple times.</p>
<p>See <code>parametrize-iterators</code> for details and suggestions.</p>
</li>
<li>
<p><a href="">#13946</a>: The private <code>config.inicfg</code> attribute is now deprecated.
Use <code>config.getini() &lt;pytest.Config.getini&gt;</code> to access configuration values instead.</p>
<p>See <code>config-inicfg</code> for more details.</p>
</li>
<li>
<p><a href="">#14004</a>: Passing <code>baseid</code> to <code>~pytest.FixtureDef</code> or <code>nodeid</code> strings to fixture registration APIs is now deprecated. These are internal pytest APIs that are used by some plugins.</p>
<p>Use the <code>node</code> parameter instead for fixture scoping. This enables more robust node-based
matching instead of string prefix matching.
If you've used <code>nodeid=None</code>, pass <code>node=session</code> instead.</p>
<p>This will be removed in pytest 10.</p>
</li>
<li>
<p><a href="">#14335</a>: The method of configuring hooks using markers, deprecated since pytest 7.2, is now scheduled to be removed in pytest 10.
See <code>hook-markers</code> for more details.</p>
</li>
<li>
<p><a href="">#14434</a>: The <code>--pastebin</code> option is now deprecated.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b2522cf</code></a> Prepare release version 9.1.0</li>
<li><a href=""><code>368d2fc</code></a> [refactor] Tighten <code>SetComparisonFunction</code> to <code>Iterator[str]</code> (<a href="">#14587</a>)</li>
<li><a href=""><code>ff77cd8</code></a> [refactor] Make base assertion comparisons return an iterator instead of a li...</li>
<li><a href=""><code>0d8491a</code></a> build(deps): Bump actions/stale from 10.2.0 to 10.3.0</li>
<li><a href=""><code>4a809d9</code></a> Merge pull request <a href="">#14568</a> from pytest-dev/register-fixture</li>
<li><a href=""><code>5dfa385</code></a> Fix recursion traceback test to cover all styles (<a href="">#14582</a>)</li>
<li><a href=""><code>f52ff0c</code></a> Add <code>pytest.register_fixture</code></li>
<li><a href=""><code>a8ac094</code></a> Merge pull request <a href="">#14567</a> from pytest-dev/more-visibility-deprecate</li>
<li><a href=""><code>e5620cd</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#14577</a>)</li>
<li><a href=""><code>2ce9c6d</code></a> Merge pull request <a href="">#14540</a> from minbang930/fix-14533-doctest-module-fixtures</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.3...9.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.17 to 0.15.18
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.18</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-18.</p>
<h3>Preview features</h3>
<ul>
<li>Handle nested <code>ruff:ignore</code> comments (<a href="">#25791</a>)</li>
<li>Stop displaying severity in output (<a href="">#26050</a>)</li>
<li>Use human-readable names in CLI output (<a href="">#25937</a>)</li>
<li>Use human-readable names in LSP and playground diagnostics (<a href="">#26058</a>)</li>
<li>[<code>pydocstyle</code>] Prevent property docstrings starting with verbs (<code>D421</code>) (<a href="">#23775</a>)</li>
<li>[<code>flake8-pyi</code>] Extend <code>PYI033</code> to Python files (<a href="">#26129</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Detect equivalent numeric mapping keys (<a href="">#26009</a>)</li>
<li>Detect mapping keys equivalent to booleans (<a href="">#25982</a>)</li>
<li>Detect repeated signed and complex dictionary keys (<a href="">#26007</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Rename <code>PYI033</code> to <code>legacy-type-comment</code> (<a href="">#26131</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Use <code>ThinVec</code> for call keywords (<a href="">#25999</a>)</li>
<li>Inline parser recovery context checks (<a href="">#26038</a>)</li>
<li>Match parser keywords as bytes (<a href="">#26037</a>)</li>
<li>Move value parsing out of lexing (<a href="">#25360</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Render subdiagnostics and secondary annotations as related information (<a href="">#26011</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update fix availability for always-fixable rules (<a href="">#26091</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Add fix safety section (<code>TID252</code>) (<a href="">#17491</a>)</li>
</ul>
<h3>Parser</h3>
<ul>
<li>Reject <code>__debug__</code> lambda parameters (<a href="">#26022</a>)</li>
<li>Reject <code>_</code> as a match-pattern target (<a href="">#25977</a>)</li>
<li>Reject multiple starred names in sequence patterns (<a href="">#25976</a>)</li>
<li>Reject parenthesized star imports (<a href="">#26021</a>)</li>
<li>Reject starred comprehension targets (<a href="">#26023</a>)</li>
<li>Reject unparenthesized generator expressions in class bases (<a href="">#25978</a>)</li>
<li>Reject <code>yield</code> expressions after commas (<a href="">#26024</a>)</li>
<li>Validate function type parameter default order (<a href="">#25981</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.18</h2>
<p>Released on 2026-06-18.</p>
<h3>Preview features</h3>
<ul>
<li>Handle nested <code>ruff:ignore</code> comments (<a href="">#25791</a>)</li>
<li>Stop displaying severity in output (<a href="">#26050</a>)</li>
<li>Use human-readable names in CLI output (<a href="">#25937</a>)</li>
<li>Use human-readable names in LSP and playground diagnostics (<a href="">#26058</a>)</li>
<li>[<code>pydocstyle</code>] Prevent property docstrings starting with verbs (<code>D421</code>) (<a href="">#23775</a>)</li>
<li>[<code>flake8-pyi</code>] Extend <code>PYI033</code> to Python files (<a href="">#26129</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Detect equivalent numeric mapping keys (<a href="">#26009</a>)</li>
<li>Detect mapping keys equivalent to booleans (<a href="">#25982</a>)</li>
<li>Detect repeated signed and complex dictionary keys (<a href="">#26007</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Rename <code>PYI033</code> to <code>legacy-type-comment</code> (<a href="">#26131</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Use <code>ThinVec</code> for call keywords (<a href="">#25999</a>)</li>
<li>Inline parser recovery context checks (<a href="">#26038</a>)</li>
<li>Match parser keywords as bytes (<a href="">#26037</a>)</li>
<li>Move value parsing out of lexing (<a href="">#25360</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Render subdiagnostics and secondary annotations as related information (<a href="">#26011</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update fix availability for always-fixable rules (<a href="">#26091</a>)</li>
<li>[<code>flake8-tidy-imports</code>] Add fix safety section (<code>TID252</code>) (<a href="">#17491</a>)</li>
</ul>
<h3>Parser</h3>
<ul>
<li>Reject <code>__debug__</code> lambda parameters (<a href="">#26022</a>)</li>
<li>Reject <code>_</code> as a match-pattern target (<a href="">#25977</a>)</li>
<li>Reject multiple starred names in sequence patterns (<a href="">#25976</a>)</li>
<li>Reject parenthesized star imports (<a href="">#26021</a>)</li>
<li>Reject starred comprehension targets (<a href="">#26023</a>)</li>
<li>Reject unparenthesized generator expressions in class bases (<a href="">#25978</a>)</li>
<li>Reject <code>yield</code> expressions after commas (<a href="">#26024</a>)</li>
<li>Validate function type parameter default order (<a href="">#25981</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6686f63</code></a> Bump 0.15.18 (<a href="">#26135</a>)</li>
<li><a href=""><code>efbb732</code></a> [ty] Suggest keyword-only arguments between variadic parameters (<a href="">#26134</a>)</li>
<li><a href=""><code>c256d5f</code></a> [ty] Support <code>Annotated[Any, ...]</code> as a class base (<a href="">#26133</a>)</li>
<li><a href=""><code>19a4bea</code></a> [flake8-pyi] Rename PYI033 to legacy-type-comment (<a href="">#26131</a>)</li>
<li><a href=""><code>1d9866c</code></a> Bump ecosystem-analyzer commit (<a href="">#26130</a>)</li>
<li><a href=""><code>8656c73</code></a> [ty] Compact indexed AST node storage (<a href="">#25998</a>)</li>
<li><a href=""><code>c17c8d9</code></a> [ty] Garbage-collect cached constraint sets (<a href="">#26116</a>)</li>
<li><a href=""><code>ef0fb8f</code></a> [ty] Fix bound TypeVar default cycle recovery (<a href="">#26124</a>)</li>
<li><a href=""><code>b83c024</code></a> [flake8-pyi] Extend PYI033 to Python files in preview (<a href="">#26129</a>)</li>
<li><a href=""><code>e8a5e38</code></a> Update Rust crate zip to v8 (<a href="">#26078</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.17...0.15.18">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.68.2 to 4.68.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.3 stable</h2>
<ul>
<li><code>utils</code>: delay <code>os.get_terminal_size</code> (<a href="">#1763</a> &lt;- <a href="">#1760</a>)</li>
<li><code>autonotebook</code>: support QtConsole, Spyder, JupyterLite (<a href="">#1763</a>, <a href="">#1628</a>, <a href="">#1559</a> &lt;- <a href="">#1283</a>, <a href="">#1098</a>, <a href="">#512</a>)</li>
<li>minor docs updates
<ul>
<li>fix typo (<a href="">#1762</a>)</li>
<li>use <code>git-fame</code></li>
</ul>
</li>
<li>misc minor framework updates
<ul>
<li>fix &amp; update CI build</li>
<li>pre-commit: add docs &amp; metadata generation</li>
<li>move <code>tox.ini</code> -&gt; <code>pyproject.toml</code>, move <code>tox-gh-actions</code> -&gt; <code>tox-gh</code></li>
<li>add Python 3.14, drop 3.7 support</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9aff609</code></a> bump version, merge pull request <a href="">#1763</a> from tqdm/jupyterlite</li>
<li><a href=""><code>9872f80</code></a> drop date from snap version str to fix pydantic</li>
<li><a href=""><code>b829334</code></a> support QtConsole, Spyder, JupyterLite</li>
<li><a href=""><code>6fa4867</code></a> delay os.get_terminal_size</li>
<li><a href=""><code>748e107</code></a> lint</li>
<li><a href=""><code>e6e29eb</code></a> move tox.ini -&gt; pyproject.toml</li>
<li><a href=""><code>617e4fa</code></a> tox-gh-actions -&gt; tox-gh</li>
<li><a href=""><code>c49c50d</code></a> add python 3.14, drop python 3.7 support</li>
<li><a href=""><code>fa2bcdb</code></a> pre-commit: tqdm.1</li>
<li><a href=""><code>1ec7988</code></a> auto git-fame</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.68.2...v4.68.3">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.48 to 0.0.51
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.51</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-18.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix bound TypeVar default cycle recovery (<a href="">#26124</a>)</li>
<li>Support <code>Annotated[Any, ...]</code> as a class base (<a href="">#26133</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Suggest keyword-only arguments between variadic parameters (<a href="">#26134</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid assuming classes with <code>Any</code> or <code>Unknown</code> bases are descriptors (<a href="">#26120</a>)</li>
<li>Infer simpler types in complex lambda cycles (<a href="">#26137</a>)</li>
<li>Preserve exact class objects during identity narrowing (<a href="">#26117</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Preserve unpacking diagnostics for nested assignment targets (<a href="">#26121</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Compact indexed AST node storage (<a href="">#25998</a>)</li>
<li>Discard dead DNF branches in intersection building (<a href="">#26144</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Remove broken gradual guarantee link (<a href="">#3806</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<h2>Install ty 0.0.51</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.51/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.51</h2>
<p>Released on 2026-06-18.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix bound TypeVar default cycle recovery (<a href="">#26124</a>)</li>
<li>Support <code>Annotated[Any, ...]</code> as a class base (<a href="">#26133</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Suggest keyword-only arguments between variadic parameters (<a href="">#26134</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Avoid assuming classes with <code>Any</code> or <code>Unknown</code> bases are descriptors (<a href="">#26120</a>)</li>
<li>Infer simpler types in complex lambda cycles (<a href="">#26137</a>)</li>
<li>Preserve exact class objects during identity narrowing (<a href="">#26117</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Preserve unpacking diagnostics for nested assignment targets (<a href="">#26121</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Compact indexed AST node storage (<a href="">#25998</a>)</li>
<li>Discard dead DNF branches in intersection building (<a href="">#26144</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Remove broken gradual guarantee link (<a href="">#3806</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<h2>0.0.50</h2>
<p>Released on 2026-06-17.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid cross-TypeVar leakage in generic inference (<a href="">#26099</a>)</li>
<li>Fix panic from oscillating collection-use constraints (<a href="">#26031</a>)</li>
<li>Preserve type variables in fixed tuple aliases (<a href="">#26041</a>)</li>
<li>Respect ParamSpec binding contexts (<a href="">#25993</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b5ef61c</code></a> Bump version to 0.0.51 (<a href="">#3811</a>)</li>
<li><a href=""><code>0749dee</code></a> Remove broken gradual guarantee link (<a href="">#3806</a>)</li>
<li><a href=""><code>556d22c</code></a> fix typo (<a href="">#3805</a>)</li>
<li><a href=""><code>ad35fdf</code></a> Improve the &quot;Does ty have a strict mode?&quot; FAQ (<a href="">#3798</a>)</li>
<li><a href=""><code>9eb8419</code></a> Expand mypy and Pyright rule mapping (<a href="">#3783</a>)</li>
<li><a href=""><code>8c5c8c1</code></a> Bump version to 0.0.50 (<a href="">#3800</a>)</li>
<li><a href=""><code>42a9002</code></a> Update benchmarks for ty 0.0.50 (<a href="">#3799</a>)</li>
<li><a href=""><code>f515f25</code></a> Pass PyPI version to ty-pre-commit when triggering a release in that repo (<a href="">#3</a>...</li>
<li><a href=""><code>b669da8</code></a> Bump version to 0.0.49 (<a href="">#3749</a>)</li>
<li><a href=""><code>79f0f51</code></a> Fixups to new AGENTS.md file (<a href="">#3741</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.48...0.0.51">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e17cd7486137`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.