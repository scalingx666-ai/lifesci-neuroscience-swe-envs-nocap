# Issue

**Title:** Bump pytest from 9.1.0 to 9.1.1

## Description

Bumps [pytest](https://github.com/pytest-dev/pytest) from 9.1.0 to 9.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.1.1</h2>
<h1>pytest 9.1.1 (2026-06-19)</h1>
<h2>Bug fixes</h2>
<ul>
<li><a href="">#14220</a>: Fixed a logic bug in <code>pytest.RaisesGroup</code> which would might cause it to display incorrect &quot;It matches <!-- raw HTML omitted -->FooError()<!-- raw HTML omitted --> which was paired with <!-- raw HTML omitted -->BarError<!-- raw HTML omitted -->&quot; messages.</li>
<li><a href="">#14591</a>: Fixed a regression in pytest 9.1.0 which caused overriding a parametrized fixture with an indirect <!-- raw HTML omitted --><a href="https://github.com/pytest"><code>@​pytest</code></a>.mark.parametrize<!-- raw HTML omitted --> to fail with &quot;duplicate parametrization of '&lt;fixture name&gt;'&quot;.</li>
<li><a href="">#14606</a>: Fixed <code>list-item</code> typing errors from mypy in <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> <code>argvalues</code> parameter.</li>
<li><a href="">#14608</a>: Fixed a regression in pytest 9.1.0 where <code>conftest.py</code> files located in <code>&lt;invocation dir&gt;/test*</code> were no longer loaded as initial conftests when invoked without arguments.
This could cause certain hooks (like <code>pytest_addoption</code>) in these files to not fire.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf470ec</code></a> Prepare release version 9.1.1</li>
<li><a href=""><code>e0c8ce6</code></a> Merge pull request <a href="">#14625</a> from pytest-dev/patchback/backports/9.1.x/a07c31a97...</li>
<li><a href=""><code>1b82d16</code></a> Merge pull request <a href="">#14624</a> from pytest-dev/patchback/backports/9.1.x/b375b79ec...</li>
<li><a href=""><code>501c4bc</code></a> Merge pull request <a href="">#14596</a> from bluetech/doc-classmethod</li>
<li><a href=""><code>b61f588</code></a> Merge pull request <a href="">#14622</a> from chrisburr/fix-14608-initial-conftest-test-subdir</li>
<li><a href=""><code>9a567e0</code></a> [automated] Update plugin list (<a href="">#14617</a>) (<a href="">#14618</a>)</li>
<li><a href=""><code>ef8b299</code></a> Merge pull request <a href="">#14620</a> from pytest-dev/patchback/backports/9.1.x/680f9f3ed...</li>
<li><a href=""><code>66abd07</code></a> Merge pull request <a href="">#14220</a> from bysiber/fix-stale-iexp-raisesgroup</li>
<li><a href=""><code>79fbf93</code></a> Merge pull request <a href="">#14612</a> from pytest-dev/patchback/backports/9.1.x/974ed48b6...</li>
<li><a href=""><code>0d312eb</code></a> Merge pull request <a href="">#14611</a> from bluetech/parametrize-argvalues-typing</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.1.0...9.1.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d59bd0922181`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.