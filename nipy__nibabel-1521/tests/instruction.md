# Issue

**Title:** chore(deps): bump the python group with 4 updates

## Description

Bumps the python group with 4 updates: [pytest](https://github.com/pytest-dev/pytest), [pytest-run-parallel](https://github.com/Quansight-Labs/pytest-run-parallel), [tox](https://github.com/tox-dev/tox) and [pydata-sphinx-theme](https://github.com/pydata/pydata-sphinx-theme).

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

Updates `pytest-run-parallel` from 0.8.2 to 0.9.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Quansight-Labs/pytest-run-parallel/releases">pytest-run-parallel's releases</a>.</em></p>
<blockquote>
<h2>v0.9.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix xpass tests incorrectly being recognized as passes by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#181</a></li>
<li>Add a Python 3.15 trove classifier by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#182</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Quansight-Labs/pytest-run-parallel/compare/v0.9.0...v0.9.1">https://github.com/Quansight-Labs/pytest-run-parallel/compare/v0.9.0...v0.9.1</a></p>
<h2>v0.9.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Drop python 3.9 by <a href="https://github.com/Liam-DeVoe"><code>@​Liam-DeVoe</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#168</a></li>
<li>Add a force_parallel_threads mark by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#176</a></li>
<li>Avoid crash for sybil doctests by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#174</a></li>
<li>Fix test failures running on a single-CPU system by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">Quansight-Labs/pytest-run-parallel#178</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Quansight-Labs/pytest-run-parallel/compare/v0.8.2...v0.9.0">https://github.com/Quansight-Labs/pytest-run-parallel/compare/v0.8.2...v0.9.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b23961a</code></a> Merge pull request <a href="">#183</a> from ngoldbaum/v0.9.1</li>
<li><a href=""><code>8003c93</code></a> Release v0.9.1</li>
<li><a href=""><code>8cd4274</code></a> Merge pull request <a href="">#182</a> from ngoldbaum/3.15-trove-classifier</li>
<li><a href=""><code>814a07b</code></a> Merge pull request <a href="">#181</a> from ngoldbaum/fix-xpass</li>
<li><a href=""><code>78fe062</code></a> Add a Python 3.15 trove classifier</li>
<li><a href=""><code>4d1927a</code></a> [pre-commit.ci lite] apply automatic fixes</li>
<li><a href=""><code>aa1bf03</code></a> Fix xpass tests incorrectly being recognized as passes</li>
<li><a href=""><code>aee1776</code></a> Merge pull request <a href="">#179</a> from ngoldbaum/v0.9.0</li>
<li><a href=""><code>d40b08c</code></a> Release v0.9.0</li>
<li><a href=""><code>c7f94e3</code></a> Merge pull request <a href="">#178</a> from ngoldbaum/fix-single-core</li>
<li>Additional commits viewable in <a href="https://github.com/Quansight-Labs/pytest-run-parallel/compare/v0.8.2...v0.9.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tox` from 4.54.0 to 4.55.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/releases">tox's releases</a>.</em></p>
<blockquote>
<h2>v4.55.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(config): propagate overrides through config references by <a href="https://github.com/tales-aparecida"><code>@​tales-aparecida</code></a> in <a href="">tox-dev/tox#3951</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/tales-aparecida"><code>@​tales-aparecida</code></a> made their first contribution in <a href="">tox-dev/tox#3951</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.55.0...4.55.1">https://github.com/tox-dev/tox/compare/4.55.0...4.55.1</a></p>
<h2>v4.55.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>👷 ci(schemastore): sync fork before pushing branch by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3942</a></li>
<li>feat: Also pass <code>TERMINFO</code> when in an interactive shell by <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a> in <a href="">tox-dev/tox#3946</a></li>
<li>🐛 fix(pip): skip constrain_package_deps when constraints is set by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3948</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.54.0...4.55.0">https://github.com/tox-dev/tox/compare/4.54.0...4.55.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/blob/main/docs/changelog.rst">tox's changelog</a>.</em></p>
<blockquote>
<h1>Bug fixes - 4.55.1</h1>
<ul>
<li><code>TOX_OVERRIDE</code> (and <code>-x</code>/<code>--override</code>) now propagates through configuration references. Previously, overriding a
base value that was later referenced via <code>{[section]key}</code> (ini) or <code>{replace = &quot;ref&quot;, of = [...]}</code> (toml) was
ignored because reference resolution read the raw file value, bypassing the override system - by
:user:<code>tales-aparecida</code>. (:issue:<code>3950</code>) (:issue:<code>3950</code>)</li>
</ul>
<hr />
<p>v4.55.0 (2026-05-28)</p>
<hr />
<h1>Features - 4.55.0</h1>
<ul>
<li>Automatically pass the TERMINFO environment variable to tox subprocesses if the output is a TTY. This variable is used
by Ghostty to communicate terminal capabilities to programs. (:issue:<code>3946</code>)</li>
</ul>
<h1>Bug fixes - 4.55.0</h1>
<ul>
<li>When the <code>constraints</code> configuration option is set, <code>constrain_package_deps</code> and <code>use_frozen_constraints</code> are
now ignored. Previously, both the user-provided constraints file and the auto-generated constraints file were passed
to pip during <code>install_package_deps</code>, which could cause resolver conflicts when the same package appeared in both
files - by :user:<code>gaborbernat</code>. (:issue:<code>3945</code>) (:issue:<code>3945</code>)</li>
</ul>
<hr />
<p>v4.54.0 (2026-05-12)</p>
<hr />
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7ebde0c</code></a> release 4.55.1</li>
<li><a href=""><code>9ac5479</code></a> 🐛 fix(config): propagate overrides through config references (<a href="">#3951</a>)</li>
<li><a href=""><code>28972a9</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3949</a>)</li>
<li><a href=""><code>928b7f0</code></a> release 4.55.0</li>
<li><a href=""><code>a43427f</code></a> 🐛 fix(pip): skip constrain_package_deps when constraints is set (<a href="">#3948</a>)</li>
<li><a href=""><code>27b68b3</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3947</a>)</li>
<li><a href=""><code>4e6627c</code></a> feat: Also pass <code>TERMINFO</code> when in an interactive shell (<a href="">#3946</a>)</li>
<li><a href=""><code>10c431c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3943</a>)</li>
<li><a href=""><code>c86e876</code></a> 👷 ci(schemastore): sync fork before pushing branch (<a href="">#3942</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/tox/compare/4.54.0...4.55.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pydata-sphinx-theme` from 0.17.1 to 0.19.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydata/pydata-sphinx-theme/releases">pydata-sphinx-theme's releases</a>.</em></p>
<blockquote>
<h2>v0.19.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump pydata/pydata-sphinx-theme/.github/workflows/CI.yml from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2398</a></li>
<li>Bump pydata/pydata-sphinx-theme from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2397</a></li>
<li>Bump hynek/build-and-inspect-python-package from 2.17.0 to 2.18.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2396</a></li>
<li>Bump pydata/pydata-sphinx-theme/.github/workflows/docs.yml from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2395</a></li>
<li>Docs update Font Awesome links by <a href="https://github.com/hntk03"><code>@​hntk03</code></a> in <a href="">pydata/pydata-sphinx-theme#2399</a></li>
<li>[pre-commit.ci] pre-commit autoupdate hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2347</a></li>
<li>[pre-commit.ci] pre-commit autoupdate hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2401</a></li>
<li>Fix code coverage workflow by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2393</a></li>
<li>Bump actions/checkout from 6.0.2 to 6.0.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2406</a></li>
<li>Bump astral-sh/setup-uv from 8.1.0 to 8.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2407</a></li>
<li>Fix vertical scrollbar in math container by <a href="https://github.com/hntk03"><code>@​hntk03</code></a> in <a href="">pydata/pydata-sphinx-theme#2404</a></li>
<li>[css] De-jumble header items at intermediate widths :) by <a href="https://github.com/sneakers-the-rat"><code>@​sneakers-the-rat</code></a> in <a href="">pydata/pydata-sphinx-theme#1784</a></li>
<li>Fix gettext builder by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2403</a></li>
<li>Bump 0.18.0 -&gt; 0.19.0rc0 by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2410</a></li>
<li>fix: configure defaults for Google Analytics before loading script by <a href="https://github.com/tswast"><code>@​tswast</code></a> in <a href="">pydata/pydata-sphinx-theme#2369</a></li>
<li>Bump 0.19.0rc0 -&gt; 0.19.0 by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2414</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/sneakers-the-rat"><code>@​sneakers-the-rat</code></a> made their first contribution in <a href="">pydata/pydata-sphinx-theme#1784</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydata/pydata-sphinx-theme/compare/v0.18.0...v0.19.0">https://github.com/pydata/pydata-sphinx-theme/compare/v0.18.0...v0.19.0</a></p>
<h2>v0.19.0rc0</h2>
<h2>Fixes</h2>
<ul>
<li>De-jumble header items at intermediate widths :) by <a href="https://github.com/sneakers-the-rat"><code>@​sneakers-the-rat</code></a> in <a href="">pydata/pydata-sphinx-theme#1784</a></li>
<li>Fix vertical scrollbar in math container by <a href="https://github.com/hntk03"><code>@​hntk03</code></a> in <a href="">pydata/pydata-sphinx-theme#2404</a></li>
<li>Fix gettext builder by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2403</a></li>
</ul>
<h2>Internal tooling, CI</h2>
<ul>
<li>Docs update Font Awesome links by <a href="https://github.com/hntk03"><code>@​hntk03</code></a> in <a href="">pydata/pydata-sphinx-theme#2399</a></li>
<li>Fix code coverage workflow by <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> in <a href="">pydata/pydata-sphinx-theme#2393</a></li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Bump pydata/pydata-sphinx-theme/.github/workflows/CI.yml from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2398</a></li>
<li>Bump pydata/pydata-sphinx-theme from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2397</a></li>
<li>Bump hynek/build-and-inspect-python-package from 2.17.0 to 2.18.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2396</a></li>
<li>Bump pydata/pydata-sphinx-theme/.github/workflows/docs.yml from 178df7a9d69695be4e49fa56822d76b048977387 to 047227ad41f26a993ea7b2182955d26aa837acea by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2395</a></li>
<li>[pre-commit.ci] pre-commit autoupdate hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2347</a></li>
<li>[pre-commit.ci] pre-commit autoupdate hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2401</a></li>
<li>Bump actions/checkout from 6.0.2 to 6.0.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2406</a></li>
<li>Bump astral-sh/setup-uv from 8.1.0 to 8.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pydata/pydata-sphinx-theme#2407</a></li>
</ul>
<h2>Acknowledgements</h2>
<ul>
<li>Thanks <a href="https://github.com/sneakers-the-rat"><code>@​sneakers-the-rat</code></a> and <a href="https://github.com/timhoffm"><code>@​timhoffm</code></a> for working on the medium size layout</li>
<li>Thanks <a href="https://github.com/hntk03"><code>@​hntk03</code></a> for your sustained involvement across several releases</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>01e209b</code></a> Bump 0.19.0rc0 -&gt; 0.19.0 (<a href="">#2414</a>)</li>
<li><a href=""><code>1c26125</code></a> fix: configure defaults for Google Analytics before loading script (<a href="">#2369</a>)</li>
<li><a href=""><code>be7da51</code></a> Bump 0.18.0 -&gt; 0.19.0rc0 (<a href="">#2410</a>)</li>
<li><a href=""><code>0fb30d6</code></a> Fix gettext builder (<a href="">#2403</a>)</li>
<li><a href=""><code>dd460e8</code></a> [css] De-jumble header items at intermediate widths :) (<a href="">#1784</a>)</li>
<li><a href=""><code>db37b88</code></a> Fix vertical scrollbar in math container (<a href="">#2404</a>)</li>
<li><a href=""><code>2b80896</code></a> Bump astral-sh/setup-uv from 8.1.0 to 8.2.0 (<a href="">#2407</a>)</li>
<li><a href=""><code>bd863f8</code></a> Bump actions/checkout from 6.0.2 to 6.0.3 (<a href="">#2406</a>)</li>
<li><a href=""><code>f67c036</code></a> Fix code coverage workflow (<a href="">#2393</a>)</li>
<li><a href=""><code>a5b3600</code></a> [pre-commit.ci] pre-commit autoupdate hooks (<a href="">#2401</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pydata/pydata-sphinx-theme/compare/v0.17.1...v0.19.0">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67e697743ee6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.