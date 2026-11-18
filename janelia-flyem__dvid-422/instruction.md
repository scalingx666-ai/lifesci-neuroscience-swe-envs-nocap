# Issue

**Title:** Bump google.golang.org/grpc from 1.58.3 to 1.79.3

## Description

Bumps [google.golang.org/grpc](https://github.com/grpc/grpc-go) from 1.58.3 to 1.79.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/grpc/grpc-go/releases">google.golang.org/grpc's releases</a>.</em></p>
<blockquote>
<h2>Release 1.79.3</h2>
<h1>Security</h1>
<ul>
<li>server: fix an authorization bypass where malformed :path headers (missing the leading slash) could bypass path-based restricted &quot;deny&quot; rules in interceptors like <code>grpc/authz</code>. Any request with a non-canonical path is now immediately rejected with an <code>Unimplemented</code> error. (<a href="">#8981</a>)</li>
</ul>
<h2>Release 1.79.2</h2>
<h1>Bug Fixes</h1>
<ul>
<li>stats: Prevent redundant error logging in health/ORCA producers by skipping stats/tracing processing when no stats handler is configured. (<a href="">grpc/grpc-go#8874</a>)</li>
</ul>
<h2>Release 1.79.1</h2>
<h1>Bug Fixes</h1>
<ul>
<li>grpc: Remove the <code>-dev</code> suffix from the User-Agent header. (<a href="">grpc/grpc-go#8902</a>)</li>
</ul>
<h2>Release 1.79.0</h2>
<h1>API Changes</h1>
<ul>
<li>mem: Add experimental API <code>SetDefaultBufferPool</code> to change the default buffer pool. (<a href="">#8806</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/vanja-p"><code>@​vanja-p</code></a></li>
</ul>
</li>
<li>experimental/stats: Update <code>MetricsRecorder</code> to require embedding the new <code>UnimplementedMetricsRecorder</code> (a no-op struct) in all implementations for forward compatibility. (<a href="">#8780</a>)</li>
</ul>
<h1>Behavior Changes</h1>
<ul>
<li>balancer/weightedtarget: Remove handling of <code>Addresses</code> and only handle <code>Endpoints</code> in resolver updates. (<a href="">#8841</a>)</li>
</ul>
<h1>New Features</h1>
<ul>
<li>experimental/stats: Add support for asynchronous gauge metrics through the new <code>AsyncMetricReporter</code> and <code>RegisterAsyncReporter</code> APIs. (<a href="">#8780</a>)</li>
<li>pickfirst: Add support for weighted random shuffling of endpoints, as described in <a href="">gRFC A113</a>.
<ul>
<li>This is enabled by default, and can be turned off using the environment variable <code>GRPC_EXPERIMENTAL_PF_WEIGHTED_SHUFFLING</code>. (<a href="">#8864</a>)</li>
</ul>
</li>
<li>xds: Implement <code>:authority</code> rewriting, as specified in <a href="https://github.com/grpc/proposal/blob/master/A81-xds-authority-rewriting.md">gRFC A81</a>. (<a href="">#8779</a>)</li>
<li>balancer/randomsubsetting: Implement the <code>random_subsetting</code> LB policy, as specified in <a href="https://github.com/grpc/proposal/blob/master/A68-random-subsetting.md">gRFC A68</a>. (<a href="">#8650</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/marek-szews"><code>@​marek-szews</code></a></li>
</ul>
</li>
</ul>
<h1>Bug Fixes</h1>
<ul>
<li>credentials/tls: Fix a bug where the port was not stripped from the authority override before validation. (<a href="">#8726</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/Atul1710"><code>@​Atul1710</code></a></li>
</ul>
</li>
<li>xds/priority: Fix a bug causing delayed failover to lower-priority clusters when a higher-priority cluster is stuck in <code>CONNECTING</code> state. (<a href="">#8813</a>)</li>
<li>health: Fix a bug where health checks failed for clients using legacy compression options (<code>WithDecompressor</code> or <code>RPCDecompressor</code>). (<a href="">#8765</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/sanki92"><code>@​sanki92</code></a></li>
</ul>
</li>
<li>transport: Fix an issue where the HTTP/2 server could skip header size checks when terminating a stream early. (<a href="">#8769</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/joybestourous"><code>@​joybestourous</code></a></li>
</ul>
</li>
<li>server: Propagate status detail headers, if available, when terminating a stream during request header processing. (<a href="">#8754</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/joybestourous"><code>@​joybestourous</code></a></li>
</ul>
</li>
</ul>
<h1>Performance Improvements</h1>
<ul>
<li>credentials/alts: Optimize read buffer alignment to reduce copies. (<a href="">#8791</a>)</li>
<li>mem: Optimize pooling and creation of <code>buffer</code> objects.  (<a href="">#8784</a>)</li>
<li>transport: Reduce slice re-allocations by reserving slice capacity. (<a href="">#8797</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dda86db</code></a> Change version to 1.79.3 (<a href="">#8983</a>)</li>
<li><a href=""><code>72186f1</code></a> grpc: enforce strict path checking for incoming requests on the server (<a href="">#8981</a>)</li>
<li><a href=""><code>97ca352</code></a> Changing version to 1.79.3-dev (<a href="">#8954</a>)</li>
<li><a href=""><code>8902ab6</code></a> Change the version to release 1.79.2 (<a href="">#8947</a>)</li>
<li><a href=""><code>a928670</code></a> Cherry-pick <a href="">#8874</a> to v1.79.x (<a href="">#8904</a>)</li>
<li><a href=""><code>06df363</code></a> Change version to 1.79.2-dev (<a href="">#8903</a>)</li>
<li><a href=""><code>782f2de</code></a> Change version to 1.79.1 (<a href="">#8902</a>)</li>
<li><a href=""><code>850eccb</code></a> Change version to 1.79.1-dev (<a href="">#8851</a>)</li>
<li><a href=""><code>765ff05</code></a> Change version to 1.79.0 (<a href="">#8850</a>)</li>
<li><a href=""><code>68804be</code></a> Cherry pick <a href="">#8864</a> to v1.79.x (<a href="">#8896</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/grpc/grpc-go/compare/v1.58.3...v1.79.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=google.golang.org/grpc&package-manager=go_modules&previous-version=1.58.3&new-version=1.79.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7702b4d50f82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.