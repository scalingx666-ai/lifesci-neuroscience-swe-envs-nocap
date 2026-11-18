# Issue

**Title:** chore(deps): bump the build-dependencies group across 1 directory with 5 updates

## Description

Bumps the build-dependencies group with 5 updates in the / directory:

| Package | From | To |
| --- | --- | --- |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.1` | `9.7.4` |
| [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) | `10.20` | `10.21` |
| [numpy](https://github.com/numpy/numpy) | `2.4.1` | `2.4.3` |
| [myst-nb](https://github.com/executablebooks/myst-nb) | `1.3.0` | `1.4.0` |
| [universal-pathlib](https://github.com/fsspec/universal_pathlib) | `0.3.8` | `0.3.10` |

Updates `mkdocs-material` from 9.7.1 to 9.7.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.4</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Hardened social cards plugin by switching to sandboxed environment (recommended by <a href="https://github.com/caveeroo"><code>@​caveeroo</code></a>)</li>
<li>Updated MkDocs 2.0 incompatibility warning</li>
</ul>
<h2>mkdocs-material-9.7.2</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to <code>mkdocs build</code> about impending MkDocs 2.0 incompatibility (doesn't affect strict mode)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.6 (2026-03-19)</p>
<ul>
<li>Automatically disable MkDocs 2.0 warning for forks of MkDocs</li>
</ul>
<p>mkdocs-material-9.7.5 (2026-03-10)</p>
<ul>
<li>Limited version range of mkdocs to &lt;2</li>
<li>Updated MkDocs 2.0 incompatibility warning (clarify relation with MkDocs)</li>
</ul>
<p>mkdocs-material-9.7.4 (2026-03-03)</p>
<ul>
<li>Hardened social cards plugin by switching to sandboxed environment</li>
<li>Updated MkDocs 2.0 incompatibility warning</li>
</ul>
<p>mkdocs-material-9.7.3 (2026-02-24)</p>
<ul>
<li>Fixed <a href="">#8567</a>: Print MkDocs 2.0 incompatibility warning to stderr</li>
</ul>
<p>mkdocs-material-9.7.2 (2026-02-18)</p>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to 'mkdocs build' about impending MkDocs 2.0 incompatibility</li>
</ul>
<p>mkdocs-material-9.7.1 (2025-12-18)</p>
<ul>
<li>Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li>Fixed privacy plugin not picking up protocol-relative URLs</li>
<li>Fixed <a href="">#8542</a>: false positives and negatives captured in privacy plugin</li>
</ul>
<p>mkdocs-material-9.7.0 (2025-11-11)</p>
<p>⚠️ Material for MkDocs is now in maintenance mode</p>
<p>This is the last release of Material for MkDocs that will receive new features.
Going forward, the Material for MkDocs team focuses on Zensical, a next-gen
static site generator built from first principles. We will provide critical
bug fixes and security updates for Material for MkDocs for 12 months at least.</p>
<p>Read the full announcement on our blog:
<a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/</a></p>
<p>This release includes all features that were previously exclusive to the
Insiders edition. These features are now freely available to everyone.</p>
<p>Note on deprecated plugins: The projects and typeset plugins are included in
this release, but must be considered deprecated. Both plugins proved
unsustainable to maintain and represent architectural dead ends. They are
provided as-is without ongoing support.</p>
<p>Changes:</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9580c28</code></a> Prepare 9.7.4 release</li>
<li><a href=""><code>4ae913c</code></a> Updated MkDocs 2.0 warning message</li>
<li><a href=""><code>fdf40c0</code></a> Bump minimatch (<a href="">#8570</a>)</li>
<li><a href=""><code>b368bed</code></a> Switched social card generator to sandboxed Jinja environment</li>
<li><a href=""><code>e2d0012</code></a> Updated blog post with note on environment variable</li>
<li><a href=""><code>fc7b41e</code></a> Updated changelog</li>
<li><a href=""><code>da5d442</code></a> Prepare 9.7.3 release</li>
<li><a href=""><code>03e8bae</code></a> Fixed order of imports</li>
<li><a href=""><code>70dee38</code></a> Switched warning message to print to stderr</li>
<li><a href=""><code>b78109b</code></a> Updated blog post on MkDocs 2.0</li>
<li>Additional commits viewable in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.1...9.7.4">compare view</a></li>
</ul>
</details>
<br />

Updates `pymdown-extensions` from 10.20 to 10.21
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/pymdown-extensions/releases">pymdown-extensions's releases</a>.</em></p>
<blockquote>
<h2>10.21</h2>
<ul>
<li><strong>NEW</strong>: Caption: Add support for specifying not only IDs but classes and arbitrary attributes. Initial work by
<a href="https://github.com/joapuiib"><code>@​joapuiib</code></a>.</li>
<li><strong>FIX</strong>: MagicLink: Fix a matching pattern for Bitbucket repo.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6d92b68</code></a> Bump version</li>
<li><a href=""><code>baeca0e</code></a> Docs: update JS deps</li>
<li><a href=""><code>bf2a237</code></a> Add classes and attributes to captions (<a href="">#2844</a>)</li>
<li><a href=""><code>5c69e05</code></a> Fix bitbucket reference (<a href="">#2835</a>)</li>
<li><a href=""><code>fa4a066</code></a> Fix spelling</li>
<li><a href=""><code>a69f671</code></a> Update docs</li>
<li><a href=""><code>1aa6f20</code></a> Ensure callouts always lowercases the first class (the alert type)</li>
<li><a href=""><code>66f95d7</code></a> Docs: Update JS deps</li>
<li><a href=""><code>44e4a12</code></a> Update readme</li>
<li><a href=""><code>e99fa9a</code></a> Remove override for &quot;back to top&quot; button box shadow</li>
<li>See full diff in <a href="https://github.com/facelessuser/pymdown-extensions/compare/10.20...10.21">compare view</a></li>
</ul>
</details>
<br />

Updates `numpy` from 2.4.1 to 2.4.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.4.3 (Mar 9, 2026)</h2>
<h1>NumPy 2.4.3 Release Notes</h1>
<p>The NumPy 2.4.3 is a patch release that fixes bugs discovered after the
2.4.2 release. The most user visible fix may be a threading fix for
OpenBLAS on ARM, closing issue <a href="">#30816</a>.</p>
<p>This release supports Python versions 3.11-3.14</p>
<h2>Contributors</h2>
<p>A total of 11 people contributed to this release. People with a &quot;+&quot; by their
names contributed a patch for the first time.</p>
<ul>
<li>Antareep Sarkar +</li>
<li>Charles Harris</li>
<li>Joren Hammudoglu</li>
<li>Matthieu Darbois</li>
<li>Matti Picus</li>
<li>Nathan Goldbaum</li>
<li>Peter Hawkins</li>
<li>Pieter Eendebak</li>
<li>Sebastian Berg</li>
<li>Warren Weckesser</li>
<li>stratakis +</li>
</ul>
<h2>Pull requests merged</h2>
<p>A total of 14 pull requests were merged for this release.</p>
<ul>
<li><a href="">#30759</a>: MAINT: Prepare 2.4.x for further development</li>
<li><a href="">#30827</a>: BUG: Fix some leaks found via LeakSanitizer (<a href="">#30756</a>)</li>
<li><a href="">#30841</a>: MAINT: Synchronize 2.4.x submodules with main</li>
<li><a href="">#30849</a>: TYP: <code>matlib</code>: missing extended precision imports</li>
<li><a href="">#30850</a>: BUG: Fix weak hash function in np.isin(). (<a href="">#30840</a>)</li>
<li><a href="">#30921</a>: BUG: fix infinite recursion in np.ma.flatten_structured_array...</li>
<li><a href="">#30922</a>: BUG: Fix buffer overrun in CPU baseline validation (<a href="">#30877</a>)</li>
<li><a href="">#30923</a>: BUG: Fix busdaycalendar's handling of a bool array weekmask....</li>
<li><a href="">#30924</a>: BUG: Fix reference leaks and NULL pointer dereferences (<a href="">#30908</a>)</li>
<li><a href="">#30925</a>: MAINT: fix two minor issues noticed when touching the C API setup</li>
<li><a href="">#30955</a>: ENH: Test .kind not .char in np.testing.assert_equal (<a href="">#30879</a>)</li>
<li><a href="">#30957</a>: BUG: fix type issues in uses if PyDataType macros</li>
<li><a href="">#30958</a>: MAINT: Don't use vulture 2.15, it has false positives</li>
<li><a href="">#30973</a>: MAINT: update openblas (<a href="">#30961</a>)</li>
</ul>
<h2>2.4.2 (Feb 1, 2026)</h2>
<h1>NumPy 2.4.2 Release Notes</h1>
<p>The NumPy 2.4.2 is a patch release that fixes bugs discovered after the
2.4.1 release. Highlights are:</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8bcb2e7</code></a> Merge pull request <a href="">#30974</a> from charris/prepare-2.4.3</li>
<li><a href=""><code>9a2b5ee</code></a> REL: Prepare for the NumPy 2.4.3 release</li>
<li><a href=""><code>a822ac2</code></a> Merge pull request <a href="">#30973</a> from charris/backport-30961</li>
<li><a href=""><code>039bf54</code></a> MAINT: update openblas (<a href="">#30961</a>)</li>
<li><a href=""><code>254bafa</code></a> Merge pull request <a href="">#30955</a> from charris/backport-30879</li>
<li><a href=""><code>0cc7d38</code></a> ENH: Test .kind not .char in np.testing.assert_equal (<a href="">#30879</a>)</li>
<li><a href=""><code>9ee571d</code></a> Merge pull request <a href="">#30957</a> from charris/backport-30918</li>
<li><a href=""><code>f302a16</code></a> Merge pull request <a href="">#30958</a> from charris/backport-30938</li>
<li><a href=""><code>d240a09</code></a> MAINT: Don't use vulture 2.15, it has false positives</li>
<li><a href=""><code>4fc08e9</code></a> MAINT: Don't use vulture 2.15, it has false positives</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v2.4.1...v2.4.3">compare view</a></li>
</ul>
</details>
<br />

Updates `myst-nb` from 1.3.0 to 1.4.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/myst-nb/releases">myst-nb's releases</a>.</em></p>
<blockquote>
<h2>v1.4.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>MAINT: post JB2 release fix by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#700</a></li>
<li>Fix dead link in error directive message by <a href="https://github.com/crespum"><code>@​crespum</code></a> in <a href="">executablebooks/MyST-NB#703</a></li>
<li>Improve theme integration by <a href="https://github.com/flying-sheep"><code>@​flying-sheep</code></a> in <a href="">executablebooks/MyST-NB#693</a></li>
<li>Update infrastructure for new pythons and prep for latest sphinx by <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> in <a href="">executablebooks/MyST-NB#706</a></li>
<li>Remove upper pin for Sphinx (and adding newer sphinx and python version to CI testing) by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#704</a></li>
<li>MAINT: default branch got renamed by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#711</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/crespum"><code>@​crespum</code></a> made their first contribution in <a href="">executablebooks/MyST-NB#703</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/MyST-NB/compare/v1.3.0...v1.4.0">https://github.com/executablebooks/MyST-NB/compare/v1.3.0...v1.4.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/MyST-NB/blob/main/CHANGELOG.md">myst-nb's changelog</a>.</em></p>
<blockquote>
<h2>v1.4.0 - 2026-03-02</h2>
<p>(<a href="https://github.com/executablebooks/MyST-NB/compare/v1.3.0...v1.4.0">full changelog</a>)</p>
<h3>What's Changed</h3>
<ul>
<li>MAINT: post JB2 release fix by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#700</a></li>
<li>Fix dead link in error directive message by <a href="https://github.com/crespum"><code>@​crespum</code></a> in <a href="">executablebooks/MyST-NB#703</a></li>
<li>Improve theme integration by <a href="https://github.com/flying-sheep"><code>@​flying-sheep</code></a> in <a href="">executablebooks/MyST-NB#693</a></li>
<li>Update infrastructure for new pythons and prep for latest sphinx by <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> in <a href="">executablebooks/MyST-NB#706</a></li>
<li>Remove upper pin for Sphinx (and adding newer sphinx and python version to CI testing) by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#704</a></li>
<li>MAINT: default branch got renamed by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">executablebooks/MyST-NB#711</a></li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/crespum"><code>@​crespum</code></a> made their first contribution in <a href="">executablebooks/MyST-NB#703</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a32f74</code></a> Preparing for release v1.4.0</li>
<li><a href=""><code>6199097</code></a> MAINT: default branch got renamed (<a href="">#711</a>)</li>
<li><a href=""><code>a0d0275</code></a> CI: testing python 3.14 and sphinx9 and docutils 0.22 (<a href="">#704</a>)</li>
<li><a href=""><code>68352d6</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#710</a>)</li>
<li><a href=""><code>d7012c4</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#708</a>)</li>
<li><a href=""><code>4f4096d</code></a> Update infrastructure for new pythons and prep for latest sphinx (<a href="">#706</a>)</li>
<li><a href=""><code>5e06ea0</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#707</a>)</li>
<li><a href=""><code>49e01eb</code></a> Improve theme integration (<a href="">#693</a>)</li>
<li><a href=""><code>531af65</code></a> Fix dead link (<a href="">#703</a>)</li>
<li><a href=""><code>8f5a1e7</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#702</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/executablebooks/myst-nb/compare/v1.3.0...v1.4.0">compare view</a></li>
</ul>
</details>
<br />

Updates `universal-pathlib` from 0.3.8 to 0.3.10
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fsspec/universal_pathlib/releases">universal-pathlib's releases</a>.</em></p>
<blockquote>
<h2>v0.3.10</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix ProxyUPath as copy or move target on 3.14+ by <a href="https://github.com/jpweytjens"><code>@​jpweytjens</code></a> in <a href="">fsspec/universal_pathlib#547</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/jpweytjens"><code>@​jpweytjens</code></a> made their first contribution in <a href="">fsspec/universal_pathlib#547</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fsspec/universal_pathlib/compare/v0.3.9...v0.3.10">https://github.com/fsspec/universal_pathlib/compare/v0.3.9...v0.3.10</a></p>
<h2>v0.3.9</h2>
<h2>What's Changed</h2>
<ul>
<li>Pydantic serialize proxyupath by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#538</a></li>
<li>upath.core: (backcompat) TypeError on protocol incompatibility by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#540</a></li>
<li>upath: update flavours by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">fsspec/universal_pathlib#512</a></li>
<li>Raise if using subclass directly with wrong protocol by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#541</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fsspec/universal_pathlib/compare/v0.3.8...v0.3.9">https://github.com/fsspec/universal_pathlib/compare/v0.3.8...v0.3.9</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fsspec/universal_pathlib/blob/main/CHANGELOG.md">universal-pathlib's changelog</a>.</em></p>
<blockquote>
<h2>[0.3.10] - 2026-02-22</h2>
<h3>Fixed</h3>
<ul>
<li>upath.extensions: fix ProxyUPath as copy or move target on 3.14+ (<a href="">#547</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>upath: updated flavours (<a href="">#545</a>)</li>
<li>ci: updated development dependencies (<a href="">#550</a>)</li>
</ul>
<h2>[0.3.9] - 2026-01-31</h2>
<h3>Fixed</h3>
<ul>
<li>upath.core: raise TypeError if using subclass directly with wrong protocol (<a href="">#541</a>)</li>
<li>upath.core: (backcompat) TypeError on protocol incompatibility (<a href="">#540</a>)</li>
<li>upath.extensions: Pydantic serialize ProxyUPath (<a href="">#538</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>upath: updated flavours (<a href="">#512</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>419c33c</code></a> cut release 0.3.10 (<a href="">#552</a>)</li>
<li><a href=""><code>ee8f013</code></a> build(deps-dev): bump huggingface-hub from 1.3.7 to 1.4.1 in the pip-dependen...</li>
<li><a href=""><code>6835bb1</code></a> Fix ProxyUPath as copy or move target on 3.14+ (<a href="">#547</a>)</li>
<li><a href=""><code>09a655f</code></a> upath: update flavour sources (<a href="">#545</a>)</li>
<li><a href=""><code>3a0df86</code></a> cut release 0.3.9 (<a href="">#543</a>)</li>
<li><a href=""><code>e44a8c7</code></a> Raise if using subclass directly with wrong protocol (<a href="">#541</a>)</li>
<li><a href=""><code>640ca44</code></a> upath._flavour_sources: bump the pip-dependencies group with 2 updates (<a href="">#512</a>)</li>
<li><a href=""><code>977544a</code></a> upath.core: (backcompat) TypeError on protocol incompatibility (<a href="">#540</a>)</li>
<li><a href=""><code>bc25303</code></a> Pydantic serialize ProxyUPath (<a href="">#538</a>)</li>
<li>See full diff in <a href="https://github.com/fsspec/universal_pathlib/compare/v0.3.8...v0.3.10">compare view</a></li>
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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88e0d1043ea7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.