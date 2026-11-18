# Issue

**Title:** Bump go.opentelemetry.io/otel/sdk from 1.39.0 to 1.40.0

## Description

Bumps [go.opentelemetry.io/otel/sdk](https://github.com/open-telemetry/opentelemetry-go) from 1.39.0 to 1.40.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/CHANGELOG.md">go.opentelemetry.io/otel/sdk's changelog</a>.</em></p>
<blockquote>
<h2>[1.40.0/0.62.0/0.16.0] 2026-02-02</h2>
<h3>Added</h3>
<ul>
<li>Add <code>AlwaysRecord</code> sampler in <code>go.opentelemetry.io/otel/sdk/trace</code>. (<a href="">#7724</a>)</li>
<li>Add <code>Enabled</code> method to all synchronous instrument interfaces (<code>Float64Counter</code>, <code>Float64UpDownCounter</code>, <code>Float64Histogram</code>, <code>Float64Gauge</code>, <code>Int64Counter</code>, <code>Int64UpDownCounter</code>, <code>Int64Histogram</code>, <code>Int64Gauge</code>,) in <code>go.opentelemetry.io/otel/metric</code>.
This stabilizes the synchronous instrument enabled feature, allowing users to check if an instrument will process measurements before performing computationally expensive operations. (<a href="">#7763</a>)</li>
<li>Add <code>go.opentelemetry.io/otel/semconv/v1.39.0</code> package.
The package contains semantic conventions from the <code>v1.39.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/semconv/v1.39.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.38.0.</code> (<a href="">#7783</a>, <a href="">#7789</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Improve the concurrent performance of <code>HistogramReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code> by 4x. (<a href="">#7443</a>)</li>
<li>Improve the concurrent performance of <code>FixedSizeReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code>. (<a href="">#7447</a>)</li>
<li>Improve performance of concurrent histogram measurements in <code>go.opentelemetry.io/otel/sdk/metric</code>. (<a href="">#7474</a>)</li>
<li>Improve performance of concurrent synchronous gauge measurements in <code>go.opentelemetry.io/otel/sdk/metric</code>. (<a href="">#7478</a>)</li>
<li>Add experimental observability metrics in <code>go.opentelemetry.io/otel/exporters/stdout/stdoutmetric</code>. (<a href="">#7492</a>)</li>
<li><code>Exporter</code> in <code>go.opentelemetry.io/otel/exporters/prometheus</code> ignores metrics with the scope <code>go.opentelemetry.io/contrib/bridges/prometheus</code>.
This prevents scrape failures when the Prometheus exporter is misconfigured to get data from the Prometheus bridge. (<a href="">#7688</a>)</li>
<li>Improve performance of concurrent exponential histogram measurements in <code>go.opentelemetry.io/otel/sdk/metric</code>. (<a href="">#7702</a>)</li>
<li>The <code>rpc.grpc.status_code</code> attribute in the experimental metrics emitted from <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc</code> is replaced with the <code>rpc.response.status_code</code> attribute to align with the semantic conventions. (<a href="">#7854</a>)</li>
<li>The <code>rpc.grpc.status_code</code> attribute in the experimental metrics emitted from <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploggrpc</code> is replaced with the <code>rpc.response.status_code</code> attribute to align with the semantic conventions. (<a href="">#7854</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix bad log message when key-value pairs are dropped because of key duplication in <code>go.opentelemetry.io/otel/sdk/log</code>. (<a href="">#7662</a>)</li>
<li>Fix <code>DroppedAttributes</code> on <code>Record</code> in <code>go.opentelemetry.io/otel/sdk/log</code> to not count the non-attribute key-value pairs dropped because of key duplication. (<a href="">#7662</a>)</li>
<li>Fix <code>SetAttributes</code> on <code>Record</code> in <code>go.opentelemetry.io/otel/sdk/log</code> to not log that attributes are dropped when they are actually not dropped. (<a href="">#7662</a>)</li>
<li>Fix missing <code>request.GetBody</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code> to correctly handle HTTP/2 <code>GOAWAY</code> frame. (<a href="">#7794</a>)</li>
<li><code>WithHostID</code> detector in <code>go.opentelemetry.io/otel/sdk/resource</code> to use full path for <code>ioreg</code> command on Darwin (macOS). (<a href="">#7818</a>)</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>go.opentelemetry.io/otel/exporters/zipkin</code>.
For more information, see the <a href="https://opentelemetry.io/blog/2025/deprecating-zipkin-exporters/">OTel blog post deprecating the Zipkin exporter</a>. (<a href="">#7670</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a3a5317</code></a> Release v1.40.0 (<a href="">#7859</a>)</li>
<li><a href=""><code>77785da</code></a> chore(deps): update github/codeql-action action to v4.32.1 (<a href="">#7858</a>)</li>
<li><a href=""><code>56fa1c2</code></a> chore(deps): update module github.com/clipperhouse/uax29/v2 to v2.5.0 (<a href="">#7857</a>)</li>
<li><a href=""><code>298cbed</code></a> Upgrade semconv use to v1.39.0 (<a href="">#7854</a>)</li>
<li><a href=""><code>3264bf1</code></a> refactor: modernize code (<a href="">#7850</a>)</li>
<li><a href=""><code>fd5d030</code></a> chore(deps): update module github.com/grpc-ecosystem/grpc-gateway/v2 to v2.27...</li>
<li><a href=""><code>8d3b4cb</code></a> chore(deps): update actions/cache action to v5.0.3 (<a href="">#7847</a>)</li>
<li><a href=""><code>91f7cad</code></a> chore(deps): update github.com/timakin/bodyclose digest to 73d1f95 (<a href="">#7845</a>)</li>
<li><a href=""><code>fdad1eb</code></a> chore(deps): update module github.com/grpc-ecosystem/grpc-gateway/v2 to v2.27...</li>
<li><a href=""><code>c46d3ba</code></a> chore(deps): update golang.org/x/telemetry digest to fcf36f6 (<a href="">#7843</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/open-telemetry/opentelemetry-go/compare/v1.39.0...v1.40.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=go.opentelemetry.io/otel/sdk&package-manager=go_modules&previous-version=1.39.0&new-version=1.40.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bc362b180fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.