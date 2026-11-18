# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 7 updates

## Description

Bumps the datalad group in /services/datalad with 7 updates:

| Package | From | To |
| --- | --- | --- |
| [boto3](https://github.com/boto/boto3) | `1.43.56` | `1.43.79` |
| [charset-normalizer](https://github.com/jawah/charset_normalizer) | `3.4.9` | `3.5.1` |
| [pygit2](https://github.com/libgit2/pygit2) | `1.19.3` | `1.20.0` |
| [pygithub](https://github.com/pygithub/pygithub) | `2.9.1` | `2.10.0` |
| [coverage](https://github.com/coveragepy/coveragepy) | `7.15.2` | `7.15.4` |
| [datalad](https://github.com/datalad/datalad) | `1.6.1` | `1.6.2` |
| [ruff](https://github.com/astral-sh/ruff) | `0.16.0` | `0.16.4` |

Updates `boto3` from 1.43.56 to 1.43.79
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5e48139</code></a> Merge branch 'release-1.43.79'</li>
<li><a href=""><code>962bf4c</code></a> Bumping version to 1.43.79</li>
<li><a href=""><code>e479d02</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>bf8d343</code></a> Merge branch 'release-1.43.78'</li>
<li><a href=""><code>722e01b</code></a> Merge branch 'release-1.43.78' into develop</li>
<li><a href=""><code>4830df4</code></a> Bumping version to 1.43.78</li>
<li><a href=""><code>921bb10</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>cca5d6f</code></a> Merge branch 'release-1.43.77'</li>
<li><a href=""><code>2ff832b</code></a> Merge branch 'release-1.43.77' into develop</li>
<li><a href=""><code>8c3a6f7</code></a> Bumping version to 1.43.77</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.43.56...1.43.79">compare view</a></li>
</ul>
</details>
<br />

Updates `charset-normalizer` from 3.4.9 to 3.5.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/releases">charset-normalizer's releases</a>.</em></p>
<blockquote>
<h2>Version 3.5.1</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.5.0...3.5.1">3.5.1</a> (2026-08-15)</h2>
<h3>Changed</h3>
<ul>
<li>Raised upper bound of setuptools to v84 (<a href="">#794</a>)</li>
<li>Cache performance access optimization for our CharInfo struct (prebuilt only).</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>No longer decoding large content when the noise detector output give a high entropy.
Only impacted large content input &gt;1M bytes.</li>
</ul>
<h2>Version 3.5.0</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.9...3.5.0">3.5.0</a> (2026-08-12)</h2>
<h3>Added</h3>
<ul>
<li>Explicit support for Python 3.15</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Comparing a CharsetMatch to a non-alias encoding strings (<a href="">#773</a>)</li>
<li>Return 0.0 CharsetMatch.multi_byte_usage for empty payloads instead of crashing (<a href="">#774</a>)</li>
<li>A file with both a charset declaration and BOM/SIG did not verify first the BOM/SIG charset.</li>
<li>iso2022* cases misdetected due to a flaw in our multibyte chunking logic.</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Replaced the optional mypyc build with Cython extensions while retaining the
pure Python fallback. The previous engine (mypyc) started to hit rough limit around
the optimization of our noise/coherence detector while Cython allows us to
steer the engine toward the right generated optimized sources.
This change SHOULD not impact bundler (e.g. Pyinstaller) as the module are
immediately discoverable (i.e. not hidden import like mypyc did).
Moreover, a long wished distribution is the abi3 wheels, this will allow us
to no longer rush each year when a new Python interpreter is released.
We still distribute the interpreter specific wheels for faster performance.</li>
<li>Applied micro-optimization on several utils.</li>
<li>CharsetMatches no longer sort on each match insertion.</li>
</ul>
<h3>Misc</h3>
<ul>
<li>Removed an old performance optimization attempt in apy.py (success_fast_tracked+payload_result_cache).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md">charset-normalizer's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.5.0...3.5.1">3.5.1</a> (2026-08-15)</h2>
<h3>Changed</h3>
<ul>
<li>Raised upper bound of setuptools to v84 (<a href="">#794</a>)</li>
<li>Cache performance access optimization for our CharInfo struct (prebuilt only).</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>No longer decoding large content when the noise detector output give a high entropy.
Only impacted large content input &gt;1M bytes.</li>
</ul>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.9...3.5.0">3.5.0</a> (2026-08-12)</h2>
<h3>Added</h3>
<ul>
<li>Explicit support for Python 3.15</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Comparing a CharsetMatch to a non-alias encoding strings (<a href="">#773</a>)</li>
<li>Return 0.0 CharsetMatch.multi_byte_usage for empty payloads instead of crashing (<a href="">#774</a>)</li>
<li>A file with both a charset declaration and BOM/SIG did not verify first the BOM/SIG charset.</li>
<li>iso2022* cases misdetected due to a flaw in our multibyte chunking logic.</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Replaced the optional mypyc build with Cython extensions while retaining the
pure Python fallback. The previous engine (mypyc) started to hit rough limit around
the optimization of our noise/coherence detector while Cython allows us to
steer the engine toward the right generated optimized sources.
This change SHOULD not impact bundler (e.g. Pyinstaller) as the module are
immediately discoverable (i.e. not hidden import like mypyc did).
Moreover, a long wished distribution is the abi3 wheels, this will allow us
to no longer rush each year when a new Python interpreter is released.
We still distribute the interpreter specific wheels for faster performance.</li>
<li>Applied micro-optimization on several utils.</li>
<li>CharsetMatches no longer sort on each match insertion.</li>
</ul>
<h3>Misc</h3>
<ul>
<li>Removed an old performance optimization attempt in apy.py (success_fast_tracked+payload_result_cache).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e239bdc</code></a> Merge pull request <a href="">#795</a> from jawah/release-3.5.1</li>
<li><a href=""><code>648ad77</code></a> docs: update faq</li>
<li><a href=""><code>fab2749</code></a> docs: write changelog for 3.5.1</li>
<li><a href=""><code>7d32774</code></a> chore: bump version to 3.5.1</li>
<li><a href=""><code>9a69f60</code></a> docs: update data/info</li>
<li><a href=""><code>5dcc6dd</code></a> perf: charinfo cache access optimization in cython</li>
<li><a href=""><code>ea3b447</code></a> fix: do not validate-decode large payload when md says it's noise</li>
<li><a href=""><code>a05917f</code></a> chore: allow setuptools 84 builds (<a href="">#794</a>)</li>
<li><a href=""><code>3325d87</code></a> Merge pull request <a href="">#792</a> from jawah/update-cibuildwheel-action</li>
<li><a href=""><code>77203b1</code></a> chore: reformat noxfile.py</li>
<li>Additional commits viewable in <a href="https://github.com/jawah/charset_normalizer/compare/3.4.9...3.5.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pygit2` from 1.19.3 to 1.20.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/releases">pygit2's releases</a>.</em></p>
<blockquote>
<h2>1.20.0 (2026-08-08)</h2>
<ul>
<li>
<p>New <code>RemoteCallbacks.custom_headers()</code>
<a href="">#1465</a></p>
</li>
<li>
<p>New rebase API: <code>Repository.rebase_init(...)</code>, <code>Repository.rebase_open(...)</code>,
<code>Rebase</code>, and <code>RebaseOperation</code>
<a href="">#1483</a></p>
</li>
<li>
<p>Fix <code>Config.snapshot()</code> for non-repository configs, allow <code>PathLike</code> in
<code>Config.__init__()</code>, and improve config documentation
<a href="">#1468</a></p>
</li>
<li>
<p>Fix <code>UnicodeDecodeError</code> with non-UTF-8 file paths in <code>Repository.status()</code>,
<code>DiffFile.path</code>, index paths, checkout callbacks, and related APIs
<a href="">#1451</a>
<a href="">#1469</a></p>
</li>
<li>
<p>Fix <code>enums.CheckoutStrategy.CONFLICT_STYLE_ZDIFF3</code>, which was mistakenly
bound to the <code>DIFF3</code> constant
<a href="">#1483</a></p>
</li>
<li>
<p>Fix crashes and reference-lifetime bugs in custom refdb backends
<a href="">#1471</a>
<a href="">#1474</a>
<a href="">#1475</a>
<a href="">#1476</a></p>
</li>
<li>
<p>Update wheels to libgit2 1.9.6 and OpenSSL 3.5.7</p>
</li>
<li>
<p>Add riscv64 wheels
<a href="">#1463</a></p>
</li>
</ul>
<p>Breaking changes:</p>
<ul>
<li>
<p>Remove deprecated <code>pygit2.legacyenums</code> module and <code>GIT_*</code> constants,
use <code>pygit2.enums</code> instead</p>
</li>
<li>
<p>Remove deprecated support for passing <code>str</code> to <code>Repository.merge(...)</code>,
pass a <code>Commit</code>, <code>Oid</code>, or <code>Reference</code> object instead</p>
</li>
<li>
<p><code>Repository.merge_file_from_index(...)</code> now returns <code>MergeFileResult</code> by
default; pass <code>use_deprecated=True</code> for the previous string return, now
deprecated.</p>
</li>
<li>
<p>Remove deprecated <code>Remote.ls_remotes(...)</code>, use <code>Remote.list_heads(...)</code>
instead</p>
</li>
<li>
<p>Remove <code>pygit2.to_bytes(...)</code> and <code>pygit2.to_str(...)</code>; they were undocumented
accidental public APIs</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/blob/master/CHANGELOG.md">pygit2's changelog</a>.</em></p>
<blockquote>
<h1>1.20.0 (2026-08-08)</h1>
<ul>
<li>
<p>New <code>RemoteCallbacks.custom_headers()</code>
<a href="">#1465</a></p>
</li>
<li>
<p>New rebase API: <code>Repository.rebase_init(...)</code>, <code>Repository.rebase_open(...)</code>,
<code>Rebase</code>, and <code>RebaseOperation</code>
<a href="">#1483</a></p>
</li>
<li>
<p>Fix <code>Config.snapshot()</code> for non-repository configs, allow <code>PathLike</code> in
<code>Config.__init__()</code>, and improve config documentation
<a href="">#1468</a></p>
</li>
<li>
<p>Fix <code>UnicodeDecodeError</code> with non-UTF-8 file paths in <code>Repository.status()</code>,
<code>DiffFile.path</code>, index paths, checkout callbacks, and related APIs
<a href="">#1451</a>
<a href="">#1469</a></p>
</li>
<li>
<p>Fix <code>enums.CheckoutStrategy.CONFLICT_STYLE_ZDIFF3</code>, which was mistakenly
bound to the <code>DIFF3</code> constant
<a href="">#1483</a></p>
</li>
<li>
<p>Fix crashes and reference-lifetime bugs in custom refdb backends
<a href="">#1471</a>
<a href="">#1474</a>
<a href="">#1475</a>
<a href="">#1476</a></p>
</li>
<li>
<p>Update wheels to libgit2 1.9.6 and OpenSSL 3.5.7</p>
</li>
<li>
<p>Add riscv64 wheels
<a href="">#1463</a></p>
</li>
</ul>
<p>Breaking changes:</p>
<ul>
<li>
<p>Remove deprecated <code>pygit2.legacyenums</code> module and <code>GIT_*</code> constants,
use <code>pygit2.enums</code> instead</p>
</li>
<li>
<p>Remove deprecated support for passing <code>str</code> to <code>Repository.merge(...)</code>,
pass a <code>Commit</code>, <code>Oid</code>, or <code>Reference</code> object instead</p>
</li>
<li>
<p><code>Repository.merge_file_from_index(...)</code> now returns <code>MergeFileResult</code> by
default; pass <code>use_deprecated=True</code> for the previous string return, now
deprecated.</p>
</li>
<li>
<p>Remove deprecated <code>Remote.ls_remotes(...)</code>, use <code>Remote.list_heads(...)</code>
instead</p>
</li>
<li>
<p>Remove <code>pygit2.to_bytes(...)</code> and <code>pygit2.to_str(...)</code>; they were undocumented
accidental public APIs</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ba21cf5</code></a> Release 1.20.0</li>
<li><a href=""><code>28be4b8</code></a> Fix refcount test failing under pytest assertion rewriting</li>
<li><a href=""><code>007c562</code></a> Fix NULL dereference in refdb backend exists callback</li>
<li><a href=""><code>5878864</code></a> Fix ownership and lifetime bugs in refdb backend callbacks</li>
<li><a href=""><code>2efb706</code></a> Update wheels to OpenSSL 3.5.7</li>
<li><a href=""><code>cc48ea6</code></a> Fix ownership and error handling bugs in refdb backend callbacks</li>
<li><a href=""><code>997c65b</code></a> Fix the refdb backend rename callback</li>
<li><a href=""><code>eb512d2</code></a> Fix refcounting bugs in the refdb backend write callback</li>
<li><a href=""><code>258bf55</code></a> chore(CI): bump actions/setup-python from 6 to 7 in the actions group</li>
<li><a href=""><code>b7fdcd6</code></a> encoding: drop public to_str, rename internal helper to path_to_str</li>
<li>Additional commits viewable in <a href="https://github.com/libgit2/pygit2/compare/v1.19.3...v1.20.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pygithub` from 2.9.1 to 2.10.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pygithub/pygithub/releases">pygithub's releases</a>.</em></p>
<blockquote>
<h2>2.10.0</h2>
<h3>Notable changes</h3>
<h4>Drop Python 3.9 support due to End-of-Life</h4>
<p>Python 3.9 reached its end-of-life October 31, 2025. Support has been removed with this release.</p>
<h3>New Features</h3>
<ul>
<li>Allow to specify the Github API version by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3480</a></li>
<li>Add issue dependency endpoints by <a href="https://github.com/james-geiger"><code>@​james-geiger</code></a> in <a href="">PyGithub/PyGithub#3477</a></li>
</ul>
<h3>Improvements</h3>
<ul>
<li>Add <code>incomplete_results</code> property to <code>PaginatedList</code> by <a href="https://github.com/Felixoid"><code>@​Felixoid</code></a> in <a href="">PyGithub/PyGithub#3396</a></li>
<li>Add <code>WorkflowRun.get_attempt</code> and <code>Repository.get_workflow_job</code> functions by <a href="https://github.com/cecheta"><code>@​cecheta</code></a> in <a href="">PyGithub/PyGithub#3401</a></li>
<li>Add support for <code>head_repo</code> when creating pull request by <a href="https://github.com/shannon"><code>@​shannon</code></a> in <a href="">PyGithub/PyGithub#3479</a></li>
<li>Add <code>max_rate_limit_wait</code> to <code>GithubRetry</code> to cap rate limit backoff by <a href="https://github.com/tanistheta"><code>@​tanistheta</code></a> in <a href="">PyGithub/PyGithub#3540</a></li>
<li>Add <code>return_run_details</code> parameter to <code>Workflow.create_dispatch</code> by <a href="https://github.com/SebastienSyd"><code>@​SebastienSyd</code></a> in <a href="">PyGithub/PyGithub#3471</a></li>
<li>Update <code>SecurityAndAnalysis</code> by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3503</a></li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Fix duplicated URL in <code>OrganizationVariable.edit()</code> and <code>OrganizationSecret.edit()</code> by <a href="https://github.com/Krishnachaitanyakc"><code>@​Krishnachaitanyakc</code></a> in <a href="">PyGithub/PyGithub#3472</a></li>
<li>Fix <code>GithubException.__str__</code> decoding bytes data by <a href="https://github.com/SAY-5"><code>@​SAY-5</code></a> in <a href="">PyGithub/PyGithub#3494</a></li>
<li>Fixing <code>OrganizationVariable.value</code> by properly using base class by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3507</a></li>
<li>Parse only the query string for <code>PaginatedList.totalCount</code> by <a href="https://github.com/Noethix55555"><code>@​Noethix55555</code></a> in <a href="">PyGithub/PyGithub#3518</a></li>
<li>Encode boolean query parameters as lowercase by <a href="https://github.com/Noethix55555"><code>@​Noethix55555</code></a> in <a href="">PyGithub/PyGithub#3516</a></li>
<li>Fix doubled slash in request path for <code>base_url</code> with trailing slash by <a href="https://github.com/Noethix55555"><code>@​Noethix55555</code></a> in <a href="">PyGithub/PyGithub#3537</a></li>
<li>Fix <code>WorkflowRun</code> schema suggestion by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3559</a></li>
<li>Fix OAuth2 authorization <code>state</code> / <code>code_verifier</code> parameters by <a href="https://github.com/TheoGoudout"><code>@​TheoGoudout</code></a> in <a href="">PyGithub/PyGithub#3440</a></li>
<li>Allow creating custom property with <code>values_editable_by</code> param by <a href="https://github.com/chawlajay9"><code>@​chawlajay9</code></a> in <a href="">PyGithub/PyGithub#3548</a></li>
<li>Fix <code>OrganizationSecret.edit()</code> to seal the value and use <code>PUT</code> by <a href="https://github.com/Noethix55555"><code>@​Noethix55555</code></a> in <a href="">PyGithub/PyGithub#3529</a></li>
<li>Fix lazy retrieval of latest tag name by <a href="https://github.com/sathieu"><code>@​sathieu</code></a> in <a href="">PyGithub/PyGithub#3487</a></li>
<li>Fix typing and typos by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3485</a></li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Add support for Python 3.15 and drop EOL 3.9 by <a href="https://github.com/hugovk"><code>@​hugovk</code></a> in <a href="">PyGithub/PyGithub#3551</a></li>
<li>Move self-link awareness into <code>CompletableGithubObject</code> by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3432</a></li>
<li>Add documentation for agents, add Claude skills by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3509</a></li>
<li>Add <code>sphinx-copybutton</code> for code blocks by <a href="https://github.com/DivyanshiGautam31"><code>@​DivyanshiGautam31</code></a> in <a href="">PyGithub/PyGithub#3493</a></li>
<li>Add support to OpenAPI script for applying schema to methods by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3374</a></li>
<li>Improve OpenAPI apply properties and methods by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3495</a></li>
<li>Fix OpenAPI method verb detection by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3496</a></li>
<li>Add OpenAPI script tests by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3489</a></li>
<li>Fix OpenAPI apply method by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3498</a></li>
<li>Reordering OpenAPI test sequence by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3500</a></li>
<li>Apply typing convention by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3504</a></li>
<li>Bump <code>mypy</code> Python version to 3.12 by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3505</a></li>
<li>Use <code>@overload</code> to type <code>get_user</code> by <a href="https://github.com/xmo-odoo"><code>@​xmo-odoo</code></a> in <a href="">PyGithub/PyGithub#3502</a></li>
<li>Add overload type annotations by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3506</a></li>
<li>Simplify <code>OrganizationVariable</code> by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3508</a></li>
<li>Add OpenAPI script filename option to create class by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3512</a></li>
<li>OpenAPI script improvements by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3511</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/PyGithub/PyGithub/blob/main/doc/changes.rst">pygithub's changelog</a>.</em></p>
<blockquote>
<h2>Version 2.10.0 (August 20, 2026)</h2>
<p>Notable changes
^^^^^^^^^^^^^^^</p>
<p>Drop Python 3.9 support due to End-of-Life
&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;
Python 3.9 reached its end-of-life October 31, 2025. Support has been removed with this release.</p>
<p>New Features
^^^^^^^^^^^^</p>
<ul>
<li>Allow to specify the Github API version (<code> &lt;</code><em>) (<code>546b0ee7e &lt;</code></em>)</li>
<li>Add issue dependency endpoints (<code> &lt;</code><em>) (<code>b0ee6e0c7 &lt;</code></em>)</li>
</ul>
<p>Improvements
^^^^^^^^^^^^</p>
<ul>
<li>Add <code>incomplete_results</code> property to <code>PaginatedList</code> (<code> &lt;</code><em>) (<code>7806e7dcc &lt;</code></em>)</li>
<li>Add <code>WorkflowRun.get_attempt</code> and <code>Repository.get_workflow_job</code> functions (<code> &lt;</code><em>) (<code>fdf9ed869 &lt;</code></em>)</li>
<li>Add support for <code>head_repo</code> when creating pull request (<code> &lt;</code><em>) (<code>8ddfd6b11 &lt;</code></em>)</li>
<li>Add <code>max_rate_limit_wait</code> to <code>GithubRetry</code> to cap rate limit backoff (<code> &lt;</code><em>) (<code>8b50a098f &lt;</code></em>)</li>
<li>Add <code>return_run_details</code> parameter to <code>Workflow.create_dispatch</code> (<code> &lt;</code><em>) (<code>162ce9d0e &lt;</code></em>)</li>
<li>Update <code>SecurityAndAnalysis</code> (<code> &lt;</code><em>) (<code>9674c5799 &lt;</code></em>)</li>
</ul>
<p>Bug Fixes
^^^^^^^^^</p>
<ul>
<li>Fix duplicated URL in <code>OrganizationVariable.edit()</code> and <code>OrganizationSecret.edit()</code> (<code> &lt;</code><em>) (<code>a2e76eb8e &lt;</code></em>)</li>
<li>Fix <code>GithubException.__str__</code> decoding bytes data (<code> &lt;</code><em>) (<code>7a3b22ed6 &lt;</code></em>)</li>
<li>Fixing <code>OrganizationVariable.value</code> by properly using base class (<code> &lt;</code><em>) (<code>39a7464ff &lt;</code></em>)</li>
<li>Parse only the query string for <code>PaginatedList.totalCount</code> (<code> &lt;</code><em>) (<code>645d2a2e8 &lt;</code></em>)</li>
<li>Encode boolean query parameters as lowercase (<code> &lt;</code><em>) (<code>f4e29299e &lt;</code></em>)</li>
<li>Fix doubled slash in request path for <code>base_url</code> with trailing slash (<code> &lt;</code><em>) (<code>c15572f23 &lt;</code></em>)</li>
<li>Fix <code>WorkflowRun</code> schema suggestion (<code> &lt;</code><em>) (<code>5f707d64b &lt;</code></em>)</li>
<li>Fix OAuth2 authorization <code>state</code> / <code>code_verifier</code> parameters (<code> &lt;</code><em>) (<code>4785224bc &lt;</code></em>)</li>
<li>Allow creating custom property with <code>values_editable_by</code> param (<code> &lt;</code><em>) (<code>134f38a63 &lt;</code></em>)</li>
<li>Fix <code>OrganizationSecret.edit()</code> to seal the value and use <code>PUT</code> (<code> &lt;</code><em>) (<code>4f8674b72 &lt;</code></em>)</li>
<li>Fix lazy retrieval of latest tag name (<code> &lt;</code><em>) (<code>33071b35d &lt;</code></em>)</li>
<li>Fix typing and typos (<code> &lt;</code><em>) (<code>fd7abf6a7 &lt;</code></em>)</li>
</ul>
<p>Maintenance
^^^^^^^^^^^</p>
<ul>
<li>Add support for Python 3.15 and drop EOL 3.9 (<code> &lt;</code><em>) (<code>5e2de3144 &lt;</code></em>)</li>
<li>Move self-link awareness into <code>CompletableGithubObject</code> (<code> &lt;</code><em>) (<code>92ec3fab0 &lt;</code></em>)</li>
<li>Add documentation for agents, add Claude skills (<code> &lt;</code><em>) (<code>28f140d10 &lt;</code></em>)</li>
<li>Add <code>sphinx-copybutton</code> for code blocks (<code> &lt;</code>_)</li>
<li>Add support to OpenAPI script for applying schema to methods (<code> &lt;</code><em>) (<code>b7a6d2324 &lt;</code></em>)</li>
<li>Improve OpenAPI apply properties and methods (<code> &lt;</code>_)</li>
<li>Fix OpenAPI method verb detection (<code> &lt;</code>_)</li>
<li>Add OpenAPI script tests (<code> &lt;</code><em>) (<code>09242d9b0 &lt;</code></em>)</li>
<li>Fix OpenAPI apply method (<code> &lt;</code><em>) (<code>8f8697235 &lt;</code></em>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5cdf6ab</code></a> Release 2.10.0 (<a href="">#3560</a>)</li>
<li><a href=""><code>33071b3</code></a> Fix lazy retrieval of latest tag name (<a href="">#3487</a>)</li>
<li><a href=""><code>4f8674b</code></a> Fix OrganizationSecret.edit() to seal the value and use PUT (<a href="">#3529</a>)</li>
<li><a href=""><code>c63d09e</code></a> docs: add example for uploading multiple files in a single commit (<a href="">#3545</a>)</li>
<li><a href=""><code>4785224</code></a> Fix OAuth2 authorization <code>state</code> / <code>code_verifier</code> parameters (<a href="">#3440</a>)</li>
<li><a href=""><code>134f38a</code></a> Allow creating custom property with values_editable_by param (<a href="">#3548</a>)</li>
<li><a href=""><code>5f707d6</code></a> Fix <code>WorkflowRun</code> schema suggestion (<a href="">#3559</a>)</li>
<li><a href=""><code>8280929</code></a> docs: add exception handling example (<a href="">#3543</a>)</li>
<li><a href=""><code>c15572f</code></a> Fix doubled slash in request path for <code>base_url</code> with trailing slash (<a href="">#3537</a>)</li>
<li><a href=""><code>162ce9d</code></a> Add <code>return_run_details</code> parameter to <code>Workflow.create_dispatch</code> (<a href="">#3471</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pygithub/pygithub/compare/v2.9.1...v2.10.0">compare view</a></li>
</ul>
</details>
<br />

Updates `coverage` from 7.15.2 to 7.15.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/releases">coverage's releases</a>.</em></p>
<blockquote>
<h2>7.15.4</h2>
<h2>Version 7.15.4 — 2026-08-06</h2>
<ul>
<li>Fix: in the HTML report, a source file name containing a double quote (legal on POSIX) wasn’t escaped where it’s dropped into the <code>href</code> of the index and prev/next links, so it could close the attribute early and inject markup. Page URLs are now escaped. Thanks, <a href="">Rajath Mohare</a>.</li>
<li>Fix: the LCOV report wrote file names and other fields into its line-oriented records without neutralizing control characters. A measured file whose name contained a newline (legal on POSIX) could forge extra records, inflating the coverage seen by tools that read the report. Control characters in a field are now replaced. Thanks, <a href="">Rajath Mohare</a>.</li>
<li>Wheels are now provided for Python 3.15.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.15.4">coverage 7.15.4</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.15.4</code></p>
<h2>7.15.3</h2>
<h2>Version 7.15.3 — 2026-08-02</h2>
<ul>
<li>Fix: the sysmon core is incompatible with dynamic contexts. Previously, the combination would be prevented when read from the coverage.py configuration. But using the context API as pytest-cov does, contexts would be silently dropped. Now a warning is issued, thanks to <a href="">Jisang Han</a>. Closes <a href="">issue 2200</a>.</li>
<li>A performance improvement in the low-level line number bookkeeping when combining data files, thanks to <a href="">Kevin Turcios</a>.</li>
<li>Performance improvement in HTML reporting by reducing the number of times files have to be parsed, thanks to <a href="">Kevin Turcios</a>.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.15.3">coverage 7.15.3</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.15.3</code></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.15.4 — 2026-08-06</h2>
<ul>
<li>
<p>Fix: in the HTML report, a source file name containing a double quote (legal
on POSIX) wasn't escaped where it's dropped into the <code>href</code> of the index
and prev/next links, so it could close the attribute early and inject markup.
Page URLs are now escaped. Thanks, <code>Rajath Mohare &lt;pull 2227_&gt;</code>_.</p>
</li>
<li>
<p>Fix: the LCOV report wrote file names and other fields into its
line-oriented records without neutralizing control characters. A measured
file whose name contained a newline (legal on POSIX) could forge extra
records, inflating the coverage seen by tools that read the report. Control
characters in a field are now replaced. Thanks, <code>Rajath Mohare &lt;pull 2226_&gt;</code>_.</p>
</li>
<li>
<p>Wheels are now provided for Python 3.15.</p>
</li>
</ul>
<p>.. _pull 2226: <a href="">coveragepy/coveragepy#2226</a>
.. _pull 2227: <a href="">coveragepy/coveragepy#2227</a></p>
<p>.. _changes_7-15-3:</p>
<h2>Version 7.15.3 — 2026-08-02</h2>
<ul>
<li>
<p>Fix: the sysmon core is incompatible with dynamic contexts. Previously, the
combination would be prevented when read from the coverage.py configuration.
But using the context API as pytest-cov does, contexts would be silently
dropped. Now a warning is issued, thanks to <code>Jisang Han &lt;pull 2234_&gt;</code><em>.
Closes <code>issue 2200</code></em>.</p>
</li>
<li>
<p>A performance improvement in the low-level line number bookkeeping when
combining data files, thanks to <code>Kevin Turcios &lt;pull 2239_&gt;</code>_.</p>
</li>
<li>
<p>Performance improvement in HTML reporting by reducing the number of times
files have to be parsed, thanks to <code>Kevin Turcios &lt;pull 2240_&gt;</code>_.</p>
</li>
</ul>
<p>.. _issue 2200: <a href="">coveragepy/coveragepy#2200</a>
.. _pull 2234: <a href="">coveragepy/coveragepy#2234</a>
.. _pull 2239: <a href="">coveragepy/coveragepy#2239</a>
.. _pull 2240: <a href="">coveragepy/coveragepy#2240</a></p>
<p>.. _changes_7-15-2:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4c0e7ff</code></a> docs: sample HTML for 7.15.4</li>
<li><a href=""><code>db4cc32</code></a> docs: prep for 7.15.4</li>
<li><a href=""><code>c33085c</code></a> style: start gradual move to ruff 0.16</li>
<li><a href=""><code>53a0fd5</code></a> fix: neutralize control characters in lcov report fields (<a href="">#2226</a>)</li>
<li><a href=""><code>b64d53d</code></a> build: make 3.15 wheels</li>
<li><a href=""><code>53792ab</code></a> build: show the python version for kits</li>
<li><a href=""><code>f6b03c7</code></a> chore: make upgrade_one package=cibuildwheel</li>
<li><a href=""><code>d9b660a</code></a> chore: make upgrade</li>
<li><a href=""><code>b128a31</code></a> docs: oops, move this entry to the correct place</li>
<li><a href=""><code>a7a2c15</code></a> fix: escape filename urls in html report href attributes (<a href="">#2227</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.15.2...7.15.4">compare view</a></li>
</ul>
</details>
<br />

Updates `datalad` from 1.6.1 to 1.6.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/releases">datalad's releases</a>.</em></p>
<blockquote>
<h2>1.6.2</h2>
<h2>🧪 Tests</h2>
<ul>
<li>BF(TST): tolerate chardet 7.5.0/7.5.1 ISO-8859-1 misdetection in test_assure_unicode.  [PR <a href="">#7898</a>](<a href="">datalad/datalad#7898</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/blob/maint/CHANGELOG.md">datalad's changelog</a>.</em></p>
<blockquote>
<h1>1.6.2 (2026-08-13)</h1>
<h2>🧪 Tests</h2>
<ul>
<li>BF(TST): tolerate chardet 7.5.0/7.5.1 ISO-8859-1 misdetection in test_assure_unicode.  [PR <a href="">#7898</a>](<a href="">datalad/datalad#7898</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>78b76f8</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>1f8867a</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>38a9e1a</code></a> Merge pull request <a href="">#7898</a> from datalad/bf-chardet</li>
<li><a href=""><code>3323bce</code></a> [release-action] Autogenerate changelog snippet for PR 7898</li>
<li><a href=""><code>65bb35a</code></a> BF(TST): tolerate chardet 7.5.0/7.5.1 ISO-8859-1 misdetection in test_assure_...</li>
<li><a href=""><code>e8f31ae</code></a> Merge pull request <a href="">#7895</a> from just-meng/doc-contributing-helper-tests</li>
<li><a href=""><code>6ab19cd</code></a> Adjust wording</li>
<li><a href=""><code>9fe592a</code></a> DOC: Point out where tests for test helpers live in CONTRIBUTING.md</li>
<li><a href=""><code>755752d</code></a> Merge branch 'master' into maint</li>
<li><a href=""><code>0298135</code></a> Merge pull request <a href="">#7893</a> from datalad/contributors/update-2026-07-24</li>
<li>Additional commits viewable in <a href="https://github.com/datalad/datalad/compare/1.6.1...1.6.2">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.16.0 to 0.16.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.4</h2>
<h2>Release Notes</h2>
<p>Released on 2026-08-20.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-use-pathlib</code>] Add autofix for <code>PTH116</code> (<a href="">#26460</a>)</li>
<li>[<code>refurb</code>] Restrict <code>delete-full-slice</code> to lists (<code>FURB131</code>) (<a href="">#27711</a>)</li>
<li>[<code>refurb</code>] Skip <code>FURB101</code> and <code>FURB103</code> when the <code>open</code> argument is a file descriptor (<a href="">#27643</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>InvalidInstruction</code> on Windows CPUs that do not support <code>POPCNT</code> (<a href="">#27803</a>)</li>
<li>[<code>pyflakes</code>] Emit semantic syntax errors in string type definitions as <code>F722</code> (<a href="">#27835</a>)</li>
<li>[<code>pylint</code>] Allow <code>os._exit</code> imports in <code>import-private-name</code> (<code>PLC2701</code>) (<a href="">#27738</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[syntax-errors] Align mixed t-string/bytes error message with CPython 3.14 (<a href="">#27766</a>)</li>
<li>[<code>ruff</code>] Add <code>ctypes.LittleEndianStructure</code> and related types to existing exception (<code>RUF012</code>) (<a href="">#27753</a>)</li>
<li>[syntax-errors] Detect duplicate keyword arguments (<a href="">#17804</a>)</li>
<li>[syntax-errors] Detect parameters declared <code>nonlocal</code> (<a href="">#27628</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Offer display-only fixes and mark safe fixes preferred (<a href="">#27807</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27779</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add default indicator to rules table (<a href="">#27724</a>)</li>
<li>Fix broken link to Python docs (<a href="">#27757</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix s390x stacker assembly in release builds (<a href="">#27776</a>)</li>
<li>Guarantee minimum stack size when parsing a module, standalone expression, and suites (<a href="">#25464</a>)</li>
<li>Reduce configuration deserialization code size (<a href="">#27924</a>)</li>
<li>Check packed AST index bounds (<a href="">#27849</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AbhinavMir"><code>@​AbhinavMir</code></a></li>
<li><a href="https://github.com/eduardorittner"><code>@​eduardorittner</code></a></li>
<li><a href="https://github.com/royb3"><code>@​royb3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/rosstitmarsh"><code>@​rosstitmarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.4</h2>
<p>Released on 2026-08-20.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-use-pathlib</code>] Add autofix for <code>PTH116</code> (<a href="">#26460</a>)</li>
<li>[<code>refurb</code>] Restrict <code>delete-full-slice</code> to lists (<code>FURB131</code>) (<a href="">#27711</a>)</li>
<li>[<code>refurb</code>] Skip <code>FURB101</code> and <code>FURB103</code> when the <code>open</code> argument is a file descriptor (<a href="">#27643</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix <code>InvalidInstruction</code> on Windows CPUs that do not support <code>POPCNT</code> (<a href="">#27803</a>)</li>
<li>[<code>pyflakes</code>] Emit semantic syntax errors in string type definitions as <code>F722</code> (<a href="">#27835</a>)</li>
<li>[<code>pylint</code>] Allow <code>os._exit</code> imports in <code>import-private-name</code> (<code>PLC2701</code>) (<a href="">#27738</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[syntax-errors] Align mixed t-string/bytes error message with CPython 3.14 (<a href="">#27766</a>)</li>
<li>[<code>ruff</code>] Add <code>ctypes.LittleEndianStructure</code> and related types to existing exception (<code>RUF012</code>) (<a href="">#27753</a>)</li>
<li>[syntax-errors] Detect duplicate keyword arguments (<a href="">#17804</a>)</li>
<li>[syntax-errors] Detect parameters declared <code>nonlocal</code> (<a href="">#27628</a>)</li>
</ul>
<h3>Server</h3>
<ul>
<li>Offer display-only fixes and mark safe fixes preferred (<a href="">#27807</a>)</li>
<li>Support pull diagnostics for notebook cells (<a href="">#27779</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add default indicator to rules table (<a href="">#27724</a>)</li>
<li>Fix broken link to Python docs (<a href="">#27757</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix s390x stacker assembly in release builds (<a href="">#27776</a>)</li>
<li>Guarantee minimum stack size when parsing a module, standalone expression, and suites (<a href="">#25464</a>)</li>
<li>Reduce configuration deserialization code size (<a href="">#27924</a>)</li>
<li>Check packed AST index bounds (<a href="">#27849</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/AbhinavMir"><code>@​AbhinavMir</code></a></li>
<li><a href="https://github.com/eduardorittner"><code>@​eduardorittner</code></a></li>
<li><a href="https://github.com/royb3"><code>@​royb3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/rosstitmarsh"><code>@​rosstitmarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/zaniebot"><code>@​zaniebot</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>11c76bf</code></a> Bump 0.16.4 (<a href="">#27937</a>)</li>
<li><a href=""><code>d53c8c5</code></a> Isolate playground builds from deployment credentials (<a href="">#27839</a>)</li>
<li><a href=""><code>cab001e</code></a> Disable uv preview for releases and pre-commit hooks (<a href="">#27939</a>)</li>
<li><a href=""><code>f8d575f</code></a> [ty] Clarify writing guidance for human readers (<a href="">#27912</a>)</li>
<li><a href=""><code>ca45fae</code></a> Set <code>--preview</code> and <code>--default-index</code> for the <code>uv-lock</code> hook (<a href="">#27935</a>)</li>
<li><a href=""><code>4827bf7</code></a> Export <code>UV_DEFAULT_INDEX</code> in <code>release.sh</code> (<a href="">#27934</a>)</li>
<li><a href=""><code>d1087a4</code></a> [ty] Handle assignment expressions in string annotations (<a href="">#27921</a>)</li>
<li><a href=""><code>680cce4</code></a> [ty] Optimize inherited recursive protocol comparisons (<a href="">#27922</a>)</li>
<li><a href=""><code>974d3cb</code></a> Upgrade ecosystem-analyzer and mypy_primer to the latest upstream pins (<a href="">#27932</a>)</li>
<li><a href=""><code>b169b40</code></a> Install cargo tools locked (<a href="">#27929</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.0...0.16.4">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c32fff337d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.