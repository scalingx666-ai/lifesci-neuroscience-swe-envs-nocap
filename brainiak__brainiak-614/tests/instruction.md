# Issue

**Title:** build(deps): bump the all-security-updates group across 1 directory with 15 updates

## Description

Bumps the all-security-updates group with 15 updates in the / directory:

| Package | From | To |
| --- | --- | --- |
| [awscli](https://github.com/aws/aws-cli) | `1.44.38` | `1.45.28` |
| [tornado](https://github.com/tornadoweb/tornado) | `6.5.5` | `6.5.9` |
| [anyio](https://github.com/agronholm/anyio) | `4.11.0` | `4.14.2` |
| [bleach](https://github.com/mozilla/bleach) | `6.3.0` | `6.4.0` |
| [cryptography](https://github.com/pyca/cryptography) | `46.0.7` | `50.0.0` |
| [fsspec](https://github.com/fsspec/filesystem_spec) | `2025.9.0` | `2026.6.0` |
| [idna](https://github.com/kjd/idna) | `3.11` | `3.15` |
| [jupyter-server](https://github.com/jupyter-server/jupyter_server) | `2.18.0` | `2.20.0` |
| [jupyterlab](https://github.com/jupyterlab/jupyterlab) | `4.4.10` | `4.5.11` |
| [mistune](https://github.com/lepture/mistune) | `3.2.1` | `3.3.3` |
| [pillow](https://github.com/python-pillow/Pillow) | `12.2.0` | `12.3.0` |
| [pyasn1](https://github.com/pyasn1/pyasn1) | `0.6.3` | `0.6.4` |
| [soupsieve](https://github.com/facelessuser/soupsieve) | `2.8` | `2.9` |
| [urllib3](https://github.com/urllib3/urllib3) | `2.7.0` | `2.8.0` |
| [werkzeug](https://github.com/pallets/werkzeug) | `3.1.6` | `3.1.9` |

Updates `awscli` from 1.44.38 to 1.45.28
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>13defc3</code></a> Merge branch 'release-1.45.28'</li>
<li><a href=""><code>fa1eed1</code></a> Bumping version to 1.45.28</li>
<li><a href=""><code>72d1d54</code></a> Update changelog based on model updates</li>
<li><a href=""><code>1c2d1bd</code></a> Merge customizations for EKS</li>
<li><a href=""><code>170cfc7</code></a> feat(emr): Improve SSH host key verification with accept-new (<a href="">#10390</a>)</li>
<li><a href=""><code>11d8b20</code></a> Merge branch 'release-1.45.27'</li>
<li><a href=""><code>a819530</code></a> Merge branch 'release-1.45.27' into develop</li>
<li><a href=""><code>34296e8</code></a> Bumping version to 1.45.27</li>
<li><a href=""><code>a3a7d02</code></a> Update changelog based on model updates</li>
<li><a href=""><code>6be9e33</code></a> Merge branch 'release-1.45.26'</li>
<li>Additional commits viewable in <a href="https://github.com/aws/aws-cli/compare/1.44.38...1.45.28">compare view</a></li>
</ul>
</details>
<br />

Updates `tornado` from 6.5.5 to 6.5.9
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.6.0
releases/v6.5.10
releases/v6.5.9
releases/v6.5.8
releases/v6.5.7
releases/v6.5.6
releases/v6.5.5
releases/v6.5.4
releases/v6.5.3
releases/v6.5.2
releases/v6.5.1
releases/v6.5.0
releases/v6.4.2
releases/v6.4.1
releases/v6.4.0
releases/v6.3.3
releases/v6.3.2
releases/v6.3.1
releases/v6.3.0
releases/v6.2.0
releases/v6.1.0
releases/v6.0.4
releases/v6.0.3
releases/v6.0.2
releases/v6.0.1
releases/v6.0.0
releases/v5.1.1
releases/v5.1.0
releases/v5.0.2
releases/v5.0.1
releases/v5.0.0
releases/v4.5.3
releases/v4.5.2
releases/v4.5.1
releases/v4.5.0
releases/v4.4.3
releases/v4.4.2
releases/v4.4.1
releases/v4.4.0
releases/v4.3.0
releases/v4.2.1
releases/v4.2.0
releases/v4.1.0
releases/v4.0.2</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>75ef8b1</code></a> Merge pull request <a href="">#3719</a> from bdarnell/fixes-659</li>
<li><a href=""><code>3590cb4</code></a> test: Hardcode SimpleAsyncHTTPClient in HTTP1xxLimitTestCase</li>
<li><a href=""><code>9fc5d6d</code></a> test: Make tracemalloc optional in httpclient_test</li>
<li><a href=""><code>555a2ee</code></a> iostream: Treat connection resets as a clean close in read_until_close</li>
<li><a href=""><code>3ba622f</code></a> Release notes and version bump for 6.5.9</li>
<li><a href=""><code>41eea68</code></a> test: Fix some test issues only found by our custom tox config</li>
<li><a href=""><code>ab1a778</code></a> Merge remote-tracking branch 'bdarnell/claude/asynchttpclient-streaming-memor...</li>
<li><a href=""><code>437ab5f</code></a> web: Do not follow symlinks out of the static directory</li>
<li><a href=""><code>0394513</code></a> httputil: Apply the argument count limit to query strings</li>
<li><a href=""><code>b798f83</code></a> http1connection: Return after reading the response that follows a 1xx</li>
<li>Additional commits viewable in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.5...v6.5.9">compare view</a></li>
</ul>
</details>
<br />

Updates `anyio` from 4.11.0 to 4.14.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/agronholm/anyio/releases">anyio's releases</a>.</em></p>
<blockquote>
<h2>4.14.2</h2>
<ul>
<li>Changed <code>ByteReceiveStream.receive()</code> implementations to raise a <code>ValueError</code> when <code>max_bytes</code> is not a positive integer (<a href="">#1191</a>)</li>
<li>Fixed <code>CapacityLimiter.total_tokens</code> rejecting <code>float(&quot;inf&quot;)</code> when the limiter was instantiated outside of an event loop. The adapter setter checked for infinity by identity (<code>value is math.inf</code>), so only the exact <code>math.inf</code> singleton was accepted, while every backend setter (using <code>math.isinf()</code>) accepts any positive infinity (<a href="">#1189</a>; PR by <a href="https://github.com/greymoth-jp"><code>@​greymoth-jp</code></a>).</li>
<li>Fixed <code>to_process.run_sync()</code> deadlocking when the worker function writes enough data to <code>sys.stderr</code> to fill the (undrained) pipe buffer. The worker process now redirects <code>sys.stderr</code> to <code>os.devnull</code> as well, matching the documented behavior</li>
<li>Fixed <code>TLSStream.wrap()</code> matching an internationalized (unicode) host name against the peer certificate using IDNA 2003 (via the standard library) instead of IDNA 2008, which could cause the host name to be matched against the wrong certificate (<a href="">#1208</a>)</li>
<li>Fixed <code>anyio.open_process()</code> (and <code>run_process()</code>) ignoring the <code>extra_groups</code> argument, as it mistakenly passed the value of the <code>group</code> argument instead (<a href="">#1209</a>)</li>
<li>Fixed <code>CapacityLimiter.acquire_nowait()</code> and <code>CapacityLimiter.acquire_nowait_on_behalf_of()</code> raising <code>trio.WouldBlock</code> instead of <code>anyio.WouldBlock</code> on the <code>trio</code> backend when there are no tokens available (<a href="">#1218</a>)</li>
<li>Fixed <code>CapacityLimiter</code> on the asyncio backend over-granting tokens (<code>borrowed_tokens</code> exceeding <code>total_tokens</code> and <code>available_tokens</code> going negative) when a non-blocking acquire was made in the window between a token being released and the notified waiter resuming. The freed token is now reserved for the woken waiter right away, so the non-blocking acquire correctly raises <code>WouldBlock</code> (<a href="">#1170</a>; PR by <a href="https://github.com/gaoflow"><code>@​gaoflow</code></a>)</li>
<li>Fixed unnecessary CPU spin when delivering cancellation from <code>CancelScope</code> on asyncio under certain conditions, including improper cancel scope nesting (<a href="">#1111</a>)</li>
</ul>
<h2>4.14.1</h2>
<ul>
<li>Fixed teardown of higher-scoped async fixtures failing on asyncio with <code>RuntimeError: Attempted to exit cancel scope in a different task than it was entered in</code> when an async test raise an outcome exception (e.g., <code>pytest.skip()</code>, <code>pytest.xfail()</code>, or <code>pytest.fail()</code>) (<a href="">#1179</a>; PR by <a href="https://github.com/EmmanuelNiyonshuti"><code>@​EmmanuelNiyonshuti</code></a>)</li>
<li>Fixed <code>CapacityLimiter.total_tokens</code> rejecting a value of <code>0</code> when the limiter was instantiated outside of an event loop, contradicting the documented behavior of allowing 0 total tokens (<a href="">#1183</a>; PR by <a href="https://github.com/nyxst4ck"><code>@​nyxst4ck</code></a>)</li>
</ul>
<h2>4.14.0</h2>
<ul>
<li>
<p>Added support for Python 3.15</p>
</li>
<li>
<p>Added an asynchronous implementation of the <code>itertools</code> module (<a href="">#998</a>; PR by <a href="https://github.com/11kkw"><code>@​11kkw</code></a>)</p>
</li>
<li>
<p>Added the <code>local_port</code> parameter to <code>connect_tcp()</code> to allow binding to a specific local port before connecting (<a href="">#1067</a>; PR by <a href="https://github.com/nullwiz"><code>@​nullwiz</code></a>)</p>
</li>
<li>
<p>Added support for custom capacity limiters in async path and file I/O functions and classes</p>
</li>
<li>
<p>Added the <code>create_task()</code> task group method for easier asyncio migration (returns a <code>TaskHandle</code>) (<a href="">#1098</a>)</p>
</li>
<li>
<p>Changed <code>TaskGroup.start_soon()</code> to return a <code>TaskHandle</code></p>
</li>
<li>
<p>Added an option for <code>TaskGroup.start()</code> to return a <code>TaskHandle</code> (which then contains the start value in the <code>start_value</code> property)</p>
</li>
<li>
<p>Added the <code>cancel()</code> convenience method to <code>TaskGroup</code> as a shortcut for cancelling the task group's cancel scope</p>
</li>
<li>
<p>Improved the error message when a known backend is not installed to suggest the install command (<a href="">#1115</a>; PR by <a href="https://github.com/EmmanuelNiyonshuti"><code>@​EmmanuelNiyonshuti</code></a>)</p>
</li>
<li>
<p>Improved <code>anyio.Path</code> to preserve subclass types by returning <code>Self</code> in methods that return path objects (<a href="">#1130</a>; PR by <a href="https://github.com/EmmanuelNiyonshuti"><code>@​EmmanuelNiyonshuti</code></a>)</p>
</li>
<li>
<p>Changed the parameter type annotation in <code>anyio.Path.write_bytes()</code> to accept any <code>ReadableBuffer</code>, thus allowing it to accept <code>bytearray</code> and <code>memoryview</code> to match <code>pathlib.Path.write_bytes()</code> (<a href="">#1135</a>; PR by <a href="https://github.com/SAY-5"><code>@​SAY-5</code></a>)</p>
</li>
<li>
<p>Changed several type annotations to only accept callables returning coroutine-like objects instead of arbitrary awaitables:</p>
<ul>
<li><code>TaskGroup.start_soon()</code></li>
<li><code>TaskGroup.start()</code></li>
<li><code>anyio.from_thread.run()</code></li>
</ul>
<p>This reverts an earlier change from v3.7.0 which was made in error. (<a href="">#1153</a>)</p>
</li>
<li>
<p>Changed <code>anyio.run</code> to support callables returning arbitrary awaitables at runtime on all backends. Previously, this only worked on asyncio (<a href="">#1171</a>; PR by <a href="https://github.com/gschaffner"><code>@​gschaffner</code></a>)</p>
</li>
<li>
<p>Changed several classes (and their subclasses) to have <code>__slots__</code> (with <code>__weakref__</code>):</p>
<ul>
<li><code>anyio.CancelScope</code></li>
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
<li><a href=""><code>c384f99</code></a> Bumped up the version</li>
<li><a href=""><code>dbba29d</code></a> Fixed 100% CPU spin on cancel scope misuse (<a href="">#1217</a>)</li>
<li><a href=""><code>6bbc6c3</code></a> Fix CapacityLimiter over-granting tokens on asyncio (<a href="">#1172</a>)</li>
<li><a href=""><code>6f82b25</code></a> Refactored TestTLSStream.test_receive_invalid_max_bytes() to be less flaky</li>
<li><a href=""><code>be24b04</code></a> Relaxed timeouts to fix test flakiness</li>
<li><a href=""><code>8113506</code></a> Fix test flakiness caused by slow callback duration logging</li>
<li><a href=""><code>1e988b6</code></a> Fixed CapacityLimiter raising trio.WouldBlock instead of anyio.WouldBlock (<a href="">#1</a>...</li>
<li><a href=""><code>44713f3</code></a> Pin setup-uv to a commit sha across downstream jobs (<a href="">#1213</a>)</li>
<li><a href=""><code>f1b7301</code></a> Fixed stderr writes in a worker subprocess causing a deadlock (<a href="">#1207</a>)</li>
<li><a href=""><code>212be93</code></a> Fix flaky test_tcp_listener_same_port using a hardcoded port (<a href="">#1206</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/agronholm/anyio/compare/4.11.0...4.14.2">compare view</a></li>
</ul>
</details>
<br />

Updates `bleach` from 6.3.0 to 6.4.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mozilla/bleach/blob/main/CHANGES">bleach's changelog</a>.</em></p>
<blockquote>
<h2>Version 6.4.0 (June 5th, 2026)</h2>
<p><strong>NOTE: 2026-06-05: Bleach is no longer maintained. There will be no future
releases including for security issues.</strong>
See issue: <code>&lt;</code>__</p>
<p><strong>Backwards incompatible changes</strong></p>
<ul>
<li>Dropped support for pypy 3.10. (<a href="">#764</a>)</li>
</ul>
<p><strong>Security fixes</strong></p>
<ul>
<li>
<p>Fix bug 2023812 / GHSA-8rfp-98v4-mmr6.</p>
<p>Fix XSS issue with sanitize_uri_value where disallowed schemes with
Unicode invisible characters wouldn't be rejected.</p>
<p>For example::</p>
<p>import bleach
payload1 = '<!-- raw HTML omitted -->Click<!-- raw HTML omitted -->'
result1 = bleach.clean(payload1)
print(repr(result1))</p>
<p>outputs::</p>
<p>'<!-- raw HTML omitted -->Click<!-- raw HTML omitted -->'</p>
<p>See the advisory for details.</p>
</li>
<li>
<p>Fix GHSA-gj48-438w-jh9v.</p>
<p>Fix issue where URI sanitization wasn't happening in formaction attributes.</p>
<p>See the advisory for details.</p>
</li>
</ul>
<p><strong>Bug fixes</strong></p>
<ul>
<li>
<p>Add support for pypy 3.11. (<a href="">#764</a>)</p>
</li>
<li>
<p>Drop version max in tinycss2 pin. (<a href="">#772</a>)</p>
<p>This removes one of the things we had to keep checking and updating. Users
now own the responsibility for correctness with the version of tinycss2
they're using.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f0355a7</code></a> fix: fix last release date in CHANGES</li>
<li><a href=""><code>ae4e8a2</code></a> chore: bleach 6.4.0 and final release</li>
<li><a href=""><code>970df58</code></a> fix: uri-sanitization in formaction attributes</li>
<li><a href=""><code>7c4867c</code></a> fix: xss bypass in allowed protocol test using unicode invisible characters</li>
<li><a href=""><code>913ab75</code></a> fix: reduce redundancy in workflow jobs</li>
<li><a href=""><code>218c15a</code></a> fix: rework pip caching</li>
<li><a href=""><code>4f0b097</code></a> fix: fix tox platform restrictions</li>
<li><a href=""><code>e95a79d</code></a> chore: update pytest</li>
<li><a href=""><code>91539d4</code></a> Bump actions/cache from 5.0.3 to 5.0.4</li>
<li><a href=""><code>cd47b4c</code></a> fix: handle left-angle-bracket that's not a tag (<a href="">#733</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/mozilla/bleach/compare/v6.3.0...v6.4.0">compare view</a></li>
</ul>
</details>
<br />

Updates `cryptography` from 46.0.7 to 50.0.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst">cryptography's changelog</a>.</em></p>
<blockquote>
<p>50.0.0 - 2026-07-31</p>
<pre><code>
* **SECURITY ISSUE**:
  :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
  and its PEM and S/MIME variants no longer expose distinguishable errors or
  timing when unwrapping a ``RecipientInfo``'s ``encryptedKey``, which could
  act as a Bleichenbacher oracle for callers that decrypt untrusted messages.
  A random key is now substituted on failure, as described in :rfc:`3218`.
  Credit to **@X1AOxiang** for reporting the issue. **CVE-2026-69247**
* Deprecated Diffie-Hellman key exchange over finite fields (FFDH).
  Everything FFDH is deprecated, including the types in
  ``cryptography.hazmat.primitives.asymmetric.dh`` and loading FFDH keys or
  parameters with the key loading APIs. Users should migrate to a more
  modern key exchange algorithm.
* Added ``xof()`` class methods to
  :class:`~cryptography.hazmat.primitives.hashes.SHAKE128` and
  :class:`~cryptography.hazmat.primitives.hashes.SHAKE256` for constructing
  algorithm instances configured for use with
  :class:`~cryptography.hazmat.primitives.hashes.XOFHash`.
* The :mod:`X.509 verification &lt;cryptography.x509.verification&gt;` APIs are now
  considered stable and are subject to our API stability policy.
* Added the :doc:`/cobblestone` recipe, an implementation of the
  Cobblestone-128 and Cobblestone-256 instantiations of the `C2SP
  chunked-encryption specification
  &lt;https://c2sp.org/chunked-encryption&gt;`_ for streaming authenticated
  encryption of large messages.
* Parsing a Signed Certificate Timestamp list now rejects encodings that
  carry trailing bytes after the list or after an individual SCT, instead of
  silently ignoring them.
* Added support for using :class:`~cryptography.x509.Name` as a field type in
  the :doc:`/hazmat/asn1/index` module.
* Loading a public key or an EC private key now rejects DER where the
  ``subjectPublicKey`` (or EC ``publicKey``) ``BIT STRING`` declares a non-zero
  number of unused bits, instead of silently ignoring it.
* Parsing a CRL entry's ``InvalidityDate`` extension now rejects a
  ``GeneralizedTime`` that carries fractional seconds or another non-DER form,
  matching the strict encoding already required for every other X.509 time
  field.
* :func:`~cryptography.x509.ocsp.load_der_ocsp_request` and
  :func:`~cryptography.x509.ocsp.load_der_ocsp_response` now reject a request
  or response whose ``version`` field is not ``v1``, the only version defined
  by RFC 6960, matching the version validation already performed when loading
  certificates, CSRs and CRLs.
* :class:`~cryptography.hazmat.primitives.hashes.XOFHash` is now supported
  when building against AWS-LC.
* HMAC (and therefore PBKDF2-HMAC) with SHA-3 hashes is now supported when
  building against AWS-LC.
* Diffie-Hellman (:doc:`/hazmat/primitives/asymmetric/dh`) is now supported
  when building against AWS-LC.
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dcb7050</code></a> Prepare for 50.0.0 release (<a href="">#15372</a>)</li>
<li><a href=""><code>53fccd9</code></a> Don't leak how PKCS#7 encryptedKey decryption failed (<a href="">#15369</a>)</li>
<li><a href=""><code>d472f97</code></a> Add <code>from __future__ import annotations</code> to all src/ Python files (<a href="">#15371</a>)</li>
<li><a href=""><code>908773d</code></a> Bump downstream dependencies in CI (<a href="">#15368</a>)</li>
<li><a href=""><code>2cc07cc</code></a> Bump BoringSSL, OpenSSL, AWS-LC in CI (<a href="">#15367</a>)</li>
<li><a href=""><code>c94ede9</code></a> chore(deps): bump ruff from 0.16.0 to 0.16.1 (<a href="">#15366</a>)</li>
<li><a href=""><code>67a8308</code></a> chore(deps): bump virtualenv from 21.7.0 to 21.7.1 (<a href="">#15365</a>)</li>
<li><a href=""><code>95018ff</code></a> Release the GIL in one-shot AEAD encrypt/decrypt (<a href="">#15361</a>)</li>
<li><a href=""><code>6954733</code></a> Release the GIL during DH and DSA parameter generation (<a href="">#15364</a>)</li>
<li><a href=""><code>6893b94</code></a> Import _serialization instead of serialization in x509/extensions (<a href="">#15363</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pyca/cryptography/compare/46.0.7...50.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `fsspec` from 2025.9.0 to 2026.6.0
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a245700</code></a> changelog (<a href="">#2049</a>)</li>
<li><a href=""><code>652325d</code></a> Fix async cat ranges on error (<a href="">#2045</a>)</li>
<li><a href=""><code>073aac8</code></a> Forward kwargs from cat_ranges to cat_file (<a href="">#2044</a>)</li>
<li><a href=""><code>2818611</code></a> FTP: preserve filenames containing whitespace in _mlsd2 (<a href="">#2043</a>)</li>
<li><a href=""><code>c879384</code></a> Prevent attribute error by checking for 'forced' attribute before flushing ca...</li>
<li><a href=""><code>71b8a6b</code></a> Reflect async _walk correctly (<a href="">#2040</a>)</li>
<li><a href=""><code>5eec9f9</code></a> Fix: Omit <code>threading.get_ident()</code> from cache token for async implementations ...</li>
<li><a href=""><code>8643878</code></a> Small safety improvements (<a href="">#2039</a>)</li>
<li><a href=""><code>a1c16ab</code></a> Honour simple_templates everywhere in referenceFS (<a href="">#2029</a>)</li>
<li><a href=""><code>85facaa</code></a> Fix infinite recursion in expand_path when resolving paths with glob magic ch...</li>
<li>Additional commits viewable in <a href="https://github.com/fsspec/filesystem_spec/compare/2025.9.0...2026.6.0">compare view</a></li>
</ul>
</details>
<br />

Updates `idna` from 3.11 to 3.15
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/kjd/idna/blob/master/HISTORY.md">idna's changelog</a>.</em></p>
<blockquote>
<h2>3.15 (2026-05-12)</h2>
<ul>
<li>Enforce DNS-length cap on individual labels early in <code>check_label</code>,
short-circuiting contextual-rule processing for oversized input
while staying compatible with UTS 46 usage.</li>
<li>Tidy core helpers: hoist bidi category sets to module-level
frozensets (avoiding per-codepoint list construction), simplify
length checks, and reuse the shared <code>_unicode_dots_re</code> from
<code>idna.core</code> in the codec module.</li>
<li>Use <code>raise ... from err</code> for proper exception chaining and
switch internal string formatting to f-strings.</li>
<li>Allow <code>flit_core</code> 4.x in the build backend.</li>
<li>Expand the ruff lint set (flake8-bugbear, flake8-simplify,
pyupgrade, perflint) and apply the surfaced fixes; pin lint CI
to Python 3.14.</li>
<li>Add Dependabot configuration for GitHub Actions.</li>
<li>Convert README and HISTORY from reStructuredText to Markdown.</li>
<li>Reference CVE-2026-45409 for the 3.14 advisory in place of the
initial GHSA identifier.</li>
</ul>
<p>Thanks to Felix Yan, Stan Ulbrych, and metsw24-max for
contributions to this release.</p>
<h2>3.14 (2026-05-10)</h2>
<ul>
<li>Removed opportunity to process long inputs into quadratic
time by rejecting oversize inputs up-front. Closes a bypass
of the CVE-2024-3651 mitigation. [CVE-2026-45409]</li>
</ul>
<p>Thanks to Stan Ulbrych for reporting the issue.</p>
<h2>3.13 (2026-04-22)</h2>
<ul>
<li>Correct classification error for codepoint U+A7F1</li>
</ul>
<h2>3.12 (2026-04-21)</h2>
<ul>
<li>Update to Unicode 17.0.0.</li>
<li>Issue a deprecation warning for the transitional argument.</li>
<li>Added lazy-loading to provide some performance improvements.</li>
<li>Removed vestiges of code related to Python 2 support, including
segmentation of data structures specific to Jython.</li>
</ul>
<p>Thanks to Rodrigo Nogueira for contributions to this release.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>af30a09</code></a> Release 3.15</li>
<li><a href=""><code>30314d4</code></a> Pre-release 3.15rc0</li>
<li><a href=""><code>05d4b21</code></a> Merge pull request <a href="">#237</a> from kjd/convert-docs-to-markdown</li>
<li><a href=""><code>2987fdb</code></a> Convert README and HISTORY from reStructuredText to Markdown</li>
<li><a href=""><code>59fa800</code></a> Merge pull request <a href="">#236</a> from kjd/dependabot/github_actions/actions-f3e34333ea</li>
<li><a href=""><code>def6983</code></a> Merge branch 'master' into dependabot/github_actions/actions-f3e34333ea</li>
<li><a href=""><code>bbd8004</code></a> Merge pull request <a href="">#234</a> from StanFromIreland/patch-1</li>
<li><a href=""><code>edd07c0</code></a> Bump github/codeql-action from 3.35.2 to 4.35.2 in the actions group</li>
<li><a href=""><code>5557db0</code></a> Merge branch 'master' into patch-1</li>
<li><a href=""><code>f11746c</code></a> Merge pull request <a href="">#235</a> from StanFromIreland/patch-2</li>
<li>Additional commits viewable in <a href="https://github.com/kjd/idna/compare/v3.11...v3.15">compare view</a></li>
</ul>
</details>
<br />

Updates `jupyter-server` from 2.18.0 to 2.20.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/releases">jupyter-server's releases</a>.</em></p>
<blockquote>
<h2>v2.20.0</h2>
<h2>2.20.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.19.0...333e700119ee0bcc0b5fcd4c158213d7c275c778">Full Changelog</a>)</p>
<h3>Security fixes</h3>
<ul>
<li>CVE-2026-44727 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-fcw5-x6j4-ccmp">GHSA-fcw5-x6j4-ccmp</a></li>
</ul>
<h3>Enhancements made</h3>
<ul>
<li>Fix confusing terminal output when using ServerApp.ip=0.0.0.0 <a href="">#1643</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Add a toggle to enable curve encryption for all kernels that support it <a href="">#1638</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Grab the port from <code>bind_sockets</code> in case its different <a href="">#1651</a> (<a href="https://github.com/choldgraf"><code>@​choldgraf</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix <code>test_authorizer</code> having a spurious comma in params <a href="">#1664</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Add a reminder to merge GHSA before release <a href="">#1659</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Exclude problematic <code>pywinpty</code> 3.0.4 version <a href="">#1658</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>ci: explicitly pass base-setup inputs to fix strict validation failures <a href="">#1626</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Copilot"><code>@​Copilot</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Align docs for curve encryption with latest JEP version <a href="">#1660</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Remove PGP key from docs <a href="">#1653</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-05-29&amp;to=2026-06-17&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACarreau+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acholdgraf+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Copilot"><code>@​Copilot</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACopilot+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aianthomas23+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AYann-P+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>)</p>
<h2>v2.19.0</h2>
<h2>2.19.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.18.2...664e2255c71efe963f397b9f803dbcf503b5a920">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/blob/main/CHANGELOG.md">jupyter-server's changelog</a>.</em></p>
<blockquote>
<h2>2.20.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.19.0...333e700119ee0bcc0b5fcd4c158213d7c275c778">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Fix confusing terminal output when using ServerApp.ip=0.0.0.0 <a href="">#1643</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Add a toggle to enable curve encryption for all kernels that support it <a href="">#1638</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Grab the port from <code>bind_sockets</code> in case its different <a href="">#1651</a> (<a href="https://github.com/choldgraf"><code>@​choldgraf</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix <code>test_authorizer</code> having a spurious comma in params <a href="">#1664</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Add a reminder to merge GHSA before release <a href="">#1659</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Exclude problematic <code>pywinpty</code> 3.0.4 version <a href="">#1658</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>ci: explicitly pass base-setup inputs to fix strict validation failures <a href="">#1626</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Copilot"><code>@​Copilot</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Align docs for curve encryption with latest JEP version <a href="">#1660</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Remove PGP key from docs <a href="">#1653</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-05-29&amp;to=2026-06-17&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACarreau+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acholdgraf+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Copilot"><code>@​Copilot</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACopilot+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aianthomas23+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AYann-P+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>)</p>
<h2>2.19.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.18.2...664e2255c71efe963f397b9f803dbcf503b5a920">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Return <code>unresolved</code> stanza when kernel scope is unavailable for <code>resolvePath</code> (instead of failing with 404) <a href="">#1641</a> (<a href="https://github.com/MUFFANUJ"><code>@​MUFFANUJ</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Recreate notary store on failure to prevent save deadlock and data loss <a href="">#1640</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Restore the test skip marks with updated compatibility reason <a href="">#1646</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Drop Python 3.9 <a href="">#1644</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>05a78ad</code></a> Publish 2.20.0</li>
<li><a href=""><code>6cbee8d</code></a> Merge commit from fork</li>
<li><a href=""><code>333e700</code></a> Fix <code>test_authorizer</code> having a spurious comma in params (<a href="">#1664</a>)</li>
<li><a href=""><code>cccd543</code></a> Fix CI: explicitly pass base-setup inputs to avoid strict validation failures</li>
<li><a href=""><code>cd16d71</code></a> Align docs for curve encryption with latest JEP version (<a href="">#1660</a>)</li>
<li><a href=""><code>e458061</code></a> Add a toggle to enable curve encryption for all kernels that support it (<a href="">#1638</a>)</li>
<li><a href=""><code>0ceeb4f</code></a> Add note in RELEASE.md</li>
<li><a href=""><code>b13f8a2</code></a> Markdown does not work.</li>
<li><a href=""><code>e885b10</code></a> Add GHSA reminder in prep-release</li>
<li><a href=""><code>0e28c90</code></a> Exclude problematic <code>pywinpty</code> 3.0.4 version (<a href="">#1658</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter-server/jupyter_server/compare/v2.18.0...v2.20.0">compare view</a></li>
</ul>
</details>
<br />

Updates `jupyterlab` from 4.4.10 to 4.5.11
Updates `mistune` from 3.2.1 to 3.3.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/releases">mistune's releases</a>.</em></p>
<blockquote>
<h2>v3.3.3</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Set prev token in render_list_item and add block_text to ignore_blocks  -  by <a href="https://github.com/gaoflow"><code>@​gaoflow</code></a> in <a href="">lepture/mistune#456</a> <a href=""><!-- raw HTML omitted -->(0799e)<!-- raw HTML omitted --></a></li>
<li>Improve nested bracket link input  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(fe02f)<!-- raw HTML omitted --></a></li>
<li>Escape literal emphasis markers in MarkdownRenderer  -  by <a href="https://github.com/Sanjays2402"><code>@​Sanjays2402</code></a> <a href=""><!-- raw HTML omitted -->(b0429)<!-- raw HTML omitted --></a></li>
<li>Use SAFE_PROTOCOLS instead of HARMFUL_PROTOCOLS  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(4009f)<!-- raw HTML omitted --></a></li>
<li>Add max_emphasis_depth  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(0938f)<!-- raw HTML omitted --></a></li>
<li>Add image max depth  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(cca5e)<!-- raw HTML omitted --></a></li>
<li><strong>inline</strong>: Use original run length in emphasis multiple-of-3 rule  -  by <a href="https://github.com/greymoth-jp"><code>@​greymoth-jp</code></a> and <strong>Claude Opus 4.8 (1M context)</strong> <a href=""><!-- raw HTML omitted -->(2d26b)<!-- raw HTML omitted --></a></li>
</ul>
<h3>   🏎 Performance</h3>
<ul>
<li>Improve link label parsing performance  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(e001d)<!-- raw HTML omitted --></a></li>
<li>Improve performance for math and formatting plugins  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(c2228)<!-- raw HTML omitted --></a></li>
<li>Improve for footnotes, ruby and spoiler  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(ae7e9)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/lepture/mistune/compare/v3.3.2...v3.3.3">View changes on GitHub</a></h5>
<h2>v3.3.2</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Try to support python 3.8  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(c9f1a)<!-- raw HTML omitted --></a></li>
<li>Resolve mypy issues for python 3.8 and 3.9+  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(29b70)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/lepture/mistune/compare/v3.3.1...v3.3.2">View changes on GitHub</a></h5>
<h2>v3.3.1</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li><strong>abbr</strong>: Update process_text method in abrr, adding parse_emphasis parameter  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(ae850)<!-- raw HTML omitted --></a></li>
<li><strong>directive</strong>: Use correct file path for include directive  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(18c21)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/lepture/mistune/compare/v3.3.0...v3.3.1">View changes on GitHub</a></h5>
<h2>v3.3.0</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Resolve O(n^2) DoS in parse_link_text (CWE-400)  -  by <strong>bhanugoudm041</strong> <a href=""><!-- raw HTML omitted -->(b6b49)<!-- raw HTML omitted --></a></li>
<li>Resolve O(n^2) DoS in parse_link_text (CWE-400)-Type handling/testing done  -  by <strong>bhanugoudm041</strong> <a href=""><!-- raw HTML omitted -->(b3af8)<!-- raw HTML omitted --></a></li>
<li><strong>block</strong>: Avoid quadratic ref link scans  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(2b04d)<!-- raw HTML omitted --></a></li>
<li><strong>cli</strong>: Add entrypoint and utf-8 output  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(2f244)<!-- raw HTML omitted --></a></li>
<li><strong>directives</strong>: Constrain include targets  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(1bef3)<!-- raw HTML omitted --></a></li>
<li><strong>formatting</strong>: Avoid quadratic marker scans  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(96d0f)<!-- raw HTML omitted --></a></li>
<li><strong>image</strong>: Validate figure width option  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(e3e51)<!-- raw HTML omitted --></a></li>
<li><strong>inline</strong>: Avoid bracket parsing DoS  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(25f25)<!-- raw HTML omitted --></a></li>
<li><strong>math</strong>: Reject currency patterns and cross-line matches in inline math  -  by <a href="https://github.com/geopanther"><code>@​geopanther</code></a> <a href=""><!-- raw HTML omitted -->(566e1)<!-- raw HTML omitted --></a></li>
<li><strong>math</strong>: Support display and backtick math  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(1141e)<!-- raw HTML omitted --></a></li>
<li><strong>renderer</strong>: Render plugin list and table nodes  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(614b0)<!-- raw HTML omitted --></a></li>
<li><strong>renderer</strong>: Block encoded unsafe URL schemes  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(c7101)<!-- raw HTML omitted --></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/blob/main/docs/changes.rst">mistune's changelog</a>.</em></p>
<blockquote>
<h2>Version 3.3.3</h2>
<p><strong>Released on Jul 9, 2026</strong></p>
<ul>
<li>Limit deeply nested emphasis and image parsing to avoid <code>RecursionError</code>.</li>
<li>Fix repeated link suffix and unclosed formatting marker performance issues.</li>
<li>Fix unclosed inline spoiler performance issues.</li>
<li>Avoid recursive parsing for adjacent ruby tokens.</li>
<li>Speed up footnote reference indexing.</li>
</ul>
<h2>Version 3.3.2</h2>
<p><strong>Released on Jun 23, 2026</strong></p>
<ul>
<li>Fix Python 3.8 import compatibility in the inline parser.</li>
<li>Fix mypy compatibility for list parsing on Python 3.8 and 3.9+.</li>
</ul>
<h2>Version 3.3.1</h2>
<p><strong>Released on Jun 22, 2026</strong></p>
<ul>
<li>Fix <code>abbr</code> plugin compatibility with escaped inline text.</li>
<li>Normalize included Markdown line endings before parsing directives.</li>
</ul>
<h2>Version 3.3.0</h2>
<p><strong>Released on Jun 21, 2026</strong></p>
<ul>
<li>Improve CommonMark compatibility and parser performance.</li>
<li>Add command line entrypoint with UTF-8 output.</li>
<li>Support display and backtick math.</li>
<li>Render plugin list and table nodes in Markdown renderer.</li>
<li>Escape leading block markers in Markdown renderer.</li>
<li>Fix RST renderer for block quotes nested in lists.</li>
<li>Avoid generated heading ID collisions in TOC.</li>
<li>Harden URL, image, figure, and include directive handling.</li>
<li>Fix quadratic scans in inline links, reference links, and formatting markers.</li>
<li>Fix math escaping, currency pattern matching, and cross-line matching.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>060f73a</code></a> chore: release 3.3.3</li>
<li><a href=""><code>ae7e9d5</code></a> perf: improve for footnotes, ruby and spoiler</li>
<li><a href=""><code>c2228a2</code></a> perf: improve performance for math and formatting plugins</li>
<li><a href=""><code>e001d51</code></a> perf: improve link label parsing performance</li>
<li><a href=""><code>cca5ee6</code></a> fix: add image max depth</li>
<li><a href=""><code>0938fb7</code></a> fix: add max_emphasis_depth</li>
<li><a href=""><code>9946c92</code></a> tests: update dealine time for pypy</li>
<li><a href=""><code>4009f67</code></a> fix: use SAFE_PROTOCOLS instead of HARMFUL_PROTOCOLS</li>
<li><a href=""><code>3025549</code></a> Merge pull request <a href="">#462</a> from Sanjays2402/fix/markdown-renderer-escape-emphasis</li>
<li><a href=""><code>b042996</code></a> fix: escape literal emphasis markers in MarkdownRenderer</li>
<li>Additional commits viewable in <a href="https://github.com/lepture/mistune/compare/v3.2.1...v3.3.3">compare view</a></li>
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
<li>Update dependency cibuildwheel to v3.4.1 <a href="">#9607</a> [@<a href="https://github.com/apps/reno...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d90d230173c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.