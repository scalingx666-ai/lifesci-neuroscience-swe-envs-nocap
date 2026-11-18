# Issue

**Title:** Bump setuptools from 65.7.0 to 70.0.0 in /tvb_library

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 65.7.0 to 70.0.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v70.0.0</h1>
<h2>Features</h2>
<ul>
<li>Emit a warning when <code>[tools.setuptools]</code> is present in <code>pyproject.toml</code> and will be ignored. -- by :user:<code>SnoopJ</code> (<a href="">#4150</a>)</li>
<li>Improved <code>AttributeError</code> error message if <code>pkg_resources.EntryPoint.require</code> is called without extras or distribution
Gracefully &quot;do nothing&quot; when trying to activate a <code>pkg_resources.Distribution</code> with a <code>None</code> location, rather than raising a <code>TypeError</code>
-- by :user:<code>Avasam</code> (<a href="">#4262</a>)</li>
<li>Typed the dynamically defined variables from <code>pkg_resources</code> -- by :user:<code>Avasam</code> (<a href="">#4267</a>)</li>
<li>Modernized and refactored VCS handling in package_index. (<a href="">#4332</a>)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>In install command, use super to call the superclass methods. Avoids race conditions when monkeypatching from _distutils_system_mod occurs late. (<a href="">#4136</a>)</li>
<li>Fix finder template for lenient editable installs of implicit nested namespaces
constructed by using <code>package_dir</code> to reorganise directory structure. (<a href="">#4278</a>)</li>
<li>Fix an error with <code>UnicodeDecodeError</code> handling in <code>pkg_resources</code> when trying to read files in UTF-8 with a fallback -- by :user:<code>Avasam</code> (<a href="">#4348</a>)</li>
</ul>
<h2>Improved Documentation</h2>
<ul>
<li>Uses RST substitution to put badges in 1 line. (<a href="">#4312</a>)</li>
</ul>
<h2>Deprecations and Removals</h2>
<ul>
<li>
<p>Further adoption of UTF-8 in <code>setuptools</code>.
This change regards mostly files produced and consumed during the build process
(e.g. metadata files, script wrappers, automatically updated config files, etc..)
Although precautions were taken to minimize disruptions, some edge cases might
be subject to backwards incompatibility.</p>
<p>Support for <code>&quot;locale&quot;</code> encoding is now <strong>deprecated</strong>. (<a href="">#4309</a>)</p>
</li>
<li>
<p>Remove <code>setuptools.convert_path</code> after long deprecation period.
This function was never defined by <code>setuptools</code> itself, but rather a
side-effect of an import for internal usage. (<a href="">#4322</a>)</p>
</li>
<li>
<p>Remove fallback for customisations of <code>distutils</code>' <code>build.sub_command</code> after long
deprecated period.
Users are advised to import <code>build</code> directly from <code>setuptools.command.build</code>. (<a href="">#4322</a>)</p>
</li>
<li>
<p>Removed <code>typing_extensions</code> from vendored dependencies -- by :user:<code>Avasam</code> (<a href="">#4324</a>)</p>
</li>
<li>
<p>Remove deprecated <code>setuptools.dep_util</code>.
The provided alternative is <code>setuptools.modified</code>. (<a href="">#4360</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5cbf12a</code></a> Workaround for release error in v70</li>
<li><a href=""><code>9c1bcc3</code></a> Bump version: 69.5.1 → 70.0.0</li>
<li><a href=""><code>4dc0c31</code></a> Remove deprecated <code>setuptools.dep_util</code> (<a href="">#4360</a>)</li>
<li><a href=""><code>6c1ef57</code></a> Remove xfail now that test passes. Ref <a href="">#4371</a>.</li>
<li><a href=""><code>d14fa01</code></a> Add all site-packages dirs when creating simulated environment for test_edita...</li>
<li><a href=""><code>6b7f7a1</code></a> Prevent <code>bin</code> folders to be taken as extern packages when vendoring (<a href="">#4370</a>)</li>
<li><a href=""><code>69141f6</code></a> Add doctest for vendorised bin folder</li>
<li><a href=""><code>2a53cc1</code></a> Prevent 'bin' folders to be taken as extern packages</li>
<li><a href=""><code>7208628</code></a> Replace call to deprecated <code>validate_pyproject</code> command (<a href="">#4363</a>)</li>
<li><a href=""><code>96d681a</code></a> Remove call to deprecated validate_pyproject command</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v65.7.0...v70.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=setuptools&package-manager=pip&previous-version=65.7.0&new-version=70.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/the-virtual-brain/tvb-root/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `901f2e9870b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.