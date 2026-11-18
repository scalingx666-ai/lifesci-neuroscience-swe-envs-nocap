# Issue

**Title:** Bump pytest from 9.0.2 to 9.0.3

## Description

Bumps [pytest](https://github.com/pytest-dev/pytest) from 9.0.2 to 9.0.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.0.3</h2>
<h1>pytest 9.0.3 (2026-04-07)</h1>
<h2>Bug fixes</h2>
<ul>
<li>
<p><a href="">#12444</a>: Fixed <code>pytest.approx</code> which now correctly takes into account <code>~collections.abc.Mapping</code> keys order to compare them.</p>
</li>
<li>
<p><a href="">#13634</a>: Blocking a <code>conftest.py</code> file using the <code>-p no:</code> option is now explicitly disallowed.</p>
<p>Previously this resulted in an internal assertion failure during plugin loading.</p>
<p>Pytest now raises a clear <code>UsageError</code> explaining that conftest files are not plugins and cannot be disabled via <code>-p</code>.</p>
</li>
<li>
<p><a href="">#13734</a>: Fixed crash when a test raises an exceptiongroup with <code>__tracebackhide__ = True</code>.</p>
</li>
<li>
<p><a href="">#14195</a>: Fixed an issue where non-string messages passed to <!-- raw HTML omitted -->unittest.TestCase.subTest()<!-- raw HTML omitted --> were not printed.</p>
</li>
<li>
<p><a href="">#14343</a>: Fixed use of insecure temporary directory (CVE-2025-71176).</p>
</li>
</ul>
<h2>Improved documentation</h2>
<ul>
<li><a href="">#13388</a>: Clarified documentation for <code>-p</code> vs <code>PYTEST_PLUGINS</code> plugin loading and fixed an incorrect <code>-p</code> example.</li>
<li><a href="">#13731</a>: Clarified that capture fixtures (e.g. <code>capsys</code> and <code>capfd</code>) take precedence over the <code>-s</code> / <code>--capture=no</code> command-line options in <code>Accessing captured output from a test function &lt;accessing-captured-output&gt;</code>.</li>
<li><a href="">#14088</a>: Clarified that the default <code>pytest_collection</code> hook sets <code>session.items</code> before it calls <code>pytest_collection_finish</code>, not after.</li>
<li><a href="">#14255</a>: TOML integer log levels must be quoted: Updating reference documentation.</li>
</ul>
<h2>Contributor-facing changes</h2>
<ul>
<li>
<p><a href="">#12689</a>: The test reports are now published to Codecov from GitHub Actions.
The test statistics is visible <a href="https://app.codecov.io/gh/pytest-dev/pytest/tests">on the web interface</a>.</p>
<p>-- by <code>aleguy02</code></p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a7d58d7</code></a> Prepare release version 9.0.3</li>
<li><a href=""><code>089d981</code></a> Merge pull request <a href="">#14366</a> from bluetech/revert-14193-backport</li>
<li><a href=""><code>8127eaf</code></a> Revert &quot;Fix: assertrepr_compare respects dict insertion order (<a href="">#14050</a>) (<a href="">#14193</a>)&quot;</li>
<li><a href=""><code>99a7e60</code></a> Merge pull request <a href="">#14363</a> from pytest-dev/patchback/backports/9.0.x/95d8423bd...</li>
<li><a href=""><code>ddee02a</code></a> Merge pull request <a href="">#14343</a> from bluetech/cve-2025-71176-simple</li>
<li><a href=""><code>74eac69</code></a> doc: Update training info (<a href="">#14298</a>) (<a href="">#14301</a>)</li>
<li><a href=""><code>f92dee7</code></a> Merge pull request <a href="">#14267</a> from pytest-dev/patchback/backports/9.0.x/d6fa26c62...</li>
<li><a href=""><code>7ee58ac</code></a> Merge pull request <a href="">#12378</a> from Pierre-Sassoulas/fix-implicit-str-concat-and-d...</li>
<li><a href=""><code>37da870</code></a> Merge pull request <a href="">#14259</a> from mitre88/patch-4 (<a href="">#14268</a>)</li>
<li><a href=""><code>c34bfa3</code></a> Add explanation for string context diffs (<a href="">#14257</a>) (<a href="">#14266</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.2...9.0.3">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85c3fa332a5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.