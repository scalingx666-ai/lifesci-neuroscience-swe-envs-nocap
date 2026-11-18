# Issue

**Title:** Update numpy requirement from <=2.2.2,>=1.16 to >=1.16,<=2.2.3

## Description

Updates the requirements on [numpy](https://github.com/numpy/numpy) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.2.3 (Feb 13, 2025)</h2>
<h1>NumPy 2.2.3 Release Notes</h1>
<p>NumPy 2.2.3 is a patch release that fixes bugs found after the 2.2.2
release. The majority of the changes are typing improvements and fixes
for free threaded Python. Both of those areas are still under
development, so if you discover new problems, please report them.</p>
<p>This release supports Python versions 3.10-3.13.</p>
<h2>Contributors</h2>
<p>A total of 9 people contributed to this release. People with a &quot;+&quot; by
their names contributed a patch for the first time.</p>
<ul>
<li>!amotzop</li>
<li>Charles Harris</li>
<li>Chris Sidebottom</li>
<li>Joren Hammudoglu</li>
<li>Matthew Brett</li>
<li>Nathan Goldbaum</li>
<li>Raghuveer Devulapalli</li>
<li>Sebastian Berg</li>
<li>Yakov Danishevsky +</li>
</ul>
<h2>Pull requests merged</h2>
<p>A total of 21 pull requests were merged for this release.</p>
<ul>
<li><a href="">#28185</a>: MAINT: Prepare 2.2.x for further development</li>
<li><a href="">#28201</a>: BUG: fix data race in a more minimal way on stable branch</li>
<li><a href="">#28208</a>: BUG: Fix <code>from_float_positional</code> errors for huge pads</li>
<li><a href="">#28209</a>: BUG: fix data race in np.repeat</li>
<li><a href="">#28212</a>: MAINT: Use VQSORT_COMPILER_COMPATIBLE to determine if we should...</li>
<li><a href="">#28224</a>: MAINT: update highway to latest</li>
<li><a href="">#28236</a>: BUG: Add cpp atomic support (<a href="">#28234</a>)</li>
<li><a href="">#28237</a>: BLD: Compile fix for clang-cl on WoA</li>
<li><a href="">#28243</a>: TYP: Avoid upcasting <code>float64</code> in the set-ops</li>
<li><a href="">#28249</a>: BLD: better fix for clang / ARM compiles</li>
<li><a href="">#28266</a>: TYP: Fix <code>timedelta64.__divmod__</code> and <code>timedelta64.__mod__</code>...</li>
<li><a href="">#28274</a>: TYP: Fixed missing typing information of set_printoptions</li>
<li><a href="">#28278</a>: BUG: backport resource cleanup bugfix from <a href="">gh-28273</a></li>
<li><a href="">#28282</a>: BUG: fix incorrect bytes to stringdtype coercion</li>
<li><a href="">#28283</a>: TYP: Fix scalar constructors</li>
<li><a href="">#28284</a>: TYP: stub <code>numpy.matlib</code></li>
<li><a href="">#28285</a>: TYP: stub the missing <code>numpy.testing</code> modules</li>
<li><a href="">#28286</a>: CI: Fix the github label for <code>TYP:</code> PR's and issues</li>
<li><a href="">#28305</a>: TYP: Backport typing updates from main</li>
<li><a href="">#28321</a>: BUG: fix race initializing legacy dtype casts</li>
<li><a href="">#28324</a>: CI: update test_moderately_small_alpha</li>
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
<li><a href=""><code>a274561</code></a> Merge pull request <a href="">#28322</a> from charris/prepare-2.2.3</li>
<li><a href=""><code>5ab0f71</code></a> REL: Prepare for the NumPy 2.2.3 release [wheel build]</li>
<li><a href=""><code>010ad9b</code></a> Merge pull request <a href="">#28324</a> from charris/update-test_dirichlet_moderately_small...</li>
<li><a href=""><code>6338746</code></a> CI: update test_moderately_small_alpha [wheel build]</li>
<li><a href=""><code>56f8d5b</code></a> Merge pull request <a href="">#28321</a> from charris/backport-28290</li>
<li><a href=""><code>48515a3</code></a> MAINT: Update some testing files from main</li>
<li><a href=""><code>96ca7e3</code></a> MAINT: respond to code review</li>
<li><a href=""><code>c20ac88</code></a> MAINT: use a try/finally to make the deadlock protection more robust</li>
<li><a href=""><code>d494647</code></a> MAINT: fix indentation and clarify comment</li>
<li><a href=""><code>3f8fbd6</code></a> MAINT: go back to try/except</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v1.16.0...v2.2.3">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93e9c1f44e38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.