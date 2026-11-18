# Issue

**Title:** build(deps): bump setuptools from 80.9.0 to 83.0.0

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 80.9.0 to 83.0.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v83.0.0</h1>
<h2>Features</h2>
<ul>
<li>Require Python 3.10 or later.</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li><code>MANIFEST.in</code> matching (via <code>FileList</code>) is now insensitive to Unicode
normalization form. A pattern authored in one form (e.g. NFC, as typically
saved by editors) now matches a file whose name is stored on disk in another
(e.g. NFD, as produced by macOS APFS/HFS+). Previously an <code>exclude</code>,
<code>global-exclude</code>, <code>recursive-exclude</code>, or <code>prune</code> rule could silently
fail to drop a non-ASCII-named file from the source distribution, publishing
it despite the exclusion -- see GHSA-h35f-9h28-mq5c.</li>
</ul>
<h2>Deprecations and Removals</h2>
<ul>
<li><code>pypa/distutils#334</code></li>
</ul>
<h1>v82.0.1</h1>
<h2>Bugfixes</h2>
<ul>
<li>Fix the loading of <code>launcher manifest.xml</code> file. (<a href="">#5047</a>)</li>
<li>Replaced deprecated <code>json.__version__</code> with fixture in tests. (<a href="">#5186</a>)</li>
</ul>
<h2>Improved Documentation</h2>
<ul>
<li>Add advice about how to improve predictability when installing sdists. (<a href="">#5168</a>)</li>
</ul>
<h2>Misc</h2>
<ul>
<li><a href="">#4941</a>, <a href="">#5157</a>, <a href="">#5169</a>, <a href="">#5175</a></li>
</ul>
<p>v82.0.0</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6519f72</code></a> Bump version: 82.0.1 → 83.0.0</li>
<li><a href=""><code>d1151b1</code></a> Merge pull request <a href="">#5250</a> from pypa/feature/distutils-d7633fbed</li>
<li><a href=""><code>a2df31e</code></a> Capture removal of dry_run parameter in changelog.</li>
<li><a href=""><code>00144dc</code></a> Moved newsfragment to the release where it occurred.</li>
<li><a href=""><code>a4a5a2b</code></a> Add news fragment.</li>
<li><a href=""><code>77470c2</code></a> Merge <a href="https://github.com/pypa/distutils">https://github.com/pypa/distutils</a> into feature/distutils-d7633fbed</li>
<li><a href=""><code>3c43897</code></a> Merge pull request <a href="">#5247</a> from pypa/copilot/fix-pypy-version-issue</li>
<li><a href=""><code>bb6ea66</code></a> Bump PyPy from 3.10 to 3.11 in CI workflow</li>
<li><a href=""><code>a2bc3ac</code></a> Fix broken intersphinx reference to build's installation docs</li>
<li><a href=""><code>2d6a739</code></a> Use stacked parametrize decorators instead of itertools.product</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v80.9.0...v83.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=setuptools&package-manager=uv&previous-version=80.9.0&new-version=83.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/brainiak/brainiak/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66e71dd25efd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.