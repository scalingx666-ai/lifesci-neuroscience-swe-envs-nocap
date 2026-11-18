# Issue

**Title:** Bump sphinx-argparse from 0.5.2 to 0.6.0

## Description

Bumps [sphinx-argparse](https://github.com/sphinx-doc/sphinx-argparse) from 0.5.2 to 0.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-doc/sphinx-argparse/releases">sphinx-argparse's releases</a>.</em></p>
<blockquote>
<h2>Release v0.6.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Added default feature to disable ArgumentParser coloring by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#74</a></li>
<li>Trying to fix RTD refusing to build by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#77</a></li>
<li>Moved color-disabling into <code>parse_parser</code> to fix subparsers by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#84</a></li>
<li>Unpinned ruff for CI + Cleaned up workflow files a little by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#79</a></li>
<li>Updated license metadata by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#81</a></li>
<li>Changed filename field to be explicit by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#88</a></li>
<li>Fixed MyPy by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#90</a></li>
<li>Added try-catch for autodoc mock-import by <a href="https://github.com/RobertoRoos"><code>@​RobertoRoos</code></a> in <a href="">sphinx-doc/sphinx-argparse#89</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/sphinx-doc/sphinx-argparse/compare/v0.5.2...v0.6.0">https://github.com/sphinx-doc/sphinx-argparse/compare/v0.5.2...v0.6.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-doc/sphinx-argparse/blob/main/docs/changelog.rst">sphinx-argparse's changelog</a>.</em></p>
<blockquote>
<p>0.6.0</p>
<h5></h5>
<p>The following enhancements to the HTML output are described on the :doc:<code>usage</code> page.</p>
<ul>
<li>Optional command index.</li>
<li>Optional <code>:index-groups:</code> field to the directive for an command-by-group index.</li>
<li>A <code>sphinxarg_full_subcommand_name</code> option to print fully-qualified sub-command headings.
This option helps when more than one sub-command offers a <code>create</code> or <code>list</code> or other
repeated sub-command.</li>
<li>Each command heading is a domain-specific link target.
You can link to commands and sub-commands with the <code>:ref:</code> role, but this
release adds support for the domain-specific role like
<code>:commands:command:`sample-directive-opts A` </code>.
The <code>:commands:command:</code> role supports linking from other projects through the
intersphinx extension.</li>
</ul>
<p>Changes</p>
<ul>
<li>Previously, common headings such as <strong>Positional Arguments</strong> were subject to a
process that made them unique by adding a <code>_repeatX</code> suffix to the HREF target.
This release continues to support those HREF targets as secondary targets so that
bookmarks continue to work.
However, this release prefers using fully-qualified HREF targets like
<code>sample-directive-opts-positional-arguments</code> as the primary HREF so that customers
are less likely to witness the <code>_repeatX</code> link in URLs.</li>
<li><code> &lt;</code>__ Argparse commands are now part of a Sphinx domain</li>
<li><code> &lt;</code>__ Coloring in argparse output can be disabled (default)</li>
<li><code> &lt;</code>__ The <code>:filename:</code> input is now resolved only to the
<code>conf.py</code> directory (<code>srcdir</code> in Sphinx)</li>
<li><code> &lt;</code>__ Changed the way <code>mock</code> from <code>autodoc</code> is important to
work around a persistent Sphinx bug</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f918d4e</code></a> Bumped version to 0.6.0</li>
<li><a href=""><code>9a74f45</code></a> Updated changelog</li>
<li><a href=""><code>8959ab6</code></a> Dropped Sphinx upper version limit</li>
<li><a href=""><code>0341103</code></a> Added try-catch for autodoc mock-import</li>
<li><a href=""><code>528aa98</code></a> Fixed mypy warning from CI</li>
<li><a href=""><code>abd20c5</code></a> Changed mypy python version to 3.13 + Fixed mypy in a test + Re-enabled mypy ...</li>
<li><a href=""><code>61b8bf0</code></a> Updated changelog</li>
<li><a href=""><code>de7c367</code></a> Removed pass from OSerror</li>
<li><a href=""><code>00964a3</code></a> Updated docs</li>
<li><a href=""><code>61365d0</code></a> Fixed tests through mock</li>
<li>Additional commits viewable in <a href="https://github.com/sphinx-doc/sphinx-argparse/compare/v0.5.2...v0.6.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94bd77ee5ac5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.