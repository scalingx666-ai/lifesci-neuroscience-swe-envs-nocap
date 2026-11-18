# Issue

**Title:** Update numpy requirement from <=2.2.1,>=1.16 to >=1.16,<=2.2.2

## Description

Updates the requirements on [numpy](https://github.com/numpy/numpy) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.2.2 (Jan 18, 2025)</h2>
<h1>NumPy 2.2.2 Release Notes</h1>
<p>NumPy 2.2.2 is a patch release that fixes bugs found after the 2.2.1
release. The number of typing fixes/updates is notable. This release
supports Python versions 3.10-3.13.</p>
<h2>Contributors</h2>
<p>A total of 8 people contributed to this release. People with a &quot;+&quot; by
their names contributed a patch for the first time.</p>
<ul>
<li>Alicia Boya García +</li>
<li>Charles Harris</li>
<li>Joren Hammudoglu</li>
<li>Kai Germaschewski +</li>
<li>Nathan Goldbaum</li>
<li>PTUsumit +</li>
<li>Rohit Goswami</li>
<li>Sebastian Berg</li>
</ul>
<h2>Pull requests merged</h2>
<p>A total of 16 pull requests were merged for this release.</p>
<ul>
<li><a href="">#28050</a>: MAINT: Prepare 2.2.x for further development</li>
<li><a href="">#28055</a>: TYP: fix <code>void</code> arrays not accepting <code>str</code> keys in <code>__setitem__</code></li>
<li><a href="">#28066</a>: TYP: fix unnecessarily broad <code>integer</code> binop return types (<a href="">#28065</a>)</li>
<li><a href="">#28112</a>: TYP: Better <code>ndarray</code> binop return types for <code>float64</code> &amp;...</li>
<li><a href="">#28113</a>: TYP: Return the correct <code>bool</code> from <code>issubdtype</code></li>
<li><a href="">#28114</a>: TYP: Always accept <code>date[time]</code> in the <code>datetime64</code> constructor</li>
<li><a href="">#28120</a>: BUG: Fix auxdata initialization in ufunc slow path</li>
<li><a href="">#28131</a>: BUG: move reduction initialization to ufunc initialization</li>
<li><a href="">#28132</a>: TYP: Fix <code>interp</code> to accept and return scalars</li>
<li><a href="">#28137</a>: BUG: call PyType_Ready in f2py to avoid data races</li>
<li><a href="">#28145</a>: BUG: remove unnecessary call to PyArray_UpdateFlags</li>
<li><a href="">#28160</a>: BUG: Avoid data race in PyArray_CheckFromAny_int</li>
<li><a href="">#28175</a>: BUG: Fix f2py directives and --lower casing</li>
<li><a href="">#28176</a>: TYP: Fix overlapping overloads issue in 2-&gt;1 ufuncs</li>
<li><a href="">#28177</a>: TYP: preserve shape-type in ndarray.astype()</li>
<li><a href="">#28178</a>: TYP: Fix missing and spurious top-level exports</li>
</ul>
<h2>Checksums</h2>
<h3>MD5</h3>
<pre><code>749cb2adf8043551aae22bbf0ed3130a  numpy-2.2.2-cp310-cp310-macosx_10_9_x86_64.whl
bc79fa2e44316b7ce9bacb48a993ed91  numpy-2.2.2-cp310-cp310-macosx_11_0_arm64.whl
c6b2caa2bbb645b5950dccb77efb1dbb  numpy-2.2.2-cp310-cp310-macosx_14_0_arm64.whl
8c410efac169af880cacbbac8a731658  numpy-2.2.2-cp310-cp310-macosx_14_0_x86_64.whl
</code></pre>
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
<li><a href=""><code>fd8a68e</code></a> Merge pull request <a href="">#28184</a> from charris/prepare-2.2.2</li>
<li><a href=""><code>0d106a5</code></a> REL: Prepare for the NumPy 2.2.2 release [wheel build]</li>
<li><a href=""><code>dfdd35a</code></a> Merge pull request <a href="">#28175</a> from charris/backport-28056</li>
<li><a href=""><code>e4517a8</code></a> Merge pull request <a href="">#28176</a> from charris/backport-28168</li>
<li><a href=""><code>2c0432b</code></a> Merge pull request <a href="">#28178</a> from charris/backport-28170</li>
<li><a href=""><code>2230a08</code></a> Merge pull request <a href="">#28177</a> from charris/backport-28169</li>
<li><a href=""><code>b04e32c</code></a> TYP: Fix missing and spurious top-level exports</li>
<li><a href=""><code>6a5f537</code></a> TYP: preserve shape-type in ndarray.astype()</li>
<li><a href=""><code>f782790</code></a> TYP: Fix overlapping overloads issue in 2-&gt;1 ufuncs</li>
<li><a href=""><code>a19acf1</code></a> BUG: Fix casing for f2py directives</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v1.16.0...v2.2.2">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `213eead2b06d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.