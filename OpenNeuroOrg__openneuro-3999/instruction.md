# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 10 updates

## Description

Updates the requirements on [boto3](https://github.com/boto/boto3), [falcon](https://github.com/falconry/falcon), [pygit2](https://github.com/libgit2/pygit2), [sentry-sdk[falcon]](https://github.com/getsentry/sentry-python), [taskiq-redis](https://github.com/taskiq-python/taskiq-redis), [uvicorn[standard]](https://github.com/Kludex/uvicorn), [coverage](https://github.com/coveragepy/coveragepy), [datalad](https://github.com/datalad/datalad), [pytest](https://github.com/pytest-dev/pytest) and [ruff](https://github.com/astral-sh/ruff) to permit the latest version.
Updates `boto3` from 1.43.14 to 1.43.36
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1d26f21</code></a> Merge branch 'release-1.43.36'</li>
<li><a href=""><code>111333b</code></a> Bumping version to 1.43.36</li>
<li><a href=""><code>9d1fa23</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>6d7f3c2</code></a> Update security docs to use newer versions of openssl and python (<a href="">#4796</a>)</li>
<li><a href=""><code>c5b26ca</code></a> Merge branch 'release-1.43.35'</li>
<li><a href=""><code>c3750ac</code></a> Merge branch 'release-1.43.35' into develop</li>
<li><a href=""><code>46e77cd</code></a> Bumping version to 1.43.35</li>
<li><a href=""><code>9919ede</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>1820b7d</code></a> Merge branch 'release-1.43.34'</li>
<li><a href=""><code>0065dbe</code></a> Merge branch 'release-1.43.34' into develop</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.43.14...1.43.36">compare view</a></li>
</ul>
</details>
<br />

Updates `falcon` from 4.2.0 to 4.3.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/falconry/falcon/releases">falcon's releases</a>.</em></p>
<blockquote>
<h2>4.3.1</h2>
<p>This is a <a href="https://falcon.readthedocs.io/en/4.3.1/community/releases.html#semver">SemVer</a> patch release that makes Falcon’s own test suite compatible with the recently released <code>cbor2</code> 6.x series.</p>
<p>🐍 <a href="https://pypi.org/project/falcon/4.3.1/">Falcon 4.3.1 on PyPI</a>
📚 <a href="https://falcon.readthedocs.io/en/4.3.1/changes/4.3.1.html">Changelog on RtD</a></p>
<p>Documentation and tests aside, this release is functionally identical to <a href="https://github.com/falconry/falcon/releases/tag/4.3.0">Falcon 4.3.0</a>.</p>
<h2>4.3.0</h2>
<p>Falcon 4.3.0 centers on request parsing and typing enhancements.</p>
<p>🐍 <a href="https://pypi.org/project/falcon/4.3.0/">Falcon 4.3.0 on PyPI</a>
📚 <a href="https://falcon.readthedocs.io/en/4.3.0/changes/4.3.0.html">Changelog on RtD</a></p>
<p>On the parsing side, this release introduces a family of new <a href="https://falcon.readthedocs.io/en/4.3.0/api/request_and_response_wsgi.html#falcon.Request">Request</a> methods for extracting structured data from the query string – <a href="https://falcon.readthedocs.io/en/4.3.0/api/request_and_response_wsgi.html#falcon.Request.get_param_as_dict">get_param_as_dict()</a>, <a href="https://falcon.readthedocs.io/en/4.3.0/api/request_and_response_wsgi.html#falcon.Request.get_param_as_media">get_param_as_media()</a>, and <a href="https://falcon.readthedocs.io/en/4.3.0/api/request_and_response_wsgi.html#falcon.Request.get_query_string_as_media">get_query_string_as_media()</a> – together with a new <code>delimiter</code> argument for <a href="https://falcon.readthedocs.io/en/4.3.0/api/request_and_response_wsgi.html#falcon.Request.get_param_as_list">get_param_as_list()</a>. Several of these align with OpenAPI v3 (and 3.2) parameter styles, making it easier to implement spec-compliant APIs on top of Falcon.</p>
<p>On the typing side, our internal annotations are now strict enough for the project to pass <code>mypy --strict falcon/</code>, and <a href="https://falcon.readthedocs.io/en/4.3.0/api/typing.html#generic-app-types">generic App types</a> are now automatically parametrized by the default request/response types on CPython 3.13+.</p>
<p>This release also brings a number of smaller improvements, including MessagePack support in the test client, an opt-in <code>on_request()</code> default responder, and hardening of <a href="https://falcon.readthedocs.io/en/4.3.0/api/util.html#falcon.secure_filename">falcon.secure_filename()</a> against Windows reserved device names.</p>
<p>Two features that we had hoped to land in 4.3 – response teardown callbacks and a native OpenTelemetry integration – did not make the cut in time. Both are now at the top of our priority list for Falcon <a href="https://github.com/falconry/falcon/milestone/46">4.4</a>.</p>
<p>On the security front, our GitHub Actions workflows are now audited with <a href="https://zizmor.sh/">zizmor</a>, and we have hardened the existing workflows to address the issues it surfaced. Thanks to <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> for maintaining this excellent tool!</p>
<p>This release also incorporates many pull requests submitted by our community. Sincere thanks to all 19 contributors who made this release possible!</p>
<ul>
<li><a href="https://github.com/0x1618"><code>@​0x1618</code></a></li>
<li><a href="https://github.com/0xMattB"><code>@​0xMattB</code></a></li>
<li><a href="https://github.com/arthurprioli"><code>@​arthurprioli</code></a></li>
<li><a href="https://github.com/CaselIT"><code>@​CaselIT</code></a></li>
<li><a href="https://github.com/CuriousHet"><code>@​CuriousHet</code></a></li>
<li><a href="https://github.com/gespyrop"><code>@​gespyrop</code></a></li>
<li><a href="https://github.com/granuels"><code>@​granuels</code></a></li>
<li><a href="https://github.com/jap"><code>@​jap</code></a></li>
<li><a href="https://github.com/MannXo"><code>@​MannXo</code></a></li>
<li><a href="https://github.com/mvanhorn"><code>@​mvanhorn</code></a></li>
<li><a href="https://github.com/ReinerBRO"><code>@​ReinerBRO</code></a></li>
<li><a href="https://github.com/rushevich"><code>@​rushevich</code></a></li>
<li><a href="https://github.com/StepanUFL"><code>@​StepanUFL</code></a></li>
<li><a href="https://github.com/tang-vu"><code>@​tang-vu</code></a></li>
<li><a href="https://github.com/thisisrick25"><code>@​thisisrick25</code></a></li>
<li><a href="https://github.com/toroleapinc"><code>@​toroleapinc</code></a></li>
<li><a href="https://github.com/tuanaiseo"><code>@​tuanaiseo</code></a></li>
<li><a href="https://github.com/TudorGR"><code>@​TudorGR</code></a></li>
<li><a href="https://github.com/vytas7"><code>@​vytas7</code></a></li>
</ul>
<h2>4.3.0rc1</h2>
<p>This is the first release candidate of Falcon 4.3.</p>
<p>If you haven't tested <a href="https://github.com/falconry/falcon/releases/tag/4.3.0b1"><code>4.3.0b1</code></a> (functionally these two pre-releases are identical) yet, take this release candidate for a spin with your apps, and <a href="https://falcon.readthedocs.io/en/latest/community/help.html#chat">let us know</a> if you run into any issues (be it runtime, or type-checking)!</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/falconry/falcon/blob/master/RELEASE.md">falcon's changelog</a>.</em></p>
<blockquote>
<h2>Release Manager's Guide</h2>
<p>Release Process:</p>
<ol>
<li>Bump version (including the suffix for pre-release, if applicable).</li>
<li>Update changelog and render towncrier fragments.</li>
<li>Release beta or rc.</li>
<li>Run benchmark and check for regressions.</li>
<li>Review and edit doc changes since the last release for clarity and consistency.</li>
<li>Publish final version and add a release note.</li>
<li>Run benchmark and update falconframework.org with latest numbers.</li>
<li>Announce the new version in Gitter channels and on the socials.</li>
<li>Incorporate the tag into the current stable series branch.</li>
<li>Improve this document.</li>
</ol>
<h3>Bump version</h3>
<p>Modify <code>falcon/version.py</code> if it has not been updated since the previous
release. Examine the rendered changelog to determine the appropriate SEMVER
field to modify.</p>
<p>Note that we have dropped <code>setup.cfg</code> altogether, so <code>__version__</code> in
<code>falcon/version.py</code> must contain the <strong>whole version</strong>
(including the previously separately managed <code>tag_build</code>), for instance:</p>
<pre lang="python"><code># Development version
__version__ = '4.0.0.dev1'
<h1>First alpha</h1>
<p><strong>version</strong> = '4.0.0a1'</p>
<h1>Release candidate</h1>
<p><strong>version</strong> = '4.0.0rc1'</p>
<h1>Stable release</h1>
<p><strong>version</strong> = '4.0.0'<br />
</code></pre></p>
<p>Update changelog filename in <code>pyproject.toml</code> to suit.</p>
<h3>Update changelog and render towncrier fragments</h3>
<p>If a changelog RST has not yet been created, add one under <code>docs/changes</code> using
the following template, and update the summary and changes to supported
platforms to suit:</p>
<pre lang="rst"><code>Changelog for Falcon 4.0.1
==========================
<p>&lt;/tr&gt;&lt;/table&gt;<br />
</code></pre></p>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e18c27f</code></a> chore(release): prepare <code>4.3.1</code> patch (<a href="">#2664</a>)</li>
<li><a href=""><code>875e92a</code></a> chore(release): prepare <code>4.3.0</code> stable (<a href="">#2661</a>)</li>
<li><a href=""><code>0016a3a</code></a> chore(release): prepare <code>4.3.0rc1</code> (<a href="">#2660</a>)</li>
<li><a href=""><code>a570555</code></a> chore(release): prepare <code>4.3.0b1</code> (<a href="">#2659</a>)</li>
<li><a href=""><code>5d46622</code></a> chore(CI): upgrade to <code>cibuildwheel</code> v4.0.0 (<a href="">#2656</a>)</li>
<li><a href=""><code>370f933</code></a> chore(CI): audit GitHub actions with <code>zizmor</code> (<a href="">#2652</a>)</li>
<li><a href=""><code>5119682</code></a> chore: slightly improve pyright compat, run a couple of smoke checks (<a href="">#2650</a>)</li>
<li><a href=""><code>e6d57cc</code></a> chore(release): bump version to <code>a1</code> (<a href="">#2649</a>)</li>
<li><a href=""><code>0ce9dd8</code></a> chore: clean up recent contributions before 4.3 release (<a href="">#2632</a>)</li>
<li><a href=""><code>27814c5</code></a> chore(typing): aligh async and sync middleware params type (<a href="">#2648</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/falconry/falcon/compare/4.2.0...4.3.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pygit2` from 1.19.2 to 1.19.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/releases">pygit2's releases</a>.</em></p>
<blockquote>
<h2>1.19.3 (2026-06-13)</h2>
<ul>
<li>
<p>Memory fixes
<a href="">#1368</a>
<a href="">#1417</a>
<a href="">#1443</a></p>
</li>
<li>
<p>Fix <code>Repository.ident</code>
<a href="">#1461</a></p>
</li>
<li>
<p>Build/CI fixes and updates
<a href="">#1454</a>
<a href="">#1459</a></p>
</li>
<li>
<p>Documentation and annotation fixes
<a href="">#410</a>
<a href="">#1289</a>
<a href="">#1323</a>
<a href="">#1333</a>
<a href="">#1458</a>
<a href="">#1460</a></p>
</li>
<li>
<p>Add <code>AGENTS.md</code> file generated by Kimi-k2.6</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/libgit2/pygit2/blob/master/CHANGELOG.md">pygit2's changelog</a>.</em></p>
<blockquote>
<h1>1.19.3 (2026-06-13)</h1>
<ul>
<li>
<p>Memory fixes
<a href="">#1368</a>
<a href="">#1417</a>
<a href="">#1443</a></p>
</li>
<li>
<p>Fix <code>Repository.ident</code>
<a href="">#1461</a></p>
</li>
<li>
<p>Build/CI fixes and updates
<a href="">#1454</a>
<a href="">#1459</a></p>
</li>
<li>
<p>Documentation and annotation fixes
<a href="">#410</a>
<a href="">#1289</a>
<a href="">#1323</a>
<a href="">#1333</a>
<a href="">#1458</a>
<a href="">#1460</a></p>
</li>
<li>
<p>Add <code>AGENTS.md</code> file generated by Kimi-k2.6</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d86662e</code></a> Release 1.19.3</li>
<li><a href=""><code>9433ecd</code></a> Documentation updates and fixes</li>
<li><a href=""><code>926acaf</code></a> Add AGENTS.md file</li>
<li><a href=""><code>2d9fc7d</code></a> docs: fix warnings when building the docs</li>
<li><a href=""><code>319561c</code></a> Add contributing guidelines</li>
<li><a href=""><code>dd62675</code></a> CI: Fix windows arm build</li>
<li><a href=""><code>d040bc3</code></a> cibuildwheel: update to VS 18</li>
<li><a href=""><code>bcd60f4</code></a> Fix mypy</li>
<li><a href=""><code>7ab18e0</code></a> Fix &quot;ruff check&quot;</li>
<li><a href=""><code>282985a</code></a> Fix ruff format --diff</li>
<li>Additional commits viewable in <a href="https://github.com/libgit2/pygit2/compare/v1.19.2...v1.19.3">compare view</a></li>
</ul>
</details>
<br />

Updates `sentry-sdk[falcon]` to 2.63.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/releases">sentry-sdk[falcon]'s releases</a>.</em></p>
<blockquote>
<h2>2.63.0</h2>
<h3>Bug Fixes 🐛</h3>
<h4>Fastapi</h4>
<ul>
<li>Prevent double wrapping of sync handlers on FastAPI &gt;= 0.137 by <a href="https://github.com/jhonny-on"><code>@​jhonny-on</code></a> in <a href="">#6569</a></li>
<li>Use effective_route_context path for prefixed routers by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6572</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(asgi) Gate query string and client IP behind send_default_pii by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6501</a></li>
<li>(serializer) Avoid creating reference cycles on every call by <a href="https://github.com/Malkiz223"><code>@​Malkiz223</code></a> in <a href="">#6563</a></li>
<li>(user) Set <code>user.ip_address</code> on telemetry if present by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6555</a></li>
<li>Remove 0000 trace_id fallbacks by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#6570</a></li>
<li>MANIFEST.in: Graft tests directory. by <a href="https://github.com/charlesroelli"><code>@​charlesroelli</code></a> in <a href="">#6237</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<ul>
<li>(fastapi) Verify request info capture with POST endpoints by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6287</a></li>
<li>(starlette) Verify request info capture with POST endpoints by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6269</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md">sentry-sdk[falcon]'s changelog</a>.</em></p>
<blockquote>
<h2>2.63.0</h2>
<h3>Bug Fixes 🐛</h3>
<h4>Fastapi</h4>
<ul>
<li>Prevent double wrapping of sync handlers on FastAPI &gt;= 0.137 by <a href="https://github.com/jhonny-on"><code>@​jhonny-on</code></a> in <a href="">#6569</a></li>
<li>Use effective_route_context path for prefixed routers by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6572</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(asgi) Gate query string and client IP behind send_default_pii by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6501</a></li>
<li>(serializer) Avoid creating reference cycles on every call by <a href="https://github.com/Malkiz223"><code>@​Malkiz223</code></a> in <a href="">#6563</a></li>
<li>(user) Set <code>user.ip_address</code> on telemetry if present by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6555</a></li>
<li>Remove 0000 trace_id fallbacks by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#6570</a></li>
<li>MANIFEST.in: Graft tests directory. by <a href="https://github.com/charlesroelli"><code>@​charlesroelli</code></a> in <a href="">#6237</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<ul>
<li>(fastapi) Verify request info capture with POST endpoints by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6287</a></li>
<li>(starlette) Verify request info capture with POST endpoints by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6269</a></li>
</ul>
<h2>2.62.0</h2>
<h3>New Features ✨</h3>
<ul>
<li>
<p>Add integration for <code>aiomysql</code> by <a href="https://github.com/tonal"><code>@​tonal</code></a> in <a href="">#4703</a></p>
<p>We're adding support for the <code>aiomysql</code> package. To enable the integration, add it to your <code>integrations</code> list:</p>
<pre lang="python"><code>import sentry_sdk
from sentry_sdk.integrations.aiomysql import AioMySQLIntegration
<p>sentry_sdk.init(
traces_sample_rate=1.0,
integrations=[AioMySQLIntegration()],
)
</code></pre></p>
</li>
<li>
<p>Support HTTPX2 by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6463</a></p>
<p>We're adding out-of-the-box support for HTTPX2. As long as use the package, the Sentry integration
will be enabled automatically and you should see your requests instrumented in Sentry.</p>
<pre lang="python"><code>import httpx2
import sentry_sdk
<p>sentry_sdk.init(...)
</code></pre></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>44b008a</code></a> update changelog</li>
<li><a href=""><code>0b2af51</code></a> Update CHANGELOG.md</li>
<li><a href=""><code>250caad</code></a> release: 2.63.0</li>
<li><a href=""><code>72a57de</code></a> fix(flask): Set user data on scope at request start (<a href="">#6566</a>)</li>
<li><a href=""><code>6a4c3a1</code></a> fix: Remove 0000 trace_id fallbacks (<a href="">#6570</a>)</li>
<li><a href=""><code>1df9835</code></a> feat(falcon): Set name and source on request span when streaming (<a href="">#6562</a>)</li>
<li><a href=""><code>77874bd</code></a> test(falcon): Support span streaming (<a href="">#6561</a>)</li>
<li><a href=""><code>6bcfb9c</code></a> fix(fastapi): Prevent double wrapping of sync handlers on FastAPI &gt;= 0.137 (#...</li>
<li><a href=""><code>72d972c</code></a> fix(fastapi): use effective_route_context path for prefixed routers (<a href="">#6572</a>)</li>
<li><a href=""><code>cc802f6</code></a> feat(chalice): Add span streaming support to Chalice integration (<a href="">#6503</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/getsentry/sentry-python/compare/2.60.0...2.63.0">compare view</a></li>
</ul>
</details>
<br />

Updates `taskiq-redis` from 1.2.2 to 1.2.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/taskiq-python/taskiq-redis/releases">taskiq-redis's releases</a>.</em></p>
<blockquote>
<h2>1.2.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Updated redis version. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq-redis#125</a></li>
<li>Fixed race-condition for streambroker. by <a href="https://github.com/s3rius"><code>@​s3rius</code></a> in <a href="">taskiq-python/taskiq-redis#126</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/taskiq-python/taskiq-redis/compare/1.2.2...1.2.3">https://github.com/taskiq-python/taskiq-redis/compare/1.2.2...1.2.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>39c6b7c</code></a> Fixed race-condition for streambroker. (<a href="">#126</a>)</li>
<li><a href=""><code>da1271d</code></a> Updated redis version. (<a href="">#125</a>)</li>
<li>See full diff in <a href="https://github.com/taskiq-python/taskiq-redis/compare/1.2.2...1.2.3">compare view</a></li>
</ul>
</details>
<br />

Updates `uvicorn[standard]` to 0.49.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/releases">uvicorn[standard]'s releases</a>.</em></p>
<blockquote>
<h2>Version 0.49.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump httptools minimum version to 0.8.0 by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2962</a></li>
<li>Consume duplicate forwarding headers in ProxyHeadersMiddleware (reverses the 0.48.0 behavior of ignoring them) by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2971</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Kludex/uvicorn/compare/0.48.0...0.49.0">https://github.com/Kludex/uvicorn/compare/0.48.0...0.49.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md">uvicorn[standard]'s changelog</a>.</em></p>
<blockquote>
<h2>0.49.0 (June 3, 2026)</h2>
<h3>Changed</h3>
<ul>
<li>Bump <code>httptools</code> minimum version to 0.8.0 (<a href="">#2962</a>)</li>
<li>Consume duplicate forwarding headers in <code>ProxyHeadersMiddleware</code> (reverses the 0.48.0 behavior of ignoring them) (<a href="">#2971</a>)</li>
</ul>
<h2>0.48.0 (May 24, 2026)</h2>
<h3>Changed</h3>
<ul>
<li>Default <code>ssl_ciphers</code> to <code>None</code> and use OpenSSL defaults (<a href="">#2940</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Ignore duplicate forwarding headers in <code>ProxyHeadersMiddleware</code> (<a href="">#2944</a>)</li>
</ul>
<h2>0.47.0 (May 14, 2026)</h2>
<h3>Added</h3>
<ul>
<li>Add <code>ssl_context_factory</code> for custom <code>SSLContext</code> configuration (<a href="">#2920</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Eagerly import the ASGI app in the parent process (<a href="">#2919</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Treat <code>fd=0</code> as a valid file descriptor with reload/workers (<a href="">#2927</a>)</li>
</ul>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3ef2e3e</code></a> Version 0.49.0 (<a href="">#2973</a>)</li>
<li><a href=""><code>eeb64b1</code></a> Consume duplicate forwarding headers in ProxyHeadersMiddleware (<a href="">#2971</a>)</li>
<li><a href=""><code>630f4ac</code></a> Make the watchfiles reload tests deterministic (<a href="">#2972</a>)</li>
<li><a href=""><code>9154922</code></a> chore(deps): bump the github-actions group across 1 directory with 6 updates ...</li>
<li><a href=""><code>739727a</code></a> Migrate docs deploy from Cloudflare Pages to Workers (<a href="">#2967</a>)</li>
<li><a href=""><code>be4a240</code></a> Gate docs preview deploy on Cloudflare token presence (<a href="">#2966</a>)</li>
<li><a href=""><code>c489d7e</code></a> Bump httptools minimum version to 0.8.0 (<a href="">#2962</a>)</li>
<li><a href=""><code>9f547bd</code></a> Skip docs preview deploy for Dependabot PRs (<a href="">#2961</a>)</li>
<li><a href=""><code>44446b8</code></a> Migrate documentation from MkDocs Material to Zensical (<a href="">#2959</a>)</li>
<li><a href=""><code>cfd659c</code></a> Bump pymdown-extensions to 10.21.3 (<a href="">#2958</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/Kludex/uvicorn/compare/0.48.0...0.49.0">compare view</a></li>
</ul>
</details>
<br />

Updates `coverage` from 7.14.0 to 7.14.3
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.14.3 — 2026-06-22</h2>
<ul>
<li>
<p>Fix: the default <code>...</code> exclusion rule now also matches function bodies
whose closing return-type bracket is on its own line (for example, after a
long <code>-&gt; dict[ ... ]</code> annotation that a formatter has split over multiple
lines). Closes <code>issue 2185</code><em>, thanks <code>Mengjia Shang &lt;pull 2196_&gt;</code></em>.</p>
</li>
<li>
<p>Fix: On 3.13t, we incorrectly issued <code>Couldn't import C tracer</code> errors.
We can't import the C tracer because in 7.14.2 we stopped shipping compiled
wheels for 3.13t. Thanks, <code>Hugo van Kemenade &lt;pull 2203_&gt;</code>_.</p>
</li>
</ul>
<p>.. _issue 2185: <a href="">coveragepy/coveragepy#2185</a>
.. _pull 2196: <a href="">coveragepy/coveragepy#2196</a>
.. _pull 2203: <a href="">coveragepy/coveragepy#2203</a></p>
<p>.. _changes_7-14-2:</p>
<h2>Version 7.14.2 — 2026-06-20</h2>
<ul>
<li>
<p>Fix: some messages were being written to stdout, making <code>coverage json -o -</code> useless for capturing JSON output. Now messages are written to stderr,
fixing <code>issue 2197</code>_.</p>
</li>
<li>
<p>Fix: <code>CoverageData</code> kept one SQLite connection per thread that recorded
coverage, but never closed them when those threads terminated. On long runs
with many short-lived threads this leaked one file descriptor per dead
thread, eventually failing with <code>OSError: [Errno 24] Too many open files</code>.
Connections belonging to terminated threads are now closed and dropped.
Fixes <code>issue 2192</code><em>.  Thanks, <code>Matthew Lloyd &lt;pull 2193_&gt;</code></em>.</p>
</li>
<li>
<p>Fix: when using sys.monitoring, we were assuming we could use the
<code>COVERAGE_ID</code> tool id.  But other tools might also assume they could use
that id.  Pre-allocated ids don't really make sense, so now we search for a
usable one instead. Fixes <code>issue 2187</code>_.</p>
</li>
<li>
<p>Following <code>the advice of cibuildwheel &lt;no-13t_&gt;</code>_, we no longer distribute
wheels for Python 3.13 free-threaded.</p>
</li>
</ul>
<p>.. _issue 2187: <a href="">coveragepy/coveragepy#2187</a>
.. _issue 2192: <a href="">coveragepy/coveragepy#2192</a>
.. _pull 2193: <a href="">coveragepy/coveragepy#2193</a>
.. _issue 2197: <a href="">coveragepy/coveragepy#2197</a>
.. _no-13t: <a href="https://py-free-threading.github.io/ci/#building-free-threaded-wheels-with-cibuildwheel">https://py-free-threading.github.io/ci/#building-free-threaded-wheels-with-cibuildwheel</a></p>
<p>.. _changes_7-14-1:</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>22f13ea</code></a> docs: sample HTML for 7.14.3</li>
<li><a href=""><code>2ca4e5f</code></a> docs: prep for 7.14.3</li>
<li><a href=""><code>01d714e</code></a> docs: add changelog entry for <a href="">#2203</a></li>
<li><a href=""><code>f36248d</code></a> fix: don't emit 'Couldn't import C tracer' warning for 3.13t (<a href="">#2203</a>)</li>
<li><a href=""><code>86d73d1</code></a> docs: thanks, Mengjia Shang</li>
<li><a href=""><code>3d4ae3c</code></a> docs: add the <a href="">#2196</a> pr link to CHANGES</li>
<li><a href=""><code>f4b2b4d</code></a> fix: exclude <code>...</code> bodies after multi-line return-type annotations (<a href="">#2185</a>) (#...</li>
<li><a href=""><code>1980ed0</code></a> chore: bump sigstore/gh-action-sigstore-python (<a href="">#2201</a>)</li>
<li><a href=""><code>bca3217</code></a> build: since we don't ship 3.13t, don't test it</li>
<li><a href=""><code>77550d8</code></a> docs: oops, mismatched pull requests</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.14.0...7.14.3">compare view</a></li>
</ul>
</details>
<br />

Updates `datalad` from 1.4.1 to 1.6.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/releases">datalad's releases</a>.</em></p>
<blockquote>
<h2>1.6.0</h2>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p><code>datalad run</code> now wraps command-created commits as merge commits,
preserving linear first-parent history while keeping the full
provenance record.  This works across subdataset hierarchies:
each dataset that gained intermediate commits gets its own merge,
and merge need propagates bottom-up.  A new <code>datalad save --since</code>
(<code>since=</code>) parameter makes this independently usable outside of <code>run</code>.
[PR <a href="">#7821</a>](<a href="">datalad/datalad#7821</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>add submodule URL candidates by URL-rewrite to match parent protocol.  [PR <a href="">#7606</a>](<a href="">datalad/datalad#7606</a>) (by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Mark <code>test_gin_cloning</code> as <code>xfail</code> (strict=False) on <code>TimeoutError</code> and
<code>IncompleteResultsError</code> instead of <code>flaky</code> retries. gin.g-node.org has
become too unreliable from CI runners (HTTP 403 from GitHub-hosted IPs,
TCP timeouts, slow responses). When gin cooperates the test still
reports XPASS; persistent gin failures no longer block CI.
[PR <a href="">#7876</a>](<a href="">datalad/datalad#7876</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>1.5.0</h2>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p>Add <code>--cfg-proc</code> option to <code>install</code>, <code>clone</code>, and <code>get</code> to run configuration procedures on datasets post-installation.
Fixes <a href="">#7468</a> via [PR <a href="">#7477</a>](<a href="">datalad/datalad#7477</a>)
(by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
<li>
<p>NF+BM: extend create_test_dataset spec, add save/run benchmarks on heavy hierarchies.  [PR <a href="">#7839</a>](<a href="">datalad/datalad#7839</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
</ul>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>
<p>Fix <code>AltConstraints.__or__()</code> and <code>Constraints.__and__()</code> mutating
their left-hand operand in place and returning <code>self</code>. This caused
silent side effects when constraint objects defined at module level
(e.g. <code>reckless_opt</code>) were reused across multiple <code>|</code> or <code>&amp;</code> chains.
Both operators now return a new instance, preserving the original.
Identified via the constraint system overhaul in
<a href="https://github.com/datalad/datalad-next">datalad-next</a>.
Fixes <a href="">#7164</a>
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>Propagate <code>datalad -c key=value</code> CLI config overrides and <code>DATALAD_*</code>
environment variables to subprocesses via Git's native
environment-based configuration mechanism (<code>GIT_CONFIG_COUNT</code> /
<code>GIT_CONFIG_KEY_N</code> / <code>GIT_CONFIG_VALUE_N</code>). Previously the overrides
were only stored in <code>datalad.cfg.overrides</code> and were invisible to</p>
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
<h1>1.6.0 (2026-06-09)</h1>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p><code>datalad run</code> now wraps command-created commits as merge commits,
preserving linear first-parent history while keeping the full
provenance record.  This works across subdataset hierarchies:
each dataset that gained intermediate commits gets its own merge,
and merge need propagates bottom-up.  A new <code>datalad save --since</code>
(<code>since=</code>) parameter makes this independently usable outside of <code>run</code>.
[PR <a href="">#7821</a>](<a href="">datalad/datalad#7821</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>add submodule URL candidates by URL-rewrite to match parent protocol.  [PR <a href="">#7606</a>](<a href="">datalad/datalad#7606</a>) (by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
</ul>
<h2>🧪 Tests</h2>
<ul>
<li>Mark <code>test_gin_cloning</code> as <code>xfail</code> (strict=False) on <code>TimeoutError</code> and
<code>IncompleteResultsError</code> instead of <code>flaky</code> retries. gin.g-node.org has
become too unreliable from CI runners (HTTP 403 from GitHub-hosted IPs,
TCP timeouts, slow responses). When gin cooperates the test still
reports XPASS; persistent gin failures no longer block CI.
[PR <a href="">#7876</a>](<a href="">datalad/datalad#7876</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h1>1.5.0 (2026-06-04)</h1>
<p>This was primarily a bug fix release. But because of having 2
enhancements/new features, automated CI assigned 1.5.0.</p>
<h2>🚀 Enhancements and New Features</h2>
<ul>
<li>
<p>Add <code>--cfg-proc</code> option to <code>install</code>, <code>clone</code>, and <code>get</code> to run configuration procedures on datasets post-installation.
Fixes <a href="">#7468</a> via [PR <a href="">#7477</a>](<a href="">datalad/datalad#7477</a>)
(by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a>)</p>
</li>
<li>
<p>NF+BM: extend create_test_dataset spec, add save/run benchmarks on heavy hierarchies.  [PR <a href="">#7839</a>](<a href="">datalad/datalad#7839</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
</ul>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>Fix <code>AltConstraints.__or__()</code> and <code>Constraints.__and__()</code> mutating
their left-hand operand in place and returning <code>self</code>. This caused
silent side effects when constraint objects defined at module level
(e.g. <code>reckless_opt</code>) were reused across multiple <code>|</code> or <code>&amp;</code> chains.
Both operators now return a new instance, preserving the original.
Identified via the constraint system overhaul in
<a href="https://github.com/datalad/datalad-next">datalad-next</a>.
Fixes <a href="">#7164</a>
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>43ace70</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>3c2fdfd</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>fbb3a7b</code></a> Merge pull request <a href="">#7876</a> from datalad/enh-merge-maint</li>
<li><a href=""><code>d516d8e</code></a> BF(TST): xfail test_gin_cloning - gin.g-node.org too unreliable</li>
<li><a href=""><code>840fc23</code></a> Add a note about 1.5.0 release which should have been just a patch release</li>
<li><a href=""><code>eab2e34</code></a> Merge tag '1.5.0' into enh-merge-maint</li>
<li><a href=""><code>f025f55</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>08e53fa</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>1bf2e35</code></a> Merge pull request <a href="">#7868</a> from yarikoptic/bf-jobs-auto</li>
<li><a href=""><code>88e0c76</code></a> BF: resolve -J auto for push/drop/remove instead of passing 'auto' to git-annex</li>
<li>Additional commits viewable in <a href="https://github.com/datalad/datalad/compare/1.4.1...1.6.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.0.3 to 9.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.1.1</h2>
<h1>pytest 9.1.1 (2026-06-19)</h1>
<h2>Bug fixes</h2>
<ul>
<li><a href="">#14220</a>: Fixed a logic bug in <code>pytest.RaisesGroup</code> which would might cause it to display incorrect &quot;It matches <!-- raw HTML omitted -->FooError()<!-- raw HTML omitted --> which was paired with <!-- raw HTML omitted -->BarError<!-- raw HTML omitted -->&quot; messages.</li>
<li><a href="">#14591</a>: Fixed a regression in pytest 9.1.0 which caused overriding a parametrized fixture with an indirect <!-- raw HTML omitted --><a href="https://github.com/pytest"><code>@​pytest</code></a>.mark.parametrize<!-- raw HTML omitted --> to fail with &quot;duplicate parametrization of '&lt;fixture name&gt;'&quot;.</li>
<li><a href="">#14606</a>: Fixed <code>list-item</code> typing errors from mypy in <code>@pytest.mark.parametrize &lt;pytest.mark.parametrize ref&gt;</code> <code>argvalues</code> parameter.</li>
<li><a href="">#14608</a>: Fixed a regression in pytest 9.1.0 where <code>conftest.py</code> files located in <code>&lt;invocation dir&gt;/test*</code> were no longer loaded as initial conftests when invoked without arguments.
This could cause certain hooks (like <code>pytest_addoption</code>) in these files to not fire.</li>
</ul>
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
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf470ec</code></a> Prepare release version 9.1.1</li>
<li><a href=""><code>e0c8ce6</code></a> Merge pull request <a href="">#14625</a> from pytest-dev/patchback/backports/9.1.x/a07c31a97...</li>
<li><a href=""><code>1b82d16</code></a> Merge pull request <a href="">#14624</a> from pytest-dev/patchback/backports/9.1.x/b375b79ec...</li>
<li><a href=""><code>501c4bc</code></a> Merge pull request <a href="">#14596</a> from bluetech/doc-classmethod</li>
<li><a href=""><code>b61f588</code></a> Merge pull request <a href="">#14622</a> from chrisburr/fix-14608-initial-conftest-test-subdir</li>
<li><a href=""><code>9a567e0</code></a> [automated] Update plugin list (<a href="">#14617</a>) (<a href="">#14618</a>)</li>
<li><a href=""><code>ef8b299</code></a> Merge pull request <a href="">#14620</a> from pytest-dev/patchback/backports/9.1.x/680f9f3ed...</li>
<li><a href=""><code>66abd07</code></a> Merge pull request <a href="">#14220</a> from bysiber/fix-stale-iexp-raisesgroup</li>
<li><a href=""><code>79fbf93</code></a> Merge pull request <a href="">#14612</a> from pytest-dev/patchback/backports/9.1.x/974ed48b6...</li>
<li><a href=""><code>0d312eb</code></a> Merge pull request <a href="">#14611</a> from bluetech/parametrize-argvalues-typing</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.3...9.1.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.14 to 0.15.19
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.19</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-23.</p>
<h3>Preview features</h3>
<ul>
<li>Support human-readable names when hovering suppression comments and in code actions (<a href="">#26114</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fall back to default settings when editor-only settings are invalid (<a href="">#26244</a>)</li>
<li>Fix panic when inserting text at a notebook cell boundary (<a href="">#26111</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pylint</code>] Update fix suggestions for <code>__floor__</code>, <code>__trunc__</code>, <code>__length_hint__</code>, and <code>__matmul__</code> variants (<code>PLC2801</code>) (<a href="">#26239</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid allocating when parsing single string literals (<a href="">#26200</a>)</li>
<li>Avoid reallocating singleton call arguments (<a href="">#26223</a>)</li>
<li>Lazily create source files for lint diagnostics (<a href="">#26226</a>)</li>
<li>Optimize formatter text width and indentation (<a href="">#26236</a>)</li>
<li>Reserve capacity for builtin bindings (<a href="">#26229</a>)</li>
<li>Skip repeated-key checks for singleton dictionaries (<a href="">#26228</a>)</li>
<li>Use ArrayVec for qualified name segments (<a href="">#26224</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-pyi</code>] Note that <code>PYI051</code> is an opinionated stylistic rule (<a href="">#26179</a>)</li>
<li>[<code>pyupgrade</code>] Clarify <code>UP029</code> as a Python 2 compatibility rule (<a href="">#26243</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Publish Ruff crates to crates.io (<a href="">#26271</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MakenRosa"><code>@​MakenRosa</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/trilamsr"><code>@​trilamsr</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/sanjibani"><code>@​sanjibani</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<h2>Install ruff 0.15.19</h2>
<h3>Install prebuilt binaries via shell script</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.19</h2>
<p>Released on 2026-06-23.</p>
<h3>Preview features</h3>
<ul>
<li>Support human-readable names when hovering suppression comments and in code actions (<a href="">#26114</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fall back to default settings when editor-only settings are invalid (<a href="">#26244</a>)</li>
<li>Fix panic when inserting text at a notebook cell boundary (<a href="">#26111</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pylint</code>] Update fix suggestions for <code>__floor__</code>, <code>__trunc__</code>, <code>__length_hint__</code>, and <code>__matmul__</code> variants (<code>PLC2801</code>) (<a href="">#26239</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid allocating when parsing single string literals (<a href="">#26200</a>)</li>
<li>Avoid reallocating singleton call arguments (<a href="">#26223</a>)</li>
<li>Lazily create source files for lint diagnostics (<a href="">#26226</a>)</li>
<li>Optimize formatter text width and indentation (<a href="">#26236</a>)</li>
<li>Reserve capacity for builtin bindings (<a href="">#26229</a>)</li>
<li>Skip repeated-key checks for singleton dictionaries (<a href="">#26228</a>)</li>
<li>Use ArrayVec for qualified name segments (<a href="">#26224</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-pyi</code>] Note that <code>PYI051</code> is an opinionated stylistic rule (<a href="">#26179</a>)</li>
<li>[<code>pyupgrade</code>] Clarify <code>UP029</code> as a Python 2 compatibility rule (<a href="">#26243</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Publish Ruff crates to crates.io (<a href="">#26271</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MakenRosa"><code>@​MakenRosa</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/trilamsr"><code>@​trilamsr</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/sanjibani"><code>@​sanjibani</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<h2>0.15.18</h2>
<p>Released on 2026-06-18.</p>
<h3>Preview features</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7f04365</code></a> Bump version to 0.15.19 (<a href="">#26291</a>)</li>
<li><a href=""><code>a30ba16</code></a> [ty] Infer definite equality comparison results (<a href="">#26290</a>)</li>
<li><a href=""><code>bcd2028</code></a> [ty] Avoid recursion when projecting narrowing constraints (<a href="">#26276</a>)</li>
<li><a href=""><code>c0e083e</code></a> [ty] Avoid bypassing lazy constraints for Divergent (<a href="">#26288</a>)</li>
<li><a href=""><code>fb13596</code></a> Record configured crates.io packages (<a href="">#26281</a>)</li>
<li><a href=""><code>85da759</code></a> [ty...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eecf0a246fc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.