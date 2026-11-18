# Issue

**Title:** chore(deps): Bump the datalad group in /services/datalad with 9 updates

## Description

Updates the requirements on [boto3](https://github.com/boto/boto3), [pyjwt](https://github.com/jpadilla/pyjwt), [requests](https://github.com/psf/requests), [sentry-sdk[falcon]](https://github.com/getsentry/sentry-python), [taskiq[reload]](https://github.com/taskiq-python/taskiq), [uvicorn[standard]](https://github.com/Kludex/uvicorn), [coverage](https://github.com/coveragepy/coveragepy), [pytest-asyncio](https://github.com/pytest-dev/pytest-asyncio) and [ruff](https://github.com/astral-sh/ruff) to permit the latest version.
Updates `boto3` from 1.42.95 to 1.43.14
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>07953b0</code></a> Merge branch 'release-1.43.14'</li>
<li><a href=""><code>25c77c3</code></a> Bumping version to 1.43.14</li>
<li><a href=""><code>5e64afc</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>97921f4</code></a> Merge branch 'release-1.43.13'</li>
<li><a href=""><code>4e58a35</code></a> Merge branch 'release-1.43.13' into develop</li>
<li><a href=""><code>1307ac2</code></a> Bumping version to 1.43.13</li>
<li><a href=""><code>c75c901</code></a> Add changelog entries from botocore</li>
<li><a href=""><code>d3f2433</code></a> Merge branch 'release-1.43.12'</li>
<li><a href=""><code>d5eddf9</code></a> Merge branch 'release-1.43.12' into develop</li>
<li><a href=""><code>93f3a42</code></a> Bumping version to 1.43.12</li>
<li>Additional commits viewable in <a href="https://github.com/boto/boto3/compare/1.42.95...1.43.14">compare view</a></li>
</ul>
</details>
<br />

Updates `pyjwt` from 2.12.1 to 2.13.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/releases">pyjwt's releases</a>.</em></p>
<blockquote>
<h2>2.13.0</h2>
<h1>PyJWT 2.13.0 — Security Release</h1>
<p>This release bundles five security fixes plus three additional hardening / spec-compliance changes. We recommend all users upgrade.</p>
<h2>Security</h2>
<ul>
<li>
<p><strong><a href="https://github.com/jpadilla/pyjwt/security/advisories/GHSA-xgmm-8j9v-c9wx"><code>GHSA-xgmm-8j9v-c9wx</code></a> — JWK JSON accepted as HMAC secret (algorithm confusion).</strong> <code>HMACAlgorithm.prepare_key</code> previously rejected PEM- and SSH-formatted asymmetric keys but did not catch a JWK passed as a raw JSON string. In a verifier configured with both symmetric and asymmetric algorithms in <code>algorithms=[…]</code> and a raw-JSON JWK as the key, an attacker could forge HS256 tokens using the JWK text as the HMAC secret. The guard has been extended to reject any JWK-shaped JSON. <em>Reported by <a href="https://github.com/aradona91"><code>@​aradona91</code></a>.</em></p>
</li>
<li>
<p><strong><a href="https://github.com/jpadilla/pyjwt/security/advisories/GHSA-jq35-7prp-9v3f"><code>GHSA-jq35-7prp-9v3f</code></a> — Algorithm allow-list bypass with <code>PyJWK</code> / <code>PyJWKClient</code>.</strong> When verifying with a <code>PyJWK</code>, the caller's <code>algorithms=[…]</code> allow-list was checked against the token header <code>alg</code> as a string only; actual verification used the algorithm bound to the <code>PyJWK</code>. An attacker who controlled a registered JWKS key could sign with one algorithm and advertise another on the header. PyJWT now requires the token header <code>alg</code> to match the <code>PyJWK</code>'s algorithm before verification. <em>Reported by <a href="https://github.com/sushi-gif"><code>@​sushi-gif</code></a>.</em></p>
</li>
<li>
<p><strong><a href="https://github.com/jpadilla/pyjwt/security/advisories/GHSA-w7vc-732c-9m39"><code>GHSA-w7vc-732c-9m39</code></a> — DoS via base64 decode of unused payload segment when <code>b64=false</code>.</strong> For detached-payload JWS (<code>b64=false</code>), the compact-form payload segment was base64-decoded before being discarded in favor of the caller-supplied <code>detached_payload</code>. An attacker could inflate the unused segment to force CPU + memory cost without holding a valid signature. The segment is now required to be empty per RFC 7515 Appendix F, and is no longer decoded. <em>Reported by <a href="https://github.com/thesmartshadow"><code>@​thesmartshadow</code></a>.</em></p>
</li>
<li>
<p><strong><a href="https://github.com/jpadilla/pyjwt/security/advisories/GHSA-993g-76c3-p5m4"><code>GHSA-993g-76c3-p5m4</code></a> — <code>PyJWKClient</code> accepts non-HTTP(S) URIs.</strong> <code>PyJWKClient.fetch_data</code> passed its URI to <code>urllib.request.urlopen</code>, which by default also handles <code>file://</code>, <code>ftp://</code>, and <code>data:</code> schemes. An application that fed an attacker-influenced URI into <code>PyJWKClient</code> could be coerced into reading local files or reaching other unintended schemes. <code>PyJWKClient</code> now rejects any URI whose scheme isn't <code>http</code> or <code>https</code>. <em>Reported by <a href="https://github.com/KEIJOT"><code>@​KEIJOT</code></a>.</em></p>
</li>
<li>
<p><strong><a href="https://github.com/jpadilla/pyjwt/security/advisories/GHSA-fhv5-28vv-h8m8"><code>GHSA-fhv5-28vv-h8m8</code></a> — <code>PyJWKClient</code> cache wiped on fetch error.</strong> A <code>finally</code>-block <code>put(jwk_set=None)</code> cleared the JWK Set cache whenever a fetch raised, turning a transient JWKS-endpoint outage into application-wide auth failure. The cache write was moved into the success path; transient errors no longer evict valid cached keys. <em>Reported by <a href="https://github.com/eddieran"><code>@​eddieran</code></a>.</em></p>
</li>
</ul>
<h2>Fixed</h2>
<ul>
<li>Reject empty HMAC keys outright in <code>HMACAlgorithm.prepare_key</code> with <code>InvalidKeyError</code> instead of accepting them with only a warning. Defends against the <code>os.getenv(&quot;JWT_SECRET&quot;, &quot;&quot;)</code> footgun. <em>Thanks to <a href="https://github.com/SnailSploit"><code>@​SnailSploit</code></a> and <a href="https://github.com/spartan8806"><code>@​spartan8806</code></a> for the reports.</em></li>
<li>Forward per-call <code>options</code> (including <code>enforce_minimum_key_length</code>) from <code>PyJWT.decode</code> through to <code>PyJWS._verify_signature</code>. The option was previously silently dropped between the two layers, so it only took effect when set on the <code>PyJWT</code> instance. <em>Thanks to <a href="https://github.com/WLUB"><code>@​WLUB</code></a> for the report.</em></li>
<li><strong>RFC 7797 §3 compliance for <code>b64=false</code>:</strong> the encoder now auto-adds <code>&quot;b64&quot;</code> to <code>crit</code>, and the decoder rejects tokens that set <code>b64=false</code> without listing it in <code>crit</code>. <em>Thanks to <a href="https://github.com/MachineLearning-Nerd"><code>@​MachineLearning-Nerd</code></a> for the report.</em></li>
</ul>
<h2>Changed</h2>
<ul>
<li>Migrate the <code>dev</code>, <code>docs</code>, and <code>tests</code> package extras to dependency groups, by <a href="https://github.com/kurtmckee"><code>@​kurtmckee</code></a> in <a href="">#1152</a>.</li>
</ul>
<h2>Upgrade notes</h2>
<p>Most fixes are invisible to correctly-configured callers. A few behavioral changes you may encounter:</p>
<ul>
<li><strong>Empty HMAC keys now raise.</strong> If your app passed <code>&quot;&quot;</code> or <code>b&quot;&quot;</code> as a secret (often via a missing env var, e.g. <code>os.getenv(&quot;JWT_SECRET&quot;, &quot;&quot;)</code>), <code>encode</code>/<code>decode</code> will now raise <code>InvalidKeyError</code>. This is the intended behavior — fix the configuration.</li>
<li><strong><code>PyJWK</code> decoding now requires the token's <code>alg</code> to match the JWK's algorithm.</strong> Previously a mismatch was silently honored if the header <code>alg</code> appeared in the allow-list. Tokens that relied on this mismatch will now fail with <code>InvalidAlgorithmError</code>.</li>
<li><strong><code>PyJWKClient</code> now rejects non-HTTP(S) URIs at construction time.</strong> Tests or dev environments that fetched JWKS from <code>file://</code> URIs need to switch to a local HTTP server or load the JWKS by other means (e.g. construct <code>PyJWKSet.from_dict(...)</code> directly).</li>
<li><strong><code>b64=false</code> tokens are now strictly RFC 7515 / 7797 compliant.</strong> Tokens with a non-empty compact-form payload segment, or that omit <code>&quot;b64&quot;</code> from <code>crit</code>, will be rejected. PyJWT-produced tokens always satisfy both invariants, so round-trips through PyJWT are unaffected.</li>
<li><strong><code>enforce_minimum_key_length</code> set per-call now takes effect.</strong> Callers who passed <code>options={&quot;enforce_minimum_key_length&quot;: True}</code> to <code>jwt.decode()</code> previously got no enforcement; they will now get <code>InvalidKeyError</code> on undersized keys, as documented.</li>
</ul>
<p><strong>Full changelog:</strong> <a href="https://github.com/jpadilla/pyjwt/compare/2.12.1...2.13.0">https://github.com/jpadilla/pyjwt/compare/2.12.1...2.13.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/blob/master/CHANGELOG.rst">pyjwt's changelog</a>.</em></p>
<blockquote>
<h2><code>v2.13.0 &lt;https://github.com/jpadilla/pyjwt/compare/2.12.1...2.13.0&gt;</code>__</h2>
<p>Security</p>
<pre><code>
- Reject JWK JSON documents passed as raw HMAC secrets in
  ``HMACAlgorithm.prepare_key`` to close an algorithm-confusion gap that
  the existing PEM/SSH guard did not cover. Reported by @aradona91 in
  `GHSA-xgmm-8j9v-c9wx &lt;https://github.com/jpadilla/pyjwt/security/advisories/GHSA-xgmm-8j9v-c9wx&gt;`__.
- Bind the JWT header ``alg`` to ``PyJWK.algorithm_name`` during
  verification so the caller's ``algorithms=[...]`` allow-list cannot be
  bypassed when decoding with a ``PyJWK`` / ``PyJWKClient`` key. Reported
  by @sushi-gif in `GHSA-jq35-7prp-9v3f &lt;https://github.com/jpadilla/pyjwt/security/advisories/GHSA-jq35-7prp-9v3f&gt;`__.
- Reject non-``http(s)`` URI schemes in ``PyJWKClient`` so attacker-
  influenced URIs cannot read local files or reach unintended schemes via
  urllib's default ``file://`` / ``ftp://`` / ``data:`` handlers. Reported
  by @KEIJOT in `GHSA-993g-76c3-p5m4 &lt;https://github.com/jpadilla/pyjwt/security/advisories/GHSA-993g-76c3-p5m4&gt;`__.
- Preserve the cached JWK Set on fetch errors in ``PyJWKClient.fetch_data``.
  The previous ``finally``-block ``put(None)`` pattern cleared the cache
  on any transient outage, turning one bad JWKS request into application-
  wide auth failure. Reported by @eddieran in `GHSA-fhv5-28vv-h8m8 &lt;https://github.com/jpadilla/pyjwt/security/advisories/GHSA-fhv5-28vv-h8m8&gt;`__.
- Skip the unconditional base64 decode of the compact-form payload segment
  when ``b64=false`` is set in the protected header, and require that
  segment to be empty (RFC 7515 Appendix F detached form). Closes an
  unauthenticated DoS amplifier. Reported by @thesmartshadow in
  `GHSA-w7vc-732c-9m39 &lt;https://github.com/jpadilla/pyjwt/security/advisories/GHSA-w7vc-732c-9m39&gt;`__.
<p>Fixed</p>
<pre><code>
- Reject empty HMAC keys outright in ``HMACAlgorithm.prepare_key`` with
  ``InvalidKeyError`` instead of accepting them with only a warning.
  Thanks to @SnailSploit and @spartan8806 for independently flagging the
  footgun.
- Forward per-call ``options`` (including ``enforce_minimum_key_length``)
  from ``PyJWT.decode`` through to ``PyJWS._verify_signature`` so the
  option actually takes effect when set at the call site rather than only
  on the ``PyJWT`` instance. Thanks to @WLUB for the report.
- RFC 7797 §3 compliance for ``b64=false``: the encoder now auto-adds
  ``&amp;quot;b64&amp;quot;`` to the ``crit`` header parameter, and the decoder rejects
  tokens that set ``b64=false`` without listing it in ``crit``. Thanks to
  @MachineLearning-Nerd for the report.

Changed
</code></pre>
<ul>
<li>Migrate the <code>dev</code>, <code>docs</code>, and <code>tests</code> package extras to dependency groups by <a href="https://github.com/kurtmckee"><code>@​kurtmckee</code></a> in <code> &amp;lt;</code>__
</code></pre></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7144e45</code></a> Apply ruff format</li>
<li><a href=""><code>d2f4bec</code></a> Restore <code>cast()</code> calls with cross-version <code>type: ignore</code> for <code>prepare_key</code></li>
<li><a href=""><code>22f478c</code></a> Remove redundant casts in <code>RSAAlgorithm.prepare_key</code> and `ECAlgorithm.prepare...</li>
<li><a href=""><code>95791b1</code></a> Bundle security fixes and hardening into 2.13.0</li>
<li><a href=""><code>dcc27a9</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1155</a>)</li>
<li><a href=""><code>9d08a9a</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#1146</a>)</li>
<li><a href=""><code>b87c100</code></a> Bump codecov/codecov-action from 5 to 6 (<a href="">#1154</a>)</li>
<li><a href=""><code>40e3147</code></a> Migrate development extras to dependency groups (<a href="">#1152</a>)</li>
<li>See full diff in <a href="https://github.com/jpadilla/pyjwt/compare/2.12.1...2.13.0">compare view</a></li>
</ul>
</details>
<br />

Updates `requests` from 2.33.1 to 2.34.2
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
</blockquote>
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
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.33.1...v2.34.2">compare view</a></li>
</ul>
</details>
<br />

Updates `sentry-sdk[falcon]` to 2.60.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/releases">sentry-sdk[falcon]'s releases</a>.</em></p>
<blockquote>
<h2>2.60.0</h2>
<p>Adds a new <code>stream_gen_ai_spans</code> option that controls how <code>gen_ai</code> spans are
sent to Sentry. When set, the SDK extracts all <code>gen_ai</code> spans out of a
transaction and sends them as v2 envelope items.</p>
<p>Enable this option if <code>gen_ai</code> spans are being dropped because the transaction payload exceeds size limits.</p>
<pre lang="python"><code>import sentry_sdk
<p>sentry_sdk.init(
dsn='https://<a href="mailto:examplePublicKey@o0.ingest.sentry.io">examplePublicKey@o0.ingest.sentry.io</a>/0',
stream_gen_ai_spans=True,
)
</code></pre></p>
<h3>New Features ✨</h3>
<ul>
<li>(asyncpg) Add cursor span support via BaseCursor method patching by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6252</a></li>
<li>(integrations) Pass along the conversation ID for openai <code>responses</code> calls by <a href="https://github.com/constantinius"><code>@​constantinius</code></a> in <a href="">#6199</a></li>
<li>(wsgi,asgi) Introduce substitute values for filtered fields in span-streaming mode by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6178</a></li>
<li>Remove truncation when <code>stream_gen_ai_spans</code> is enabled by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6260</a></li>
<li>Add option to send GenAI spans in the new span format by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6079</a></li>
</ul>
<h3>Bug Fixes 🐛</h3>
<h4>Openai</h4>
<ul>
<li>Guard against <code>choices=None</code> by <a href="https://github.com/cla7aye15I4nd"><code>@​cla7aye15I4nd</code></a> in <a href="">#6216</a></li>
<li>Stop setting transaction status when child span fails by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6192</a></li>
<li>Only finish relevant spans in Responses patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6191</a></li>
<li>Only finish relevant spans in Chat Completions patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6190</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(stdlib) Instrument response body read for chunked HTTP responses by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6202</a></li>
<li>(typing) Add <code>@sentry_sdk.traces.trace</code> overloads to fix typing by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6236</a></li>
<li>Use proto version 2 to fix backfilled user agent and IP by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6256</a></li>
<li>Make sure <code>http.server</code> spans are segments by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6230</a></li>
<li>Handle mypy 2.0 related failures by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6218</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<h4>Django</h4>
<ul>
<li>Check transaction annotations on transaction events by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6251</a></li>
<li>Reload middleware on test teardown by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6249</a></li>
</ul>
<h4>Openai</h4>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/getsentry/sentry-python/blob/master/CHANGELOG.md">sentry-sdk[falcon]'s changelog</a>.</em></p>
<blockquote>
<h2>2.60.0</h2>
<p>Adds a new <code>stream_gen_ai_spans</code> option that controls how <code>gen_ai</code> spans are
sent to Sentry. When set, the SDK extracts all <code>gen_ai</code> spans out of a
transaction and sends them as v2 envelope items.</p>
<p>Enable this option if <code>gen_ai</code> spans are being dropped because the transaction payload exceeds size limits.</p>
<pre lang="python"><code>import sentry_sdk
<p>sentry_sdk.init(
dsn='https://<a href="mailto:examplePublicKey@o0.ingest.sentry.io">examplePublicKey@o0.ingest.sentry.io</a>/0',
stream_gen_ai_spans=True,
)
</code></pre></p>
<h3>New Features ✨</h3>
<ul>
<li>(asyncpg) Add cursor span support via BaseCursor method patching by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6252</a></li>
<li>(integrations) Pass along the conversation ID for openai <code>responses</code> calls by <a href="https://github.com/constantinius"><code>@​constantinius</code></a> in <a href="">#6199</a></li>
<li>(wsgi,asgi) Introduce substitute values for filtered fields in span-streaming mode by <a href="https://github.com/ericapisani"><code>@​ericapisani</code></a> in <a href="">#6178</a></li>
<li>Remove truncation when <code>stream_gen_ai_spans</code> is enabled by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6260</a></li>
<li>Add option to send GenAI spans in the new span format by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6079</a></li>
</ul>
<h3>Bug Fixes 🐛</h3>
<h4>Openai</h4>
<ul>
<li>Guard against <code>choices=None</code> by <a href="https://github.com/cla7aye15I4nd"><code>@​cla7aye15I4nd</code></a> in <a href="">#6216</a></li>
<li>Stop setting transaction status when child span fails by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6192</a></li>
<li>Only finish relevant spans in Responses patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6191</a></li>
<li>Only finish relevant spans in Chat Completions patches by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6190</a></li>
</ul>
<h4>Other</h4>
<ul>
<li>(stdlib) Instrument response body read for chunked HTTP responses by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6202</a></li>
<li>(typing) Add <code>@sentry_sdk.traces.trace</code> overloads to fix typing by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6236</a></li>
<li>Use proto version 2 to fix backfilled user agent and IP by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6256</a></li>
<li>Make sure <code>http.server</code> spans are segments by <a href="https://github.com/sentrivana"><code>@​sentrivana</code></a> in <a href="">#6230</a></li>
<li>Handle mypy 2.0 related failures by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6218</a></li>
</ul>
<h3>Internal Changes 🔧</h3>
<h4>Django</h4>
<ul>
<li>Check transaction annotations on transaction events by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6251</a></li>
<li>Reload middleware on test teardown by <a href="https://github.com/alexander-alderman-webb"><code>@​alexander-alderman-webb</code></a> in <a href="">#6249</a></li>
</ul>
<h4>Openai</h4>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e30caaa</code></a> Update CHANGELOG.md</li>
<li><a href=""><code>d31ac85</code></a> release: 2.60.0</li>
<li><a href=""><code>fcb9305</code></a> feat: Remove truncation when <code>stream_gen_ai_spans</code> is enabled (<a href="">#6260</a>)</li>
<li><a href=""><code>253a4d4</code></a> feat: Add option to send GenAI spans in the new span format (<a href="">#6079</a>)</li>
<li><a href=""><code>619d803</code></a> test(langchain): Inline global state (<a href="">#6261</a>)</li>
<li><a href=""><code>f92c803</code></a> Revert &quot;fix: Work around compromised transitive dependency (<a href="">#6257</a>)&quot; (<a href="">#6262</a>)</li>
<li><a href=""><code>7a303dc</code></a> Add option to drop scrubbed user IP addresses (<a href="">#6241</a>)</li>
<li><a href=""><code>edaa6d6</code></a> feat(pymongo): Add span streaming support (<a href="">#6253</a>)</li>
<li><a href=""><code>0e47ead</code></a> feat(asyncpg): Add cursor span support via BaseCursor method patching (<a href="">#6252</a>)</li>
<li><a href=""><code>17cc8c7</code></a> fix: Use proto version 2 to fix backfilled user agent and IP (<a href="">#6256</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/getsentry/sentry-python/compare/2.58.0...2.60.0">compare view</a></li>
</ul>
</details>
<br />

Updates `taskiq[reload]` to 0.12.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/taskiq-python/taskiq/releases">taskiq[reload]'s releases</a>.</em></p>
<blockquote>
<h2>0.12.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Fixed prometheus multiprocessing registry by <a href="https://github.com/FadingFog"><code>@​FadingFog</code></a> in <a href="">taskiq-python/taskiq#620</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/FadingFog"><code>@​FadingFog</code></a> made their first contribution in <a href="">taskiq-python/taskiq#620</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/taskiq-python/taskiq/compare/0.12.3...0.12.4">https://github.com/taskiq-python/taskiq/compare/0.12.3...0.12.4</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>442621d</code></a> Fixed prometheus multiprocessing registry (<a href="">#620</a>)</li>
<li><a href=""><code>3f1d0d1</code></a> Add worker resource and queue metrics to OTel instrumentation (<a href="">#613</a>)</li>
<li><a href=""><code>6cf0568</code></a> Fixed prometheus collectors. (<a href="">#617</a>)</li>
<li><a href=""><code>784fa88</code></a> Add support for jitter so that we can ensure evenly distributed tasks don't c...</li>
<li><a href=""><code>eaed387</code></a> Refactor tests for <code>async with broker</code> (<a href="">#615</a>)</li>
<li><a href=""><code>8703d74</code></a> Fixed process-pool for sync tasks. (<a href="">#616</a>)</li>
<li><a href=""><code>653400e</code></a> Added <strong>aexit</strong> and <strong>aenter</strong> support. (<a href="">#614</a>)</li>
<li><a href=""><code>3d83293</code></a> fix: check readiness before timeout (<a href="">#600</a>)</li>
<li>See full diff in <a href="https://github.com/taskiq-python/taskiq/compare/0.12.2...0.12.4">compare view</a></li>
</ul>
</details>
<br />

Updates `uvicorn[standard]` to 0.48.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/releases">uvicorn[standard]'s releases</a>.</em></p>
<blockquote>
<h2>Version 0.48.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Default <code>ssl_ciphers</code> to <code>None</code> and use OpenSSL defaults by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2940</a></li>
<li>Ignore duplicate forwarding headers in <code>ProxyHeadersMiddleware</code> by <a href="https://github.com/Kludex"><code>@​Kludex</code></a> in <a href="">Kludex/uvicorn#2944</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Kludex/uvicorn/compare/0.47.0...0.48.0">https://github.com/Kludex/uvicorn/compare/0.47.0...0.48.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kludex/uvicorn/blob/main/docs/release-notes.md">uvicorn[standard]'s changelog</a>.</em></p>
<blockquote>
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
<h3>Changed</h3>
<ul>
<li>Revert &quot;Emit <code>http.disconnect</code> on server shutdown for streaming responses&quot; (<a href="">#2913</a>)</li>
<li>Revert &quot;Explicitly start ASGI run with empty context&quot; (<a href="">#2911</a>)</li>
</ul>
<h3>Fixed</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>73e84e5</code></a> Version 0.48.0 (<a href="">#2951</a>)</li>
<li><a href=""><code>45ea116</code></a> Ignore duplicate forwarding headers in <code>ProxyHeadersMiddleware</code> (<a href="">#2944</a>)</li>
<li><a href=""><code>dd4394c</code></a> chore(deps): bump idna from 3.11 to 3.15 (<a href="">#2941</a>)</li>
<li><a href=""><code>abe0781</code></a> Default <code>ssl_ciphers</code> to <code>None</code> and use OpenSSL defaults (<a href="">#2940</a>)</li>
<li><a href=""><code>479a2c0</code></a> Version 0.47.0 (<a href="">#2937</a>)</li>
<li><a href=""><code>89347fd</code></a> Add 7-day cooldown for dependency resolution via uv exclude-newer (<a href="">#2936</a>)</li>
<li><a href=""><code>767315b</code></a> Drop unused contents/actions permissions from zizmor workflow (<a href="">#2935</a>)</li>
<li><a href=""><code>f25ee43</code></a> chore(deps): bump urllib3 from 2.6.3 to 2.7.0 (<a href="">#2933</a>)</li>
<li><a href=""><code>8782666</code></a> Fix typo in <code>docs/deployment/index.md</code>. (<a href="">#2932</a>)</li>
<li><a href=""><code>ad5ff87</code></a> Treat <code>fd=0</code> as a valid file descriptor with reload/workers (<a href="">#2927</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/Kludex/uvicorn/compare/0.46.0...0.48.0">compare view</a></li>
</ul>
</details>
<br />

Updates `coverage` from 7.13.5 to 7.14.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.14.0 — 2026-05-10</h2>
<ul>
<li>
<p>Feature: now when running one of the reporting commands, if there are
parallel data files that need combining, they will be implicitly combined
before creating the report. There is no option to avoid the combination; let
us know if you have a use case that requires it.  Thanks, <code>Tim Hatch &lt;pull 2162_&gt;</code><em>. Closes <code>issue 1781</code></em>.</p>
</li>
<li>
<p>Fix: the output from <code>combine</code> was too verbose, listing each file
considered. Now it shows a single line with the counts of files combined,
files skipped, and files with errors. The <code>-q</code> flag suppresses this line.
The old detailed lines are available with the new <code>--debug=combine</code> option.</p>
</li>
<li>
<p>Fix: running a Python file through a symlink now sets the sys.path correctly,
matching regular Python behavior. Fixes <code>issue 2157</code>_.</p>
</li>
<li>
<p>Fix: <code>Collector.flush_data</code> could fail with &quot;RuntimeError: Set changed
size during iteration&quot; when a tracer in another thread added a line to the
per-file set that <code>add_lines</code> (or <code>add_arcs</code>) was iterating. The values
passed to <code>CoverageData</code> are now snapshotted via <code>dict.copy()</code> and
<code>set.copy()</code>, which are atomic under the GIL. Thanks, <code>Alex Vandiver &lt;pull 2165_&gt;</code>_.</p>
</li>
<li>
<p>Fix: the soft keyword <code>lazy</code> is now bolded in HTML reports.</p>
</li>
<li>
<p>We are no longer testing eventlet support. Eventlet started issuing stern
deprecation warnings that break our tests. Our support code is still there.</p>
</li>
</ul>
<p>.. _issue 1781: <a href="">coveragepy/coveragepy#1781</a>
.. _issue 2157: <a href="">coveragepy/coveragepy#2157</a>
.. _pull 2162: <a href="">coveragepy/coveragepy#2162</a>
.. _pull 2165: <a href="">coveragepy/coveragepy#2165</a></p>
<p>.. _changes_7-13-5:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>646351b</code></a> docs: sample HTML for 7.14.0</li>
<li><a href=""><code>39cd015</code></a> docs: prep for 7.14.0</li>
<li><a href=""><code>649e8aa</code></a> docs: thanks Alex Vandiver for <a href="">#2165</a></li>
<li><a href=""><code>8cd392e</code></a> fix: snapshot data in Collector.flush_data to avoid threading race (<a href="">#2165</a>)</li>
<li><a href=""><code>c48e0ed</code></a> fix: less output for combining</li>
<li><a href=""><code>c2a3a28</code></a> docs: explain the change from <a href="">#2162</a></li>
<li><a href=""><code>1cd47aa</code></a> fix: implicit combine-during-report now removes the combined data files</li>
<li><a href=""><code>2d99fd7</code></a> feat: automatically combine coverage in report, thanks Tim Hatch (<a href="">#2162</a>)</li>
<li><a href=""><code>9fbdcdf</code></a> fix: lazy soft keywords are bolded</li>
<li><a href=""><code>5de7d02</code></a> build: oops, misplaced quote</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.13.5...7.14.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest-asyncio` from 1.3.0 to 1.4.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest-asyncio/releases">pytest-asyncio's releases</a>.</em></p>
<blockquote>
<h2>pytest-asyncio v1.4.0</h2>
<h1><a href="https://github.com/pytest-dev/pytest-asyncio/tree/1.4.0">1.4.0</a> - 2026-05-26</h1>
<h2>Deprecated</h2>
<ul>
<li>Overriding the <em>event_loop_policy</em> fixture is deprecated. Use the <code>pytest_asyncio_loop_factories</code> hook instead. (<a href="">#1419</a>)</li>
</ul>
<h2>Added</h2>
<ul>
<li>
<p>Added the <code>pytest_asyncio_loop_factories</code> hook to parametrize asyncio tests with custom event loop factories.</p>
<p>The hook returns a mapping of factory names to loop factories, and <code>pytest.mark.asyncio(loop_factories=[...])</code> selects a subset of configured factories per test. When a single factory is configured, test names are unchanged.</p>
<p>Synchronous <code>@pytest_asyncio.fixture</code> functions now see the correct event loop when custom loop factories are configured, even when test code disrupts the current event loop (e.g., via <code>asyncio.run()</code> or <code>asyncio.set_event_loop(None)</code>). (<a href="">#1164</a>)</p>
</li>
</ul>
<h2>Changed</h2>
<ul>
<li>Improved the readability of the warning message that is displayed when <code>asyncio_default_fixture_loop_scope</code> is unset (<a href="">#1298</a>)</li>
<li>Only import <code>asyncio.AbstractEventLoopPolicy</code> for type checking to avoid raising
a DeprecationWarning. (<a href="">#1394</a>)</li>
<li>Updated minimum supported pytest version to v8.4.0. (<a href="">#1397</a>)</li>
</ul>
<h2>Fixed</h2>
<ul>
<li>Fixed a <code>ResourceWarning: unclosed event loop</code> warning that could occur when a synchronous test called <code>asyncio.run()</code> or otherwise unset the current event loop after pytest-asyncio had run an async test or fixture. (<a href="">#724</a>)</li>
</ul>
<h2>Notes for Downstream Packagers</h2>
<ul>
<li>Added dependency on <code>sphinx-tabs &gt;= 3.5</code> to organize documentation examples into tabs. (<a href="">#1395</a>)</li>
</ul>
<h2>pytest-asyncio v1.4.0a2</h2>
<h1><a href="https://github.com/pytest-dev/pytest-asyncio/tree/1.4.0a2">1.4.0a2</a> - 2026-05-02</h1>
<h2>Deprecated</h2>
<ul>
<li>Overriding the <em>event_loop_policy</em> fixture is deprecated. Use the <code>pytest_asyncio_loop_factories</code> hook instead. (<a href="">#1419</a>)</li>
</ul>
<h2>Added</h2>
<ul>
<li>
<p>Added the <code>pytest_asyncio_loop_factories</code> hook to parametrize asyncio tests with custom event loop factories.</p>
<p>The hook returns a mapping of factory names to loop factories, and <code>pytest.mark.asyncio(loop_factories=[...])</code> selects a subset of configured factories per test. When a single factory is configured, test names are unchanged on pytest 8.4+.</p>
<p>Synchronous <code>@pytest_asyncio.fixture</code> functions now see the correct event loop when custom loop factories are configured, even when test code disrupts the current event loop (e.g., via <code>asyncio.run()</code> or <code>asyncio.set_event_loop(None)</code>). (<a href="">#1164</a>)</p>
</li>
</ul>
<h2>Changed</h2>
<ul>
<li>Improved the readability of the warning message that is displayed when <code>asyncio_default_fixture_loop_scope</code> is unset (<a href="">#1298</a>)</li>
<li>Only import <code>asyncio.AbstractEventLoopPolicy</code> for type checking to avoid raising
a DeprecationWarning. (<a href="">#1394</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6e14cd2</code></a> chore: Prepare release of v1.4.0.</li>
<li><a href=""><code>4b900fb</code></a> Build(deps): Bump codecov/codecov-action from 6.0.0 to 6.0.1</li>
<li><a href=""><code>ab9f632</code></a> Build(deps): Bump zipp from 3.23.1 to 4.1.0</li>
<li><a href=""><code>a56fc77</code></a> Build(deps): Bump hypothesis from 6.152.6 to 6.152.8</li>
<li><a href=""><code>e8bae9b</code></a> Build(deps): Bump requests from 2.34.0 to 2.34.2</li>
<li><a href=""><code>fc43340</code></a> Build(deps): Bump idna from 3.14 to 3.15</li>
<li><a href=""><code>762eaf5</code></a> Build(deps): Bump jaraco-functools from 4.4.0 to 4.5.0</li>
<li><a href=""><code>b62e222</code></a> Build(deps): Bump click from 8.3.3 to 8.4.0</li>
<li><a href=""><code>9190447</code></a> Build(deps): Bump pydantic from 2.13.3 to 2.13.4</li>
<li><a href=""><code>82a393c</code></a> ci: Remove unnecessary debug output.</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest-asyncio/compare/v1.3.0...v1.4.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.11 to 0.15.14
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.14</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-21.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Implement <code>airflow-task-implicit-multiple-outputs</code> (<code>AIR202</code>) (<a href="">#25152</a>)</li>
<li>[<code>flake8-use-pathlib</code>] Mark <code>PTH101</code> fix as unsafe when first argument is a class attribute annotated as <code>int</code> (<a href="">#25086</a>)</li>
<li>[<code>pylint</code>] Implement <code>too-many-try-statements</code> (<code>W0717</code>) (<a href="">#23970</a>)</li>
<li>[<code>ruff</code>] Add <code>incorrect-decorator-order</code> (<code>RUF074</code>) (<a href="">#23461</a>)</li>
<li>[<code>ruff</code>] Add <code>fallible-context-manager</code> (<code>RUF075</code>) (<a href="">#22844</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix lambda formatting in interpolated string expressions (<a href="">#25144</a>)</li>
<li>Treat generic <code>frozenset</code> annotations as immutable (<a href="">#25251</a>)</li>
<li>[<code>flake8-type-checking</code>] Avoid <code>strict</code> behavior when <code>future-annotations</code> are enabled (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#25035</a>)</li>
<li>[<code>pylint</code>] Avoid false positives in <code>else</code> clause (<code>PLR1733</code>) (<a href="">#25177</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-comprehensions</code>] Skip <code>C417</code> for lambdas with positional-only parameters (<a href="">#25272</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve f-string source verbatim in <code>SIM101</code> fix (<a href="">#25061</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid unnecessary parser lookahead for operators (<a href="">#25290</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update code example setting Neovim LSP log level (<a href="">#25284</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Add full PEP 798 support (<a href="">#25104</a>)</li>
<li>Add a parser recursion limit (<a href="">#24810</a>)</li>
<li>Update various <code>ruff_python_stdlib</code> APIs (<a href="">#25273</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ocaballeror"><code>@​ocaballeror</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/samuelcolvin"><code>@​samuelcolvin</code></a></li>
<li><a href="https://github.com/baltasarblanco"><code>@​baltasarblanco</code></a></li>
<li><a href="https://github.com/aconal-com"><code>@​aconal-com</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/JelleZijlstra"><code>@​JelleZijlstra</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
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
<h2>0.15.14</h2>
<p>Released on 2026-05-21.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Implement <code>airflow-task-implicit-multiple-outputs</code> (<code>AIR202</code>) (<a href="">#25152</a>)</li>
<li>[<code>flake8-use-pathlib</code>] Mark <code>PTH101</code> fix as unsafe when first argument is a class attribute annotated as <code>int</code> (<a href="">#25086</a>)</li>
<li>[<code>pylint</code>] Implement <code>too-many-try-statements</code> (<code>W0717</code>) (<a href="">#23970</a>)</li>
<li>[<code>ruff</code>] Add <code>incorrect-decorator-order</code> (<code>RUF074</code>) (<a href="">#23461</a>)</li>
<li>[<code>ruff</code>] Add <code>fallible-context-manager</code> (<code>RUF075</code>) (<a href="">#22844</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix lambda formatting in interpolated string expressions (<a href="">#25144</a>)</li>
<li>Treat generic <code>frozenset</code> annotations as immutable (<a href="">#25251</a>)</li>
<li>[<code>flake8-type-checking</code>] Avoid <code>strict</code> behavior when <code>future-annotations</code> are enabled (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#25035</a>)</li>
<li>[<code>pylint</code>] Avoid false positives in <code>else</code> clause (<code>PLR1733</code>) (<a href="">#25177</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-comprehensions</code>] Skip <code>C417</code> for lambdas with positional-only parameters (<a href="">#25272</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve f-string source verbatim in <code>SIM101</code> fix (<a href="">#25061</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid unnecessary parser lookahead for operators (<a href="">#25290</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update code example setting Neovim LSP log level (<a href="">#25284</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Add full PEP 798 support (<a href="">#25104</a>)</li>
<li>Add a parser recursion limit (<a href="">#24810</a>)</li>
<li>Update various <code>ruff_python_stdlib</code> APIs (<a href="">#25273</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ocaballeror"><co...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f90ce8ab3d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.