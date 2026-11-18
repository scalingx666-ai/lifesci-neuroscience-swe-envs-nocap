# Issue

**Title:** Update numpy requirement from <2.2.0,>=1.22.2 to >=1.22.2,<2.3.0

## Description

Updates the requirements on [numpy](https://github.com/numpy/numpy) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.2.0  (Dec 8, 2024)</h2>
<h1>NumPy 2.2.0 Release Notes</h1>
<p>The NumPy 2.2.0 release is quick release that brings us back into sync
with the usual twice yearly release cycle. There have been an number of
small cleanups, as well as work bringing the new StringDType to
completion and improving support for free threaded Python. Highlights
are:</p>
<ul>
<li>New functions <code>matvec</code> and <code>vecmat</code>, see below.</li>
<li>Many improved annotations.</li>
<li>Improved support for the new StringDType.</li>
<li>Improved support for free threaded Python</li>
<li>Fixes for f2py</li>
</ul>
<p>This release supports Python versions 3.10-3.13.</p>
<h2>Deprecations</h2>
<ul>
<li>
<p><code>_add_newdoc_ufunc</code> is now deprecated. <code>ufunc.__doc__ = newdoc</code>
should be used instead.</p>
<p>(<a href="">gh-27735</a>)</p>
</li>
</ul>
<h2>Expired deprecations</h2>
<ul>
<li>
<p><code>bool(np.array([]))</code> and other empty arrays will now raise an error.
Use <code>arr.size &gt; 0</code> instead to check whether an array has no
elements.</p>
<p>(<a href="">gh-27160</a>)</p>
</li>
</ul>
<h2>Compatibility notes</h2>
<ul>
<li>
<p><code>numpy.cov</code> now properly transposes single-row (2d
array) design matrices when <code>rowvar=False</code>. Previously, single-row
design matrices would return a scalar in this scenario, which is not
correct, so this is a behavior change and an array of the
appropriate shape will now be returned.</p>
<p>(<a href="">gh-27661</a>)</p>
</li>
</ul>
<h2>New Features</h2>
<ul>
<li>
<p>New functions for matrix-vector and vector-matrix products</p>
<p>Two new generalized ufuncs were defined:</p>
<ul>
<li><code>numpy.matvec</code> - matrix-vector product, treating the
arguments as stacks of matrices and column vectors,</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/blob/main/doc/RELEASE_WALKTHROUGH.rst">numpy's changelog</a>.</em></p>
<blockquote>
<p>This is a walkthrough of the NumPy 2.1.0 release on Linux, modified for
building with GitHub Actions and cibuildwheels and uploading to the
<code>anaconda.org staging repository for NumPy &lt;https://anaconda.org/multibuild-wheels-staging/numpy&gt;</code>_.
The commands can be copied into the command line, but be sure to replace 2.1.0
by the correct version. This should be read together with the
:ref:<code>general release guide &lt;prepare_release&gt;</code>.</p>
<h1>Facility preparation</h1>
<p>Before beginning to make a release, use the <code>requirements/*_requirements.txt</code> files to
ensure that you have the needed software. Most software can be installed with
pip, but some will require apt-get, dnf, or whatever your system uses for
software. You will also need a GitHub personal access token (PAT) to push the
documentation. There are a few ways to streamline things:</p>
<ul>
<li>Git can be set up to use a keyring to store your GitHub personal access token.
Search online for the details.</li>
<li>You can use the <code>keyring</code> app to store the PyPI password for twine. See the
online twine documentation for details.</li>
</ul>
<h1>Prior to release</h1>
<h2>Add/drop Python versions</h2>
<p>When adding or dropping Python versions, three files need to be edited:</p>
<ul>
<li>.github/workflows/wheels.yml  # for github cibuildwheel</li>
<li>tools/ci/cirrus_wheels.yml  # for cibuildwheel aarch64/arm64 builds</li>
<li>pyproject.toml  # for classifier and minimum version check.</li>
</ul>
<p>Make these changes in an ordinary PR against main and backport if necessary.
Add <code>[wheel build]</code> at the end of the title line of the commit summary so
that wheel builds will be run to test the changes. We currently release wheels
for new Python versions after the first Python rc once manylinux and
cibuildwheel support it. For Python 3.11 we were able to release within a week
of the rc1 announcement.</p>
<h2>Backport pull requests</h2>
<p>Changes that have been marked for this release must be backported to the
maintenance/2.1.x branch.</p>
<h2>Update 2.1.0 milestones</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e7a123b</code></a> Merge pull request <a href="">#27928</a> from charris/prepare-2.2.0</li>
<li><a href=""><code>d97d071</code></a> MAINT: Try fixing MacOS cirrus build failures. [wheel build]</li>
<li><a href=""><code>1ed7b67</code></a> REL: Prepare for the NumPy 2.2.0 release [wheel build]</li>
<li><a href=""><code>fd9e7ef</code></a> Merge pull request <a href="">#27916</a> from charris/backport-27915</li>
<li><a href=""><code>2e0941f</code></a> MAINT: Bump actions/cache from 4.1.2 to 4.2.0</li>
<li><a href=""><code>013656d</code></a> Merge pull request <a href="">#27912</a> from charris/backport-27877</li>
<li><a href=""><code>7895ba6</code></a> Merge pull request <a href="">#27913</a> from charris/backport-27896</li>
<li><a href=""><code>ee8d1cd</code></a> PERF: improve multithreaded ufunc scaling (<a href="">#27896</a>)</li>
<li><a href=""><code>77fff6b</code></a> ENH: Refactor <code>__qualname__</code> across API (<a href="">#27877</a>)</li>
<li><a href=""><code>b30a338</code></a> Merge pull request <a href="">#27911</a> from charris/backport-27891</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v1.22.2...v2.2.0">compare view</a></li>
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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `158f984732b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.