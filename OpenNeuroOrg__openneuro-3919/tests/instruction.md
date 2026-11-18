# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 10 updates

## Description

Updates the requirements on [boto3](https://github.com/boto/boto3), [charset-normalizer](https://github.com/jawah/charset_normalizer), [pygit2](https://github.com/libgit2/pygit2), [pygithub](https://github.com/pygithub/pygithub), [requests](https://github.com/psf/requests), [sentry-sdk[falcon]](https://github.com/getsentry/sentry-python), [taskiq[reload]](https://github.com/taskiq-python/taskiq), [uvicorn[standard]](https://github.com/Kludex/uvicorn), [datalad](https://github.com/datalad/datalad) and [ruff](https://github.com/astral-sh/ruff) to permit the latest version.
Updates `boto3` from 1.42.75 to 1.42.95
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a47ce81</code></a> Merge branch 'release-1.42.95'</li>
<li><a href=""><code>03cc5cd</code></a> Bumping version to 1.42.95</li>
<li><a href=""><code>ab160a5</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>1009404</code></a> Merge branch 'release-1.42.94'</li>
<li><a href=""><code>0017b80</code></a> Merge branch 'release-1.42.94' into develop</li>
<li><a href=""><code>d13e367</code></a> Bumping version to 1.42.94</li>
<li><a href=""><code>7ddb8f5</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>7b0e06b</code></a> Bump actions/github-script from 8.0.0 to 9.0.0 (<a href="">#4774</a>)</li>
<li><a href=""><code>30acde7</code></a> Merge branch 'release-1.42.93'</li>
<li><a href=""><code>5e30d50</code></a> Merge branch 'release-1.42.93' into develop</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.42.75...1.42.95">compare view</a></li>
</ul>
</details>
<br />

Updates `charset-normalizer` from 3.4.6 to 3.4.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/releases">charset-normalizer's releases</a>.</em></p>
<blockquote>
<h2>Version 3.4.7</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.6...3.4.7">3.4.7</a> (2026-04-02)</h2>
<h3>Changed</h3>
<ul>
<li>Pre-built optimized version using mypy[c] v1.20.</li>
<li>Relax <code>setuptools</code> constraint to <code>setuptools&gt;=68,&lt;82.1</code>.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Correctly remove SIG remnant in utf-7 decoded string. (<a href="">#718</a>) (<a href="">#716</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md">charset-normalizer's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.6...3.4.7">3.4.7</a> (2026-04-02)</h2>
<h3>Changed</h3>
<ul>
<li>Pre-built optimized version using mypy[c] v1.20.</li>
<li>Relax <code>setuptools</code> constraint to <code>setuptools&gt;=68,&lt;82.1</code>.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Correctly remove SIG remnant in utf-7 decoded string. (<a href="">#718</a>) (<a href="">#716</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f07891</code></a> Merge pull request <a href="">#729</a> from jawah/release-3.4.7</li>
<li><a href=""><code>fdbeb29</code></a> chore: update dev, and ci requirements</li>
<li><a href=""><code>b66f922</code></a> chore: add ft classifier</li>
<li><a href=""><code>f94249d</code></a> chore: add test cases for utf_7 recent fix</li>
<li><a href=""><code>95c866f</code></a> chore: bump version to 3.4.7</li>
<li><a href=""><code>4f429bb</code></a> chore: bump mypy pre-commit to v1.20</li>
<li><a href=""><code>b579cd6</code></a> fix: correctly remove SIG remnant in utf-7 decoded string</li>
<li><a href=""><code>58bf944</code></a> :arrow_up: Bump github/codeql-action from 4.32.4 to 4.35.1 (<a href="">#728</a>)</li>
<li><a href=""><code>44cf8a1</code></a> :arrow_up: Bump actions/download-artifact from 8.0.0 to 8.0.1 (<a href="">#726</a>)</li>
<li><a href=""><code>362bc20</code></a> :arrow_up: Bump docker/setup-qemu-action from 3.7.0 to 4.0.0 (<a href="">#725</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jawah/charset_normalizer/compare/3.4.6...3.4.7">compare view</a></li>
</ul>
</details>
<br />

Updates `pygit2` from 1.19.1 to 1.19.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/releases">pygit2's releases</a>.</em></p>
<blockquote>
<h2>1.19.2 (2026-03-29)</h2>
<ul>
<li>
<p>Fix refcount and error handling issues in <code>filter_register(...)</code></p>
</li>
<li>
<p>Fix config with valueless keys
<a href="">#1457</a></p>
</li>
<li>
<p>New <code>Repository.load_filter_list(...)</code> and <code>FilterList</code>
<a href="">#1444</a></p>
</li>
<li>
<p>New <code>Odb.read_header(...)</code> and now <code>Odb.read(...)</code> returns <code>enums.ObjectType</code> instead of int
<a href="">#1450</a></p>
</li>
<li>
<p>Build and CI fixes
<a href="">#1446</a>
<a href="">#1448</a>
<a href="">#1455</a></p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/blob/master/CHANGELOG.md">pygit2's changelog</a>.</em></p>
<blockquote>
<h1>1.19.2 (2026-03-29)</h1>
<ul>
<li>
<p>Fix refcount and error handling issues in <code>filter_register(...)</code></p>
</li>
<li>
<p>Fix config with valueless keys
<a href="">#1457</a></p>
</li>
<li>
<p>New <code>Repository.load_filter_list(...)</code> and <code>FilterList</code>
<a href="">#1444</a></p>
</li>
<li>
<p>New <code>Odb.read_header(...)</code> and now <code>Odb.read(...)</code> returns <code>enums.ObjectType</code> instead of int
<a href="">#1450</a></p>
</li>
<li>
<p>Build and CI fixes
<a href="">#1446</a>
<a href="">#1448</a>
<a href="">#1455</a></p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>627c4c1</code></a> Release 1.19.2</li>
<li><a href=""><code>be7adf8</code></a> Fixed RuntimeError when iterating git config entries with valueless keys. (<a href="">#1</a>...</li>
<li><a href=""><code>a44a305</code></a> Update changelog</li>
<li><a href=""><code>6b027da</code></a> fix: set build-backend in pyproject.toml</li>
<li><a href=""><code>885553b</code></a> Memory review filter_register with Kimi's help</li>
<li><a href=""><code>555b1f3</code></a> Add Odb.read_header</li>
<li><a href=""><code>b4ed388</code></a> Odb.read returns ObjectType enum instead of int</li>
<li><a href=""><code>070e6b2</code></a> Fix signature info in Odb.read's docstring</li>
<li><a href=""><code>4ad82f8</code></a> chore(CI): bump the actions group with 2 updates</li>
<li><a href=""><code>a6b354f</code></a> Update changelog</li>
<li>Additional commits viewable in <a href="https://github.com/libgit2/pygit2/compare/v1.19.1...v1.19.2">compare view</a></li>
</ul>
</details>
<br />

Updates `pygithub` from 2.9.0 to 2.9.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pygithub/pygithub/releases">pygithub's releases</a>.</em></p>
<blockquote>
<h2>v2.9.1</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Fix getting release by tag in lazy mode by <a href="https://github.com/EnricoMi"><code>@​EnricoMi</code></a> in <a href="">PyGithub/PyGithub#3469</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/PyGithub/PyGithub/compare/v2.9.0...v2.9.1">https://github.com/PyGithub/PyGithub/compare/v2.9.0...v2.9.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/PyGithub/PyGithub/blob/main/doc/changes.rst">pygithub's changelog</a>.</em></p>
<blockquote>
<h2>Version 2.9.1 (April 14, 2026)</h2>
<p>Bug Fixes
^^^^^^^^^</p>
<ul>
<li>Fix getting release by tag in lazy mode (<code> &lt;</code><em>) (<code>7d1ba281e &lt;</code></em>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>73742d4</code></a> Release 2.9.1 (<a href="">#3478</a>)</li>
<li><a href=""><code>7d1ba28</code></a> Fix getting release by tag in lazy mode (<a href="">#3469</a>)</li>
<li>See full diff in <a href="https://github.com/pygithub/pygithub/compare/v2.9.0...v2.9.1">compare view</a></li>
</ul>
</details>
<br />

Updates `requests` from 2.33.0 to 2.33.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.33.1</h2>
<h2>2.33.1 (2026-03-30)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed test cleanup for CVE-2026-25645 to avoid leaving unnecessary
files in the tmp directory. (<a href="">#7305</a>)</li>
<li>Fixed Content-Type header parsing for malformed values. (<a href="">#7309</a>)</li>
<li>Improved error consistency for malformed header values. (<a href="">#7308</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/ferdnyc"><code>@​ferdnyc</code></a> made their first contribution in <a href="">psf/requests#7277</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2331-2026-03-30">https://github.com/psf/requests/blob/main/HISTORY.md#2331-2026-03-30</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.33.1 (2026-03-30)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed test cleanup for CVE-2026-25645 to avoid leaving unnecessary
files in the tmp directory. (<a href="">#7305</a>)</li>
<li>Fixed Content-Type header parsing for malformed values. (<a href="">#7309</a>)</li>
<li>Improved error consistency for malformed header values. (<a href="">#7308</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>111d2b7</code></a> v2.33.1</li>
<li><a href=""><code>f0198e6</code></a> Fix malformed value parsing for Content-Type (<a href="">#7309</a>)</li>
<li><a href=""><code>bc7dd0f</code></a> Fix cosmetic header validity parsing regex (<a href="">#7308</a>)</li>
<li><a href=""><code>4443b1a</code></a> Fix unintended test extra (<a href="">#7306</a>)</li>
<li><a href=""><code>389eea5</code></a> Cleanup extracted file after extract_zipped_path test (<a href="">#7305</a>)</li>
<li><a href=""><code>7407309</code></a> Packaging: DRY out extras definition (<a href="">#7277</a>)</li>
<li>See full diff in <a href="https://github.com/psf/requests/compare/v2.33.0...v2.33.1">compare view</a></li>
</ul>
</details>
<br />

Updates `sentry-sdk[falcon]` to 2.58.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/releases">sentry-sdk[falcon]'s releases</a>.</em></p>
<blockquote>
<h2>2.58.0</h2>
<h3>New Features ✨</h3>
<ul>
<li>(ai) Redact base64 data URLs in image_url content blocks by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5953</a></li>
<li>(integrations) Instrument pyreqwest tracing by <a href="https://github.com/servusdei2018"><code>@​servusdei2018</code></a> in <a href="">#5682</a></li>
<li>(litellm) Add async callbacks by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5969</a></li>
</ul>
<h3>Bug Fixes 🐛</h3>
<h4>Anthropic</h4>
<ul>
<li>Capture exceptions for <code>stream()</code> calls by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5950</a></li>
<li>Stop setting transaction status when child span fails by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5717</a></li>
<li>Only finish relevant spans in .create() patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5716</a></li>
</ul>
<h4>Pydantic Ai</h4>
<ul>
<li>Adapt import for new library versions by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5984</a></li>
<li>Use first-class hooks when available by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5947</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(huggingface_hub) Stop setting transaction status when a child span fails by <a href="https://github.com/Zenithatic"><code>@​Zenithatic</code></a> in <a href="">#5952</a></li>
<li>(litellm) Avoid double span exits when streaming by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5933</a></li>
<li>(wsgi) Respect HTTP_X_FORWARDED_PROTO in request.url construction by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#5963</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<h4>Litellm</h4>
<ul>
<li>Replace mocks with <code>httpx</code> types in rate-limit test by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5975</a></li>
<li>Replace mocks with <code>httpx</code> types in embedding tests by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5970</a></li>
<li>Replace mocks with <code>httpx</code> types in nonstreaming <code>completion()</code> tests by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5937</a></li>
<li>Remove dead attributes by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5985</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(ai) Remove <code>gen_ai.tool.type</code> span attribute by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5964</a></li>
<li>(anthropic) Separate sync and async .create() patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5715</a></li>
<li>(openai) Split token counting by API for easier deprecation by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5930</a></li>
<li>(openai-agents) Remove error attributes by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5986</a></li>
<li>(opentelemetry) Ignore mypy error by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5927</a></li>
<li>🤖 Update test matrix with new releases (04/13) by <a href="https://github.com/github-actions"><code>@​github-actions</code></a> in <a href="">#5983</a></li>
<li>Fix license metadata in setup.py by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#5934</a></li>
<li>Update validate-pr workflow by <a href="https://github.com/stephanie-anderson"><code>@​stephanie-anderson</code></a> in <a href="">#5931</a></li>
</ul>
<h3>Other</h3>
<ul>
<li>Handle <code>None</code> span context in the span processor and pin tokenizers version for anthropic tests on Python 3.8 by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5967</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md">sentry-sdk[falcon]'s changelog</a>.</em></p>
<blockquote>
<h2>2.58.0</h2>
<h3>New Features ✨</h3>
<ul>
<li>(ai) Redact base64 data URLs in image_url content blocks by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5953</a></li>
<li>(integrations) Instrument pyreqwest tracing by <a href="https://github.com/servusdei2018"><code>@​servusdei2018</code></a> in <a href="">#5682</a></li>
<li>(litellm) Add async callbacks by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5969</a></li>
</ul>
<h3>Bug Fixes 🐛</h3>
<h4>Anthropic</h4>
<ul>
<li>Capture exceptions for <code>stream()</code> calls by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5950</a></li>
<li>Stop setting transaction status when child span fails by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5717</a></li>
<li>Only finish relevant spans in .create() patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5716</a></li>
</ul>
<h4>Pydantic Ai</h4>
<ul>
<li>Adapt import for new library versions by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5984</a></li>
<li>Use first-class hooks when available by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5947</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(huggingface_hub) Stop setting transaction status when a child span fails by <a href="https://github.com/Zenithatic"><code>@​Zenithatic</code></a> in <a href="">#5952</a></li>
<li>(litellm) Avoid double span exits when streaming by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5933</a></li>
<li>(wsgi) Respect HTTP_X_FORWARDED_PROTO in request.url construction by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#5963</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<h4>Litellm</h4>
<ul>
<li>Replace mocks with <code>httpx</code> types in rate-limit test by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5975</a></li>
<li>Replace mocks with <code>httpx</code> types in embedding tests by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5970</a></li>
<li>Replace mocks with <code>httpx</code> types in nonstreaming <code>completion()</code> tests by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5937</a></li>
<li>Remove dead attributes by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5985</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(ai) Remove <code>gen_ai.tool.type</code> span attribute by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5964</a></li>
<li>(anthropic) Separate sync and async .create() patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5715</a></li>
<li>(openai) Split token counting by API for easier deprecation by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#5930</a></li>
<li>(openai-agents) Remove error attributes by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5986</a></li>
<li>(opentelemetry) Ignore mypy error by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5927</a></li>
<li>🤖 Update test matrix with new releases (04/13) by <a href="https://github.com/github-actions"><code>@​github-actions</code></a> in <a href="">#5983</a></li>
<li>Fix license metadata in setup.py by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#5934</a></li>
<li>Update validate-pr workflow by <a href="https://github.com/stephanie-anderson"><code>@​stephanie-anderson</code></a> in <a href="">#5931</a></li>
</ul>
<h3>Other</h3>
<ul>
<li>Handle <code>None</code> span context in the span processor and pin tokenizers version for anthropic tests on Python 3.8 by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#5967</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce445d9</code></a> release: 2.58.0</li>
<li><a href=""><code>c0c0e9c</code></a> feat(litellm): Add async callbacks (<a href="">#5969</a>)</li>
<li><a href=""><code>ea74b63</code></a> test(litellm): Replace mocks with <code>httpx</code> types in rate-limit test (<a href="">#5975</a>)</li>
<li><a href=""><code>06ed1bc</code></a> test(litellm): Replace mocks with <code>httpx</code> types in embedding tests (<a href="">#5970</a>)</li>
<li><a href=""><code>66ef2e6</code></a> test(litellm): Replace mocks with <code>httpx</code> types in nonstreaming `completion()...</li>
<li><a href=""><code>96ebbf6</code></a> fix(litellm): Avoid double span exits when streaming (<a href="">#5933</a>)</li>
<li><a href=""><code>7e22b5d</code></a> build(deps): bump actions/github-script from 8.0.0 to 9.0.0 (<a href="">#5979</a>)</li>
<li><a href=""><code>35151a9</code></a> build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1 (<a href="">#5980</a>)</li>
<li><a href=""><code>d1c5b53</code></a> build(deps): bump actions/create-github-app-token from 3.0.0 to 3.1.1 (<a href="">#5981</a>)</li>
<li><a href=""><code>e255aaf</code></a> build(deps): bump getsentry/testing-ai-sdk-integrations from 6b1f51ec8af03e19...</li>
<li>Additional commits viewable in <a href="https://github.com/getsentry/sentry-python/compare/2.50.0...2.58.0">compare view</a></li>
</ul>
</details>
<br />

Updates `taskiq[reload]` to 0.12.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/taskiq-python/taskiq/releases">taskiq[reload]'s releases</a>.</em></p>
<blockquote>
<h2>0.12.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix: Handle missing worker processes on shutdown by <a href="https://github.com/dzhamaldev"><code>@​dzhamaldev</code></a> in <a href="">taskiq-python/taskiq#564</a></li>
<li>Fixed reload-loop. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq#568</a></li>
<li>Fix documentation because faststream change website domain by <a href="https://github.com/azmovi"><code>@​azmovi</code></a> in <a href="">taskiq-python/taskiq#579</a></li>
<li>Fix heading levels in middlewares documentation by <a href="https://github.com/flxdot"><code>@​flxdot</code></a> in <a href="">taskiq-python/taskiq#576</a></li>
<li>Fix license classifier metadata by <a href="https://github.com/Robanni"><code>@​Robanni</code></a> in <a href="">taskiq-python/taskiq#573</a></li>
<li>Changed log for scheduler errors. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq#581</a></li>
<li>Replace utils.remove_suffix() with built-in str.removesuffix() by <a href="https://github.com/uhx"><code>@​uhx</code></a> in <a href="">taskiq-python/taskiq#583</a></li>
<li>Update message-format.md with serializer examples by <a href="https://github.com/matthewbal"><code>@​matthewbal</code></a> in <a href="">taskiq-python/taskiq#584</a></li>
<li>Fix: PrometheusMiddleware exports metrics from only one worker when --workers &gt; 1 by <a href="https://github.com/sergey-chek"><code>@​sergey-chek</code></a> in <a href="">taskiq-python/taskiq#594</a></li>
<li>feat: Change shutdown warning logs to info level by <a href="https://github.com/nkhitrov"><code>@​nkhitrov</code></a> in <a href="">taskiq-python/taskiq#596</a></li>
<li>Added Fastapi Lifespan to docs  by <a href="https://github.com/Shaxzodbek16"><code>@​Shaxzodbek16</code></a> in <a href="">taskiq-python/taskiq#589</a></li>
<li>Fixed UV python download failures. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq#597</a></li>
<li>docs: fix typo at max_retries explanation by <a href="https://github.com/wimble3"><code>@​wimble3</code></a> in <a href="">taskiq-python/taskiq#601</a></li>
<li>Fix .gitignore search in FileWatcher by <a href="https://github.com/LaryStef"><code>@​LaryStef</code></a> in <a href="">taskiq-python/taskiq#598</a></li>
<li>Get rid of izulu by <a href="https://github.com/mahenzon"><code>@​mahenzon</code></a> in <a href="">taskiq-python/taskiq#606</a></li>
<li>Fixed shared labels. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq#609</a></li>
<li>Added autoversioning. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq#610</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/dzhamaldev"><code>@​dzhamaldev</code></a> made their first contribution in <a href="">taskiq-python/taskiq#564</a></li>
<li><a href="https://github.com/azmovi"><code>@​azmovi</code></a> made their first contribution in <a href="">taskiq-python/taskiq#579</a></li>
<li><a href="https://github.com/flxdot"><code>@​flxdot</code></a> made their first contribution in <a href="">taskiq-python/taskiq#576</a></li>
<li><a href="https://github.com/Robanni"><code>@​Robanni</code></a> made their first contribution in <a href="">taskiq-python/taskiq#573</a></li>
<li><a href="https://github.com/uhx"><code>@​uhx</code></a> made their first contribution in <a href="">taskiq-python/taskiq#583</a></li>
<li><a href="https://github.com/matthewbal"><code>@​matthewbal</code></a> made their first contribution in <a href="">taskiq-python/taskiq#584</a></li>
<li><a href="https://github.com/sergey-chek"><code>@​sergey-chek</code></a> made their first contribution in <a href="">taskiq-python/taskiq#594</a></li>
<li><a href="https://github.com/nkhitrov"><code>@​nkhitrov</code></a> made their first contribution in <a href="">taskiq-python/taskiq#596</a></li>
<li><a href="https://github.com/Shaxzodbek16"><code>@​Shaxzodbek16</code></a> made their first contribution in <a href="">taskiq-python/taskiq#589</a></li>
<li><a href="https://github.com/wimble3"><code>@​wimble3</code></a> made their first contribution in <a href="">taskiq-python/taskiq#601</a></li>
<li><a href="https://github.com/LaryStef"><code>@​LaryStef</code></a> made their first contribution in <a href="">taskiq-python/taskiq#598</a></li>
<li><a href="https://github.com/mahenzon"><code>@​mahenzon</code></a> made their first contribution in <a href="">taskiq-python/taskiq#606</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/taskiq-python/taskiq/compare/0.12.1...0.12.2">https://github.com/taskiq-python/taskiq/compare/0.12.1...0.12.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>981b3d3</code></a> Added autoversioning. (<a href="">#610</a>)</li>
<li><a href=""><code>dc23835</code></a> Fixed shared labels. (<a href="">#609</a>)</li>
<li><a href=""><code>02700d4</code></a> Get rid of izulu (<a href="">#606</a>)</li>
<li><a href=""><code>dade604</code></a> Fix .gitignore search in FileWatcher (<a href="">#598</a>)</li>
<li><a href=""><code>8f7c4a1</code></a> fix: fix typo at max_retries explanation</li>
<li><a href=""><code>3770e73</code></a> Fixed UV python download failures. (<a href="">#597</a>)</li>
<li><a href=""><code>72d2882</code></a> Added Fastapi Lifespan to docs  (<a href="">#589</a>)</li>
<li><a href=""><code>281da9b</code></a> feat: Change shutdown warning logs to info level (<a href="">#596</a>)</li>
<li><a href=""><code>d1fa98f</code></a> Fix: Use MultiProcessCollector in PrometheusMiddleware for multi-worker suppo...</li>
<li><a href=""><code>eb29304</code></a> docs: separate code example from installation comand and fix typos</li>
<li>Additional commits viewable in <a href="https://github.com/taskiq-python/taskiq/compare/0.11.18...0.12.2">compare view</a></li>
</ul>
</details>
<br />

Updates `uvicorn[standard]` to 0.46.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/releases">uvicorn[standard]'s releases</a>.</em></p>
<blockquote>
<h2>Version 0.46.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Support <code>ws_max_size</code> in <code>wsproto</code> implementation by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2915</a></li>
<li>Support <code>ws_ping_interval</code> and <code>ws_ping_timeout</code> in <code>wsproto</code> implementation by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2916</a></li>
<li>Use <code>bytearray</code> for incoming WebSocket message buffer in websockets-sansio by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2917</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Kludex/uvicorn/compare/0.45.0...0.46.0">https://github.com/Kludex/uvicorn/compare/0.45.0...0.46.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md">uvicorn[standard]'s changelog</a>.</em></p>
<blockquote>
<h2>0.46.0 (April 23, 2026)</h2>
<h3>Added</h3>
<ul>
<li>Support <code>ws_max_size</code> in <code>wsproto</code> implementation (<a href="">#2915</a>)</li>
<li>Support <code>ws_ping_interval</code> and <code>ws_ping_timeout</code> in <code>wsproto</code> implementation (<a href="">#2916</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Use <code>bytearray</code> for incoming WebSocket message buffer in <code>websockets-sansio</code> (<a href="">#2917</a>)</li>
</ul>
<h2>0.45.0 (April 21, 2026)</h2>
<h3>Added</h3>
<ul>
<li>Add <code>--reset-contextvars</code> flag to isolate ASGI request context (<a href="">#2912</a>)</li>
<li>Accept <code>os.PathLike</code> for <code>log_config</code> (<a href="">#2905</a>)</li>
<li>Accept <code>log_level</code> strings case-insensitively (<a href="">#2907</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Revert &quot;Emit <code>http.disconnect</code> on server shutdown for streaming responses&quot; (<a href="">#2913</a>)</li>
<li>Revert &quot;Explicitly start ASGI run with empty context&quot; (<a href="">#2911</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Preserve forwarded client ports in proxy headers middleware (<a href="">#2903</a>)</li>
<li>Raise helpful <code>ImportError</code> when PyYAML is missing for YAML log config (<a href="">#2906</a>)</li>
</ul>
<h2>0.44.0 (April 6, 2026)</h2>
<h3>Added</h3>
<ul>
<li>Implement websocket keepalive pings for websockets-sansio (<a href="">#2888</a>)</li>
</ul>
<h2>0.43.0 (April 3, 2026)</h2>
<p>You can quit Uvicorn now. We heard you, <a href="https://github.com/pamelafox"><code>@​pamelafox</code></a> - all 47 of your Ctrl+C's (thanks for flagging it, and thanks to <a href="https://github.com/tiangolo"><code>@​tiangolo</code></a> for the fix 🙏). <a href="https://x.com/pamelafox/status/2039097686155227623">See the tweet</a>.</p>
<h3>Changed</h3>
<ul>
<li>Emit <code>http.disconnect</code> ASGI <code>receive()</code> event on server shutting down for streaming responses (<a href="">#2829</a>)</li>
<li>Use native <code>context</code> parameter for <code>create_task</code> on Python 3.11+ (<a href="">#2859</a>)</li>
<li>Drop cast in ASGI types (<a href="">#2875</a>)</li>
</ul>
<h2>0.42.0 (March 16, 2026)</h2>
<h3>Changed</h3>
<ul>
<li>Use <code>bytearray</code> for request body accumulation to avoid O(n^2) allocation on fragmented bodies (<a href="">#2845</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b224045</code></a> Version 0.46.0 (<a href="">#2918</a>)</li>
<li><a href=""><code>7375b5b</code></a> Use <code>bytearray</code> for incoming WebSocket message buffer in websockets-sansio (#...</li>
<li><a href=""><code>d438fb1</code></a> Support <code>ws_ping_interval</code> and <code>ws_ping_timeout</code> in <code>wsproto</code> implementation ...</li>
<li><a href=""><code>3e6b964</code></a> Support <code>ws_max_size</code> in <code>wsproto</code> implementation (<a href="">#2915</a>)</li>
<li><a href=""><code>2c423bd</code></a> Version 0.45.0 (<a href="">#2914</a>)</li>
<li><a href=""><code>7f027f8</code></a> Revert &quot;Emit <code>http.disconnect</code> on server shutdown for streaming responses&quot; (#...</li>
<li><a href=""><code>73a80c3</code></a> Add <code>--reset-contextvars</code> flag to isolate ASGI request context (<a href="">#2912</a>)</li>
<li><a href=""><code>45c0b56</code></a> Revert empty context for ASGI runs (<a href="">#2911</a>)</li>
<li><a href=""><code>850d926</code></a> Raise helpful <code>ImportError</code> when PyYAML is missing for YAML log config (<a href="">#2906</a>)</li>
<li><a href=""><code>fdcacb4</code></a> Accept <code>log_level</code> strings case-insensitively (<a href="">#2907</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/Kludex/uvicorn/compare/0.34.3...0.46.0">compare view</a></li>
</ul>
</details>
<br />

Updates `datalad` from 1.3.4 to 1.4.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/releases">datalad's releases</a>.</em></p>
<blockquote>
<h2>1.4.1</h2>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>BF: update patoolib imports for 2.0 API change and coverage-bin/datalad to arbitrary path to execute from.  [PR <a href="">#7832</a>](<a href="">datalad/datalad#7832</a>) (by <a href="https://github.com/jkonieczny2"><code>@​jkonieczny2</code></a>)</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Skip <code>openfiles</code> tests when <code>psutil</code> is not installed instead of
failing with <code>ImportError</code>.
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>1.4.0</h2>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p>DataLad now provides a pytest plugin that automatically registers custom markers and pytest configuration for DataLad extensions. Extensions no longer need to duplicate 31 marker definitions and pytest configuration in their tox.ini files. The plugin is automatically discovered when datalad is installed, making it easier for extensions to inherit consistent test configuration. [PR <a href="">#7793</a>](<a href="">datalad/datalad#7793</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>[ENH ] allow using submodule {path_basename} as props for url rewrite.  [PR <a href="">#7726</a>](<a href="">datalad/datalad#7726</a>) (by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
<li>
<p>Add <code>--message</code> option to <code>clone</code>, <code>create</code>, and <code>update</code> for custom commit messages when registering subdatasets. Related to <a href="">#3316</a> via [PR <a href="">#7785</a>](<a href="">datalad/datalad#7785</a>) (by <a href="https://github.com/asmacdo"><code>@​asmacdo</code></a>)</p>
</li>
</ul>
<h2>📝 Documentation</h2>
<ul>
<li>Overhaul <code>CONTRIBUTING.md</code>: add testing guidance (red/green TDD workflow,
<code>@with_tree</code>/<code>@with_tempfile</code> examples, result assertion helpers, marks
table), extend Code Style rules, and tighten the file by removing command
duplication, condensing Benchmarking and Environment Variables sections,
and consolidating branch/commit prefix lists into a single table.
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🎉 Enhancements</h2>
<ul>
<li>ENH: config option <code>datalad.save.skip-openfiles</code> to handle situation with files open for writing during <code>datalad save</code>.  [PR <a href="">#7811</a>](<a href="">datalad/datalad#7811</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/blob/maint/CHANGELOG.md">datalad's changelog</a>.</em></p>
<blockquote>
<h1>1.4.1 (2026-04-08)</h1>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>BF: update patoolib imports for 2.0 API change and coverage-bin/datalad to arbitrary path to execute from.  [PR <a href="">#7832</a>](<a href="">datalad/datalad#7832</a>) (by <a href="https://github.com/jkonieczny2"><code>@​jkonieczny2</code></a>)</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Skip <code>openfiles</code> tests when <code>psutil</code> is not installed instead of
failing with <code>ImportError</code>.
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h1>1.4.0 (2026-04-01)</h1>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p>DataLad now provides a pytest plugin that automatically registers custom markers and pytest configuration for DataLad extensions. Extensions no longer need to duplicate 31 marker definitions and pytest configuration in their tox.ini files. The plugin is automatically discovered when datalad is installed, making it easier for extensions to inherit consistent test configuration. [PR <a href="">#7793</a>](<a href="">datalad/datalad#7793</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>[ENH ] allow using submodule {path_basename} as props for url rewrite.  [PR <a href="">#7726</a>](<a href="">datalad/datalad#7726</a>) (by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
<li>
<p>Add <code>--message</code> option to <code>clone</code>, <code>create</code>, and <code>update</code> for custom commit messages when registering subdatasets. Related to <a href="">#3316</a> via [PR <a href="">#7785</a>](<a href="">datalad/datalad#7785</a>) (by <a href="https://github.com/asmacdo"><code>@​asmacdo</code></a>)</p>
</li>
</ul>
<h2>📝 Documentation</h2>
<ul>
<li>Overhaul <code>CONTRIBUTING.md</code>: add testing guidance (red/green TDD workflow,
<code>@with_tree</code>/<code>@with_tempfile</code> examples, result assertion helpers, marks
table), extend Code Style rules, and tighten the file by removing command
duplication, condensing Benchmarking and Environment Variables sections,
and consolidating branch/commit prefix lists into a single table.
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🎉 Enhancements</h2>
<ul>
<li>ENH: config option <code>datalad.save.skip-openfiles</code> to handle situation with files open for writing during <code>datalad save</code>.  [PR <a href="">#7811</a>](<a href="">datalad/datalad#7811</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c3895a</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>5825d44</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>8a8d49d</code></a> Merge pull request <a href="">#7729</a> from yarikoptic/bf-4700</li>
<li><a href=""><code>aec8e08</code></a> Merge pull request <a href="">#7832</a> from jkonieczny2/bf-update-patoolib-imports</li>
<li><a href=""><code>75e4a01</code></a> Merge pull request <a href="">#7837</a> from datalad/bf-ci-fixes</li>
<li><a href=""><code>9aeeb50</code></a> BF(TST): move and reuse <a href="https://github.com/skip"><code>@​skip</code></a>_if_no_psutil for more tests in save</li>
<li><a href=""><code>a0298e6</code></a> [release-action] Autogenerate changelog snippet for PR 7832</li>
<li><a href=""><code>4151383</code></a> Use <code>external_version</code> for comparison for patool</li>
<li><a href=""><code>b1ee79e</code></a> [coverage] don't use PWD, otherwise tests fail because they can't find .cover...</li>
<li><a href=""><code>bd1be05</code></a> [archive_utils_patool] don't check patool 1.x for coverage since CI/CD uses p...</li>
<li>Additional commits viewable in <a href="https://github.com/datalad/datalad/compare/1.3.4...1.4.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.7 to 0.15.11
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.11</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] Ignore <code>RUF029</code> when function is decorated with <code>asynccontextmanager</code> (<a href="">#24642</a>)</li>
<li>[<code>airflow</code>] Implement <code>airflow-xcom-pull-in-template-string</code> (<code>AIR201</code>) (<a href="">#23583</a>)</li>
<li>[<code>flake8-bandit</code>] Fix <code>S103</code> false positives and negatives in mask analysis (<a href="">#24424</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Omit overridden methods for <code>ASYNC109</code> (<a href="">#24648</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-async</code>] Add override mention to <code>ASYNC109</code> docs (<a href="">#24666</a>)</li>
<li>Update Neovim config examples to use <code>vim.lsp.config</code> (<a href="">#24577</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/benberryallwood"><code>@​benberryallwood</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
</ul>
<h2>Install ruff 0.15.11</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ruff 0.15.11</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-apple-darwin.tar.gz">ruff-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-x86_64-apple-darwin.tar.gz">ruff-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-pc-windows-msvc.zip">ruff-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-i686-pc-windows-msvc.zip">ruff-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.11</h2>
<p>Released on 2026-04-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] Ignore <code>RUF029</code> when function is decorated with <code>asynccontextmanager</code> (<a href="">#24642</a>)</li>
<li>[<code>airflow</code>] Implement <code>airflow-xcom-pull-in-template-string</code> (<code>AIR201</code>) (<a href="">#23583</a>)</li>
<li>[<code>flake8-bandit</code>] Fix <code>S103</code> false positives and negatives in mask analysis (<a href="">#24424</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Omit overridden methods for <code>ASYNC109</code> (<a href="">#24648</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-async</code>] Add override mention to <code>ASYNC109</code> docs (<a href="">#24666</a>)</li>
<li>Update Neovim config examples to use <code>vim.lsp.config</code> (<a href="">#24577</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/benberryallwood"><code>@​benberryallwood</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
</ul>
<h2>0.15.10</h2>
<p>Released on 2026-04-09.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-logging</code>] Allow closures in except handlers (<code>LOG004</code>) (<a href="">#24464</a>)</li>
<li>[<code>flake8-self</code>] Make <code>SLF</code> diagnostics robust to non-self-named variables (<a href="">#24281</a>)</li>
<li>[<code>flake8-simplify</code>] Make the fix for <code>collapsible-if</code> safe in <code>preview</code> (<code>SIM102</code>) (<a href="">#24371</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Avoid emitting multi-line f-string elements before Python 3.12 (<a href="">#24377</a>)</li>
<li>Avoid syntax error from <code>E502</code> fixes in f-strings and t-strings (<a href="">#24410</a>)</li>
<li>Strip form feeds from indent passed to <code>dedent_to</code> (<a href="">#24381</a>)</li>
<li>[<code>pyupgrade</code>] Fix panic caused by handling of octals (<code>UP012</code>) (<a href="">#24390</a>)</li>
<li>Reject multi-line f-string elements before Python 3.12 (<a href="">#24355</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>ruff</code>] Treat f-string interpolation as potential side effect (<code>RUF019</code>) (<a href="">#24426</a>)</li>
</ul>
<h3>Server</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53554b1</code></a> Bump 0.15.11 (<a href="">#24678</a>)</li>
<li><a href=""><code>08c56c8</code></a> Factor out the <code>mdtest</code> crate (<a href="">#24616</a>)</li>
<li><a href=""><code>725fbb7</code></a> [ty] Use partially qualified names when reporting diagnostics regarding bad c...</li>
<li><a href=""><code>ddd6a30</code></a> [ty] Do not suggest argument completion when at value of keyword argument (<a href="">#2</a>...</li>
<li><a href=""><code>9282e61</code></a> Disallow <a href="https://github.com/disjoint"><code>@​disjoint</code></a>_base on TypedDicts and Protocols (<a href="">#24671</a>)</li>
<li><a href="https://github.com/ast...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `164afdedb1ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.