# Issue

**Title:** Bump anyio from 4.10.0 to 4.14.2

## Description

Bumps [anyio](https://github.com/agronholm/anyio) from 4.10.0 to 4.14.2.
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
<li>Additional commits viewable in <a href="https://github.com/agronholm/anyio/compare/4.10.0...4.14.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=anyio&package-manager=uv&previous-version=4.10.0&new-version=4.14.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--921.org.readthedocs.build/en/921/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c3cef38c9e22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.