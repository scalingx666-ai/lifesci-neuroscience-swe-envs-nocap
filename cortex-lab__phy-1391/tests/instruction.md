# Issue

**Title:** Bump the minor-and-patch group with 13 updates

## Description

Bumps the minor-and-patch group with 13 updates:

| Package | From | To |
| --- | --- | --- |
| [click](https://github.com/pallets/click) | `8.3.1` | `8.4.2` |
| [colorcet](https://github.com/holoviz/colorcet) | `3.1.0` | `3.2.1` |
| [matplotlib](https://github.com/matplotlib/matplotlib) | `3.10.8` | `3.10.9` |
| [pillow](https://github.com/python-pillow/Pillow) | `12.2.0` | `12.3.0` |
| [qtconsole](https://github.com/spyder-ide/qtconsole) | `5.7.1` | `5.7.2` |
| [requests](https://github.com/psf/requests) | `2.32.5` | `2.34.2` |
| [responses](https://github.com/getsentry/responses) | `0.26.0` | `0.26.2` |
| [tqdm](https://github.com/tqdm/tqdm) | `4.67.3` | `4.68.4` |
| [traitlets](https://github.com/ipython/traitlets) | `5.14.3` | `5.15.1` |
| [ipykernel](https://github.com/ipython/ipykernel) | `7.2.0` | `7.3.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.5` | `0.15.22` |
| [coverage](https://github.com/coveragepy/coveragepy) | `7.13.4` | `7.15.2` |
| [coveralls](https://github.com/TheKevJames/coveralls-python) | `4.0.1` | `4.1.0` |

Updates `click` from 8.3.1 to 8.4.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pallets/click/releases">click's releases</a>.</em></p>
<blockquote>
<h2>8.4.2</h2>
<p>This is the Click 8.4.1 fix release, which fixes bugs but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/click/8.4.2/">https://pypi.org/project/click/8.4.2/</a>
Changes: <a href="https://click.palletsprojects.com/page/changes/#version-8-4-2">https://click.palletsprojects.com/page/changes/#version-8-4-2</a>
Milestone: <a href="https://github.com/pallets/click/milestone/34">https://github.com/pallets/click/milestone/34</a></p>
<ul>
<li>Fix Fish shell completion broken in <code>8.4.0</code> by <a href="">#3126</a>. Newlines and
tabs in option help text are now escaped, keeping the original completion
format while still supporting multi-line help. <a href="">#3502</a>
<a href="">#3043</a> <a href="">#3504</a> <a href="">#3508</a></li>
<li>Deprecated commands and options with empty or missing help text no longer
render a stray leading space before the <code>(DEPRECATED)</code> label. <a href="">#3509</a></li>
<li>A {class}<code>Group</code> with <code>invoke_without_command=True</code> marks its subcommand as
optional in the usage help, showing <code>[COMMAND]</code> instead of <code>COMMAND</code>.
<a href="">#3059</a> <a href="">#3507</a></li>
<li><code>echo_via_pager</code> flushes after each write, so passing a generator streams
output to the pager incrementally instead of staying hidden until the pipe
buffer fills. <a href="">#3242</a> <a href="">#2542</a> <a href="">#3534</a></li>
<li><code>echo_via_pager</code> and <code>get_pager_file</code> no longer close a borrowed stdout
stream when no external pager runs, completing the partial
<code>I/O operation on closed file</code> fix from <a href="">#3482</a>. <a href="">#3449</a>
<a href="">#3533</a></li>
<li>Fix CLI usage symopsis for optional arguments producing double square brackets
<code>[[a|b|c]]...</code> whose type already brackets their metavar. <a href="">#3578</a></li>
<li>{func}<code>version_option</code> resolves a <code>package_name</code> that does not match an
installed distribution as an import (top-level module) name via
{func}<code>importlib.metadata.packages_distributions</code>. Packages whose
top-level module name differs from their distribution name (<code>PIL</code> vs
<code>Pillow</code>, <code>jwt</code> vs <code>PyJWT</code>) no longer raise <code>RuntimeError</code> out of the
box. <a href="">#2331</a> <a href="">#1884</a> <a href="">#3125</a> <a href="">#3582</a></li>
</ul>
<h2>8.4.1</h2>
<p>This is the Click 8.4.1 fix release, which fixes bugs but does not otherwise change behavior and should not result in breaking changes compared to the latest feature release.</p>
<p>PyPI: <a href="https://pypi.org/project/click/8.4.1/">https://pypi.org/project/click/8.4.1/</a>
Changes: <a href="https://click.palletsprojects.com/page/changes/#version-8-4-1">https://click.palletsprojects.com/page/changes/#version-8-4-1</a>
Milestone: <a href="https://github.com/pallets/click/milestone/32">https://github.com/pallets/click/milestone/32</a></p>
<ul>
<li><code>get_parameter_source()</code> is available during eager callbacks and type conversion again. <a href="">#3458</a> <a href="">#3484</a></li>
<li>Zsh completion scripts parse correctly on Windows. <a href="">#3277</a> # 3466</li>
<li>Shell completion of <code>Choice</code> <code>Enum</code> values produces a valid completion result. <a href="">#3015</a></li>
<li>Fix empty byte-string handling in echo. <a href="">#3487</a></li>
<li>Fix closed file error with <code>echo_via_pager</code>. <a href="">#3449</a></li>
</ul>
<h2>8.4.0</h2>
<p>This is the Click 8.4.0 feature release. A feature release may include new features, remove previously deprecated code, add new deprecation, or introduce potentially breaking changes.</p>
<p>We encourage everyone to upgrade. You can read more about our [Version Support Policy][version] on our website.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pallets/click/blob/main/CHANGES.md">click's changelog</a>.</em></p>
<blockquote>
<h2>Version 8.4.2</h2>
<p>Released 2026-06-24</p>
<ul>
<li>Fix Fish shell completion broken in <code>8.4.0</code> by {pr}<code>3126</code>. Newlines and
tabs in option help text are now escaped, keeping the original completion
format while still supporting multi-line help. {issue}<code>3502</code>
{issue}<code>3043</code> {pr}<code>3504</code> {pr}<code>3508</code></li>
<li>Deprecated commands and options with empty or missing help text no longer
render a stray leading space before the <code>(DEPRECATED)</code> label. {pr}<code>3509</code></li>
<li>A {class}<code>Group</code> with <code>invoke_without_command=True</code> marks its subcommand as
optional in the usage help, showing <code>[COMMAND]</code> instead of <code>COMMAND</code>.
{issue}<code>3059</code> {pr}<code>3507</code></li>
<li><code>echo_via_pager</code> flushes after each write, so passing a generator streams
output to the pager incrementally instead of staying hidden until the pipe
buffer fills. {issue}<code>3242</code> {issue}<code>2542</code> {pr}<code>3534</code></li>
<li><code>echo_via_pager</code> and <code>get_pager_file</code> no longer close a borrowed stdout
stream when no external pager runs, completing the partial
<code>I/O operation on closed file</code> fix from {pr}<code>3482</code>. {issue}<code>3449</code>
{pr}<code>3533</code></li>
<li>Fix CLI usage symopsis for optional arguments producing double square brackets
<code>[[a|b|c]]...</code> whose type already brackets their metavar. {pr}<code>3578</code></li>
<li>{func}<code>version_option</code> resolves a <code>package_name</code> that does not match an
installed distribution as an import (top-level module) name via
{func}<code>importlib.metadata.packages_distributions</code>. Packages whose
top-level module name differs from their distribution name (<code>PIL</code> vs
<code>Pillow</code>, <code>jwt</code> vs <code>PyJWT</code>) no longer raise <code>RuntimeError</code> out of the
box. {issue}<code>2331</code> {issue}<code>1884</code> {issue}<code>3125</code> {pr}<code>3582</code></li>
</ul>
<h2>Version 8.4.1</h2>
<p>Released 2026-05-21</p>
<ul>
<li><code>get_parameter_source()</code> is available during eager callbacks and type
conversion again. {issue}<code>3458</code> {pr}<code>3484</code></li>
<li>Zsh completion scripts parse correctly on Windows. {issue}<code>3277</code> {pr}<code>3466</code></li>
<li>Shell completion of <code>Enum</code> values used as <code>Choice</code> options produces a
valid completion result. {issue}<code>3015</code> {pr}<code>3471</code></li>
<li>Fix empty byte-string handling in echo. {issue}<code>3487</code> {pr}<code>3493</code></li>
<li>Fix closed file error with <code>echo_via_pager</code>. {issue}<code>3449</code> {pr}<code>3482</code></li>
<li>Fix <code>open_url</code> on Windows when the file path contains spaces.
{issue}<code>2994</code> {pr}<code>3478</code></li>
</ul>
<h2>Version 8.4.0</h2>
<p>Released 2026-05-17</p>
<ul>
<li>
<p>{class}<code>ParamType</code> typing improvements. {pr}<code>3371</code></p>
<ul>
<li>{class}<code>ParamType</code> is now a generic abstract base class,</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b2e30a1</code></a> Release version 8.4.2</li>
<li><a href=""><code>7a16b20</code></a> Fix <code>package_name</code> resolution when module differs from distribution name (<a href="">#3582</a>)</li>
<li><a href=""><code>bec5928</code></a> Fix <code>package_name</code> resolution when top-level module differs from distribution...</li>
<li><a href=""><code>916883a</code></a> Fix tests to not rely on <code>-Wdefault</code> option (<a href="">#3591</a>)</li>
<li><a href=""><code>09195f6</code></a> Fix double-bracketing of choices in synopsis (<a href="">#3578</a>)</li>
<li><a href=""><code>1557e26</code></a> Check for warning exception with idiomatic context manager</li>
<li><a href=""><code>d9ff133</code></a> Static typing improvements in <code>click.shell_completion</code> (<a href="">#3460</a>)</li>
<li><a href=""><code>762c97e</code></a> Fix double-bracketing of choices in synopsis</li>
<li><a href=""><code>8929d39</code></a> Convert changes to markdown. (<a href="">#3559</a>)</li>
<li><a href=""><code>237be50</code></a> Move changes headings down a level.</li>
<li>Additional commits viewable in <a href="https://github.com/pallets/click/compare/8.3.1...8.4.2">compare view</a></li>
</ul>
</details>
<br />

Updates `colorcet` from 3.1.0 to 3.2.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/holoviz/colorcet/releases">colorcet's releases</a>.</em></p>
<blockquote>
<h2>Version 3.2.1</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: typing Protocol not being able to instantiate on 3.10 by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#153</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/holoviz/colorcet/compare/v3.2.0...v3.2.1">https://github.com/holoviz/colorcet/compare/v3.2.0...v3.2.1</a></p>
<h2>Version 3.2.0</h2>
<h2>What's Changed</h2>
<ul>
<li>CI: skip Python 3.7 on MacOs by <a href="https://github.com/maximlt"><code>@​maximlt</code></a> in <a href="">holoviz/colorcet#123</a></li>
<li>ci: Fix ci by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#127</a></li>
<li>Support Python 3.13 by <a href="https://github.com/bersbersbers"><code>@​bersbersbers</code></a> in <a href="">holoviz/colorcet#126</a></li>
<li>Migrate colorcet to using pixi for development by <a href="https://github.com/Azaya89"><code>@​Azaya89</code></a> in <a href="">holoviz/colorcet#128</a></li>
<li>ci: Fix build step by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#129</a></li>
<li>Drop support for python versions &lt;3.9 by <a href="https://github.com/Azaya89"><code>@​Azaya89</code></a> in <a href="">holoviz/colorcet#131</a></li>
<li>Broken links: update Continuous.ipynb to fix broken link to test image. by <a href="https://github.com/Coderambling"><code>@​Coderambling</code></a> in <a href="">holoviz/colorcet#134</a></li>
<li>Add Type Hints to core module by <a href="https://github.com/Azaya89"><code>@​Azaya89</code></a> in <a href="">holoviz/colorcet#133</a></li>
<li>Include Python 3.13 in the CI by <a href="https://github.com/maximlt"><code>@​maximlt</code></a> in <a href="">holoviz/colorcet#135</a></li>
<li>Fix image link by <a href="https://github.com/myd7349"><code>@​myd7349</code></a> in <a href="">holoviz/colorcet#136</a></li>
<li>Update README links to use https by <a href="https://github.com/myd7349"><code>@​myd7349</code></a> in <a href="">holoviz/colorcet#137</a></li>
<li>Update index.ipynb by <a href="https://github.com/gilan6"><code>@​gilan6</code></a> in <a href="">holoviz/colorcet#139</a></li>
<li>Python 3.14 support by <a href="https://github.com/bersbersbers"><code>@​bersbersbers</code></a> in <a href="">holoviz/colorcet#141</a></li>
<li>compat: Remove rc for Python 3.14 by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#142</a></li>
<li>Updated membership by <a href="https://github.com/jbednar"><code>@​jbednar</code></a> in <a href="">holoviz/colorcet#143</a></li>
<li>Add <a href="https://github.com/maximlt"><code>@​maximlt</code></a> to the list of maintainers by <a href="https://github.com/maximlt"><code>@​maximlt</code></a> in <a href="">holoviz/colorcet#144</a></li>
<li>ci: Update github action versions and add downstream option by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#147</a></li>
<li>type: Also type check with TY by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#148</a></li>
<li>chore: Use Ruff for linting by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#149</a></li>
<li>chore!: Drop Python 3.9 EOL by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#150</a></li>
<li>build: Align infrastructure with other repos by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#151</a></li>
<li>update readme to work on PyPI by <a href="https://github.com/hoxbro"><code>@​hoxbro</code></a> in <a href="">holoviz/colorcet#152</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/bersbersbers"><code>@​bersbersbers</code></a> made their first contribution in <a href="">holoviz/colorcet#126</a></li>
<li><a href="https://github.com/Azaya89"><code>@​Azaya89</code></a> made their first contribution in <a href="">holoviz/colorcet#128</a></li>
<li><a href="https://github.com/Coderambling"><code>@​Coderambling</code></a> made their first contribution in <a href="">holoviz/colorcet#134</a></li>
<li><a href="https://github.com/myd7349"><code>@​myd7349</code></a> made their first contribution in <a href="">holoviz/colorcet#136</a></li>
<li><a href="https://github.com/gilan6"><code>@​gilan6</code></a> made their first contribution in <a href="">holoviz/colorcet#139</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/holoviz/colorcet/compare/v3.1.0...v3.2.0">https://github.com/holoviz/colorcet/compare/v3.1.0...v3.2.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2b6006d</code></a> fix: typing Protocol not being able to instantiated on 3.10 (<a href="">#153</a>)</li>
<li><a href=""><code>d2a5d26</code></a> one more fix</li>
<li><a href=""><code>400d12d</code></a> update readme to work on PyPI (<a href="">#152</a>)</li>
<li><a href=""><code>a19fd35</code></a> build: Align infrastructure with other repos (<a href="">#151</a>)</li>
<li><a href=""><code>6a49ddc</code></a> chore!: Drop Python 3.9 EOL (<a href="">#150</a>)</li>
<li><a href=""><code>e60d447</code></a> chore: Use Ruff for linting (<a href="">#149</a>)</li>
<li><a href=""><code>43083b8</code></a> type: Also type check with TY (<a href="">#148</a>)</li>
<li><a href=""><code>26e08e3</code></a> ci: Update github action versions and add downstream option (<a href="">#147</a>)</li>
<li><a href=""><code>2370e6e</code></a> Add <a href="https://github.com/maximlt"><code>@​maximlt</code></a> to the list of maintainers (<a href="">#144</a>)</li>
<li><a href=""><code>53b0322</code></a> Updated membership (<a href="">#143</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/holoviz/colorcet/compare/v3.1.0...v3.2.1">compare view</a></li>
</ul>
</details>
<br />

Updates `matplotlib` from 3.10.8 to 3.10.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>v3.10.9</h2>
<p>This is a micro release of the v3.10.x series.
Highlights of this release include:</p>
<ul>
<li>Various minor bug and doc fixes</li>
<li>Security hardening validation of cyclers - Removing eval usage</li>
<li>Security hardening in Latex and PS calls - Removing shell escapes</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dd8d78b</code></a> REL: v3.10.9</li>
<li><a href=""><code>2fb1891</code></a> REL: Release prep v3.10.9</li>
<li><a href=""><code>d0e923a</code></a> Merge branch 'v3.10.8-doc' into v3.10.x</li>
<li><a href=""><code>1637932</code></a> Merge pull request <a href="">#31558</a> from meeseeksmachine/auto-backport-of-pr-31556-on-v...</li>
<li><a href=""><code>a83faac</code></a> Backport PR <a href="">#31556</a>: FIX: Inverted PyErr_Occurred check in enum type caster (_...</li>
<li><a href=""><code>a4f57ab</code></a> Merge pull request <a href="">#31545</a> from ksunden/backport-of-pr-31282-on-v3.10.x</li>
<li><a href=""><code>063288d</code></a> Merge pull request <a href="">#31544</a> from ksunden/backport-of-pr-31248-on-v3.10.x</li>
<li><a href=""><code>b2ed196</code></a> Backport PR <a href="">#31248</a>: SEC: Remove eval() from validate_cycler</li>
<li><a href=""><code>acc6024</code></a> Merge pull request <a href="">#31282</a> from scottshambaugh/tex_no_shell</li>
<li><a href=""><code>e3fb541</code></a> Merge pull request <a href="">#31078</a> from meeseeksmachine/auto-backport-of-pr-31075-on-v...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.8...v3.10.9">compare view</a></li>
</ul>
</details>
<br />

Updates `pillow` from 12.2.0 to 12.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.3.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.3.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.3.0.html</a></p>
<h2>Removals</h2>
<ul>
<li>Remove non-image ImageCms modes <a href="">#9697</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>Add release notes for SBOM and performance improvements <a href="">#9747</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add security release notes <a href="">#9741</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add release notes for Python 3.15 beta wheels <a href="">#9696</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>ImageFont can also be used with ImageText <a href="">#9597</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Additional guidelines for security reports <a href="">#9659</a> [<a href="https://github.com/wiredfool"><code>@​wiredfool</code></a>]</li>
<li>Fixed typo <a href="">#9636</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added CVEs to 12.2.0 release notes <a href="">#9591</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Revise development support information in README <a href="">#9583</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add INCIDENT_RESPONSE.md <a href="">#9555</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add STRIDE threat model to security docs <a href="">#9562</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add CVEs to 12.2.0 release notes <a href="">#9556</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update README with revised security policy <a href="">#9553</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update security policy <a href="">#9552</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Update macOS tested Python versions <a href="">#9534</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Update dependency harfbuzz to v14.2.1 <a href="">#9720</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency mypy to v2 <a href="">#9653</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency cibuildwheel to v4 <a href="">#9665</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update github-actions <a href="">#9655</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency libavif to v1.4.2 <a href="">#9652</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency lcms2 to v2.19.1 <a href="">#9651</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency check-jsonschema to v0.37.2 <a href="">#9650</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update google/oss-fuzz digest to d872252 <a href="">#9614</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency lcms2 to v2.19 <a href="">#9609</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency libpng to v1.6.58 - autoclosed <a href="">#9608</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency harfbuzz to v14 <a href="">#9610</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency mypy to v1.20.2 <a href="">#9599</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update github-actions <a href="">#9611</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency cibuildwheel to v3.4.1 <a href="">#9607</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Move dependency versions to single JSON and enable Renovate <a href="">#9559</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Updated raqm to 0.10.5 <a href="">#9557</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency cibuildwheel to v3.4.0 <a href="">#9532</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Remove matrix.os from benchmark <a href="">#9735</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Remove references to libavif patch <a href="">#9734</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add benchmark tests <a href="">#9654</a> [<a href="https://github.com/akx"><code>@​akx</code></a>]</li>
<li>Use reshape() instead of setting NumPy array shape directly <a href="">#9728</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bb1d8e8</code></a> 12.3.0 version bump</li>
<li><a href=""><code>e63fc48</code></a> Add release notes for SBOM and performance improvements (<a href="">#9747</a>)</li>
<li><a href=""><code>13b701b</code></a> Add release notes for <a href="">#9679</a></li>
<li><a href=""><code>5564ca7</code></a> List methods</li>
<li><a href=""><code>a0920fd</code></a> Speed up ImageChops operations (<a href="">#9738</a>)</li>
<li><a href=""><code>07e9a6c</code></a> Speed up <code>Image.filter()</code> (<a href="">#9736</a>)</li>
<li><a href=""><code>a94578c</code></a> Speed up <code>Image.getchannel()</code>, <code>Image.merge()</code>, <code>Image.putalpha()</code> and `Image...</li>
<li><a href=""><code>53e02c4</code></a> Speed up <code>Image.fill()</code>, <code>Image.linear_gradient()</code> and `Image.radial_gradient...</li>
<li><a href=""><code>af03747</code></a> Speed up <code>Image.resample()</code> (<a href="">#9739</a>)</li>
<li><a href=""><code>5c9ca56</code></a> Speed up <code>alpha_composite</code>, <code>matrix</code>, <code>negative</code>, <code>quantize</code> (<a href="">#9740</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/12.2.0...12.3.0">compare view</a></li>
</ul>
</details>
<br />

Updates `qtconsole` from 5.7.1 to 5.7.2
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ca38efd</code></a> Release 5.7.2</li>
<li><a href=""><code>d8b014e</code></a> Update Changelog</li>
<li><a href=""><code>5f63c90</code></a> Add ANSI codes to show/hide cursor (<a href="">#650</a>)</li>
<li><a href=""><code>7caae7c</code></a> Back to work</li>
<li>See full diff in <a href="https://github.com/spyder-ide/qtconsole/compare/5.7.1...5.7.2">compare view</a></li>
</ul>
</details>
<br />

Updates `requests` from 2.32.5 to 2.34.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.34.2</h2>
<h2>2.34.2 (2026-05-14)</h2>
<ul>
<li>Moved <code>headers</code> input type back to <code>Mapping</code> to avoid invariance issues with <code>MutableMapping</code> and inferred dict types. Users calling <code>Request.headers.update()</code> may need to narrow typing in their code. (<a href="">#7441</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2342-2026-05-14">https://github.com/psf/requests/blob/main/HISTORY.md#2342-2026-05-14</a></p>
<h2>v2.34.1</h2>
<h2>2.34.1 (2026-05-13)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Widened <code>json</code> input type from <code>dict</code> and <code>list</code> to <code>Mapping</code>
and <code>Sequence</code>. (<a href="">#7436</a>)</li>
<li>Changed <code>headers</code> input type to MutableMapping and removed <code>None</code> from
<code>Request.headers</code> typing to improve handling for users. (<a href="">#7431</a>)</li>
<li><code>Response.reason</code> moved from <code>str | None</code> to <code>str</code> to improve handling
for users. (<a href="">#7437</a>)</li>
<li>Fixed a bug where some bodies with custom <code>__getattr__</code> implementations
weren't being properly detected as Iterables. (<a href="">#7433</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/k223kim"><code>@​k223kim</code></a> made their first contribution in <a href="">psf/requests#7433</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2341-2026-05-13">https://github.com/psf/requests/blob/main/HISTORY.md#2341-2026-05-13</a></p>
<h2>v2.34.0</h2>
<h2>2.34.0 (2026-05-11)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>
<p>Requests 2.34.0 introduces inline types, replacing those provided by
typeshed. Public API types should be fully compatible with mypy, pyright,
and ty. <strong>We believe types are comprehensive but if you find issues, please
report them to the <a href="">pinned tracking issue</a>.</strong></p>
<p>Special thanks to <a href="https://github.com/bastimeyer"><code>@​bastimeyer</code></a>, <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a>, <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a>, and <a href="https://github.com/srittau"><code>@​srittau</code></a> for
helping review and test the types ahead of the release. (<a href="">#7272</a>)</p>
</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Digest Auth hashing algorithms have added <code>usedforsecurity=False</code> to clarify
security considerations. (<a href="">#7310</a>)</li>
<li>Requests added support for Python 3.15 based on beta1. Downstream projects
should be able to start testing prior to its release in October. (<a href="">#7422</a>)</li>
<li>Requests added support for Python 3.14t. (<a href="">#7419</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li><code>Response.history</code> no longer contains a reference to itself, preventing
accidental looping when traversing the history list. (<a href="">#7328</a>)</li>
<li>Requests no longer performs greedy matching on no_proxy domains. The</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.34.2 (2026-05-14)</h2>
<ul>
<li>Moved <code>headers</code> input type back to <code>Mapping</code> to avoid invariance issues
with <code>MutableMapping</code> and inferred dict types. Users calling
<code>Request.headers.update()</code> may need to narrow typing in their code. (<a href="">#7441</a>)</li>
</ul>
<h2>2.34.1 (2026-05-13)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Widened <code>json</code> input type from <code>dict</code> and <code>list</code> to <code>Mapping</code>
and <code>Sequence</code>. (<a href="">#7436</a>)</li>
<li>Changed <code>headers</code> input type to MutableMapping and removed <code>None</code> from
<code>Request.headers</code> typing to improve handling for users. (<a href="">#7431</a>)</li>
<li><code>Response.reason</code> moved from <code>str | None</code> to <code>str</code> to improve handling
for users. (<a href="">#7437</a>)</li>
<li>Fixed a bug where some bodies with custom <code>__getattr__</code> implementations
weren't being properly detected as Iterables. (<a href="">#7433</a>)</li>
</ul>
<h2>2.34.0 (2026-05-11)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>
<p>Requests 2.34.0 introduces inline types, replacing those provided by
typeshed. Public API types should be fully compatible with mypy, pyright,
and ty. We believe types are comprehensive but if you find issues, please
report them to the pinned tracking issue.</p>
<p>Special thanks to <a href="https://github.com/bastimeyer"><code>@​bastimeyer</code></a>, <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a>, <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a>, and <a href="https://github.com/srittau"><code>@​srittau</code></a> for
helping review and test the types ahead of the release. (<a href="">#7272</a>)</p>
</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Digest Auth hashing algorithms have added <code>usedforsecurity=False</code> to clarify
security considerations. (<a href="">#7310</a>)</li>
<li>Requests added support for Python 3.15 based on beta1. Downstream projects
should be able to start testing prior to its release in October. (<a href="">#7422</a>)</li>
<li>Requests added support for Python 3.14t. (<a href="">#7419</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li><code>Response.history</code> no longer contains a reference to itself, preventing
accidental looping when traversing the history list. (<a href="">#7328</a>)</li>
<li>Requests no longer performs greedy matching on no_proxy domains. The
proxy_bypass implementation has been updated with CPython's fix from
bpo-39057. (<a href="">#7427</a>)</li>
<li>Requests no longer incorrectly strips duplicate leading slashes in
URI paths. This should address user issues with specific presigned
URLs. Note the full fix requires urllib3 2.7.0+. (<a href="">#7315</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6e83187</code></a> v2.34.2</li>
<li><a href=""><code>84d10f0</code></a> Move Request.headers back to Mapping (<a href="">#7441</a>)</li>
<li><a href=""><code>b7b549b</code></a> v2.34.1</li>
<li><a href=""><code>e511bc7</code></a> Fix mutability issues with headers input types (<a href="">#7431</a>)</li>
<li><a href=""><code>5691f59</code></a> Update JsonType containers to read-based collections (<a href="">#7436</a>)</li>
<li><a href=""><code>2144213</code></a> Constrain Response.reason to str (<a href="">#7437</a>)</li>
<li><a href=""><code>6404f34</code></a> Fix <code>prepare_body</code> stream detection for <code>__getattr__</code>-based file wrappers (<a href="">#7</a>...</li>
<li><a href=""><code>0b401c7</code></a> v2.34.0</li>
<li><a href=""><code>86b378d</code></a> Align Session.get parameters with requests.get (<a href="">#7429</a>)</li>
<li><a href=""><code>a4f9a59</code></a> Port bpo-39057 to Requests (<a href="">#7427</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.32.5...v2.34.2">compare view</a></li>
</ul>
</details>
<br />

Updates `responses` from 0.26.0 to 0.26.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/responses/releases">responses's releases</a>.</em></p>
<blockquote>
<h2>0.26.2</h2>
<ul>
<li>Default headers (such as <code>Content-Type</code>, <code>Date</code> and <code>Server</code>) are now stripped
from recorded files regardless of header name case. Previously, responses recorded from
servers that send lowercase header names (for example over HTTP/2) kept these redundant
headers in the generated file.</li>
<li>Fixed <code>query_param_matcher</code> mutating the caller's params dict when numeric
values are provided. See <a href="">#801</a></li>
</ul>
<h2>0.26.1</h2>
<ul>
<li>Added Spanish translation of the README (<code>README.es.rst</code>)</li>
<li>When both <code>content_type</code> and <code>headers['content-type']</code> are in a response mock file,
<code>content_type</code> is now used.</li>
<li>Added strict_match to urlencoded_params_matcher, enabling partial request parameter
matching.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/responses/blob/master/CHANGES">responses's changelog</a>.</em></p>
<blockquote>
<h2>0.26.2</h2>
<ul>
<li>Default headers (such as <code>Content-Type</code>, <code>Date</code> and <code>Server</code>) are now stripped
from recorded files regardless of header name case. Previously, responses recorded from
servers that send lowercase header names (for example over HTTP/2) kept these redundant
headers in the generated file.</li>
<li>Fixed <code>query_param_matcher</code> mutating the caller's params dict when numeric
values are provided. See <a href="">#801</a></li>
</ul>
<h2>0.26.1</h2>
<ul>
<li>Added Spanish translation of the README (<code>README.es.rst</code>)</li>
<li>When both <code>content_type</code> and <code>headers['content-type']</code> are in a response mock file,
<code>content_type</code> is now used.</li>
<li>Added strict_match to urlencoded_params_matcher, enabling partial request parameter
matching.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>31d28eb</code></a> release: 0.26.2</li>
<li><a href=""><code>6fb610d</code></a> Fix CHANGES (<a href="">#802</a>)</li>
<li><a href=""><code>aae1d47</code></a> Set license format to SPDX identifier in setup.py (<a href="">#803</a>)</li>
<li><a href=""><code>a19add7</code></a> fix: query_param_matcher no longer mutates the caller's params dict (<a href="">#801</a>)</li>
<li><a href=""><code>88e15db</code></a> Strip default headers from recorded files case-insensitively (<a href="">#798</a>)</li>
<li><a href=""><code>1d48f2f</code></a> docs: fix typos (<a href="">#800</a>)</li>
<li><a href=""><code>853e7d2</code></a> docs: update tox Python version examples (<a href="">#797</a>)</li>
<li><a href=""><code>705067b</code></a> Merge branch 'release/0.26.1'</li>
<li><a href=""><code>7a80232</code></a> release: 0.26.1</li>
<li><a href=""><code>1fda897</code></a> Add strict_match parameter to urlencoded_params_matcher (<a href="">#796</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/getsentry/responses/compare/0.26.0...0.26.2">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.67.3 to 4.68.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.4 stable</h2>
<ul>
<li>trim to <code>ncols</code> even when <code>'{bar}' not in bar_format</code> (<a href="">#1717</a>, <a href="">#1767</a> &lt;- <a href="">#1658</a>)</li>
<li>fix <code>tqdm.write</code> when <code>stdout=None</code> (<a href="">#1768</a> &lt;- <a href="">#1654</a>)</li>
</ul>
<h2>tqdm v4.68.3 stable</h2>
<ul>
<li><code>utils</code>: delay <code>os.get_terminal_size</code> (<a href="">#1763</a> &lt;- <a href="">#1760</a>)</li>
<li><code>autonotebook</code>: support QtConsole, Spyder, JupyterLite (<a href="">#1763</a>, <a href="">#1628</a>, <a href="">#1559</a> &lt;- <a href="">#1283</a>, <a href="">#1098</a>, <a href="">#512</a>)</li>
<li>minor docs updates
<ul>
<li>fix typo (<a href="">#1762</a>)</li>
<li>use <code>git-fame</code></li>
</ul>
</li>
<li>misc minor framework updates
<ul>
<li>fix &amp; update CI build</li>
<li>pre-commit: add docs &amp; metadata generation</li>
<li>move <code>tox.ini</code> -&gt; <code>pyproject.toml</code>, move <code>tox-gh-actions</code> -&gt; <code>tox-gh</code></li>
<li>add Python 3.14, drop 3.7 support</li>
</ul>
</li>
</ul>
<h2>tqdm v4.68.2 stable</h2>
<ul>
<li>revert accidental change to <code>ascii</code> default (fixes <a href="">#1760</a>)
<ul>
<li><code>UnicodeEncodeError: 'charmap' codec can't encode characters in position 6-7: character maps to &lt;undefined&gt;</code> can be fixed by installing <code>tqdm!=4.68.0,!=4.68.1</code></li>
</ul>
</li>
<li>misc docs updates
<ul>
<li>fix links</li>
<li>replace stray <code>rst</code> -&gt; <code>md</code> syntax</li>
<li>consistent &quot;progress bar&quot; terminology (<a href="">#1737</a>)</li>
</ul>
</li>
<li>tests: fix coverage (fixes <a href="">#1760</a>)</li>
</ul>
<h2>tqdm v4.68.1 stable</h2>
<ul>
<li>set name of monitor thread (<a href="">#1669</a>, <a href="">#1752</a> &lt;- <a href="">#1435</a>)</li>
<li>fix monitor thread <code>atexit</code> deadlock (<a href="">#1751</a> &lt;- <a href="">#528</a>, <a href="">#627</a>, <a href="">#1435</a>, <a href="">#1564</a>)</li>
<li>docs: minor copyediting</li>
</ul>
<h2>tqdm v4.68.0 stable</h2>
<ul>
<li><code>utils</code>: simplify terminal size detection (<a href="">#1760</a>)</li>
<li><code>contrib</code>
<ul>
<li><code>itertools</code> (<a href="">#1760</a>)
<ul>
<li>add <code>chain</code>, <code>permutations</code>, <code>combinations</code>, <code>combinations_with_replacement</code>, <code>batched</code></li>
<li>add <code>product(repeat=1)</code> keyword argument (<a href="">#1428</a>)</li>
</ul>
</li>
<li>fix <code>discord</code>, <code>telegram</code> error handling</li>
<li>fix <code>discord</code>, <code>slack</code>, <code>telegram</code> format for <code>total=None</code></li>
</ul>
</li>
<li>soft-deprecate <code>tqdm.utils.envwrap</code> -&gt; <a href="https://github.com/tqdm/envwrap"><code>envwrap</code></a></li>
<li>benchmarks: fix <code>asv</code></li>
<li>misc linting</li>
<li>misc framework updates
<ul>
<li>CI: migrate manual job to <code>pre-commit.ci</code></li>
<li>bump workflow actions &amp; pre-commit hooks</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53d096e</code></a> bump version, merge pull request <a href="">#1768</a> from its-Sohan/fix/write-stdout-none</li>
<li><a href=""><code>74ff992</code></a> fix: prevent tqdm.write from crashing when sys.stdout is none</li>
<li><a href=""><code>3757d0d</code></a> Merge pull requests <a href="">#1717</a> and <a href="">#1767</a> (fixes <a href="">#1658</a>)</li>
<li><a href=""><code>55156ce</code></a> fix: apply disp_trim to all format_meter return paths (<a href="">#1658</a>)</li>
<li><a href=""><code>9aff609</code></a> bump version, merge pull request <a href="">#1763</a> from tqdm/jupyterlite</li>
<li><a href=""><code>9872f80</code></a> drop date from snap version str to fix pydantic</li>
<li><a href=""><code>b829334</code></a> support QtConsole, Spyder, JupyterLite</li>
<li><a href=""><code>6fa4867</code></a> delay os.get_terminal_size</li>
<li><a href=""><code>748e107</code></a> lint</li>
<li><a href=""><code>e6e29eb</code></a> move tox.ini -&gt; pyproject.toml</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.67.3...v4.68.4">compare view</a></li>
</ul>
</details>
<br />

Updates `traitlets` from 5.14.3 to 5.15.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/ipython/traitlets/releases">traitlets's releases</a>.</em></p>
<blockquote>
<h2>v5.15.1</h2>
<h2>5.15.1</h2>
<p>(<a href="https://github.com/ipython/traitlets/compare/v5.15.0...bc0b8b51f1adab7671b6e3932d91844c05731660">Full Changelog</a>)</p>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix CI (docs build, mypy tests, downstream) <a href="">#943</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/ipython/traitlets/graphs/contributors?from=2026-05-06&amp;to=2026-06-03&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3ACarreau+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3Akrassowski+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>) | <a href="https://github.com/rmorshea"><code>@​rmorshea</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3Armorshea+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>)</p>
<h2>v5.15.0</h2>
<h2>5.15.0</h2>
<p>(<a href="https://github.com/ipython/traitlets/compare/v5.14.3...8c2b92efa3238961b74cc1dc6497722e41da5472">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Moved definitions of K and V outside of TYPE_CHECKING condition <a href="">#935</a> (<a href="https://github.com/JohanMabille"><code>@​JohanMabille</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Accept integer-valued numbers for Integer <a href="">#919</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/ivanov"><code>@​ivanov</code></a>)</li>
<li>Update <code>__new__</code> method to use Self type for improved type hinting <a href="">#918</a> (<a href="https://github.com/fleming79"><code>@​fleming79</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix whitespace formatting in CLI help. <a href="">#917</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Fix <code>traitlets.__all__</code> <a href="">#933</a> (<a href="https://github.com/kylebarron"><code>@​kylebarron</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>The --config option with absolute paths will be loaded only once. <a href="">#923</a> (<a href="https://github.com/ryumasai"><code>@​ryumasai</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Avoid using <code>return t.cast</code> which can prevent attribute access during process teardown <a href="">#913</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Suppress exceptions when closing handlers during <code>__del__</code> <a href="">#912</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Removed pinning on virtualenv <a href="">#939</a> (<a href="https://github.com/JohanMabille"><code>@​JohanMabille</code></a>)</li>
<li>Pin virtualenv&lt;21 in tests because of breaking change incompatible wi… <a href="">#937</a> (<a href="https://github.com/JohanMabille"><code>@​JohanMabille</code></a>, <a href="https://github.com/SylvainCorlay"><code>@​SylvainCorlay</code></a>)</li>
<li>Added upper bound to mypy on pypy <a href="">#936</a> (<a href="https://github.com/JohanMabille"><code>@​JohanMabille</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Start testing on 3.14 and 3.14t <a href="">#929</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Require Python 3.9 (drop 3.8) <a href="">#924</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Deprecate empty <code>isidentifier</code> utility <a href="">#915</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Fix downstream test <code>package_spec</code> <a href="">#914</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/ipython/traitlets/blob/main/CHANGELOG.md">traitlets's changelog</a>.</em></p>
<blockquote>
<h2>5.15.1</h2>
<p>(<a href="https://github.com/ipython/traitlets/compare/v5.15.0...bc0b8b51f1adab7671b6e3932d91844c05731660">Full Changelog</a>)</p>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix CI (docs build, mypy tests, downstream) <a href="">#943</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/ipython/traitlets/graphs/contributors?from=2026-05-06&amp;to=2026-06-03&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3ACarreau+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3Akrassowski+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>) | <a href="https://github.com/rmorshea"><code>@​rmorshea</code></a> (<a href="https://github.com/search?q=repo%3Aipython%2Ftraitlets+involves%3Armorshea+updated%3A2026-05-06..2026-06-03&amp;type=Issues">activity</a>)</p>
<!-- raw HTML omitted -->
<h2>5.15.0</h2>
<p>(<a href="https://github.com/ipython/traitlets/compare/v5.14.3...8c2b92efa3238961b74cc1dc6497722e41da5472">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Moved definitions of K and V outside of TYPE_CHECKING condition <a href="">#935</a> (<a href="https://github.com/JohanMabille"><code>@​JohanMabille</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Accept i...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3498bf296395`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.