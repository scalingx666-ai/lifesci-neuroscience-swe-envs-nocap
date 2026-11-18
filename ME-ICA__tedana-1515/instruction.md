# Issue

**Title:** Bump tornado from 6.5.8 to 6.5.9

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.5.8 to 6.5.9.
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
<li>Additional commits viewable in <a href="https://github.com/tornadoweb/tornado/compare/v6.5.8...v6.5.9">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8effd06318ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.