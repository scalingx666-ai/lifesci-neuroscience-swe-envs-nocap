# Issue

**Title:** chore(deps): bump the build-dependencies group with 8 updates

## Description

Bumps the build-dependencies group with 8 updates:

| Package | From | To |
| --- | --- | --- |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.6.21` | `9.7.1` |
| [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) | `10.16.1` | `10.20` |
| [mkdocs-macros-plugin](https://github.com/fralau/mkdocs_macros_plugin) | `1.4.0` | `1.5.0` |
| [numpy](https://github.com/numpy/numpy) | `2.3.3` | `2.4.1` |
| [sphinx](https://github.com/sphinx-doc/sphinx) | `8.2.3` | `9.0.4` |
| [furo](https://github.com/pradyunsg/furo) | `2025.9.25` | `2025.12.19` |
| [myst-parser](https://github.com/executablebooks/MyST-Parser) | `4.0.1` | `5.0.0` |
| [universal-pathlib](https://github.com/fsspec/universal_pathlib) | `0.3.0` | `0.3.8` |

Updates `mkdocs-material` from 9.6.21 to 9.7.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.1</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is in maintenance mode</strong></p>
<p>Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs until November 2026.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li>Fixed privacy plugin not picking up protocol-relative URLs</li>
<li>Fixed <a href="">#8542</a>: false positives and negatives captured in privacy plugin</li>
</ul>
<h2>mkdocs-material-9.7.0</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is now in maintenance mode</strong></p>
<p>This is the last release of Material for MkDocs that will receive new features. Going forward, the Material for MkDocs team focuses on <a href="https://zensical.org">Zensical</a>, a next-gen static site generator built from first principles. We will provide critical bug fixes and security updates for Material for MkDocs for 12 months at least.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<p>This release includes all features that were previously exclusive to the Insiders edition. These features are now freely available to everyone.</p>
<p><strong>Note on deprecated plugins</strong>: The [projects] and [typeset] plugins are included in this release, but must be considered deprecated. Both plugins proved unsustainable to maintain and represent architectural dead ends. They are provided as-is without ongoing support.</p>
<p><strong>Changes</strong>:</p>
<ul>
<li>Added support for projects plugin (for compat, now deprecated)</li>
<li>Added support for typeset plugin (for compat, now deprecated)</li>
<li>Added support for pinned blog posts and author profiles</li>
<li>Added support for customizing pagination for blog index pages</li>
<li>Added support for customizing blog category sort order</li>
<li>Added support for staying on page when switching languages</li>
<li>Added support for disabling tags in table of contents</li>
<li>Added support for nested tags and shadow tags</li>
<li>Added support for footnote tooltips</li>
<li>Added support for instant previews</li>
<li>Added support for instant prefetching</li>
<li>Added support for custom social card layouts</li>
<li>Added support for custom social card background images</li>
<li>Added support for selectable rangs in code blocks</li>
<li>Added support for custom selectors for code annotations</li>
<li>Added support for configurable log level in privacy plugin</li>
<li>Added support for processing of external links in privacy plugin</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
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
<ul>
<li>Added support for pinned blog posts and author profiles</li>
<li>Added support for customizing pagination for blog index pages</li>
<li>Added support for customizing blog category sort order</li>
<li>Added support for staying on page when switching languages</li>
<li>Added support for disabling tags in table of contents</li>
<li>Added support for nested tags and shadow tags</li>
<li>Added support for footnote tooltips</li>
<li>Added support for instant previews</li>
<li>Added support for instant prefetching</li>
<li>Added support for custom social card layouts</li>
<li>Added support for custom social card background images</li>
<li>Added support for selectable rangs in code blocks</li>
<li>Added support for custom selectors for code annotations</li>
<li>Added support for configurable log level in privacy plugin</li>
<li>Added support for processing of external links in privacy plugin</li>
<li>Added support for automatic image optimization via optimize plugin</li>
<li>Added support for navigation paths (breadcrumbs)</li>
<li>Fixed <a href="">#8519</a>: Vector accents do not render when using KaTeX</li>
</ul>
<p>mkdocs-material-9.6.23 (2025-11-01)</p>
<ul>
<li>Updated Burmese translation</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7e236f6</code></a> Temporarily disable publishing</li>
<li><a href=""><code>3941491</code></a> Fixed CI</li>
<li><a href=""><code>034eaf7</code></a> Prepare 9.7.1 release</li>
<li><a href=""><code>79ba428</code></a> Fixed privacy plugin not picking up protocol-relative URLs</li>
<li><a href=""><code>61cad24</code></a> Updated dependencies</li>
<li><a href=""><code>dde13ce</code></a> Fixed false positives and negatives captured in privacy plugin  (<a href="">#8542</a>)</li>
<li><a href=""><code>291012d</code></a> Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li><a href=""><code>673d8ca</code></a> Fixed links</li>
<li><a href=""><code>1722784</code></a> Documentation</li>
<li><a href=""><code>aee925f</code></a> Fixed links</li>
<li>Additional commits viewable in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.6.21...9.7.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pymdown-extensions` from 10.16.1 to 10.20
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/pymdown-extensions/releases">pymdown-extensions's releases</a>.</em></p>
<blockquote>
<h2>10.20</h2>
<ul>
<li>
<p><strong>NEW</strong>: Quotes: New blockquotes extension added that uses a more modern approach when compared to Python Markdown's
default. Quotes specifically will not group consecutive blockquotes together in the same lazy fashion that the
default Python Markdown does which follows a more modern trend to how parsers these days handle block quotes.</p>
<p>In addition, Quotes also provides an optional feature to enable specifying callouts/alerts in the style used by
GitHub and Obsidian.</p>
</li>
</ul>
<h2>10.19.1</h2>
<ul>
<li><strong>FIX</strong>: Arithmatex: Fix issue where block <code>$$</code> math used inline within a paragraph could result in nested math
parsing.</li>
</ul>
<h2>10.19</h2>
<ul>
<li><strong>NEW</strong>: Emoji: Update Twemoji to use Unicode 16.</li>
<li><strong>NEW</strong>: Critic: Roll back <code>view</code> mode deprecation as some still like to use it, though further enhancements to this
mode are not planned.</li>
</ul>
<h2>10.18</h2>
<ul>
<li><strong>NEW</strong>: Critic: <code>view</code> mode has been deprecated. To avoid warnings or future issues, explicitly set <code>mode</code> to
either <code>accept</code> or <code>reject</code>. In the future, the new default will be <code>accept</code> and the <code>view</code> mode will be removed
entirely.</li>
<li><strong>FIX</strong>: Block Admonition: <code>important</code> should have always been available as a default.</li>
</ul>
<h2>10.17.2</h2>
<ul>
<li><strong>FIX</strong>: Blocks: Blocks extensions will now better handle nesting of indented style Admonitions, Details, and Tabbed
and other non-conflicting blocks.</li>
</ul>
<h2>10.17.1</h2>
<ul>
<li><strong>FIX</strong>: Fix an issue where Highlight can override another extension in the &quot;registered&quot; list in Python Markdown.</li>
</ul>
<h2>10.17</h2>
<ul>
<li><strong>NEW</strong>: Allow specifying static IDs in caption block headers via <code>#id</code> syntax.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7d5c4be</code></a> Quotes: Add nesting examples, fix some grammar, and add nesting test</li>
<li><a href=""><code>9d5b64a</code></a> Update notes about the new callouts</li>
<li><a href=""><code>531a77a</code></a> Docs: make line number hover stand out more</li>
<li><a href=""><code>0d7be84</code></a> Revert change to line wrapping</li>
<li><a href=""><code>6f9cb09</code></a> Wrap lines table format as well and adjust docs theme line highlight</li>
<li><a href=""><code>97f7166</code></a> Wrap Pygments lines with &lt;span&gt; to allow for better styling</li>
<li><a href=""><code>ad0d493</code></a> Update map</li>
<li><a href=""><code>753ddde</code></a> Tweak admonition colors</li>
<li><a href=""><code>7e686ee</code></a> Docs: Update JS deps</li>
<li><a href=""><code>2703d81</code></a> Add custom blockquote extension (<a href="">#2817</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/facelessuser/pymdown-extensions/compare/10.16.1...10.20">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-macros-plugin` from 1.4.0 to 1.5.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fralau/mkdocs-macros-plugin/blob/master/CHANGELOG.md">mkdocs-macros-plugin's changelog</a>.</em></p>
<blockquote>
<h2>1.5.0, 2025-11-13</h2>
<ul>
<li>Added: For each push, testing on github for versions Python 3.8 to 3.12</li>
<li>Fixed: bug in import of packages when not in source dir (<a href="">#278</a>)</li>
</ul>
<h2>1.4.1, 2025-10-18</h2>
<ul>
<li>Added: support for j2_extensions paramater in config file (<a href="">#272</a>)</li>
<li>Fixed: missing dependency declaration on <code>requests</code> (<a href="">#269</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0536f4d</code></a> Fix type hint for compatibility</li>
<li><a href=""><code>d9a6bc3</code></a> Require mkdocs-test&gt;=0.6.0 (compatibility with Python 3.8 and 3.9)</li>
<li><a href=""><code>bcaa72d</code></a> Make last minute corrections</li>
<li><a href=""><code>356fc2a</code></a> Prepare for release</li>
<li><a href=""><code>aaf16bd</code></a> Limit testing to 3.10 up (<a href="">#279</a>)</li>
<li><a href=""><code>ba5356c</code></a> Use proper exit for pytest if Python &lt; 3.10 (<a href="">#279</a>)</li>
<li><a href=""><code>6c79660</code></a> Skip test_modules.py if Python version &lt; 3.10 (<a href="">#279</a>)</li>
<li><a href=""><code>cec7440</code></a> Test installation of d2 in a cross-platform way (<a href="">#279</a>)</li>
<li><a href=""><code>492759c</code></a> Update with changes from local repo (<a href="">#278</a>)</li>
<li><a href=""><code>cc54168</code></a> Merge branch 'master' of github.com:fralau/mkdocs_macros_plugin</li>
<li>Additional commits viewable in <a href="https://github.com/fralau/mkdocs_macros_plugin/compare/v1.4.0...v1.5.0">compare view</a></li>
</ul>
</details>
<br />

Updates `numpy` from 2.3.3 to 2.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/releases">numpy's releases</a>.</em></p>
<blockquote>
<h2>2.4.1 (Jan 10, 2026)</h2>
<h1>NumPy 2.4.1 Release Notes</h1>
<p>The NumPy 2.4.1 is a patch release that fixes bugs discoved after the
2.4.0 release. In particular, the typo <code>SeedlessSequence</code> is preserved to
enable wheels using the random Cython API and built against NumPy &lt; 2.4.0
to run without errors.</p>
<p>This release supports Python versions 3.11-3.14</p>
<h2>Contributors</h2>
<p>A total of 9 people contributed to this release. People with a &quot;+&quot; by their
names contributed a patch for the first time.</p>
<ul>
<li>Alexander Shadchin</li>
<li>Bill Tompkins +</li>
<li>Charles Harris</li>
<li>Joren Hammudoglu</li>
<li>Marten van Kerkwijk</li>
<li>Nathan Goldbaum</li>
<li>Raghuveer Devulapalli</li>
<li>Ralf Gommers</li>
<li>Sebastian Berg</li>
</ul>
<h2>Pull requests merged</h2>
<p>A total of 15 pull requests were merged for this release.</p>
<ul>
<li><a href="">#30490</a>: MAINT: Prepare 2.4.x for further development</li>
<li><a href="">#30503</a>: DOC: <code>numpy.select</code>: fix <code>default</code> parameter docstring...</li>
<li><a href="">#30504</a>: REV: Revert part of <a href="">#30164</a> (<a href="">#30500</a>)</li>
<li><a href="">#30506</a>: TYP: <code>numpy.select</code>: allow passing array-like <code>default</code>...</li>
<li><a href="">#30507</a>: MNT: use if constexpr for compile-time branch selection</li>
<li><a href="">#30513</a>: BUG: Fix leak in flat assignment iterator</li>
<li><a href="">#30516</a>: BUG: fix heap overflow in fixed-width string multiply (<a href="">#30511</a>)</li>
<li><a href="">#30523</a>: BUG: Ensure summed weights returned by np.average always are...</li>
<li><a href="">#30527</a>: TYP: Fix return type of histogram2d</li>
<li><a href="">#30594</a>: MAINT: avoid passing ints to random functions that take double...</li>
<li><a href="">#30595</a>: BLD: Avoiding conflict with pygit2 for static build</li>
<li><a href="">#30596</a>: MAINT: Fix msvccompiler missing error on FreeBSD</li>
<li><a href="">#30608</a>: BLD: update vendored Meson to 1.9.2</li>
<li><a href="">#30620</a>: ENH: use more fine-grained critical sections in array coercion...</li>
<li><a href="">#30623</a>: BUG: Undo result type change of quantile/percentile but keep...</li>
</ul>
<h2>2.4.0 (Dec 20, 2025)</h2>
<h1>NumPy 2.4.0 Release Notes</h1>
<p>The NumPy 2.4.0 release continues the work to improve free threaded Python
support, user dtypes implementation, and annotations. There are many expired</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/numpy/numpy/blob/main/doc/RELEASE_WALKTHROUGH.rst">numpy's changelog</a>.</em></p>
<blockquote>
<p>This is a walkthrough of the NumPy 2.4.0 release on Linux, which will be the
first feature release using the <code>numpy/numpy-release &lt;https://github.com/numpy/numpy-release&gt;</code>__ repository.</p>
<p>The commands can be copied into the command line, but be sure to replace 2.4.0
with the correct version. This should be read together with the
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
<p>When adding or dropping Python versions, multiple config and CI files need to
be edited in addition to changing the minimum version in <code>pyproject.toml</code>.
Make these changes in an ordinary PR against main and backport if necessary.
We currently release wheels for new Python versions after the first Python RC
once manylinux and cibuildwheel support that new Python version.</p>
<h2>Backport pull requests</h2>
<p>Changes that have been marked for this release must be backported to the
maintenance/2.4.x branch.</p>
<h2>Update 2.4.0 milestones</h2>
<p>Look at the issues/prs with 2.4.0 milestones and either push them off to a
later version, or maybe remove the milestone. You may need to add a milestone.</p>
<p>Check the numpy-release repo</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d24bb7f</code></a> Merge pull request <a href="">#30624</a> from charris/prepare-for-2.4.1</li>
<li><a href=""><code>d3bfd6d</code></a> REL: Prepare for the NumPy 2.4.1 release</li>
<li><a href=""><code>abe3d86</code></a> Merge pull request <a href="">#30623</a> from charris/backport-30601</li>
<li><a href=""><code>5d89078</code></a> TST: Add test showing that q promotes (for &quot;interpolating ones&quot;)</li>
<li><a href=""><code>16890ce</code></a> BUG: Fix result type change and make weak q safe</li>
<li><a href=""><code>bf7ef0b</code></a> Merge pull request <a href="">#30620</a> from charris/backport-30514</li>
<li><a href=""><code>3d3af25</code></a> ENH: use more fine-grained critical sections in array coercion internals (<a href="">#30</a>...</li>
<li><a href=""><code>8b7f197</code></a> Merge pull request <a href="">#30608</a> from charris/update-vendored-meson</li>
<li><a href=""><code>30999f6</code></a> BLD: update vendored Meson to 1.9.2</li>
<li><a href=""><code>e6bea65</code></a> Merge pull request <a href="">#30596</a> from charris/remove-msvccompiler-check</li>
<li>Additional commits viewable in <a href="https://github.com/numpy/numpy/compare/v2.3.3...v2.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `sphinx` from 8.2.3 to 9.0.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-doc/sphinx/releases">sphinx's releases</a>.</em></p>
<blockquote>
<h2>Sphinx 9.0.4</h2>
<p>Changelog: <a href="https://www.sphinx-doc.org/en/master/changes/9.0.html">https://www.sphinx-doc.org/en/master/changes/9.0.html</a></p>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14143</a>: Fix spurious build warnings when translators reorder references
in strings, or use translated display text in references.
Patch by Matt Wang.</li>
</ul>
<h2>Sphinx 9.0.3</h2>
<p>Changelog: <a href="https://www.sphinx-doc.org/en/master/changes/9.0.html">https://www.sphinx-doc.org/en/master/changes/9.0.html</a></p>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14142</a>: autodoc: Restore some missing exports in <code>sphinx.ext.autodoc</code>.
Patch by Adam Turner.</li>
</ul>
<h2>Sphinx 9.0.2</h2>
<p>Changelog: <a href="https://www.sphinx-doc.org/en/master/changes/9.0.html">https://www.sphinx-doc.org/en/master/changes/9.0.html</a></p>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14142</a>: autodoc: Restore <code>sphinx.ext.autodoc.mock</code>.
Patch by Adam Turner.</li>
</ul>
<h2>Sphinx 9.0.1</h2>
<p>Changelog: <a href="https://www.sphinx-doc.org/en/master/changes/9.0.html">https://www.sphinx-doc.org/en/master/changes/9.0.html</a></p>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#13942</a>: autodoc: Restore the mapping interface for options objects.
Patch by Adam Turner.</li>
<li><a href="">#13942</a>: autodoc: Deprecate the mapping interface for options objects.
Patch by Adam Turner.</li>
<li><a href="">#13387</a>: Update translations.</li>
</ul>
<h2>Sphinx 9.0.0</h2>
<p>Changelog: <a href="https://www.sphinx-doc.org/en/master/changes/9.0.html">https://www.sphinx-doc.org/en/master/changes/9.0.html</a></p>
<h2>Dependencies</h2>
<ul>
<li><a href="">#13786</a>: Support <a href="https://docutils.sourceforge.io/RELEASE-NOTES.html#release-0-22-2026-07-29">Docutils 0.22</a>. Patch by Adam Turner.</li>
</ul>
<p>Incompatible changes</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-doc/sphinx/blob/v9.0.4/CHANGES.rst">sphinx's changelog</a>.</em></p>
<blockquote>
<h1>Release 9.0.4 (released Dec 04, 2025)</h1>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14143</a>: Fix spurious build warnings when translators reorder references
in strings, or use translated display text in references.
Patch by Matt Wang.</li>
</ul>
<h1>Release 9.0.3 (released Dec 04, 2025)</h1>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14142</a>: autodoc: Restore some missing exports in :mod:<code>!sphinx.ext.autodoc</code>.
Patch by Adam Turner.</li>
</ul>
<h1>Release 9.0.2 (released Dec 03, 2025)</h1>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#14142</a>: autodoc: Restore :mod:<code>!sphinx.ext.autodoc.mock</code>.
Patch by Adam Turner.</li>
</ul>
<h1>Release 9.0.1 (released Dec 01, 2025)</h1>
<h2>Bugs fixed</h2>
<ul>
<li><a href="">#13942</a>: autodoc: Restore the mapping interface for options objects.
Patch by Adam Turner.</li>
<li><a href="">#13942</a>: autodoc: Deprecate the mapping interface for options objects.
Patch by Adam Turner.</li>
<li><a href="">#13387</a>: Update translations.</li>
</ul>
<h1>Release 9.0.0 (released Nov 30, 2025)</h1>
<h2>Dependencies</h2>
<ul>
<li>
<p><a href="">#13786</a>: Support <code>Docutils 0.22</code>_. Patch by Adam Turner.</p>
<p>.. _Docutils 0.22: <a href="https://docutils.sourceforge.io/RELEASE-NOTES.html#release-0-22-2026-07-29">https://docutils.sourceforge.io/RELEASE-NOTES.html#release-0-22-2026-07-29</a></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8ddba7e</code></a> Bump to 9.0.4 final</li>
<li><a href=""><code>6959633</code></a> [bot]: Update message catalogues (<a href="">#14155</a>)</li>
<li><a href=""><code>88a4a97</code></a> Allow reordered refs and translated display text in pending_xref (<a href="">#14144</a>)</li>
<li><a href=""><code>f666208</code></a> Bump version</li>
<li><a href=""><code>df8a9e7</code></a> Bump to 9.0.3 final</li>
<li><a href=""><code>bd89f96</code></a> Import names from defining module</li>
<li><a href=""><code>7d05936</code></a> autodoc: Restore some missing exports</li>
<li><a href=""><code>b745a11</code></a> Bump version</li>
<li><a href=""><code>1ac581c</code></a> Bump to 9.0.2 final</li>
<li><a href=""><code>1281a83</code></a> autodoc: Restore <code>mock</code> module for compatibility (<a href="">#14152</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/sphinx-doc/sphinx/compare/v8.2.3...v9.0.4">compare view</a></li>
</ul>
</details>
<br />

Updates `furo` from 2025.9.25 to 2025.12.19
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pradyunsg/furo/releases">furo's releases</a>.</em></p>
<blockquote>
<h2>2025.12.19</h2>
<ul>
<li>Bump the supported Sphinx version range</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pradyunsg/furo/compare/2025.09.25...2025.12.19">https://github.com/pradyunsg/furo/compare/2025.09.25...2025.12.19</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pradyunsg/furo/blob/main/docs/changelog.md">furo's changelog</a>.</em></p>
<blockquote>
<h2>2025.12.19 -- Harmonious Honeydew</h2>
<ul>
<li>✨ Add support for Sphinx 9.</li>
<li>Drop support for Sphinx 6.</li>
</ul>
<h2>2025.09.25 -- Gleaming Green</h2>
<ul>
<li>Change the dark mode code back to <code>native</code>.</li>
</ul>
<h2>2025.07.19 -- Frozen Flame</h2>
<ul>
<li>✨ Switch to accessible-pygments themes</li>
<li>✨ Prefetch the sidebar logos</li>
<li>✨ Fix flickering header drop shadow on Safari</li>
<li>Add <code>rel=edit</code> attribute to &quot;Edit this page&quot; link/icon</li>
<li>Bump NodeJS and npm dependency versions</li>
<li>Bump Saas &amp; Webpack major versions</li>
<li>Improve current page detection to be resilient to sticky elements above header</li>
<li>Modernise Sass and use <code>@use</code> + <code>@forward</code></li>
<li>Remove top of code <code>border-radius</code> with captions</li>
<li>Remove &quot;debug printf&quot; for headerTop value</li>
<li>Use distinct images for light and dark mode in the documentation</li>
<li>Use the modern Saas Modules</li>
</ul>
<h2>2024.08.06 -- Energetic Eminence</h2>
<ul>
<li>✨ Add support for Sphinx 8</li>
<li>✨ Add smoother transitions between breakpoints</li>
<li>Increase specificity of table-wrapper selector</li>
<li>Avoid page breaks inside paragraphs</li>
</ul>
<h2>2024.07.18 -- Dull Denim</h2>
<ul>
<li>Improve how icons are handled and aligned.</li>
<li>Improve scroll event handler.</li>
<li>Hide the copybutton by default.</li>
<li>Fix <code>source_view_link</code> configuration handling.</li>
<li>Fix close tag on pencil icon.</li>
</ul>
<h2>2024.05.06 -- Cheerful Cerulean</h2>
<ul>
<li>✨ Add new custom icons for auto mode, reflecting the currently active theme.</li>
<li>✨ Add a view this page button.</li>
<li>✨ Add colours and highlighting to &quot;version modified&quot; API helpers.</li>
<li>✨ Add release information to various customisation knobs.</li>
<li>Make all icons bigger and use a thinner stroke with them.</li>
</ul>
<h2>2024.04.27 -- Bold Burgundy</h2>
<ul>
<li>Add a skip to content link.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dd9e9f9</code></a> Prepare release: 2025.12.19</li>
<li><a href=""><code>d43f7e9</code></a> Update changelog</li>
<li><a href=""><code>d27cab5</code></a> Bump the supported Sphinx version range</li>
<li><a href=""><code>12f288e</code></a> Back to development</li>
<li>See full diff in <a href="https://github.com/pradyunsg/furo/compare/2025.09.25...2025.12.19">compare view</a></li>
</ul>
</details>
<br />

Updates `myst-parser` from 4.0.1 to 5.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/MyST-Parser/releases">myst-parser's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<h1>MyST-Parser 5.0.0</h1>
<p><strong>Release Date</strong>: 2026-01-15</p>
<p>This release significantly bumps the supported versions of core dependencies:</p>
<h2>‼️ Breaking Changes</h2>
<p>This release updates the minimum supported versions:</p>
<ul>
<li><strong>Python</strong>: <code>&gt;=3.11</code> (dropped Python 3.10, tests up to 3.14)</li>
<li><strong>Sphinx</strong>: <code>&gt;=8,&lt;10</code> (dropped Sphinx 7, added Sphinx 9)</li>
<li><strong>Docutils</strong>: <code>&gt;=0.20,&lt;0.23</code> (dropped docutils 0.19, added docutils 0.22)</li>
<li><strong>markdown-it-py</strong>: <code>~=4.0</code> (upgraded from v3)</li>
</ul>
<h2>⬆️ Dependency Upgrades</h2>
<ul>
<li>⬆️ Upgrade to markdown-it-py v4 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1060</a></li>
<li>⬆️ Drop Python 3.10 and Sphinx 7 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1059</a></li>
<li>⬆️ Drop docutils 0.19 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1061</a></li>
<li>⬆️ Add support for Python 3.14 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1075</a></li>
<li>⬆️ Support Sphinx v9 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1076</a></li>
<li>⬆️ Allow docutils 0.22 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1084</a></li>
</ul>
<h2>👌 Improvements</h2>
<ul>
<li>👌 Improve generation of meta nodes by <a href="https://github.com/AA-Turner"><code>@​AA-Turner</code></a> in <a href="">#1080</a></li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>📚 Fix typo in tables.md by <a href="https://github.com/electricalgorithm"><code>@​electricalgorithm</code></a> in <a href="">#1034</a></li>
<li>📚 Fix minor typo in <code>cross-referencing.md</code> by <a href="https://github.com/krassowski"><code>@​krassowski</code></a> in <a href="">#1036</a></li>
</ul>
<h2>🔧 Internal / Maintenance</h2>
<ul>
<li>🔧 Update pre-commit by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1058</a></li>
<li>🔧 Add <code>AGENTS.md</code> by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">#1083</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/MyST-Parser/compare/v4.0.1...v5.0.0">v4.0.1...v5.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/MyST-Parser/blob/master/CHANGELOG.md">myst-parser's changelog</a>.</em></p>
<blockquote>
<h2>5.0.0 - 2026-01-15</h2>
<p>This release significantly bumps the supported versions of core dependencies:</p>
<h3>‼️ Breaking Changes</h3>
<p>This release updates the minimum supported versions:</p>
<ul>
<li><strong>Python</strong>: <code>&gt;=3.11</code> (dropped Python 3.10, tests up to 3.14)</li>
<li><strong>Sphinx</strong>: <code>&gt;=8,&lt;10</code> (dropped Sphinx 7, added Sphinx 9)</li>
<li><strong>Docutils</strong>: <code>&gt;=0.20,&lt;0.23</code> (dropped docutils 0.19, added docutils 0.22)</li>
<li><strong>markdown-it-py</strong>: <code>~=4.0</code> (upgraded from v3)</li>
</ul>
<h3>⬆️ Dependency Upgrades</h3>
<ul>
<li>⬆️ Upgrade to markdown-it-py v4 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1060">gh-pr:1060</a></li>
<li>⬆️ Drop Python 3.10 and Sphinx 7 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1059">gh-pr:1059</a></li>
<li>⬆️ Drop docutils 0.19 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1061">gh-pr:1061</a></li>
<li>⬆️ Add support for Python 3.14 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1075">gh-pr:1075</a></li>
<li>⬆️ Support Sphinx v9 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1076">gh-pr:1076</a></li>
<li>⬆️ Allow docutils 0.22 by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1084">gh-pr:1084</a></li>
</ul>
<h3>👌 Improvements</h3>
<ul>
<li>👌 Improve generation of meta nodes by <a href="gh-user:AA-Turner">gh-user:AA-Turner</a> in <a href="gh-pr:1080">gh-pr:1080</a></li>
</ul>
<h3>📚 Documentation</h3>
<ul>
<li>📚 Fix typo in tables.md by <a href="gh-user:electricalgorithm">gh-user:electricalgorithm</a> in <a href="gh-pr:1034">gh-pr:1034</a></li>
<li>📚 Fix minor typo in <code>cross-referencing.md</code> by <a href="gh-user:krassowski">gh-user:krassowski</a> in <a href="gh-pr:1036">gh-pr:1036</a></li>
</ul>
<h3>🔧 Internal / Maintenance</h3>
<ul>
<li>🔧 Update pre-commit by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1058">gh-pr:1058</a></li>
<li>🔧 Add <code>AGENTS.md</code> by <a href="gh-user:chrisjsewell">gh-user:chrisjsewell</a> in <a href="gh-pr:1083">gh-pr:1083</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/MyST-Parser/compare/v4.0.1...v5.0.0">v4.0.1...v5.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a139a1f</code></a> 🚀 Release v5.0.0 (<a href="">#1085</a>)</li>
<li><a href=""><code>5405110</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1071</a>)</li>
<li><a href=""><code>19512c0</code></a> ⬆️ Allow docutils 0.22 (<a href="">#1084</a>)</li>
<li><a href=""><code>a9e529f</code></a> ⬆️ Support Sphinx v9 (<a href="">#1076</a>)</li>
<li><a href=""><code>fcf78ca</code></a> 👌 Improve generation of meta nodes (<a href="">#1080</a>)</li>
<li><a href=""><code>e0fc7a3</code></a> 🔧 Add <code>AGENTS.md</code> (<a href="">#1083</a>)</li>
<li><a href=""><code>59d5384</code></a> ⬆️ Add support for Python 3.14 (<a href="">#1075</a>)</li>
<li><a href=""><code>7b7d961</code></a> ⬆️ Update pytest requirement from &lt;9,&gt;=8 to &gt;=9,&lt;10 (<a href="">#1063</a>)</li>
<li><a href=""><code>3342a3c</code></a> ⬆️ Update sphinxext-opengraph requirement from ~=0.9.0 to ~=0.13.0 (<a href="">#1066</a>)</li>
<li><a href=""><code>2cf85de</code></a> ⬆️ Update sphinxext-rediraffe requirement from ~=0.2.7 to ~=0.3.0 (<a href="">#1064</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/executablebooks/MyST-Parser/compare/v4.0.1...v5.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `universal-pathlib` from 0.3.0 to 0.3.8
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fsspec/universal_pathlib/releases">universal-pathlib's releases</a>.</em></p>
<blockquote>
<h2>v0.3.8</h2>
<h2>What's Changed</h2>
<ul>
<li>build(deps-dev): bump the pip-dependencies group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">fsspec/universal_pathlib#501</a></li>
<li>DOC: describe UPath/s3fs behavior with <code>is_dir()</code> by <a href="https://github.com/lagamura"><code>@​lagamura</code></a> in <a href="">fsspec/universal_pathlib#503</a></li>
<li>Do not hardcode Python executable name by <a href="https://github.com/avalentino"><code>@​avalentino</code></a> in <a href="">fsspec/universal_pathlib#504</a></li>
<li>tests: remove two unused helper functions introduced in <a href="">#492</a> by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#505</a></li>
<li>Fix iterdir behaviour when raising NotADirectory for all UPath subclasses by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#506</a></li>
<li>Fix error behavior for the hardlink_to backport and symlink_to for upath.extensions by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#508</a></li>
<li>Fix GitHub tests without a network connection by <a href="https://github.com/QuLogic"><code>@​QuLogic</code></a> in <a href="">fsspec/universal_pathlib#509</a></li>
<li>tests: split base test cases into joinable/readable/writable tests by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#507</a></li>
<li>upath.extensions: fix is_relative_to for extensions by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#510</a></li>
<li>Add missing pathlib abc tests by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#511</a></li>
<li>Split test suite according to abcs by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#513</a></li>
<li>Fix upath core touch by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#515</a></li>
<li>Handover fs instance in UPath.with_segments() if possible by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#516</a></li>
<li>Fix DataPath error handling for unsupported methods by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#517</a></li>
<li>Fix HTTPPath error handling for unsupported methods by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#518</a></li>
<li>upath.implementations.tar: fix error handling for write methods by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#519</a></li>
<li>upath.implementations.zip: disable write mode in universal-pathlib by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#520</a></li>
<li>upath.implementations.cloud: fix error handling on HfPath by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#521</a></li>
<li>upath.implementations.github: adjust GitHubPath error reporting by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#522</a></li>
<li>Refactor and cleanup test suite by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#514</a></li>
<li>tests: xfail on name resolution error in github suite by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#523</a></li>
<li>Fix behaviour of UPath.parent and UPath.parents by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#529</a></li>
<li>Adjust behavior of UPath.copy and UPath.copy_into with str and Path targets by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#530</a></li>
<li>Fix S3Path copy to Local: name collision of file / dir by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#533</a></li>
<li>cut release 0.3.8 by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#534</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/lagamura"><code>@​lagamura</code></a> made their first contribution in <a href="">fsspec/universal_pathlib#503</a></li>
<li><a href="https://github.com/avalentino"><code>@​avalentino</code></a> made their first contribution in <a href="">fsspec/universal_pathlib#504</a></li>
<li><a href="https://github.com/QuLogic"><code>@​QuLogic</code></a> made their first contribution in <a href="">fsspec/universal_pathlib#509</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fsspec/universal_pathlib/compare/v0.3.7...v0.3.8">https://github.com/fsspec/universal_pathlib/compare/v0.3.7...v0.3.8</a></p>
<h2>v0.3.7</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix typing example in README by <a href="https://github.com/mmwinther"><code>@​mmwinther</code></a> in <a href="">fsspec/universal_pathlib#484</a></li>
<li>add FTPPath implementation by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#485</a></li>
<li>upath: fix maintainer display on pypi by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#486</a></li>
<li>Catch and assert warnings in tests by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#487</a></li>
<li>Fix trailing slash behavior by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#488</a></li>
<li>Tests without network connection by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#492</a></li>
<li>Require .cwd() for relative paths in .rename() by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#493</a></li>
<li>Fix MemoryPath root by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#495</a></li>
<li>upath.core: deprecate keyword arguments for UPath.rename() by <a href="https://github.com/ap"><code>@​ap</code></a>-- in <a href="">fsspec/universal_pathlib#496</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mmwinther"><code>@​mmwinther</code></a> made their first contribution in <a href="">fsspec/universal_pathlib#484</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fsspec/universal_pathlib/blob/main/CHANGELOG.md">universal-pathlib's changelog</a>.</em></p>
<blockquote>
<h2>[0.3.8] - 2026-01-11</h2>
<h3>Added</h3>
<ul>
<li>tests: add missing pathlib abc tests (<a href="">#511</a>)</li>
<li>tests: split base test cases into joinable/readable/writable tests (<a href="">#507</a>)</li>
<li>docs: describe UPath/s3fs behavior with <code>is_dir()</code> (<a href="">#503</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>upath.implementations.cloud: fix S3Path copy to local with name collision of file/dir (<a href="">#533</a>)</li>
<li>upath.core: fix behaviour of <code>UPath.parent</code> and <code>UPath.parents</code> (<a href="">#529</a>)</li>
<li>upath.implementations.github: adjust GitHubPath error reporting (<a href="">#522</a>)</li>
<li>upath.implementations.cloud: fix error handling on HfPath (<a href="">#521</a>)</li>
<li>upath.implementations.zip: disable write mode in universal-pathlib (<a href="">#520</a>)</li>
<li>upath.implementations.tar: fix error handling for write methods (<a href="">#519</a>)</li>
<li>upath.implementations.http: fix HTTPPath error handling for unsupported methods (<a href="">#518</a>)</li>
<li>upath.implementations.data: fix DataPath error handling for unsupported methods (<a href="">#517</a>)</li>
<li>upath.core: fix <code>touch()</code> method (<a href="">#515</a>)</li>
<li>upath.extensions: fix <code>is_relative_to()</code> for extensions (<a href="">#510</a>)</li>
<li>upath.extensions: fix error behavior for <code>hardlink_to()</code> backport and <code>symlink_to()</code> (<a href="">#508</a>)</li>
<li>upath: fix <code>iterdir()</code> behaviour when raising NotADirectoryError for all UPath subclasses (<a href="">#506</a>)</li>
<li>tests: xfail on name resolution error in github suite (<a href="">#523</a>)</li>
<li>tests: fix GitHub tests without a network connection (<a href="">#509</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>upath: adjust behavior of <code>UPath.copy()</code> and <code>UPath.copy_into()</code> with str and Path targets (<a href="">#530</a>)</li>
<li>upath.core: handover cached fs instances in <code>with_segments()</code> (<a href="">#516</a>)</li>
<li>tests: split test suite according to abcs and cleanup tests (<a href="">#513</a>)</li>
<li>tests: remove two unused helper functions introduced in <a href="">#492</a> (<a href="">#505</a>)</li>
<li>ci: do not hardcode Python executable name (<a href="">#504</a>)</li>
<li>ci: updated development dependencies (<a href="">#501</a>)</li>
</ul>
<h2>[0.3.7] - 2025-12-03</h2>
<h3>Added</h3>
<ul>
<li>upath.implementations.ftp: added FTPPath support (<a href="">#485</a>)</li>
<li>tests: added comprehensive warning checks in test suite (<a href="">#487</a>)</li>
<li>tests: added xfail handling for network connectivity issues (<a href="">#492</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>upath: fixed trailing slash behavior for cloud paths (<a href="">#488</a>)</li>
<li>upath.core: fixed rename implementation for relative paths (<a href="">#493</a>)</li>
<li>upath.implementations.memory: fixed MemoryPath root (<a href="">#495</a>)</li>
<li>upath.implementations.ftp: added support for FTP modification time info format (<a href="">#485</a>)</li>
<li>upath.implementations.local: fixed rename return type on Python 3.14+ (<a href="">#493</a>)</li>
<li>upath.extensions: fixed .cwd() behavior for ProxyUPath (<a href="">#493</a>)</li>
<li>upath.extensions: fixed typing of .cwd() method (<a href="">#493</a>)</li>
<li>docs: fixed typing example in README (<a href="">#484</a>)</li>
<li>pypi: fixed maintainer display on PyPI (<a href="">#486</a>)</li>
</ul>
<h3>Changed</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>89d2e6d</code></a> cut release 0.3.8 (<a href="">#534</a>)</li>
<li><a href=""><code>c4c1fe3</code></a> Fix S3Path copy to Local: name collision of file / dir (<a href="">#533</a>)</li>
<li><a href=""><code>9ceaf2f</code></a> Adjust behavior of UPath.copy and UPath.copy_into with str and Path targets (...</li>
<li><a href=""><code>4ff77c7</code></a> Fix behaviour of UPath.parent and UPath.parents (<a href="">#529</a>)</li>
<li><a href=""><code>fb7703d</code></a> tests: xfail on name resolution error in github suite (<a href="">#523</a>)</li>
<li><a href=""><code>3fd061c</code></a> upath.implementations.github: adjust GitHubPath error reporting (<a href="">#522</a>)</li>
<li><a href=""><code>ef8888a</code></a> upath.implementations.cloud: fix error handling on HfPath (<a href="">#521</a>)</li>
<li><a href=""><code>043248d</code></a> upath.implementations.zip: disable write mode in universal-pathlib (<a href="">#520</a>)</li>
<li><a href=""><code>f9d9445</code></a> upath.implementations.tar: fix error handling for write methods (<a href="">#519</a>)</li>
<li><a href=""><code>22e598a</code></a> Fix HTTPPath error handling for unsupported methods (<a href="">#518</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/fsspec/universal_pathlib/compare/v0.3.0...v0.3.8">compare view</a></li>
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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fd10bb21b9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.