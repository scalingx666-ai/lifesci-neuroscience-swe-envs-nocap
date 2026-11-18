# Issue

**Title:** chore(deps): bump the build-dependencies group in /tools/schemacode with 11 updates

## Description

Bumps the build-dependencies group in /tools/schemacode with 11 updates:

| Package | From | To |
| --- | --- | --- |
| [click](https://github.com/pallets/click) | `8.3.1` | `8.4.1` |
| [markdown-it-py](https://github.com/executablebooks/markdown-it-py) | `4.0.0` | `4.2.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.6` | `0.15.17` |
| [check-jsonschema](https://github.com/python-jsonschema/check-jsonschema) | `0.37.0` | `0.37.3` |
| [pytest](https://github.com/pytest-dev/pytest) | `9.0.3` | `9.1.0` |
| [pytest-cov](https://github.com/pytest-dev/pytest-cov) | `7.0.0` | `7.1.0` |
| [lxml](https://github.com/lxml/lxml) | `6.1.0` | `6.1.1` |
| [mypy](https://github.com/python/mypy) | `1.19.1` | `2.1.0` |
| [types-jsonschema](https://github.com/python/typeshed) | `4.26.0.20260202` | `4.26.0.20260518` |
| [types-pyyaml](https://github.com/python/typeshed) | `6.0.12.20250915` | `6.0.12.20260518` |
| [types-tabulate](https://github.com/python/typeshed) | `0.10.0.20260308` | `0.10.0.20260508` |

Updates `click` from 8.3.1 to 8.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pallets/click/releases">click's releases</a>.</em></p>
<blockquote>
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
<p>We encourage everyone to upgrade. You can read more about our <a href="https://palletsprojects.com/versions">Version Support Policy</a> on our website.</p>
<p>PyPI: <a href="https://pypi.org/project/click/8.4.0/">https://pypi.org/project/click/8.4.0/</a>
Changes:  <a href="https://click.palletsprojects.com/page/changes/#version-8-4-0">https://click.palletsprojects.com/page/changes/#version-8-4-0</a>
Milestone <a href="https://github.com/pallets/click/milestone/30">https://github.com/pallets/click/milestone/30</a></p>
<ul>
<li>
<p><code>ParamType</code> typing improvements. <a href="">#3371</a></p>
<ul>
<li>:class:<code>ParamType</code> is now a generic abstract base class,
parameterized by its converted value type.</li>
<li>:meth:<code>~ParamType.convert</code> return types are narrowed on all
concrete types (<code>str</code> for :class:<code>STRING</code>, <code>int</code> for
:class:<code>INT</code>, etc.).</li>
<li>:meth:<code>~ParamType.to_info_dict</code> returns specific
:class:<code>~typing.TypedDict</code> subclasses instead of
<code>dict[str, Any]</code>.</li>
<li>:class:<code>CompositeParamType</code> and the number-range base are now
generic with abstract methods.</li>
</ul>
</li>
<li>
<p>Refactor <code>convert_type</code> to extract type inference into a private
<code>_guess_type</code> helper, and add :func:<code>typing.overload</code> signatures.
<a href="">#3372</a></p>
</li>
<li>
<p><code>Parameter</code> typing improvements. <a href="">#2805</a></p>
<ul>
<li>:class:<code>Parameter</code> is now an abstract base class, making explicit
that it cannot be instantiated directly.</li>
<li>:attr:<code>Parameter.name</code> is now <code>str</code> instead of <code>str | None</code>.
When <code>expose_value=False</code>, the name is set to <code>&quot;&quot;</code> instead
of <code>None</code>.</li>
<li>The <code>ctx</code> parameter of :meth:<code>Parameter.get_error_hint</code> is now
typed as <code>Context | None</code>, matching the runtime behavior.</li>
</ul>
</li>
<li>
<p>Split string values from <code>default_map</code> for parameters with <code>nargs &gt; 1</code>
or :class:<code>Tuple</code> type, matching environment variable behavior.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pallets/click/blob/main/CHANGES.md">click's changelog</a>.</em></p>
<blockquote>
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
<li>{class}<code>ParamType</code> is now a generic abstract base class,
parameterized by its converted value type.</li>
<li>{meth}<code>~ParamType.convert</code> return types are narrowed on all
concrete types (<code>str</code> for {class}<code>STRING</code>, <code>int</code> for
{class}<code>INT</code>, etc.).</li>
<li>{meth}<code>~ParamType.to_info_dict</code> returns specific
{class}<code>~typing.TypedDict</code> subclasses instead of
<code>dict[str, Any]</code>.</li>
<li>{class}<code>CompositeParamType</code> and the number-range base are now
generic with abstract methods.</li>
</ul>
</li>
<li>
<p>Refactor <code>convert_type</code> to extract type inference into a private
<code>_guess_type</code> helper, and add {func}<code>typing.overload</code> signatures.
{pr}<code>3372</code></p>
</li>
<li>
<p>{class}<code>Parameter</code> typing improvements. {pr}<code>2805</code></p>
<ul>
<li>{class}<code>Parameter</code> is now an abstract base class, making explicit
that it cannot be instantiated directly.</li>
<li>{attr}<code>Parameter.name</code> is now <code>str</code> instead of <code>str | None</code>.
When <code>expose_value=False</code>, the name is set to <code>&quot;&quot;</code> instead
of <code>None</code>.</li>
<li>The <code>ctx</code> parameter of {meth}<code>Parameter.get_error_hint</code> is now
typed as <code>Context | None</code>, matching the runtime behavior.</li>
</ul>
</li>
<li>
<p>Split string values from <code>default_map</code> for parameters with <code>nargs &gt; 1</code>
or {class}<code>Tuple</code> type, matching environment variable behavior.
{issue}<code>2745</code> {pr}<code>3364</code></p>
</li>
<li>
<p>Auto-detect <code>type=UNPROCESSED</code> for <code>flag_value</code> of non-basic types</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6eeb50e</code></a> release version 8.4.1</li>
<li><a href=""><code>67921d5</code></a> change log and doc fixes (<a href="">#3495</a>)</li>
<li><a href=""><code>9c41f46</code></a> Fix changelog and version admonitions</li>
<li><a href=""><code>6cb3477</code></a> fix skip condition</li>
<li><a href=""><code>5ee8e31</code></a> fix I/O operation on closed file error with CliRunner and echo_via_pager (<a href="">#3482</a>)</li>
<li><a href=""><code>becbde5</code></a> pager doesn't close std streams</li>
<li><a href=""><code>a5f5aa6</code></a> Handle empty bytes in echo (<a href="">#3493</a>)</li>
<li><a href=""><code>4d3db84</code></a> handle empty bytes in echo</li>
<li><a href=""><code>d42f15b</code></a> Fix <code>get_parameter_source()</code> during type conversion and eager callbacks (<a href="">#3484</a>)</li>
<li><a href=""><code>0baa8db</code></a> Document ctx.params bypass with test and doc</li>
<li>Additional commits viewable in <a href="https://github.com/pallets/click/compare/8.3.1...8.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `markdown-it-py` from 4.0.0 to 4.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/markdown-it-py/releases">markdown-it-py's releases</a>.</em></p>
<blockquote>
<h2>v4.2.0</h2>
<h2>What's Changed</h2>
<ul>
<li>✨ Add <code>make_fence_rule()</code> factory for configurable fence markers by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">executablebooks/markdown-it-py#394</a></li>
<li>🚀 RELEASE v4.2.0 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">executablebooks/markdown-it-py#395</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/markdown-it-py/compare/v4.1.0...v4.2.0">https://github.com/executablebooks/markdown-it-py/compare/v4.1.0...v4.2.0</a></p>
<h2>v4.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>✨ Add <code>--stdin</code> option to CLI by <a href="https://github.com/mcepl"><code>@​mcepl</code></a> in <a href="">executablebooks/markdown-it-py#379</a></li>
<li>Add AGENTS.md and copilot-setup-steps workflow by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">executablebooks/markdown-it-py#380</a></li>
<li>🔧 Add typing to Scanner by <a href="https://github.com/Alunderin"><code>@​Alunderin</code></a> in <a href="">executablebooks/markdown-it-py#382</a></li>
<li>👌 Fix quadratic complexity in <code>fragments_join</code> / <code>text_join</code> by <a href="https://github.com/petricevich"><code>@​petricevich</code></a> in <a href="">executablebooks/markdown-it-py#389</a></li>
<li>✨Allow plugins to register inline terminator characters by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">executablebooks/markdown-it-py#391</a></li>
<li>✨ Add <code>gfm-like2</code> preset with task lists, alerts, and single-tilde strikethrough by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">executablebooks/markdown-it-py#388</a></li>
<li>🔧 Update pre-commit hooks by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">executablebooks/markdown-it-py#392</a></li>
<li>🚀 RELEASE v4.1.0 by <a href="https://github.com/chrisjsewell"><code>@​chrisjsewell</code></a> in <a href="">executablebooks/markdown-it-py#393</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mcepl"><code>@​mcepl</code></a> made their first contribution in <a href="">executablebooks/markdown-it-py#379</a></li>
<li><a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">executablebooks/markdown-it-py#380</a></li>
<li><a href="https://github.com/Alunderin"><code>@​Alunderin</code></a> made their first contribution in <a href="">executablebooks/markdown-it-py#382</a></li>
<li><a href="https://github.com/petricevich"><code>@​petricevich</code></a> made their first contribution in <a href="">executablebooks/markdown-it-py#389</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/markdown-it-py/compare/v4.0.0...v4.1.0">https://github.com/executablebooks/markdown-it-py/compare/v4.0.0...v4.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/executablebooks/markdown-it-py/blob/master/CHANGELOG.md">markdown-it-py's changelog</a>.</em></p>
<blockquote>
<h2>4.2.0 - 2026-05-07</h2>
<ul>
<li>✨ Add <code>make_fence_rule()</code> factory for configurable fence markers in <a href="">#394</a></li>
</ul>
<h2>4.1.0 - 2025-05-06</h2>
<ul>
<li>✨ Add <code>gfm-like2</code> preset with task lists, alerts, and single-tilde strikethrough core plugins in <a href="">#388</a></li>
<li>✨ Allow plugins to register inline terminator characters in <a href="">#391</a></li>
<li>👌 Fix quadratic complexity in <code>fragments_join</code> / <code>text_join</code> in <a href="">#389</a>, thanks to <a href="https://github.com/petricevich"><code>@​petricevich</code></a></li>
<li>👌 Add <code>--stdin</code> option to CLI for reading Markdown from standard input in <a href="">#379</a>, thanks to <a href="https://github.com/mcepl"><code>@​mcepl</code></a></li>
<li>🔧 Add typing to Scanner in <a href="">#382</a>, thanks to <a href="https://github.com/Alunderin"><code>@​Alunderin</code></a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/executablebooks/markdown-it-py/compare/v4.0.0...v4.1.0">https://github.com/executablebooks/markdown-it-py/compare/v4.0.0...v4.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>36c5f54</code></a> 🚀 RELEASE v4.2.0 (<a href="">#395</a>)</li>
<li><a href=""><code>96cf077</code></a> ✨ Add <code>make_fence_rule()</code> factory for configurable fence markers (<a href="">#394</a>)</li>
<li><a href=""><code>3b4ff6d</code></a> 🚀 RELEASE v4.1.0 (<a href="">#393</a>)</li>
<li><a href=""><code>8951f26</code></a> 🔧 Update pre-commit hooks (<a href="">#392</a>)</li>
<li><a href=""><code>693bb24</code></a> ✨ Add <code>gfm-like2</code> preset with task lists, alerts, and single-tilde strikethro...</li>
<li><a href=""><code>df6fd36</code></a> ✨Allow plugins to register inline terminator characters (<a href="">#391</a>)</li>
<li><a href=""><code>d4ea0ca</code></a> 👌 Fix quadratic complexity in <code>fragments_join</code> / <code>text_join</code> (<a href="">#389</a>)</li>
<li><a href=""><code>8933147</code></a> 🔧 Add typing to Scanner (<a href="">#382</a>)</li>
<li><a href=""><code>2f6ae10</code></a> 🔧 Add AGENTS.md and copilot-setup-steps workflow (<a href="">#380</a>)</li>
<li><a href=""><code>49043e4</code></a> Add --stdin option to CLI for reading Markdown from standard input (<a href="">#379</a>)</li>
<li>See full diff in <a href="https://github.com/executablebooks/markdown-it-py/compare/v4.0.0...v4.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.6 to 0.15.17
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.17</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-11.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li>Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li>Respect diagnostic start and parent ranges and trailing comments in <code>ruff:ignore</code> suppressions (<a href="">#25673</a>)</li>
<li>[<code>flake8-async</code>] Add <code>trio.as_safe_channel</code> to safe decorators (<code>ASYNC119</code>) (<a href="">#25775</a>)</li>
<li>[<code>flake8-pytest-style</code>] Also check <code>pytest_asyncio</code> fixtures (<a href="">#25375</a>)</li>
<li>[<code>ruff</code>] Ban <code>pytest</code> autouse fixtures (<code>RUF076</code>) (<a href="">#25477</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP007</code>, <code>UP045</code>) (<a href="">#23259</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix diagnostic when <code>ruff:enable</code> or <code>ruff:disable</code> appears where <code>ruff:ignore</code> is expected (<a href="">#25700</a>)</li>
<li>[<code>pyupgrade</code>] Preserve leading empty literals to avoid syntax errors (<code>UP032</code>) (<a href="">#25491</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Clarify diagnostic message for single parameters (<code>PT007</code>) (<a href="">#25592</a>)</li>
<li>[<code>numpy</code>] Drop autofix for <code>np.in1d</code> (<code>NPY201</code>) (<a href="">#25612</a>)</li>
<li>[<code>pylint</code>] Exempt Python version comparisons (<code>PLR2004</code>) (<a href="">#25743</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Reserve AST <code>Vec</code>s with correct capacity for common cases (<a href="">#25451</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Preserve whitespace for Quarto cell option comments (<a href="">#25641</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Allow rule names in <code>ruff rule</code> (<a href="">#25640</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix playground diagnostics scrollbars (<a href="">#25642</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/SuryanshSS1011"><code>@​SuryanshSS1011</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/karlhillx"><code>@​karlhillx</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.17</h2>
<p>Released on 2026-06-11.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li>Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li>Respect diagnostic start and parent ranges and trailing comments in <code>ruff:ignore</code> suppressions (<a href="">#25673</a>)</li>
<li>[<code>flake8-async</code>] Add <code>trio.as_safe_channel</code> to safe decorators (<code>ASYNC119</code>) (<a href="">#25775</a>)</li>
<li>[<code>flake8-pytest-style</code>] Also check <code>pytest_asyncio</code> fixtures (<a href="">#25375</a>)</li>
<li>[<code>ruff</code>] Ban <code>pytest</code> autouse fixtures (<code>RUF076</code>) (<a href="">#25477</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP007</code>, <code>UP045</code>) (<a href="">#23259</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix diagnostic when <code>ruff:enable</code> or <code>ruff:disable</code> appears where <code>ruff:ignore</code> is expected (<a href="">#25700</a>)</li>
<li>[<code>pyupgrade</code>] Preserve leading empty literals to avoid syntax errors (<code>UP032</code>) (<a href="">#25491</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Clarify diagnostic message for single parameters (<code>PT007</code>) (<a href="">#25592</a>)</li>
<li>[<code>numpy</code>] Drop autofix for <code>np.in1d</code> (<code>NPY201</code>) (<a href="">#25612</a>)</li>
<li>[<code>pylint</code>] Exempt Python version comparisons (<code>PLR2004</code>) (<a href="">#25743</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Reserve AST <code>Vec</code>s with correct capacity for common cases (<a href="">#25451</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Preserve whitespace for Quarto cell option comments (<a href="">#25641</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Allow rule names in <code>ruff rule</code> (<a href="">#25640</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix playground diagnostics scrollbars (<a href="">#25642</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/SuryanshSS1011"><code>@​SuryanshSS1011</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/karlhillx"><code>@​karlhillx</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c645a9</code></a> Bump 0.15.17 (<a href="">#25872</a>)</li>
<li><a href=""><code>f381eb1</code></a> Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li><a href=""><code>b9b4546</code></a> Minor workflow simplification (<a href="">#25870</a>)</li>
<li><a href=""><code>1e77ba0</code></a> [ty] Move <code>PreformattedBlockScanner</code> to format-agnostic location. (<a href="">#25856</a>)</li>
<li><a href=""><code>6f2b772</code></a> [ty] Preserve nominal type of enum.property instances (<a href="">#25849</a>)</li>
<li><a href=""><code>be4777c</code></a> [ty] Fix site-package error when multiple versions of pythons are installed i...</li>
<li><a href=""><code>53f6ff7</code></a> Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li><a href=""><code>6740325</code></a> [ty] Restrict uncached raw signature access (<a href="">#25866</a>)</li>
<li><a href=""><code>970b1bf</code></a> Auto-update snapshots when syncing typeshed (<a href="">#25841</a>)</li>
<li><a href=""><code>0785793</code></a> Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.6...0.15.17">compare view</a></li>
</ul>
</details>
<br />

Updates `check-jsonschema` from 0.37.0 to 0.37.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-jsonschema/check-jsonschema/releases">check-jsonschema's releases</a>.</em></p>
<blockquote>
<h2>0.37.3</h2>
<ul>
<li>Update vendored schemas: bitbucket-pipelines, circle-ci, dependabot, github-workflows, gitlab-ci, mergify, readthedocs, renovate, snapcraft, woodpecker-ci (2026-06-12)</li>
</ul>
<h2>0.37.2</h2>
<ul>
<li>Update vendored schemas: bitbucket-pipelines, buildkite, circle-ci, dependabot, drone-ci, github-actions, github-issue-forms, github-workflows, gitlab-ci, meltano, mergify, readthedocs, renovate, taskfile, woodpecker-ci (2026-05-02)</li>
</ul>
<h2>0.37.1</h2>
<ul>
<li>Update vendored schemas: buildkite, circle-ci, dependabot, github-workflows, gitlab-ci, mergify, readthedocs, renovate, woodpecker-ci (2026-03-25)</li>
<li>Add Changie.dev schema and pre-commit hook. Thanks <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a>! (<a href="">#662</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-jsonschema/check-jsonschema/blob/main/CHANGELOG.rst">check-jsonschema's changelog</a>.</em></p>
<blockquote>
<h2>0.37.3</h2>
<ul>
<li>Update vendored schemas: bitbucket-pipelines, circle-ci, dependabot, github-workflows,
gitlab-ci, mergify, readthedocs, renovate, snapcraft, woodpecker-ci (2026-06-12)</li>
</ul>
<h2>0.37.2</h2>
<ul>
<li>Update vendored schemas: bitbucket-pipelines, buildkite, circle-ci, dependabot,
drone-ci, github-actions, github-issue-forms, github-workflows, gitlab-ci, meltano,
mergify, readthedocs, renovate, taskfile, woodpecker-ci (2026-05-02)</li>
</ul>
<h2>0.37.1</h2>
<ul>
<li>Update vendored schemas: buildkite, circle-ci, dependabot, github-workflows,
gitlab-ci, mergify, readthedocs, renovate, woodpecker-ci (2026-03-25)</li>
<li>Add Changie.dev schema and pre-commit hook. Thanks :user:<code>edgarrmondragon</code>! (:pr:<code>662</code>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5030dca</code></a> Bump version for release</li>
<li><a href=""><code>e49ebfe</code></a> Merge pull request <a href="">#687</a> from python-jsonschema/dependabot/pip/responses-0.26.1</li>
<li><a href=""><code>b3ae064</code></a> Bump responses from 0.26.0 to 0.26.1</li>
<li><a href=""><code>48ba608</code></a> Fix stale test data</li>
<li><a href=""><code>ed0cecf</code></a> Update vendored schemas</li>
<li><a href=""><code>b1f7546</code></a> Merge pull request <a href="">#686</a> from python-jsonschema/vendor-schemas-auto</li>
<li><a href=""><code>d99034f</code></a> [vendor-schemas] automated update</li>
<li><a href=""><code>566da04</code></a> Merge pull request <a href="">#684</a> from python-jsonschema/vendor-schemas-auto</li>
<li><a href=""><code>dca8424</code></a> Merge pull request <a href="">#685</a> from python-jsonschema/pre-commit-ci-update-config</li>
<li><a href=""><code>520b76e</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li>Additional commits viewable in <a href="https://github.com/python-jsonschema/check-jsonschema/compare/0.37.0...0.37.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.0.3 to 9.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.1.0</h2>
<h1>pytest 9.1.0 (2026-06-13)</h1>
<h2>Removals and backward incompatible breaking changes</h2>
<ul>
<li>
<p><a href="">#14533</a>: When using <code>--doctest-modules</code>, autouse fixtures with <code>module</code>, <code>package</code> or <code>session</code> scope that are defined inline in Python test modules (not plugins or conftests) will now possibly execute twice.</p>
<p>If this is undesirable, move the fixture definition to a <code>conftest.py</code> file if possible.</p>
<p>Technical explanation for those interested:
When using <!-- raw HTML omitted -->--doctest-modules<!-- raw HTML omitted -->, pytest possibly collects Python modules twice, once as <code>pytest.Module</code> and once as a <code>DoctestModule</code> (depending on the configuration).
Due to improvements in pytest's fixture implementation, if e.g. the <code>DoctestModule</code> collects a fixture, it is now visible to it only, and not to the <code>Module</code>.
This means that both need to register the fixtures independently.</p>
</li>
</ul>
<h2>Deprecations (removal in next major release)</h2>
<ul>
<li>
<p><a href="">#10819</a>: Added a deprecation warning for class-scoped fixtures defined as instance methods (without <code>@classmethod</code>). Such fixtures set attributes on a different instance than the test methods use, leading to unexpected behavior. Use <code>@classmethod</code> decorator instead -- by <code>yastcher</code>.</p>
<p>See <code>10819</code> and <code>14011</code>.</p>
</li>
<li>
<p><a href="">#12882</a>: Calling <code>request.getfixturevalue() &lt;pytest.FixtureRequest.getfixturevalue&gt;</code> during teardown to request a fixture that was not already requested is now deprecated and will become an error in pytest 10.</p>
<p>See <code>dynamic-fixture-request-during-teardown</code> for details.</p>
</li>
<li>
<p><a href="">#13409</a>: Using non-<code>~collections.abc.Collection</code> iterables (such as generators, iterators, or custom iterable objects) for the <code>argvalues</code> parameter in <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> and <code>metafunc.parametrize &lt;pytest.Metafunc.parametrize&gt;</code> is now deprecated.</p>
<p>These iterables get exhausted after the first iteration,
leading to tests getting unexpectedly skipped in cases such as running <code>pytest.main()</code> multiple times,
using class-level parametrize decorators,
or collecting tests multiple times.</p>
<p>See <code>parametrize-iterators</code> for details and suggestions.</p>
</li>
<li>
<p><a href="">#13946</a>: The private <code>config.inicfg</code> attribute is now deprecated.
Use <code>config.getini() &lt;pytest.Config.getini&gt;</code> to access configuration values instead.</p>
<p>See <code>config-inicfg</code> for more details.</p>
</li>
<li>
<p><a href="">#14004</a>: Passing <code>baseid</code> to <code>~pytest.FixtureDef</code> or <code>nodeid</code> strings to fixture registration APIs is now deprecated. These are internal pytest APIs that are used by some plugins.</p>
<p>Use the <code>node</code> parameter instead for fixture scoping. This enables more robust node-based
matching instead of string prefix matching.
If you've used <code>nodeid=None</code>, pass <code>node=session</code> instead.</p>
<p>This will be removed in pytest 10.</p>
</li>
<li>
<p><a href="">#14335</a>: The method of configuring hooks using markers, deprecated since pytest 7.2, is now scheduled to be removed in pytest 10.
See <code>hook-markers</code> for more details.</p>
</li>
<li>
<p><a href="">#14434</a>: The <code>--pastebin</code> option is now deprecated.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b2522cf</code></a> Prepare release version 9.1.0</li>
<li><a href=""><code>368d2fc</code></a> [refactor] Tighten <code>SetComparisonFunction</code> to <code>Iterator[str]</code> (<a href="">#14587</a>)</li>
<li><a href=""><code>ff77cd8</code></a> [refactor] Make base assertion comparisons return an iterator instead of a li...</li>
<li><a href=""><code>0d8491a</code></a> build(deps): Bump actions/stale from 10.2.0 to 10.3.0</li>
<li><a href=""><code>4a809d9</code></a> Merge pull request <a href="">#14568</a> from pytest-dev/register-fixture</li>
<li><a href=""><code>5dfa385</code></a> Fix recursion traceback test to cover all styles (<a href="">#14582</a>)</li>
<li><a href=""><code>f52ff0c</code></a> Add <code>pytest.register_fixture</code></li>
<li><a href=""><code>a8ac094</code></a> Merge pull request <a href="">#14567</a> from pytest-dev/more-visibility-deprecate</li>
<li><a href=""><code>e5620cd</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#14577</a>)</li>
<li><a href=""><code>2ce9c6d</code></a> Merge pull request <a href="">#14540</a> from minbang930/fix-14533-doctest-module-fixtures</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.3...9.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest-cov` from 7.0.0 to 7.1.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest-cov/blob/master/CHANGELOG.rst">pytest-cov's changelog</a>.</em></p>
<blockquote>
<h2>7.1.0 (2026-03-21)</h2>
<ul>
<li>
<p>Fixed total coverage computation to always be consistent, regardless of reporting settings.
Previously some reports could produce different total counts, and consequently can make --cov-fail-under behave different depending on
reporting options.
See <code> &lt;</code>_.</p>
</li>
<li>
<p>Improve handling of ResourceWarning from sqlite3.</p>
<p>The plugin adds warning filter for sqlite3 <code>ResourceWarning</code> unclosed database (since 6.2.0).
It checks if there is already existing plugin for this message by comparing filter regular expression.
When filter is specified on command line the message is escaped and does not match an expected message.
A check for an escaped regular expression is added to handle this case.</p>
<p>With this fix one can suppress <code>ResourceWarning</code> from sqlite3 from command line::</p>
<p>pytest -W &quot;ignore:unclosed database in &lt;sqlite3.Connection object at:ResourceWarning&quot; ...</p>
</li>
<li>
<p>Various improvements to documentation.
Contributed by Art Pelling in <code> &lt;</code>_ and
&quot;vivodi&quot; in <code> &lt;</code><em>.
Also closed <code> &lt;</code></em>.</p>
</li>
<li>
<p>Fixed some assertions in tests.
Contributed by in Markéta Machová in <code> &lt;</code>_.</p>
</li>
<li>
<p>Removed unnecessary coverage configuration copying (meant as a backup because reporting commands had configuration side-effects before coverage 5.0).</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>66c8a52</code></a> Bump version: 7.0.0 → 7.1.0</li>
<li><a href=""><code>f707662</code></a> Make the examples use pypy 3.11.</li>
<li><a href=""><code>6049a78</code></a> Make context test use the old ctracer (seems the new sysmon tracer behaves di...</li>
<li><a href=""><code>8ebf20b</code></a> Update changelog.</li>
<li><a href=""><code>861d30e</code></a> Remove the backup context manager  - shouldn't be needed since coverage 5.0, ...</li>
<li><a href=""><code>fd4c956</code></a> Pass the precision on the nulled total (seems that there's some caching goion...</li>
<li><a href=""><code>78c9c4e</code></a> Only run the 3.9 on older deps.</li>
<li><a href=""><code>4849a92</code></a> Punctuation.</li>
<li><a href=""><code>197c35e</code></a> Update changelog and hopefully I don't forget to publish release again :))</li>
<li><a href=""><code>14dc1c9</code></a> Update examples to use 3.11 and make the adhoc layout example look a bit more...</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest-cov/compare/v7.0.0...v7.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `lxml` from 6.1.0 to 6.1.1
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/lxml/lxml/blob/master/CHANGES.txt">lxml's changelog</a>.</em></p>
<blockquote>
<h1>6.1.1 (2026-05-18)</h1>
<h2>Bugs fixed</h2>
<ul>
<li>
<p>The known link attributes in <code>lxml.html.defs.link_attrs</code> were missing <code>xlink:href</code>,
which can be used for URL bypass attacks in embedded SVG/MathML/etc. content.
<a href="https://github.com/fedora-python/lxml_html_clean/security/advisories/GHSA-4jhm-jv67-739f">https://github.com/fedora-python/lxml_html_clean/security/advisories/GHSA-4jhm-jv67-739f</a></p>
</li>
<li>
<p>The Linux wheels use a patched libxslt 1.1.43, fixing CVE-2025-7424 and CVE-2025-11731.</p>
</li>
<li>
<p>The Windows wheels use libxslt 1.1.45, fixing CVE-2025-7424 and CVE-2025-11731.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b4a4c59</code></a> Build: Fix build in Py3.8.</li>
<li><a href=""><code>a116dcb</code></a> Fix typo: type annotions -&gt; type annotations in PEP 560 comments (<a href="">GH-504</a>)</li>
<li><a href=""><code>7287a75</code></a> Prepare release of 6.1.1.</li>
<li><a href=""><code>5927a6d</code></a> Add missing &quot;xlink:href&quot; to the known HTML link attributes.</li>
<li><a href=""><code>23efeb4</code></a> Build: Fix build in Py3.8.</li>
<li><a href=""><code>2c0563b</code></a> Build: Add bug patch for libxslt 1.1.43 and apply it during the static librar...</li>
<li><a href=""><code>8a35fcc</code></a> Fix doctest in PyPy3.9.</li>
<li>See full diff in <a href="https://github.com/lxml/lxml/compare/lxml-6.1.0...lxml-6.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `mypy` from 1.19.1 to 2.1.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python/mypy/blob/master/CHANGELOG.md">mypy's changelog</a>.</em></p>
<blockquote>
<h1>Mypy Release Notes</h1>
<h2>Next Release</h2>
<h2>Mypy 2.1</h2>
<p>We’ve just uploaded mypy 2.1.0 to the Python Package Index (<a href="https://pypi.org/project/mypy/">PyPI</a>).
Mypy is a static type checker for Python. This release includes new features, performance
improvements and bug fixes. You can install it as follows:</p>
<pre><code>python3 -m pip install -U mypy
</code></pre>
<p>You can read the full documentation for this release on <a href="http://mypy.readthedocs.io">Read the Docs</a>.</p>
<h3>librt.vecs: Fast Growable Array Type for Mypyc</h3>
<p>The new <code>librt.vecs</code> module provides an efficient growable array type <code>vec</code> that is
optimized for mypyc use. It provides fast, packed arrays with integer and floating point
value types, which can be <strong>several times faster</strong> than <code>list</code>, and tens of times faster
than <code>array.array</code> in code compiled using mypyc. It also supports nested <code>vec</code> objects and
non-value-type items, such as <code>vec[vec[str]]</code>.</p>
<p>Refer to the <a href="https://mypyc.readthedocs.io/en/latest/librt_vecs.html">documentation</a> for
the details.</p>
<p>Contributed by Jukka Lehtosalo.</p>
<h3>librt.random: Fast Pseudo-Random Number Generation</h3>
<p>The new <code>librt.random</code> module provides fast pseudo-random number generation that is
optimized for code compiled using mypyc. It can be 3x to 10x faster than the stdlib
<code>random</code> module in compiled code.</p>
<p>Refer to the <a href="https://mypyc.readthedocs.io/en/latest/librt_random.html">documentation</a> for
the details.</p>
<p>Contributed by Jukka Lehtosalo (PR <a href="">21433</a>).</p>
<h3>Mypyc Improvements</h3>
<ul>
<li>Enable incremental self-compilation (Vaggelis Danias, PR <a href="">21369</a>)</li>
<li>Make compilation order with multiple files consistent (Piotr Sawicki, PR <a href="">21419</a>)</li>
<li>Fix crash on accessing <code>StopAsyncIteration</code> (Piotr Sawicki, PR <a href="">21406</a>)</li>
<li>Fix incremental compilation with <code>separate</code> flag (Vaggelis Danias, PR <a href="">21299</a>)</li>
</ul>
<h3>Fixes to Crashes</h3>
<ul>
<li>Fix crash on partial type with <code>--allow-redefinition</code> and <code>global</code> declaration (Jukka Lehtosalo, PR <a href="">21428</a>)</li>
<li>Fix broken awaitable generator patching (Ivan Levkivskyi, PR <a href="">21435</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c1c336d</code></a> Remove +dev from version</li>
<li><a href=""><code>74df14b</code></a> Add changelog for mypy 2.1 (<a href="">#21464</a>)</li>
<li><a href=""><code>022d9bc</code></a> Revert &quot;TypeForm: Enable by default (<a href="">#21262</a>)&quot;</li>
<li><a href=""><code>8826288</code></a> [mypyc] Document librt.random (<a href="">#21463</a>)</li>
<li><a href=""><code>3f4067b</code></a> Bump librt version to 0.11.0 (<a href="">#21458</a>)</li>
<li><a href=""><code>2b1eb58</code></a> [mypyc] Enable incremental self-compilation (<a href="">#21369</a>)</li>
<li><a href=""><code>8152f4a</code></a> Respect file config comments for stale modules (<a href="">#21444</a>)</li>
<li><a href=""><code>116d60b</code></a> Fix nondeterminism from nonassociativity of overload joins (<a href="">#21455</a>)</li>
<li><a href=""><code>6c4af8e</code></a> Fix function call message change for small number of args (<a href="">#21432</a>)</li>
<li><a href=""><code>4b8fdca</code></a> [mypyc] Add librt.random module (<a href="">#21433</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python/mypy/compare/v1.19.1...v2.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `types-jsonschema` from 4.26.0.20260202 to 4.26.0.20260518
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/python/typeshed/commits">compare view</a></li>
</ul>
</details>
<br />

Updates `types-pyyaml` from 6.0.12.20250915 to 6.0.12.20260518
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/python/typeshed/commits">compare view</a></li>
</ul>
</details>
<br />

Updates `types-tabulate` from 0.10.0.20260308 to 0.10.0.20260508
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/python/typeshed/commits">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d6557dae121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.