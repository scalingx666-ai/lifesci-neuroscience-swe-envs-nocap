# Issue

**Title:** Bump pytest from 8.4.2 to 9.0.3

## Description

Bumps [pytest](https://github.com/pytest-dev/pytest) from 8.4.2 to 9.0.3.
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
<h2>9.0.2</h2>
<h1>pytest 9.0.2 (2025-12-06)</h1>
<h2>Bug fixes</h2>
<ul>
<li>
<p><a href="">#13896</a>: The terminal progress feature added in pytest 9.0.0 has been disabled by default, except on Windows, due to compatibility issues with some terminal emulators.</p>
<p>You may enable it again by passing <code>-p terminalprogress</code>. We may enable it by default again once compatibility improves in the future.</p>
<p>Additionally, when the environment variable <code>TERM</code> is <code>dumb</code>, the escape codes are no longer emitted, even if the plugin is enabled.</p>
</li>
<li>
<p><a href="">#13904</a>: Fixed the TOML type of the <code>tmp_path_retention_count</code> settings in the API reference from number to string.</p>
</li>
<li>
<p><a href="">#13946</a>: The private <code>config.inicfg</code> attribute was changed in a breaking manner in pytest 9.0.0.
Due to its usage in the ecosystem, it is now restored to working order using a compatibility shim.
It will be deprecated in pytest 9.1 and removed in pytest 10.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
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
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/8.4.2...9.0.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pytest&package-manager=uv&previous-version=8.4.2&new-version=9.0.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--827.org.readthedocs.build/en/827/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6dd1658ec97`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.