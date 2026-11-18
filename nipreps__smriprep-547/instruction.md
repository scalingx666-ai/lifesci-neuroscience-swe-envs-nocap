# Issue

**Title:** build(deps): bump hynek/build-and-inspect-python-package from c8508a8c721100cf0319cd57d297a5fcacc7cc40 to efb823f52190ad02594531168b7a2d5790e66516

## Description

Bumps [hynek/build-and-inspect-python-package](https://github.com/hynek/build-and-inspect-python-package) from c8508a8c721100cf0319cd57d297a5fcacc7cc40 to efb823f52190ad02594531168b7a2d5790e66516.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/hynek/build-and-inspect-python-package/blob/main/CHANGELOG.md">hynek/build-and-inspect-python-package's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<p>All notable changes to this project will be documented in this file.</p>
<p>The format is based on <a href="https://keepachangelog.com/en/1.0.0/">Keep a Changelog</a>, and this project adheres to <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a>.</p>
<h2><a href="https://github.com/hynek/build-and-inspect-python-package/compare/v2.14.0...main">Unreleased</a></h2>
<h3>Changed</h3>
<ul>
<li>Pick Python version explictly instead of <code>&quot;3.x&quot;</code> to prevent incompatibily problems like <a href="">#182</a> in the future.</li>
</ul>
<h2><a href="https://github.com/hynek/build-and-inspect-python-package/compare/v2.13.0...v2.14.0">2.14.0</a></h2>
<h3>Changed</h3>
<ul>
<li>
<p>Update tools such that they work on Python 3.14 (which is now <code>3.x</code> on GitHub Actions).
<a href="">#182</a></p>
</li>
<li>
<p>The action now ignores <code>UV_PYTHON</code> coming from the outside.
<a href="">#184</a></p>
</li>
</ul>
<h2><a href="https://github.com/hynek/build-and-inspect-python-package/compare/v2.12.0...v2.13.0">2.13.0</a></h2>
<h3>Added</h3>
<ul>
<li>
<p>New output: <code>package_name</code> is the name of the built package as stored in metadata.
<a href="">#162</a></p>
</li>
<li>
<p>The package name is now part of the action summary which is helpful when you build more than one package from a repository.
<a href="">#169</a></p>
</li>
</ul>
<h3>Changed</h3>
<ul>
<li>All GitHub actions are now pinned to exact hashes for better reproducibility and mild security improvements[^st].</li>
</ul>
<p>[^st]: Chosen prefix SHA-1 hash collision attacks <a href="https://eprint.iacr.org/2020/014.pdf">exist</a>. Against serious attackers, this is but security theater.</p>
<h2><a href="https://github.com/hynek/build-and-inspect-python-package/compare/v2.11.0...v2.12.0">2.12.0</a></h2>
<h3>Changed</h3>
<ul>
<li>This release only updates the tools we use.
It's important for being able to handle packaging metadata 2.4, as published by recent versions of Hatchling, though.
<a href="">#161</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/hynek/build-and-inspect-python-package/compare/c8508a8c721100cf0319cd57d297a5fcacc7cc40...efb823f52190ad02594531168b7a2d5790e66516">compare view</a></li>
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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed264b65cd6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.