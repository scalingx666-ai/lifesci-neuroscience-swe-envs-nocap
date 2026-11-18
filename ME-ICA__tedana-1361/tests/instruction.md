# Issue

**Title:** Bump setuptools from 80.10.2 to 82.0.0

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 80.10.2 to 82.0.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v82.0.0</h1>
<h2>Deprecations and Removals</h2>
<ul>
<li><code>pkg_resources</code> has been removed from Setuptools. Most common uses of <code>pkg_resources</code> have been superseded by the <code>importlib.resources &lt;https://docs.python.org/3/library/importlib.resources.html&gt;</code>_ and <code>importlib.metadata &lt;https://docs.python.org/3/library/importlib.metadata.html&gt;</code>_ projects. Projects and environments relying on <code>pkg_resources</code> for namespace packages or other behavior should depend on older versions of <code>setuptools</code>. (<a href="">#3085</a>)</li>
</ul>
<h1>v81.0.0</h1>
<h2>Deprecations and Removals</h2>
<ul>
<li>Removed support for the --dry-run parameter to setup.py. This one feature by its nature threads through lots of core and ancillary functionality, adding complexity and friction. Removal of this parameter will help decouple the compiler functionality from distutils and thus the eventual full integration of distutils. These changes do affect some class and function signatures, so any derivative functionality may require some compatibility shims to support their expected interface. Please report any issues to the Setuptools project for investigation. (<a href="">#4872</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>03f3615</code></a> Bump version: 81.0.0 → 82.0.0</li>
<li><a href=""><code>530d114</code></a> Merge pull request <a href="">#5007</a> from pypa/feature/remove-more-pkg_resources</li>
<li><a href=""><code>11efe9f</code></a> Merge branch 'maint/75.3'</li>
<li><a href=""><code>118f129</code></a> Bump version: 75.3.3 → 75.3.4</li>
<li><a href=""><code>90561ff</code></a> Merge pull request <a href="">#5150</a> from UladzimirTrehubenka/backport_cve_47273</li>
<li><a href=""><code>4595034</code></a> Add news fragment.</li>
<li><a href=""><code>fc00800</code></a> Merge pull request <a href="">#5171</a> from cclauss/ruff-v0.15.0</li>
<li><a href=""><code>127e561</code></a> Remove tests reliant on pkg_resources, rather than xfailing them.</li>
<li><a href=""><code>64bc21e</code></a> Reference the superseding libraries.</li>
<li><a href=""><code>cf1ff45</code></a> Merge branch 'main' into debt/pbr-without-pkg_resources</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v80.10.2...v82.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=setuptools&package-manager=uv&previous-version=80.10.2&new-version=82.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41d3fb33ee53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.