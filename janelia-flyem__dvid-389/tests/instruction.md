# Issue

**Title:** Bump google.golang.org/grpc from 1.45.0 to 1.56.3

## Description

Bumps [google.golang.org/grpc](https://github.com/grpc/grpc-go) from 1.45.0 to 1.56.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/grpc/grpc-go/releases">google.golang.org/grpc's releases</a>.</em></p>
<blockquote>
<h2>Release 1.56.3</h2>
<h1>Security</h1>
<ul>
<li>
<p>server: prohibit more than MaxConcurrentStreams handlers from running at once (CVE-2023-44487)</p>
<p>In addition to this change, applications should ensure they do not leave running tasks behind related to the RPC before returning from method handlers, or should enforce appropriate limits on any such work.</p>
</li>
</ul>
<h2>Release 1.56.2</h2>
<ul>
<li>status: To fix a panic, <code>status.FromError</code> now returns an error with <code>codes.Unknown</code> when the error implements the <code>GRPCStatus()</code> method, and calling <code>GRPCStatus()</code> returns <code>nil</code>. (<a href="">#6374</a>)</li>
</ul>
<h2>Release 1.56.1</h2>
<ul>
<li>client: handle empty address lists correctly in addrConn.updateAddrs</li>
</ul>
<h2>Release 1.56.0</h2>
<h1>New Features</h1>
<ul>
<li>client: support channel idleness using <code>WithIdleTimeout</code> dial option (<a href="">#6263</a>)
<ul>
<li>This feature is currently disabled by default, but will be enabled with a 30 minute default in the future.</li>
</ul>
</li>
<li>client: when using pickfirst, keep channel state in TRANSIENT_FAILURE until it becomes READY (<a href="https://github.com/grpc/proposal/blob/master/A62-pick-first.md">gRFC A62</a>) (<a href="">#6306</a>)</li>
<li>xds: Add support for Custom LB Policies (<a href="https://github.com/grpc/proposal/blob/master/A52-xds-custom-lb-policies.md">gRFC A52</a>) (<a href="">#6224</a>)</li>
<li>xds: support pick_first Custom LB policy (<a href="https://github.com/grpc/proposal/blob/master/A62-pick-first.md">gRFC A62</a>) (<a href="">#6314</a>) (<a href="">#6317</a>)</li>
<li>client: add support for pickfirst address shuffling (<a href="https://github.com/grpc/proposal/blob/master/A62-pick-first.md">gRFC A62</a>) (<a href="">#6311</a>)</li>
<li>xds: Add support for String Matcher Header Matcher in RDS (<a href="">#6313</a>)</li>
<li>xds/outlierdetection: Add Channelz Logger to Outlier Detection LB (<a href="">#6145</a>)
<ul>
<li>Special Thanks: <a href="https://github.com/s-matyukevich"><code>@​s-matyukevich</code></a></li>
</ul>
</li>
<li>xds: enable RLS in xDS by default (<a href="">#6343</a>)</li>
<li>orca: add support for application_utilization field and missing range checks on several metrics setters</li>
<li>balancer/weightedroundrobin: add new LB policy for balancing between backends based on their load reports (<a href="https://github.com/grpc/proposal/blob/master/A58-client-side-weighted-round-robin-lb-policy.md">gRFC A58</a>) (<a href="">#6241</a>)</li>
<li>authz: add conversion of json to RBAC Audit Logging config (<a href="">#6192</a>)</li>
<li>authz: add support for stdout logger (<a href="">#6230</a> and <a href="">#6298</a>)</li>
<li>authz: support customizable audit functionality for authorization policy (<a href="">#6192</a> <a href="">#6230</a> <a href="">#6298</a> <a href="">#6158</a> <a href="">#6304</a> and <a href="">#6225</a>)</li>
</ul>
<h1>Bug Fixes</h1>
<ul>
<li>orca: fix a race at startup of out-of-band metric subscriptions that would cause the report interval to request 0 (<a href="">#6245</a>)</li>
<li>xds/xdsresource: Fix Outlier Detection Config Handling and correctly set xDS Defaults (<a href="">#6361</a>)</li>
<li>xds/outlierdetection: Fix Outlier Detection Config Handling by setting defaults in ParseConfig() (<a href="">#6361</a>)</li>
</ul>
<h1>API Changes</h1>
<ul>
<li>orca: allow a ServerMetricsProvider to be passed to the ORCA service and ServerOption (<a href="">#6223</a>)</li>
</ul>
<h2>Release 1.55.1</h2>
<ul>
<li>status: To fix a panic, <code>status.FromError</code> now returns an error with <code>codes.Unknown</code> when the error implements the <code>GRPCStatus()</code> method, and calling <code>GRPCStatus()</code> returns <code>nil</code>. (<a href="">#6374</a>)</li>
</ul>
<h2>Release 1.55.0</h2>
<h1>Behavior Changes</h1>
<ul>
<li>xds: enable federation support by default (<a href="">#6151</a>)</li>
<li>status: <code>status.Code</code> and <code>status.FromError</code> handle wrapped errors (<a href="">#6031</a> and <a href="">#6150</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1055b48</code></a> Update version.go to 1.56.3 (<a href="">#6713</a>)</li>
<li><a href=""><code>5efd7bd</code></a> server: prohibit more than MaxConcurrentStreams handlers from running at once...</li>
<li><a href=""><code>bd1f038</code></a> Upgrade version.go to 1.56.3-dev (<a href="">#6434</a>)</li>
<li><a href=""><code>faab873</code></a> Update version.go to v1.56.2 (<a href="">#6432</a>)</li>
<li><a href=""><code>6b0b291</code></a> status: fix panic when servers return a wrapped error with status OK (<a href="">#6374</a>) ...</li>
<li><a href=""><code>ed56401</code></a> [PSM interop] Don't fail target if sub-target already failed (<a href="">#6390</a>) (<a href="">#6405</a>)</li>
<li><a href=""><code>cd6a794</code></a> Update version.go to v1.56.2-dev (<a href="">#6387</a>)</li>
<li><a href=""><code>5b67e5e</code></a> Update version.go to v1.56.1 (<a href="">#6386</a>)</li>
<li><a href=""><code>d0f5150</code></a> client: handle empty address lists correctly in addrConn.updateAddrs (<a href="">#6354</a>) ...</li>
<li><a href=""><code>997c1ea</code></a> Change version to 1.56.1-dev (<a href="">#6345</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/grpc/grpc-go/compare/v1.45.0...v1.56.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=google.golang.org/grpc&package-manager=go_modules&previous-version=1.45.0&new-version=1.56.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/389)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e04f0889a6ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.