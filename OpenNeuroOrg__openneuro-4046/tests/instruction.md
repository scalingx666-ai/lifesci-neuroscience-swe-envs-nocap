# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 8 updates

## Description

Updates the requirements on [bidsschematools](https://github.com/bids-standard/bids-specification), [boto3](https://github.com/boto/boto3), [charset-normalizer](https://github.com/jawah/charset_normalizer), [sentry-sdk[falcon]](https://github.com/getsentry/sentry-python), [uvicorn[standard]](https://github.com/Kludex/uvicorn), [coverage](https://github.com/coveragepy/coveragepy), [datalad](https://github.com/datalad/datalad) and [ruff](https://github.com/astral-sh/ruff) to permit the latest version.
Updates `bidsschematools` from 1.2.2 to 1.2.7
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e37e210</code></a> chore: Bump schema package to 1.2.7</li>
<li><a href=""><code>3ff7542</code></a> fix(ci): Drop test.pypi.org publication</li>
<li><a href=""><code>4102480</code></a> chore: Bump schema package to 1.2.7-dev</li>
<li><a href=""><code>ce7a599</code></a> chore: Bump schema package to 1.2.6</li>
<li><a href=""><code>ffc78c7</code></a> fix(ci): Fix download-artifact target</li>
<li><a href=""><code>59d3faa</code></a> chore: Bump schema package to 1.2.6-dev</li>
<li><a href=""><code>315475d</code></a> chore: Bump schema package to 1.2.5</li>
<li><a href=""><code>24105db</code></a> [SCHEMA] Warn when *_beh.tsv contains onset and duration (<a href="">#2467</a>)</li>
<li><a href=""><code>9e2ccac</code></a> [FIX][SCHEMA] Phenotype subjects are a subset of participants.tsv (<a href="">#2468</a>)</li>
<li><a href=""><code>5adc48b</code></a> [FIX] Replace non-existent <code>len</code> with existent <code>length</code> (<a href="">#2466</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/bids-standard/bids-specification/compare/v1.2.2...schema-1.2.7">compare view</a></li>
</ul>
</details>
<br />

Updates `boto3` from 1.43.36 to 1.43.56
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>72a153d</code></a> Merge branch 'release-1.43.56'</li>
<li><a href=""><code>b1b9ff3</code></a> Bumping version to 1.43.56</li>
<li><a href=""><code>c7d2f6e</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>2a09bb6</code></a> Merge branch 'release-1.43.55'</li>
<li><a href=""><code>cad396b</code></a> Merge branch 'release-1.43.55' into develop</li>
<li><a href=""><code>ffe76ba</code></a> Bumping version to 1.43.55</li>
<li><a href=""><code>74d20c9</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>c073381</code></a> Merge branch 'release-1.43.54'</li>
<li><a href=""><code>5e554e5</code></a> Merge branch 'release-1.43.54' into develop</li>
<li><a href=""><code>2ad1683</code></a> Bumping version to 1.43.54</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.43.36...1.43.56">compare view</a></li>
</ul>
</details>
<br />

Updates `charset-normalizer` from 3.4.7 to 3.4.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/releases">charset-normalizer's releases</a>.</em></p>
<blockquote>
<h2>Version 3.4.9</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.8...3.4.9">3.4.9</a> (2026-07-07)</h2>
<h3>Fixed</h3>
<ul>
<li>Regression in our fallback path leading to a decode error. (<a href="">#771</a>)
We've yanked 3.4.8 as a result of that bug.</li>
</ul>
<h2>Version 3.4.8</h2>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.7...3.4.8">3.4.8</a> (2026-07-06)</h2>
<h3>Fixed</h3>
<ul>
<li>Wall import time due to cascade codec imports for our multibyte first sort of iana supported codecs (<a href="">#742</a>)</li>
<li>Unnecessary json import at runtime (<a href="">#753</a>)</li>
<li>Inverse capitalization not seen by noise detector (<a href="">#731</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>No longer holding a global cache for our noise / coherence measurements. Relax RSS memory usage.</li>
<li>Micro-optimizations in our noise / coherence measurements.</li>
<li>No longer using regex search by default for our preemptive charset mark algorithm.</li>
<li>Raised upperbound of setuptools to v83.</li>
<li>Raised upperbound of mypy(c) to v2.1.</li>
</ul>
<h3>Removed</h3>
<ul>
<li>Redundant UTF7 BOM marker (<a href="">#730</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md">charset-normalizer's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.8...3.4.9">3.4.9</a> (2026-07-07)</h2>
<h3>Fixed</h3>
<ul>
<li>Regression in our fallback path leading to a decode error. (<a href="">#771</a>)
We've yanked 3.4.8 as a result of that bug.</li>
</ul>
<h2><a href="https://github.com/Ousret/charset_normalizer/compare/3.4.7...3.4.8">3.4.8</a> (2026-07-06)</h2>
<h3>Fixed</h3>
<ul>
<li>Wall import time due to cascade codec imports for our multibyte first sort of iana supported codecs (<a href="">#742</a>)</li>
<li>Unnecessary json import at runtime (<a href="">#753</a>)</li>
<li>Inverse capitalization not seen by noise detector (<a href="">#731</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>No longer holding a global cache for our noise / coherence measurements. Relax RSS memory usage.</li>
<li>Micro-optimizations in our noise / coherence measurements.</li>
<li>No longer using regex search by default for our preemptive charset mark algorithm.</li>
<li>Raised upperbound of setuptools to v83.</li>
<li>Raised upperbound of mypy(c) to v2.1.</li>
</ul>
<h3>Removed</h3>
<ul>
<li>Redundant UTF7 BOM marker (<a href="">#730</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cc68407</code></a> Merge pull request <a href="">#772</a> from jawah/fix-regression-fallback-path</li>
<li><a href=""><code>152b923</code></a> chore: release 3.4.9</li>
<li><a href=""><code>2bc2607</code></a> fix: unicodedecodeerror in fallback path</li>
<li><a href=""><code>be252d7</code></a> chore(deps): bump docker/setup-qemu-action from 4.1.0 to 4.2.0 (<a href="">#767</a>)</li>
<li><a href=""><code>71c7bdd</code></a> chore(deps): bump actions/setup-python from 6.2.0 to 6.3.0 (<a href="">#768</a>)</li>
<li><a href=""><code>aeea391</code></a> chore(deps): bump pypa/cibuildwheel from 3.4.1 to 4.1.0 (<a href="">#758</a>)</li>
<li><a href=""><code>a6f8feb</code></a> Merge pull request <a href="">#770</a> from jawah/unblock-ci</li>
<li><a href=""><code>528e16c</code></a> chore: add osv-scanner.toml</li>
<li><a href=""><code>5993498</code></a> chore: ast_serialize musl missing prebuilt riscv,s390x,ppc64le</li>
<li><a href=""><code>aa2ddd8</code></a> Release 3.4.8 (<a href="">#766</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jawah/charset_normalizer/compare/3.4.7...3.4.9">compare view</a></li>
</ul>
</details>
<br />

Updates `sentry-sdk[falcon]` to 2.66.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/releases">sentry-sdk[falcon]'s releases</a>.</em></p>
<blockquote>
<h2>2.66.1</h2>
<h3>Bug Fixes 🐛</h3>
<h4>Tracing</h4>
<ul>
<li>Handle exceptions raised within traces_sampler and other callbacks by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6853</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<ul>
<li>Fix flaky decorator test by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#6830</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md">sentry-sdk[falcon]'s changelog</a>.</em></p>
<blockquote>
<h2>2.66.1</h2>
<h3>Bug Fixes 🐛</h3>
<h4>Tracing</h4>
<ul>
<li>Handle exceptions raised within traces_sampler and other callbacks by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6853</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<ul>
<li>Fix flaky decorator test by <a href="https://github.com/sl0thentr0py"><code>@​sl0thentr0py</code></a> in <a href="">#6830</a></li>
</ul>
<h2>2.66.0</h2>
<h3>New Features ✨</h3>
<ul>
<li>(tracing) Promote trace_lifecycle and ignore_spans to top-level options by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6821</a></li>
</ul>
<h3>Bug Fixes 🐛</h3>
<h4>Tracing</h4>
<ul>
<li>Skip child span creation in streaming path when no current span (HTTP clients) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6811</a></li>
<li>Skip child span creation in streaming path when no current span (task queues) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6814</a></li>
<li>Skip child span creation in streaming path when no current span (misc) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6815</a></li>
<li>Skip child span creation in streaming path when no current span (databases) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6808</a></li>
<li>Skip child span creation in streaming path when no current span (web frameworks) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6810</a></li>
<li>Skip child span creation in streaming path when no current span (django) by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6809</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<ul>
<li>(logging) Fix flaky test_logging_captured_warnings by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6824</a></li>
<li>Remove flaky no cyclic garbage test by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6817</a></li>
<li>Remove Claude permission settings by <a href="https://github.com/cleptric"><code>@​cleptric</code></a> in <a href="">#6806</a></li>
<li>Move <code>nullcontext</code> to <code>sentry_sdk.utils</code> by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6805</a></li>
</ul>
<h2>2.65.0</h2>
<h3>New Features ✨</h3>
<h4>Huey</h4>
<ul>
<li>Set <code>messaging.destination.name</code> on consumer spans by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6779</a></li>
<li>Set <code>messaging.destination.name</code> on producer spans by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6778</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(arq) Set <code>messaging.destination.name</code> on consumer spans by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6767</a></li>
<li>(dramatiq) Set <code>messaging.destination.name</code> on consumer spans by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6776</a></li>
<li>(rq) Set <code>messaging.destination.name</code> on consumer spans by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6774</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>653a292</code></a> Update CHANGELOG.md</li>
<li><a href=""><code>e20c226</code></a> release: 2.66.1</li>
<li><a href=""><code>4524b65</code></a> fix(tracing): Stop setting <code>NoOpSpan</code> on scope in the streaming trace lifecyc...</li>
<li><a href=""><code>2e9f26e</code></a> ref(tracing): No-op and emit warning in <code>start_transaction</code> with the streamin...</li>
<li><a href=""><code>3a50950</code></a> fix(tracing): handle exceptions raised within traces_sampler and other callba...</li>
<li><a href=""><code>b5171b7</code></a> ref: Use top-level <code>trace_lifecycle</code> and <code>ignore_spans</code> options in tests (<a href="">#6855</a>)</li>
<li><a href=""><code>17e0348</code></a> ref: Use old sampling context format in span streaming (<a href="">#6848</a>)</li>
<li><a href=""><code>2e09497</code></a> test: Add streaming tests to <code>test_http_headers</code> (<a href="">#6785</a>)</li>
<li><a href=""><code>9996734</code></a> feat(tracing): Send <code>sentry.segment.name.source</code> instead of `sentry.span.sour...</li>
<li><a href=""><code>00224f7</code></a> remove span streaming docs in changelog (<a href="">#6831</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/getsentry/sentry-python/compare/2.63.0...2.66.1">compare view</a></li>
</ul>
</details>
<br />

Updates `uvicorn[standard]` to 0.51.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/releases">uvicorn[standard]'s releases</a>.</em></p>
<blockquote>
<h2>Version 0.51.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Restart workers with overlap on SIGHUP for near-zero-downtime reloads by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#3025</a></li>
<li>Remove colorama from the standard extra by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#3027</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Kludex/uvicorn/compare/0.50.2...0.51.0">https://github.com/Kludex/uvicorn/compare/0.50.2...0.51.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md">uvicorn[standard]'s changelog</a>.</em></p>
<blockquote>
<h2>0.51.0 (July 8, 2026)</h2>
<h3>Added</h3>
<ul>
<li>Restart workers one at a time on <code>SIGHUP</code>, bringing each replacement up before retiring the old worker, so reloads no longer drop requests (<a href="">#3025</a>)</li>
</ul>
<h3>Removed</h3>
<ul>
<li>Remove <code>colorama</code> from the <code>standard</code> extra (<a href="">#3027</a>)</li>
</ul>
<h2>0.50.2 (July 6, 2026)</h2>
<h3>Fixed</h3>
<ul>
<li>Require <code>websockets&gt;=13.0</code>, which the default <code>websockets-sansio</code> implementation needs (<a href="">#3021</a>)</li>
</ul>
<h2>0.50.1 (July 6, 2026)</h2>
<h3>Fixed</h3>
<ul>
<li>Split comma-separated <code>Sec-WebSocket-Protocol</code> values in the <code>websockets-sansio</code> implementation (<a href="">#3019</a>)</li>
</ul>
<h2>0.50.0 (July 4, 2026)</h2>
<p>If you use WebSockets, note that <code>--ws auto</code> now picks the <code>websockets-sansio</code> implementation. You shouldn't need it, but you can pin <code>--ws websockets</code> to get the deprecated legacy one back.</p>
<h3>Changed</h3>
<ul>
<li>Exit with the dedicated code 3 on any startup failure: app loading, socket bind and lifespan startup errors previously exited with a mix of 0, 1 and 3 (<a href="">#3001</a>)</li>
<li>Stop the multiprocess supervisor when a worker exits with code 3 instead of restarting it forever (<a href="">#3001</a>)</li>
<li>Default <code>--ws auto</code> to <code>websockets-sansio</code> when websockets is installed (<a href="">#2985</a>)</li>
<li>Skip the eager app import in the parent process with <code>--reload</code> or <code>--workers</code>, fixing a memory regression introduced in 0.47.0 (<a href="">#3012</a>)</li>
<li>Build a fresh <code>asgi</code> scope dict per request (<a href="">#2977</a>)</li>
<li>Cache the <code>asgi</code> scope sub-dict per connection (<a href="">#2976</a>)</li>
<li>Avoid copying single-frame WebSocket payloads in <code>websockets-sansio</code> (<a href="">#2983</a>)</li>
<li>Memoize trusted host checks in <code>ProxyHeadersMiddleware</code> (<a href="">#2970</a>)</li>
<li>Replace <code>click.style</code> with an internal ANSI style helper (<a href="">#2981</a>)</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate the legacy <code>websockets</code> implementation; use <code>websockets-sansio</code> or <code>wsproto</code> instead (<a href="">#2985</a>)</li>
</ul>
<h2>0.49.0 (June 3, 2026)</h2>
<h3>Changed</h3>
<ul>
<li>Bump <code>httptools</code> minimum version to 0.8.0 (<a href="">#2962</a>)</li>
<li>Consume duplicate forwarding headers in <code>ProxyHeadersMiddleware</code> (reverses the 0.48.0 behavior of ignoring them) (<a href="">#2971</a>)</li>
</ul>
<h2>0.48.0 (May 24, 2026)</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e4d0b05</code></a> Version 0.51.0 (<a href="">#3028</a>)</li>
<li><a href=""><code>944e43d</code></a> Remove colorama from the standard extra (<a href="">#3027</a>)</li>
<li><a href=""><code>2e78770</code></a> Restart workers with overlap on SIGHUP for near-zero-downtime reloads (<a href="">#3025</a>)</li>
<li><a href=""><code>a1b570c</code></a> Version 0.50.2 (<a href="">#3022</a>)</li>
<li><a href=""><code>83c7da7</code></a> Require websockets&gt;=13.0 for the default sansio implementation (<a href="">#3021</a>)</li>
<li><a href=""><code>b4d0116</code></a> Version 0.50.1 (<a href="">#3020</a>)</li>
<li><a href=""><code>2a9151d</code></a> Split comma-separated <code>Sec-WebSocket-Protocol</code> values in the websockets-sansi...</li>
<li><a href=""><code>1bf3ab4</code></a> Cover the excluded-directory branch in <code>FileFilter</code> with a direct test (<a href="">#3014</a>)</li>
<li><a href=""><code>837b5f9</code></a> Deflake multiprocess, reload, and signal supervisor tests (<a href="">#2975</a>)</li>
<li><a href=""><code>21d2c16</code></a> Version 0.50.0 (<a href="">#3013</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/Kludex/uvicorn/compare/0.49.0...0.51.0">compare view</a></li>
</ul>
</details>
<br />

Updates `coverage` from 7.14.3 to 7.15.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/releases">coverage's releases</a>.</em></p>
<blockquote>
<h2>7.15.2</h2>
<h2>Version 7.15.2 — 2026-07-15</h2>
<ul>
<li>Fix: one of the performance improvements in 7.15.1 (pull 2215) dramatically increased memory use during reporting for large projects. Now we use a different approach that is both faster and slimmer than 7.15.0. Fixes <a href="">issue 2229</a>.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.15.2">coverage 7.15.2</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.15.2</code></p>
<h2>7.15.1</h2>
<h2>Version 7.15.1 — 2026-07-12</h2>
<ul>
<li>Fix: in the HTML report with <code>show_contexts</code> enabled, a context label containing <code>&lt;/script&gt;</code> (for example a parametrized pytest node id) could close the inline <code>&lt;script&gt;</code> element in a file page early, injecting markup. Context labels are now fully escaped. Thanks, <a href="">Rajath Mohare</a>.</li>
<li>A number of performance improvements thanks to Paul Kehrer, in pull requests <a href="">2213</a>, <a href="">2214</a>, <a href="">2215</a>, <a href="">2216</a>, <a href="">2218</a>, <a href="">2220</a>, and <a href="">2221</a>.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.15.1">coverage 7.15.1</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.15.1</code></p>
<h2>7.15.0</h2>
<h2>Version 7.15.0 — 2026-07-02</h2>
<ul>
<li>Since 7.14.0, reporting commands implicitly combine parallel data files. Now those commands have a new option <code>--keep-combined</code> to retain the data files after combining them instead of the default, which is to delete them. Finishes <a href="">issue 2198</a>.</li>
<li>Fix: the LCOV report would incorrectly count excluded functions as uncovered, as described in <a href="">issue 2205</a>. This is now fixed thanks to <a href="">Martin Kuntz Jacobsen</a>.</li>
<li>When running your program, coverage now correctly sets <code>yourmodule.__spec__.loader</code> as <a href="">strongly recommended</a>, avoiding the deprecation warning described in <a href="">issue 2208</a>. Thanks, <a href="">A5rocks</a>.</li>
<li>Fix: with Python 3.10, running with the <code>-I</code> (isolated mode) option didn’t correctly omit the current directory from the module search path, as described in <a href="">issue 2103</a>. That is now fixed thanks to <a href="">Ilia Sorokin</a>.</li>
</ul>
<p>:arrow_right:  PyPI page: <a href="https://pypi.org/project/coverage/7.15.0">coverage 7.15.0</a>.
:arrow_right:  To install: <code>python3 -m pip install coverage==7.15.0</code></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.15.2 — 2026-07-15</h2>
<ul>
<li>Fix: one of the performance improvements in 7.15.1 (pull 2215) dramatically
increased memory use during reporting for large projects. Now we use a
different approach that is both faster and slimmer than 7.15.0. Fixes <code>issue 2229</code>_.</li>
</ul>
<p>.. _issue 2229:  <a href="">coveragepy/coveragepy#2229</a></p>
<p>.. _changes_7-15-1:</p>
<h2>Version 7.15.1 — 2026-07-12</h2>
<ul>
<li>
<p>Fix: in the HTML report with <code>show_contexts</code> enabled, a context label
containing <code>&lt;/script&gt;</code> (for example a parametrized pytest node id) could
close the inline <code>&lt;script&gt;</code> element in a file page early, injecting markup.
Context labels are now fully escaped. Thanks, <code>Rajath Mohare &lt;pull 2224_&gt;</code>_.</p>
</li>
<li>
<p>A number of performance improvements thanks to Paul Kehrer, in pull requests
<code>2213 &lt;pull 2213_&gt;</code><em>, <code>2214 &lt;pull 2214_&gt;</code></em>, <code>2215 &lt;pull 2215_&gt;</code><em>, <code>2216 &lt;pull 2216_&gt;</code></em>, <code>2218 &lt;pull 2218_&gt;</code><em>, <code>2220 &lt;pull 2220_&gt;</code></em>, and <code>2221 &lt;pull 2221_&gt;</code>_.</p>
</li>
</ul>
<p>.. _pull 2213: <a href="">coveragepy/coveragepy#2213</a>
.. _pull 2214: <a href="">coveragepy/coveragepy#2214</a>
.. _pull 2215: <a href="">coveragepy/coveragepy#2215</a>
.. _pull 2216: <a href="">coveragepy/coveragepy#2216</a>
.. _pull 2218: <a href="">coveragepy/coveragepy#2218</a>
.. _pull 2220: <a href="">coveragepy/coveragepy#2220</a>
.. _pull 2221: <a href="">coveragepy/coveragepy#2221</a>
.. _pull 2224: <a href="">coveragepy/coveragepy#2224</a></p>
<p>.. _changes_7-15-0:</p>
<h2>Version 7.15.0 — 2026-07-02</h2>
<ul>
<li>
<p>Since 7.14.0, reporting commands implicitly combine parallel data files. Now
those commands have a new option <code>--keep-combined</code> to retain the data files
after combining them instead of the default, which is to delete them.
Finishes <code>issue 2198</code>_.</p>
</li>
<li>
<p>Fix: the LCOV report would incorrectly count excluded functions as uncovered,
as described in <code>issue 2205</code><em>. This is now fixed thanks to <code>Martin Kuntz Jacobsen &lt;pull 2206_&gt;</code></em>.</p>
</li>
<li>
<p>When running your program, coverage now correctly sets</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>50d8659</code></a> docs: sample HTML for 7.15.2</li>
<li><a href=""><code>b5eed20</code></a> docs: prep for 7.15.2</li>
<li><a href=""><code>78cab6e</code></a> fix: reduce memory use during reporting. <a href="">#2229</a> (<a href="">#2231</a>)</li>
<li><a href=""><code>b4c1fda</code></a> build: bump version to 7.15.2</li>
<li><a href=""><code>da63bed</code></a> docs: sample HTML for 7.15.1</li>
<li><a href=""><code>bc35e64</code></a> docs: prep for 7.15.1</li>
<li><a href=""><code>182b010</code></a> perf: resolve sysmon branch events lazily, one pair at a time (<a href="">#2221</a>)</li>
<li><a href=""><code>ee271ee</code></a> perf: compute multiline maps cheaply in the sysmon core (<a href="">#2220</a>)</li>
<li><a href=""><code>1441b96</code></a> chore: bump the action-dependencies group with 6 updates (<a href="">#2225</a>)</li>
<li><a href=""><code>dd80635</code></a> fix: escape context labels in html report inline script block (<a href="">#2224</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.14.3...7.15.2">compare view</a></li>
</ul>
</details>
<br />

Updates `datalad` from 1.6.0 to 1.6.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/releases">datalad's releases</a>.</em></p>
<blockquote>
<h2>1.6.1</h2>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>
<p><code>get_toppath()</code> now returns <code>None</code> instead of crashing with <code>TypeError</code> when
called on a path whose existence can't be verified (e.g. a broken symlink or
a nonexistent directory).  Discovered while investigating
<a href="">#7882</a>.
(by <a href="https://github.com/LiamDGray"><code>@​LiamDGray</code></a>)</p>
</li>
<li>
<p>BF: terminate child before closing stdout/stderr on process timeout.  [PR <a href="">#7866</a>](<a href="">datalad/datalad#7866</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>Fix <code>get_dataset_root()</code> to reject an ancestor <code>.git/</code> that is reached only by crossing a symlink boundary.  Previously, <code>cwd</code> inside a symlink whose apparent parent contained an unrelated <code>.git/</code> (e.g. an abandoned <code>git init</code> with no commits) caused <code>datalad status</code> / <code>datalad rerun</code> to bind to that parent, while <code>git</code> and <code>git-annex</code> correctly followed the symlink to the real dataset.  The existing &quot;symlink itself is a dataset&quot; fallback now handles that case; the <code>test_bf1886</code> semantics (symlink → subdataset within outer dataset resolves to outer) is preserved via a realpath-ancestry check.  Fixes <a href="">#7882</a> via [PR <a href="">#7883</a>](<a href="">datalad/datalad#7883</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p><code>create-sibling</code> no longer requires <code>git-annex</code> on the target (remote or local) when the source dataset is a plain-git dataset (<code>--no-annex</code>, i.e. marked with a <code>.noannex</code> file).  Previously it errored out with <code>No working git-annex installation. It's required on the remote machine to create a sibling</code> even though no annex functionality would be used.  Via [PR <a href="">#7888</a>](<a href="">datalad/datalad#7888</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
</ul>
<h2>🔩 Dependencies</h2>
<ul>
<li>Bump minimum required Git version from 2.25.0 to 2.31.0.  The <code>-c key=value</code> config-override propagation to subprocesses added in
[PR <a href="">#7858</a>](<a href="">datalad/datalad#7858</a>) relies on
Git's <code>GIT_CONFIG_COUNT</code> / <code>GIT_CONFIG_KEY_&lt;n&gt;</code> / <code>GIT_CONFIG_VALUE_&lt;n&gt;</code>
environment mechanism, which was introduced in Git 2.31.0 (2021-03).
On older Git the CLI override was silently ignored.  This bump makes the
requirement explicit at startup rather than manifesting as a silent
feature loss.  Git 2.31 is available on all currently-supported LTS
distributions.
Via [PR <a href="">#7887</a>](<a href="">datalad/datalad#7887</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🏠 Internal</h2>
<ul>
<li>Pin <code>asv&lt;0.6.6</code> and <code>asv-runner&lt;0.2.2</code> in <code>.github/workflows/benchmarks.yml</code>.  Starting with asv-runner 0.2.2 (released 2026-06-27), <code>do_setup_cache()</code> invokes any class-level <code>setup(self)</code> method it can bind with no positional args -- for the <code>save_run</code> benchmarks that means <code>setup()</code> runs before <code>setup_cache()</code> has written <code>bm_heavy.tar</code>, breaking every Benchmarks CI run since <a href="">#7402</a>.  asv itself needs pinning too because asv 0.6.6 requires <code>asv-runner&gt;=0.2.5</code>, and <code>tools/ci/benchmark-travis-pr.sh</code> re-runs <code>pip install asv</code> unconditionally which would otherwise defeat the pin.  Reported upstream at <a href="">airspeed-velocity/asv_runner#52</a>.  [PR <a href="">#7886</a>](<a href="">datalad/datalad#7886</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/datalad/datalad/blob/maint/CHANGELOG.md">datalad's changelog</a>.</em></p>
<blockquote>
<h1>1.6.1 (2026-07-23)</h1>
<h2>🐛 Bug Fixes</h2>
<ul>
<li>
<p><code>get_toppath()</code> now returns <code>None</code> instead of crashing with <code>TypeError</code> when
called on a path whose existence can't be verified (e.g. a broken symlink or
a nonexistent directory).  Discovered while investigating
<a href="">#7882</a>.
(by <a href="https://github.com/LiamDGray"><code>@​LiamDGray</code></a>)</p>
</li>
<li>
<p>BF: terminate child before closing stdout/stderr on process timeout.  [PR <a href="">#7866</a>](<a href="">datalad/datalad#7866</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p>Fix <code>get_dataset_root()</code> to reject an ancestor <code>.git/</code> that is reached only by crossing a symlink boundary.  Previously, <code>cwd</code> inside a symlink whose apparent parent contained an unrelated <code>.git/</code> (e.g. an abandoned <code>git init</code> with no commits) caused <code>datalad status</code> / <code>datalad rerun</code> to bind to that parent, while <code>git</code> and <code>git-annex</code> correctly followed the symlink to the real dataset.  The existing &quot;symlink itself is a dataset&quot; fallback now handles that case; the <code>test_bf1886</code> semantics (symlink → subdataset within outer dataset resolves to outer) is preserved via a realpath-ancestry check.  Fixes <a href="">#7882</a> via [PR <a href="">#7883</a>](<a href="">datalad/datalad#7883</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
<li>
<p><code>create-sibling</code> no longer requires <code>git-annex</code> on the target (remote or local) when the source dataset is a plain-git dataset (<code>--no-annex</code>, i.e. marked with a <code>.noannex</code> file).  Previously it errored out with <code>No working git-annex installation. It's required on the remote machine to create a sibling</code> even though no annex functionality would be used.  Via [PR <a href="">#7888</a>](<a href="">datalad/datalad#7888</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</p>
</li>
</ul>
<h2>🔩 Dependencies</h2>
<ul>
<li>Bump minimum required Git version from 2.25.0 to 2.31.0.  The <code>-c key=value</code> config-override propagation to subprocesses added in
[PR <a href="">#7858</a>](<a href="">datalad/datalad#7858</a>) relies on
Git's <code>GIT_CONFIG_COUNT</code> / <code>GIT_CONFIG_KEY_&lt;n&gt;</code> / <code>GIT_CONFIG_VALUE_&lt;n&gt;</code>
environment mechanism, which was introduced in Git 2.31.0 (2021-03).
On older Git the CLI override was silently ignored.  This bump makes the
requirement explicit at startup rather than manifesting as a silent
feature loss.  Git 2.31 is available on all currently-supported LTS
distributions.
Via [PR <a href="">#7887</a>](<a href="">datalad/datalad#7887</a>)
(by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<h2>🏠 Internal</h2>
<ul>
<li>Pin <code>asv&lt;0.6.6</code> and <code>asv-runner&lt;0.2.2</code> in <code>.github/workflows/benchmarks.yml</code>.  Starting with asv-runner 0.2.2 (released 2026-06-27), <code>do_setup_cache()</code> invokes any class-level <code>setup(self)</code> method it can bind with no positional args -- for the <code>save_run</code> benchmarks that means <code>setup()</code> runs before <code>setup_cache()</code> has written <code>bm_heavy.tar</code>, breaking every Benchmarks CI run since <a href="">#7402</a>.  asv itself needs pinning too because asv 0.6.6 requires <code>asv-runner&gt;=0.2.5</code>, and <code>tools/ci/benchmark-travis-pr.sh</code> re-runs <code>pip install asv</code> unconditionally which would otherwise defeat the pin.  Reported upstream at <a href="">airspeed-velocity/asv_runner#52</a>.  [PR <a href="">#7886</a>](<a href="">datalad/datalad#7886</a>) (by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a>)</li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b36f9b6</code></a> [skip ci] Update docs/source/changelog.rst and CITATION.cff</li>
<li><a href=""><code>ccb3e51</code></a> [skip ci] Update CHANGELOG</li>
<li><a href=""><code>d8c135a</code></a> Merge pull request <a href="">#7885</a> from LiamDGray/bf-get-toppath-crash</li>
<li><a href=""><code>b6830ba</code></a> Merge pull request <a href="">#7866</a> from datalad/bf-sigpipe-141</li>
<li><a href=""><code>67989fb</code></a> Merge pull request <a href="">#7888</a> from datalad/bf-noannex</li>
<li><a href=""><code>9f5df6f</code></a> BF(TST): satisfy mypy in test_sigpipe_on_timeout, add changelog</li>
<li><a href=""><code>ea37c77</code></a> BF: terminate child before closing stdout/stderr on process timeout</li>
<li><a href=""><code>f736847</code></a> BF: create-sibling - don't require git-annex on target for no-annex datasets</li>
<li><a href=""><code>12c17c5</code></a> TST: minor consistency tuneup for temp directory name</li>
<li><a href=""><code>48a7b69</code></a> Merge pull request <a href="">#7883</a> from yarikoptic/bf-7882</li>
<li>Additional commits viewable in <a href="https://github.com/datalad/datalad/compare/1.6.0...1.6.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.19 to 0.16.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.0</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-23.</p>
<p>Check out the <a href="https://astral.sh/blog/ruff-v0.16.0">blog post</a> for a migration guide and overview of the changes!</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Ruff now enables a much larger set of rules by default (413, up from 59). See the blog post for more details and the new <a href="https://docs.astral.sh/ruff/default-rules/">Default Rules</a> page for a full listing of the enabled rules. Note that this is primarily an expansion, but 18 of the more opinionated pycodestyle (<code>E</code>) and pyflakes (<code>F</code>) rules have been removed from the default set: <code>E401</code>, <code>E402</code>, <code>E701</code>, <code>E702</code>, <code>E703</code>, <code>E711</code>, <code>E712</code>, <code>E713</code>, <code>E714</code>, <code>E721</code>, <code>E731</code>, <code>E741</code>, <code>E742</code>, <code>E743</code>, <code>F403</code>, <code>F405</code>, <code>F406</code>, and <code>F722</code>.</p>
</li>
<li>
<p>Ruff can now format Python code blocks in Markdown files and will do this by default. See the <a href="https://docs.astral.sh/ruff/formatter/#markdown-code-formatting">documentation</a> for more details.</p>
</li>
<li>
<p>Ruff now supports <code>ruff: ignore</code> comments at the ends of lines, like <code>noqa</code> comments, or on the line preceding a diagnostic. For example, these both suppress an <a href="https://docs.astral.sh/ruff/rules/unused-import/"><code>unused-import</code></a> (<code>F401</code>) diagnostic:</p>
<pre lang="py"><code>import math  # ruff: ignore[F401]
<h1>ruff: ignore[F401]</h1>
<p>import os
</code></pre></p>
</li>
<li>
<p>Fixes are now shown in <code>check</code> and <code>format --check</code> output:</p>
<pre lang="console"><code>❯ ruff format --check .
unformatted: File would be reformatted
 --&gt; try.md:1:1
  |
1 | ```python
  - import   math
2 + import math
3 | ```
  |
<p>1 file would be reformatted
</code></pre></p>
<p>This example also shows off the Markdown formatting.</p>
</li>
<li>
<p><code>format --check</code> now supports the same output formats as the linter, including the <code>github</code> and <code>gitlab</code> outputs for rendering annotations in CI:</p>
<pre lang="console"><code>❯ ruff format --check --output-format github .
::error title=ruff (unformatted),file=try.md,line=2,col=8,endLine=2,endColumn=10::try.md:2:8: unformatted: File would be reformatted
</code></pre>
<p>See the CLI help or <a href="https://docs.astral.sh/ruff/settings/#output-format">documentation</a> for the full list of supported formats.</p>
</li>
<li>
<p>The <code>filename</code>, <code>location</code>, <code>end_location</code>, <code>fix.edits[].location</code>, and <code>fix.edits[].end_location</code> fields in the JSON output format may now be <code>null</code> rather than defaulting to the empty string and row 1, column 1, respectively.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.0</h2>
<p>Released on 2026-07-23.</p>
<p>Check out the <a href="https://astral.sh/blog/ruff-v0.16.0">blog post</a> for a migration
guide and overview of the changes!</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Ruff now enables a much larger set of rules by default (413, up from 59). See the blog post for
more details and the new <a href="https://docs.astral.sh/ruff/default-rules/">Default Rules</a> page for a
full listing of the enabled rules. Note that this is primarily an expansion, but 18 of the more
opinionated pycodestyle (<code>E</code>) and pyflakes (<code>F</code>) rules have been removed from the default set:
<code>E401</code>, <code>E402</code>, <code>E701</code>, <code>E702</code>, <code>E703</code>, <code>E711</code>, <code>E712</code>, <code>E713</code>, <code>E714</code>, <code>E721</code>, <code>E731</code>, <code>E741</code>,
<code>E742</code>, <code>E743</code>, <code>F403</code>, <code>F405</code>, <code>F406</code>, and <code>F722</code>.</p>
</li>
<li>
<p>Ruff can now format Python code blocks in Markdown files and will do this by default. See the
<a href="https://docs.astral.sh/ruff/formatter/#markdown-code-formatting">documentation</a> for more details.</p>
</li>
<li>
<p>Ruff now supports <code>ruff: ignore</code> comments at the ends of lines, like <code>noqa</code> comments, or on the line preceding a diagnostic. For example, these both suppress an <a href="https://docs.astral.sh/ruff/rules/unused-import/"><code>unused-import</code></a> (<code>F401</code>) diagnostic:</p>
<pre lang="py"><code>import math  # ruff: ignore[F401]
<h1>ruff: ignore[F401]</h1>
<p>import os
</code></pre></p>
</li>
<li>
<p>Fixes are now shown in <code>check</code> and <code>format --check</code> output:</p>
<pre lang="console"><code>❯ ruff format --check .
unformatted: File would be reformatted
 --&gt; try.md:1:1
  |
1 | ```python
  - import   math
2 + import math
3 | ```
  |
<p>1 file would be reformatted
</code></pre></p>
<p>This example also shows off the Markdown formatting.</p>
</li>
<li>
<p><code>format --check</code> now supports the same output formats as the linter, including the <code>github</code> and
<code>gitlab</code> outputs for rendering annotations in CI:</p>
<pre lang="console"><code></code></pre>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a2635fd</code></a> Bump 0.16.0 (<a href="">#27136</a>)</li>
<li><a href=""><code>3433449</code></a> [ty] Reuse full call diagnostics for implicit setter calls (<a href="">#27115</a>)</li>
<li><a href=""><code>2240070</code></a> Reflect <code>ruff: ignore</code> and <code>--add-ignore</code> stabilization in documentation (<a href="">#27</a>...</li>
<li><a href=""><code>17ef711</code></a> Stabilize <code>--add-ignore</code> (<a href="">#27125</a>)</li>
<li><a href=""><code>ef912bb</code></a> Add newly stabilized rules to defaults (<a href="">#27055</a>)</li>
<li><a href=""><code>b30f040</code></a> Stabilize new default rules (<a href="">#27035</a>)</li>
<li><a href=""><code>bcd70c5</code></a> Exclude Markdown files from <code>format-dev</code> runs (<a href="">#27052</a>)</li>
<li><a href=""><code>87e51e2</code></a> Fix <code>format --check</code> spans for syntax errors (<a href="">#27045</a>)</li>
<li><a href=""><code>afe2723</code></a> [<code>flake8-gettext</code>] Stabilize qualified-name and built-in binding resolution (...</li>
<li><a href=""><code>a9702d8</code></a> [<code>flake8-bandit</code>] Stabilize string literal binding resolution (<code>S310</code>) (<a href="">#26944</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.19...0.16.0">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ac78fce8a45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.