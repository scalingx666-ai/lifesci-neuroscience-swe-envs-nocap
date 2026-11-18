# Issue

**Title:** Bump go.opentelemetry.io/otel/sdk from 1.40.0 to 1.43.0

## Description

Bumps [go.opentelemetry.io/otel/sdk](https://github.com/open-telemetry/opentelemetry-go) from 1.40.0 to 1.43.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/CHANGELOG.md">go.opentelemetry.io/otel/sdk's changelog</a>.</em></p>
<blockquote>
<h2>[1.43.0/0.65.0/0.19.0] 2026-04-02</h2>
<h3>Added</h3>
<ul>
<li>Add <code>IsRandom</code> and <code>WithRandom</code> on <code>TraceFlags</code>, and <code>IsRandom</code> on <code>SpanContext</code> in <code>go.opentelemetry.io/otel/trace</code> for <a href="https://www.w3.org/TR/trace-context-2/#random-trace-id-flag">W3C Trace Context Level 2 Random Trace ID Flag</a> support. (<a href="">#8012</a>)</li>
<li>Add service detection with <code>WithService</code> in <code>go.opentelemetry.io/otel/sdk/resource</code>. (<a href="">#7642</a>)</li>
<li>Add <code>DefaultWithContext</code> and <code>EnvironmentWithContext</code> in <code>go.opentelemetry.io/otel/sdk/resource</code> to support plumbing <code>context.Context</code> through default and environment detectors. (<a href="">#8051</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploggrpc</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code>. (<a href="">#8038</a>)</li>
<li>Support attributes with empty value (<code>attribute.EMPTY</code>) in <code>go.opentelemetry.io/otel/sdk/metric/metricdata/metricdatatest</code>. (<a href="">#8038</a>)</li>
<li>Add support for per-series start time tracking for cumulative metrics in <code>go.opentelemetry.io/otel/sdk/metric</code>.
Set <code>OTEL_GO_X_PER_SERIES_START_TIMESTAMPS=true</code> to enable. (<a href="">#8060</a>)</li>
<li>Add <code>WithCardinalityLimitSelector</code> for metric reader for configuring cardinality limits specific to the instrument kind. (<a href="">#7855</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li>Introduce the <code>EMPTY</code> Type in <code>go.opentelemetry.io/otel/attribute</code> to reflect that an empty value is now a valid value, with <code>INVALID</code> remaining as a deprecated alias of <code>EMPTY</code>. (<a href="">#8038</a>)</li>
<li>Improve slice handling in <code>go.opentelemetry.io/otel/attribute</code> to optimize short slice values with fixed-size fast paths. (<a href="">#8039</a>)</li>
<li>Improve performance of span metric recording in <code>go.opentelemetry.io/otel/sdk/trace</code> by returning early if self-observability is not enabled. (<a href="">#8067</a>)</li>
<li>Improve formatting of metric data diffs in <code>go.opentelemetry.io/otel/sdk/metric/metricdata/metricdatatest</code>. (<a href="">#8073</a>)</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>INVALID</code> in <code>go.opentelemetry.io/otel/attribute</code>. Use <code>EMPTY</code> instead. (<a href="">#8038</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Return spec-compliant <code>TraceIdRatioBased</code> description. This is a breaking behavioral change, but it is necessary to
make the implementation <a href="https://opentelemetry.io/docs/specs/otel/trace/sdk/#traceidratiobased">spec-compliant</a>. (<a href="">#8027</a>)</li>
<li>Fix a race condition in <code>go.opentelemetry.io/otel/sdk/metric</code> where the lastvalue aggregation could collect the value 0 even when no zero-value measurements were recorded. (<a href="">#8056</a>)</li>
<li>Limit HTTP response body to 4 MiB in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code> to mitigate excessive memory usage caused by a misconfigured or malicious server.
Responses exceeding the limit are treated as non-retryable errors. (<a href="">#8108</a>)</li>
<li>Limit HTTP response body to 4 MiB in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code> to mitigate excessive memory usage caused by a misconfigured or malicious server.
Responses exceeding the limit are treated as non-retryable errors. (<a href="">#8108</a>)</li>
<li>Limit HTTP response body to 4 MiB in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> to mitigate excessive memory usage caused by a misconfigured or malicious server.
Responses exceeding the limit are treated as non-retryable errors. (<a href="">#8108</a>)</li>
<li><code>WithHostID</code> detector in <code>go.opentelemetry.io/otel/sdk/resource</code> to use full path for <code>kenv</code> command on BSD. (<a href="">#8113</a>)</li>
<li>Fix missing <code>request.GetBody</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> to correctly handle HTTP2 GOAWAY frame. (<a href="">#8096</a>)</li>
</ul>
<h2>[1.42.0/0.64.0/0.18.0/0.0.16] 2026-03-06</h2>
<h3>Added</h3>
<ul>
<li>Add <code>go.opentelemetry.io/otel/semconv/v1.40.0</code> package.
The package contains semantic conventions from the <code>v1.40.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/semconv/v1.40.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.39.0</code>. (<a href="">#7985</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9276201</code></a> Release v1.43.0 / v0.65.0 / v0.19.0 (<a href="">#8128</a>)</li>
<li><a href=""><code>61b8c94</code></a> chore(deps): update module github.com/mattn/go-runewidth to v0.0.22 (<a href="">#8131</a>)</li>
<li><a href=""><code>97a086e</code></a> chore(deps): update github.com/golangci/dupl digest to c99c5cf (<a href="">#8122</a>)</li>
<li><a href=""><code>5e363de</code></a> limit response body size for OTLP HTTP exporters (<a href="">#8108</a>)</li>
<li><a href=""><code>35214b6</code></a> Use an absolute path when calling bsd kenv (<a href="">#8113</a>)</li>
<li><a href=""><code>290024c</code></a> fix(deps): update module google.golang.org/grpc to v1.80.0 (<a href="">#8121</a>)</li>
<li><a href=""><code>e70658e</code></a> fix: support getBody in otelploghttp (<a href="">#8096</a>)</li>
<li><a href=""><code>4afe468</code></a> fix(deps): update googleapis to 9d38bb4 (<a href="">#8117</a>)</li>
<li><a href=""><code>b9ca729</code></a> chore(deps): update module github.com/go-git/go-git/v5 to v5.17.2 (<a href="">#8115</a>)</li>
<li><a href=""><code>69472ec</code></a> chore(deps): update fossas/fossa-action action to v1.9.0 (<a href="">#8118</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/open-telemetry/opentelemetry-go/compare/v1.40.0...v1.43.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=go.opentelemetry.io/otel/sdk&package-manager=go_modules&previous-version=1.40.0&new-version=1.43.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9f7be7263f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.