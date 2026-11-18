# Issue

**Title:** Update numpy requirement from <=2.2.3,>=1.16 to >=1.16,<=2.2.4

## Description

Updates the requirements on [numpy](https://github.com/numpy/numpy) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.2.4 (Mar 16, 2024)</h2>
<h1>NumPy 2.2.4 Release Notes</h1>
<p>NumPy 2.2.4 is a patch release that fixes bugs found after the 2.2.3
release. There are a large number of typing improvements, the rest of
the changes are the usual mix of bugfixes and platform maintenace.</p>
<p>This release supports Python versions 3.10-3.13.</p>
<h2>Contributors</h2>
<p>A total of 15 people contributed to this release. People with a &quot;+&quot; by
their names contributed a patch for the first time.</p>
<ul>
<li>Abhishek Kumar</li>
<li>Andrej Zhilenkov</li>
<li>Andrew Nelson</li>
<li>Charles Harris</li>
<li>Giovanni Del Monte</li>
<li>Guan Ming(Wesley) Chiu +</li>
<li>Jonathan Albrecht +</li>
<li>Joren Hammudoglu</li>
<li>Mark Harfouche</li>
<li>Matthieu Darbois</li>
<li>Nathan Goldbaum</li>
<li>Pieter Eendebak</li>
<li>Sebastian Berg</li>
<li>Tyler Reddy</li>
<li>lvllvl +</li>
</ul>
<h2>Pull requests merged</h2>
<p>A total of 17 pull requests were merged for this release.</p>
<ul>
<li><a href="">#28333</a>: MAINT: Prepare 2.2.x for further development.</li>
<li><a href="">#28348</a>: TYP: fix positional- and keyword-only params in astype, cross...</li>
<li><a href="">#28377</a>: MAINT: Update FreeBSD version and fix test failure</li>
<li><a href="">#28379</a>: BUG: numpy.loadtxt reads only 50000 lines when skip_rows &gt;= max_rows</li>
<li><a href="">#28385</a>: BUG: Make np.nonzero threading safe</li>
<li><a href="">#28420</a>: BUG: safer bincount casting (backport to 2.2.x)</li>
<li><a href="">#28422</a>: BUG: Fix building on s390x with clang</li>
<li><a href="">#28423</a>: CI: use QEMU 9.2.2 for Linux Qemu tests</li>
<li><a href="">#28424</a>: BUG: skip legacy dtype multithreaded test on 32 bit runners</li>
<li><a href="">#28435</a>: BUG: Fix searchsorted and CheckFromAny byte-swapping logic</li>
<li><a href="">#28449</a>: BUG: sanity check <code>__array_interface__</code> number of dimensions</li>
<li><a href="">#28510</a>: MAINT: Hide decorator from pytest traceback</li>
<li><a href="">#28512</a>: TYP: Typing fixes backported from <a href="">#28452</a>, <a href="">#28491</a>, <a href="">#28494</a></li>
<li><a href="">#28521</a>: TYP: Backport fixes from <a href="">#28505</a>, <a href="">#28506</a>, <a href="">#28508</a>, and <a href="">#28511</a></li>
<li><a href="">#28533</a>: TYP: Backport typing fixes from main (2)</li>
<li><a href="">#28534</a>: TYP: Backport typing fixes from main (3)</li>
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
<li><a href=""><code>3b37785</code></a> Merge pull request <a href="">#28543</a> from charris/prepare-2.2.4</li>
<li><a href=""><code>6f94b15</code></a> REL: Prepare for the NumPy 2.2.4 release [wheel build]</li>
<li><a href=""><code>1188650</code></a> Merge pull request <a href="">#28542</a> from charris/backport-typing-4</li>
<li><a href=""><code>18795c2</code></a> TYP: fix stubtest error in <code>numpy.ma</code> (<a href="">#28541</a>)</li>
<li><a href=""><code>110bb8e</code></a> TYP: fix typing errors in <code>numpy.ndarray</code> (<a href="">#28540</a>)</li>
<li><a href=""><code>bed0064</code></a> TYP: fix stubtest errors in <code>numpy.testing</code> (<a href="">#28539</a>)</li>
<li><a href=""><code>2ff0b88</code></a> TYP: fix stubtest errors in <code>numpy.random</code> (<a href="">#28538</a>)</li>
<li><a href=""><code>ecf97ae</code></a> TYP: fix stubtest errors in <code>numpy.mat[rix]lib</code> (<a href="">#28537</a>)</li>
<li><a href=""><code>5bdbd6d</code></a> TYP: fix stubtest errors in <code>numpy._globals</code> (<a href="">#28536</a>)</li>
<li><a href=""><code>8f561db</code></a> TYP: fix stubtest errors in <code>numpy._core</code> (<a href="">#28535</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v1.16.0...v2.2.4">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc9481913f96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.