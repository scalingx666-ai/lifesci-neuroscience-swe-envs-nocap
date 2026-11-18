# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 4 updates

## Description

Bumps the datalad group in /services/datalad with 4 updates: [boto3](https://github.com/boto/boto3), [pyjwt](https://github.com/jpadilla/pyjwt), [datalad](https://github.com/datalad/datalad) and [ruff](https://github.com/astral-sh/ruff).

Updates `boto3` from 1.43.95 to 1.43.101
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a1acf79</code></a> Merge branch 'release-1.43.101'</li>
<li><a href=""><code>8c719ef</code></a> Bumping version to 1.43.101</li>
<li><a href=""><code>7a0087d</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>50dcfb2</code></a> Bump the github-actions group across 1 directory with 4 updates (<a href="">#4853</a>)</li>
<li><a href=""><code>b9fcb18</code></a> Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> (<a href="">#4849</a>)</li>
<li><a href=""><code>2b8c4ed</code></a> Merge branch 'release-1.43.100'</li>
<li><a href=""><code>9506482</code></a> Merge branch 'release-1.43.100' into develop</li>
<li><a href=""><code>4001955</code></a> Bumping version to 1.43.100</li>
<li><a href=""><code>361a6d6</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>8ce7465</code></a> Merge branch 'release-1.43.99'</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.43.95...1.43.101">compare view</a></li>
</ul>
</details>
<br />

Updates `pyjwt` from 2.14.0 to 2.15.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/releases">pyjwt's releases</a>.</em></p>
<blockquote>
<h2>2.15.0</h2>
<p>See the <a href="https://github.com/jpadilla/pyjwt/blob/2.15.0/CHANGELOG.rst">2.15.0 changelog</a> for complete release details.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/blob/master/CHANGELOG.rst">pyjwt's changelog</a>.</em></p>
<blockquote>
<h2><code>v2.15.0 &lt;https://github.com/jpadilla/pyjwt/compare/2.14.0...2.15.0&gt;</code>__</h2>
<p>Security</p>
<pre><code>
- Wrap recursion errors from deeply nested JWT payloads in ``DecodeError``
  instead of exposing a raw ``RecursionError``.
<p>Added</p>
<pre><code>
- Support Python 3.15 by @kytta in ` &amp;lt;

Changed
</code></pre>
<ul>
<li><code>JWKSetCache</code> now stores the parsed <code>PyJWKSet</code> rather than the raw JWKS
payload, so a cache hit no longer re-parses every key. <code>JWKSetCache.put()</code>
accepts either form and raises <code>PyJWKSetError</code> for anything else. As a
result, <code>PyJWKClient.get_jwk_set()</code> returns the same <code>PyJWKSet</code> instance
for as long as it stays cached, rather than a freshly built one per call in
<code> &amp;lt;</code>__</li>
<li><code>PyJWKClient.fetch_data()</code> now raises
<code>PyJWKClientError(&amp;quot;The JWKS endpoint did not return a JSON object&amp;quot;)</code> when
the endpoint response is not a JSON object, instead of returning it for
<code>get_jwk_set()</code> to reject. Callers reaching the JWKS through
<code>get_jwk_set()</code> see the same error as before in
<code> &amp;lt;</code>__</li>
</ul>
<p>Fixed</p>
<pre><code>
- Return cached ``PyJWKSet`` values from ``PyJWKClient.get_jwk_set()`` instead
  of raising ``PyJWKClientError(&amp;quot;The JWKS endpoint did not return a JSON
  object&amp;quot;)``. ``JWKSetCache.put()`` documents ``PyJWKSet`` as the cached value,
  so callers pre-populating the cache to avoid a network round-trip could not
  read it back in ` &amp;lt; and
  ` &amp;lt;
- ``PyJWKClient.get_jwk_set()`` now caches the key set it returns, so a
  ``fetch_data()`` override that filters or transforms the JWKS is no longer
  undone by the next cache hit in
  ` &amp;lt;
- Raise the documented ``PyJWTError`` subclass instead of leaking a
  ``TypeError`` when the ``exp``, ``nbf``, or ``iat`` claim decodes to a
  non-numeric, non-string value such as a list, dict, or ``null``.
- Reject OKP JWK private keys when their public ``x`` component does not
  match the private ``d`` component.
- Treat malformed JWK Set members as unusable keys rather than letting
  ``AttributeError`` or ``TypeError`` escape ``PyJWKSet``. A member that is not
&amp;lt;/tr&amp;gt;&amp;lt;/table&amp;gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;

&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot; chore: prepare 2.15.0 release&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: make recursive payload tests deterministic&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: normalize recursive JWT payload errors&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; utils: mention bytes in force_bytes type error (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; docs/conf: drop duplicate 'and' from read() docstring (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Add support for Python 3.15 (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Catch http.client.HTTPException in PyJWKClient.fetch_data (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: correct docstring typo in _validate_jti (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; docs: clarify JWK certificate member handling (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; [pre-commit.ci] pre-commit autoupdate (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/jpadilla/pyjwt/compare/2.14.0...2.15.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;

&lt;br /&gt;</code></pre>

Updates `datalad` from 1.6.2 to 1.6.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/releases">datalad's releases</a>.</em></p>
<blockquote>
<h2>1.6.4</h2>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li><code>GitRepo</code> gained a <code>dot_git_common</code> property, pointing to the <code>.git</code>
directory that a linked worktree checkout shares with the repository it came
from -- where <code>config</code> and <code>objects</code> live, unlike the per-worktree <code>dot_git</code>.
For any other repository it is the same as <code>dot_git</code>.
[PR <a href="">#7931</a>](<a href="">datalad/datalad#7931</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>
<p><code>save</code> and <code>copy-file</code> now also operate in a plain <code>git</code> worktree checkout.
Fixes <a href="">#7921</a> via
[PR <a href="">#7931</a>](<a href="">datalad/datalad#7931</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p><code>datalad wtf</code> parses <code>git annex version</code> output with <code>splitlines()</code> rather
than splitting on the <em>local</em> platform's <code>os.linesep</code>.  Where the two
disagreed -- on Windows, always -- the whole output stayed a single line
and everything but <code>version</code> was silently dropped, so the <code>git-annex</code>
section reported no build flags, backends, remote types or repository
versions.</p>
</li>
<li>
<p><code>create_sibling</code> splits the remote <code>ls -A1</code> listing on <code>&quot;\n&quot;</code> rather than
the <em>local</em> <code>os.linesep</code>.  A Windows client talking to a POSIX server got
the whole listing back as one entry.  Latent: the only caller tests the
result for emptiness, which survived the bad split.</p>
</li>
</ul>
<h2>🏠 Internal</h2>
<ul>
<li><code>datalad wtf</code> reports <code>system.cpus</code>: <code>os.cpu_count()</code> and, where the
platform distinguishes them, the size of the process's CPU affinity mask.
The two differ under cgroups/containers/CI runners, and <code>AnnexRepo</code>
derives its default <code>--jobs</code> from the former.</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Windows and macOS testing moved off AppVeyor into <code>test.yml</code>'s own
matrix (<code>tools/ci/test-jobs.yml</code>), splitting <code>datalad</code> submodules the
same three ways AppVeyor's <code>Mac/WinP310core/a1/a2</code> jobs did to stay
under the job timeout.  OS-specific provisioning (APT/NeuroDebian,
Homebrew, NTFS long paths + an SSH server on Windows) was extracted
into shellcheck-able <code>tools/ci/test-env-{linux,macos,windows}.sh</code>
scripts.  AppVeyor and its AppVeyor-only helper scripts are removed.
Dropping AppVeyor exposed a few Windows-only test issues that had no
other CI signal:
<ul>
<li><code>addurls.py::get_subpaths</code>'s doctest hardcoded a POSIX <code>/</code> in its
expected output, but the function joins subpaths with
<code>os.path.sep</code>; rewritten to compare against a platform-agnostic</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/blob/maint/CHANGELOG.md">datalad's changelog</a>.</em></p>
<blockquote>
<h1>1.6.4 (2026-09-24)</h1>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li><code>GitRepo</code> gained a <code>dot_git_common</code> property, pointing to the <code>.git</code>
directory that a linked worktree checkout shares with the repository it came
from -- where <code>config</code> and <code>objects</code> live, unlike the per-worktree <code>dot_git</code>.
For any other repository it is the same as <code>dot_git</code>.
[PR <a href="">#7931</a>](<a href="">datalad/datalad#7931</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>
<p><code>save</code> and <code>copy-file</code> now also operate in a plain <code>git</code> worktree checkout.
Fixes <a href="">#7921</a> via
[PR <a href="">#7931</a>](<a href="">datalad/datalad#7931</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p><code>datalad wtf</code> parses <code>git annex version</code> output with <code>splitlines()</code> rather
than splitting on the <em>local</em> platform's <code>os.linesep</code>.  Where the two
disagreed -- on Windows, always -- the whole output stayed a single line
and everything but <code>version</code> was silently dropped, so the <code>git-annex</code>
section reported no build flags, backends, remote types or repository
versions.</p>
</li>
<li>
<p><code>create_sibling</code> splits the remote <code>ls -A1</code> listing on <code>&quot;\n&quot;</code> rather than
the <em>local</em> <code>os.linesep</code>.  A Windows client talking to a POSIX server got
the whole listing back as one entry.  Latent: the only caller tests the
result for emptiness, which survived the bad split.</p>
</li>
</ul>
<h2>🏠 Internal</h2>
<ul>
<li><code>datalad wtf</code> reports <code>system.cpus</code>: <code>os.cpu_count()</code> and, where the
platform distinguishes them, the size of the process's CPU affinity mask.
The two differ under cgroups/containers/CI runners, and <code>AnnexRepo</code>
derives its default <code>--jobs</code> from the former.</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Windows and macOS testing moved off AppVeyor into <code>test.yml</code>'s own
matrix (<code>tools/ci/test-jobs.yml</code>), splitting <code>datalad</code> submodules the
same three ways AppVeyor's <code>Mac/WinP310core/a1/a2</code> jobs did to stay
under the job timeout.  OS-specific provisioning (APT/NeuroDebian,
Homebrew, NTFS long paths + an SSH server on Windows) was extracted
into shellcheck-able <code>tools/ci/test-env-{linux,macos,windows}.sh</code>
scripts.  AppVeyor and its AppVeyor-only helper scripts are removed.
Dropping AppVeyor exposed a few Windows-only test issues that had no
other CI signal:
<ul>
<li><code>addurls.py::get_subpaths</code>'s doctest hardcoded a POSIX <code>/</code> in its
expected output, but the function joins subpaths with</li>
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
<li><a href=""><code>8357e62</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>3fcc6a2</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>a7145bd</code></a> Merge pull request <a href="">#7938</a> from datalad/claude/testsuite-speedup-partb</li>
<li><a href=""><code>935add4</code></a> TST: give each unpacked fixture dataset its own annex UUID</li>
<li><a href=""><code>e2f0222</code></a> Merge pull request <a href="">#7935</a> from datalad/claude/peaceful-dirac-21o851</li>
<li><a href=""><code>fe8a86c</code></a> BF: revert B4 - utils_testrepos is extension API, not dead code</li>
<li><a href=""><code>df42932</code></a> CI: run the <a href="https://github.com/turtle"><code>@​turtle</code></a> tests somewhere, in one dedicated matrix entry</li>
<li><a href=""><code>11ef2a2</code></a> TST: part B of the speedup work - stop paying for what is not under test</li>
<li><a href=""><code>0f60d75</code></a> BF: create_sibling - split remote <code>ls</code> output on &quot;\n&quot;, not local os.linesep</li>
<li><a href=""><code>b0531f1</code></a> TST: cover wtf's CPU reporting, including the unreadable-affinity path</li>
<li>Additional commits viewable in <a href="https://github.com/datalad/datalad/compare/1.6.2...1.6.4">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.7 to 0.16.8
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.8</h2>
<h2>Release Notes</h2>
<p>Released on 2026-09-16.</p>
<h3>Bug fixes</h3>
<ul>
<li>Visit functional <code>TypedDict</code> keyword arguments correctly (<a href="">#28584</a>)</li>
<li>[<code>flake8-simplify</code>] Detect nested <code>async with</code> under sync parent (<code>SIM117</code>) (<a href="">#27821</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve operand order in <code>SIM109</code> fix (<a href="">#27824</a>)</li>
<li>[<code>pyupgrade</code>] Preserve required parentheses in multiline <code>UP040</code> fixes (<a href="">#28164</a>)</li>
<li>[<code>pyupgrade</code>] Skip <code>TypeVarTuple</code> and <code>ParamSpec</code> conversions with bounds or constraints (<code>UP040</code>, <code>UP046</code>, <code>UP047</code>) (<a href="">#28505</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>Add support for <code>__lazy_modules__</code> (<a href="">#28459</a>)</li>
<li>Recognize PEP-728 <code>TypedDict</code> class keywords (<a href="">#28533</a>)</li>
<li>Recognize quoted types in <code>typing.TypeForm</code> (<a href="">#28507</a>)</li>
<li>Support conditional assignment to <code>__lazy_modules__</code> (<a href="">#28491</a>)</li>
<li>[<code>flake8-type-checking</code>] Prefer lazy imports over <code>TYPE_CHECKING</code> on Python 3.15 and later (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#28541</a>)</li>
<li>[<code>pyupgrade</code>] Make the fix for <code>UP040</code> always unsafe (<a href="">#28526</a>)</li>
<li>[<code>pyupgrade</code>] Stop recommending deprecated <code>ByteString</code> aliases (<code>UP035</code>) (<a href="">#28498</a>)</li>
<li>[<code>ruff</code>, <code>flake8-use-pathlib</code>] Recognize the <code>parent_mode</code> argument (<code>RUF064</code>, <code>PTH103</code>) (<a href="">#28528</a>)</li>
<li>[<code>ruff</code>] Detect <code>\Z</code> in <code>pytest.raises()</code> match patterns (<code>RUF043</code>) (<a href="">#28598</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Use rule name and code in formatter incompatibility warnings (<a href="">#28571</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>[<code>flake8-tidy-imports</code>] Add <code>extend-banned-api</code> (<a href="">#28644</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/VedantMadane"><code>@​VedantMadane</code></a></li>
<li><a href="https://github.com/alzeph"><code>@​alzeph</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/fredrikblau"><code>@​fredrikblau</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/Aniket-a14"><code>@​Aniket-a14</code></a></li>
<li><a href="https://github.com/r-b-1"><code>@​r-b-1</code></a></li>
</ul>
<h2>Install ruff 0.16.8</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.16.8/ruff-installer.sh | sh
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.8</h2>
<p>Released on 2026-09-16.</p>
<h3>Bug fixes</h3>
<ul>
<li>Visit functional <code>TypedDict</code> keyword arguments correctly (<a href="">#28584</a>)</li>
<li>[<code>flake8-simplify</code>] Detect nested <code>async with</code> under sync parent (<code>SIM117</code>) (<a href="">#27821</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve operand order in <code>SIM109</code> fix (<a href="">#27824</a>)</li>
<li>[<code>pyupgrade</code>] Preserve required parentheses in multiline <code>UP040</code> fixes (<a href="">#28164</a>)</li>
<li>[<code>pyupgrade</code>] Skip <code>TypeVarTuple</code> and <code>ParamSpec</code> conversions with bounds or constraints (<code>UP040</code>, <code>UP046</code>, <code>UP047</code>) (<a href="">#28505</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>Add support for <code>__lazy_modules__</code> (<a href="">#28459</a>)</li>
<li>Recognize PEP-728 <code>TypedDict</code> class keywords (<a href="">#28533</a>)</li>
<li>Recognize quoted types in <code>typing.TypeForm</code> (<a href="">#28507</a>)</li>
<li>Support conditional assignment to <code>__lazy_modules__</code> (<a href="">#28491</a>)</li>
<li>[<code>flake8-type-checking</code>] Prefer lazy imports over <code>TYPE_CHECKING</code> on Python 3.15 and later (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#28541</a>)</li>
<li>[<code>pyupgrade</code>] Make the fix for <code>UP040</code> always unsafe (<a href="">#28526</a>)</li>
<li>[<code>pyupgrade</code>] Stop recommending deprecated <code>ByteString</code> aliases (<code>UP035</code>) (<a href="">#28498</a>)</li>
<li>[<code>ruff</code>, <code>flake8-use-pathlib</code>] Recognize the <code>parent_mode</code> argument (<code>RUF064</code>, <code>PTH103</code>) (<a href="">#28528</a>)</li>
<li>[<code>ruff</code>] Detect <code>\Z</code> in <code>pytest.raises()</code> match patterns (<code>RUF043</code>) (<a href="">#28598</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Use rule name and code in formatter incompatibility warnings (<a href="">#28571</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>[<code>flake8-tidy-imports</code>] Add <code>extend-banned-api</code> (<a href="">#28644</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/VedantMadane"><code>@​VedantMadane</code></a></li>
<li><a href="https://github.com/alzeph"><code>@​alzeph</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/fredrikblau"><code>@​fredrikblau</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/Aniket-a14"><code>@​Aniket-a14</code></a></li>
<li><a href="https://github.com/r-b-1"><code>@​r-b-1</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>62914c4</code></a> Bump version to 0.16.8 (<a href="">#28648</a>)</li>
<li><a href=""><code>c47e0cd</code></a> [ty] Bound aliased intersection expansion during inference (<a href="">#28546</a>)</li>
<li><a href=""><code>ff4747b</code></a> renovate: update uv hashes correctly with setup-uv (<a href="">#28621</a>)</li>
<li><a href=""><code>94efeaa</code></a> [ty] Compact reachable binding and declaration histories (<a href="">#28349</a>)</li>
<li><a href=""><code>50020fb</code></a> [ty] Avoid storing constraint nodes twice (<a href="">#28375</a>)</li>
<li><a href=""><code>446bb68</code></a> [ty] Compare bound-method receivers before signatures (<a href="">#28384</a>)</li>
<li><a href=""><code>304ab86</code></a> [<code>flake8-type-checking</code>] Prefer lazy imports over <code>TYPE_CHECKING</code> on 3.15+ (`...</li>
<li><a href=""><code>d940b24</code></a> [ty] Watch script dependencies in CLI watch mode (<a href="">#28125</a>)</li>
<li><a href=""><code>fe9f065</code></a> [flake8-tidy-imports] Add <code>extend-banned-api</code> (<a href="">#28644</a>)</li>
<li><a href=""><code>31131db</code></a> [ty] Support <code>type[A &amp; B]</code> (<a href="">#27124</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.7...0.16.8">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c9eaae04cce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.