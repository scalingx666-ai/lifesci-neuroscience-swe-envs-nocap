# Issue

**Title:** build(deps): bump go.opentelemetry.io/otel/sdk from 1.43.0 to 1.45.0

## Description

Bumps [go.opentelemetry.io/otel/sdk](https://github.com/open-telemetry/opentelemetry-go) from 1.43.0 to 1.45.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/open-telemetry/opentelemetry-go/releases">go.opentelemetry.io/otel/sdk's releases</a>.</em></p>
<blockquote>
<h2>Release v1.45.0/v0.67.0/v0.21.0/v0.0.18</h2>
<h2>Overview</h2>
<h3>Added</h3>
<ul>
<li>Add experimental observability metrics to <code>BatchProcessor</code> in <code>go.opentelemetry.io/otel/sdk/log</code>. (<a href="">#7124</a>)</li>
<li>Add the experimental <code>WithUnsafeAttributes</code> no-copy attribute option to <code>go.opentelemetry.io/otel/metric/x</code> for future performance improvements. This API is a work in progress. (<a href="">#8251</a>)</li>
<li>Add <code>Map</code> and <code>MapValue</code> functions for the new <code>MAP</code> attribute type in <code>go.opentelemetry.io/otel/attribute</code>. (<a href="">#8445</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/zipkin</code>. (<a href="">#8453</a>)</li>
<li>Apply <code>AttributeValueLengthLimit</code> recursively to values contained in <code>attribute.MAP</code> attributes in <code>go.opentelemetry.io/otel/sdk/trace</code>. (<a href="">#8454</a>)</li>
<li>Remove duplicate keys from <code>attribute.MAP</code> values in <code>go.opentelemetry.io/otel/sdk/resource</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/log</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in span, event, link, and instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/trace</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in measurement and instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/metric</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Extend <code>WithAllowKeyDuplication</code> in <code>go.opentelemetry.io/otel/sdk/log</code> to disable duplicate-key removal in <code>attribute.MAP</code> values for instrumentation scope attributes. (<a href="">#8471</a>)</li>
<li>Add the <code>go.opentelemetry.io/otel/semconv/v1.42.0</code> package.
The package contains semantic conventions from the <code>v1.42.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/HEAD/semconv/v1.42.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.41.0</code>. (<a href="">#8484</a>)</li>
<li>Add <code>WithoutPanicRecording</code> as a <code>TracerProviderOption</code> in <code>go.opentelemetry.io/otel/sdk/trace</code> to disable exception event recording for panics. (<a href="">#8532</a>)</li>
<li>Add the <code>go.opentelemetry.io/otel/semconv/v1.43.0</code> package.
The package contains semantic conventions from the <code>v1.43.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/HEAD/semconv/v1.43.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.42.0</code>. (<a href="">#8628</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li><code>HistogramReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code> now uses a time-unbiased sampling algorithm for exemplars. (<a href="">#8306</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> Use <code>go.opentelemetry.io/otel/attribute.Value</code> and <code>go.opentelemetry.io/otel/attribute.KeyValue</code> for log bodies and attributes in <code>go.opentelemetry.io/otel/log</code>, <code>go.opentelemetry.io/otel/log/logtest</code>, <code>go.opentelemetry.io/otel/sdk/log</code>, and <code>go.opentelemetry.io/otel/sdk/log/logtest</code>. (<a href="">#8490</a>)</li>
<li>Encode log bodies and attributes as <code>go.opentelemetry.io/otel/attribute.Value</code> JSON in <code>go.opentelemetry.io/otel/exporters/stdout/stdoutlog</code>. (<a href="">#8490</a>)</li>
<li>Improve the performance of hashing <code>BOOLSLICE</code>, <code>INT64SLICE</code>, <code>FLOAT64SLICE</code>, and <code>STRINGSLICE</code> attribute values by avoiding reflection for short slices in <code>go.opentelemetry.io/otel/attribute</code>. (<a href="">#8511</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> <code>WithEndpointURL</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code> no longer appends the default signal path when an endpoint URL has no path, making the behavior consistent with <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> and with setting the endpoint through <code>OTEL_EXPORTER_OTLP_METRICS_ENDPOINT</code>. If the URL has no path component, the root path (<code>/</code>) is used. Use <code>WithEndpointURL(url.JoinPath(endpoint, &quot;/v1/metrics&quot;))</code> to preserve the previous behavior. (<a href="">#8538</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> <code>WithEndpointURL</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code> no longer appends the default signal path when an endpoint URL has no path, making the behavior consistent with <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> and with setting the endpoint through <code>OTEL_EXPORTER_OTLP_TRACES_ENDPOINT</code>. If the URL has no path component, the root path (<code>/</code>) is used. Use <code>WithEndpointURL(url.JoinPath(endpoint, &quot;/v1/traces&quot;))</code> to preserve the previous behavior. (<a href="">#8538</a>)</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>WithExportBufferSize</code> in <code>go.opentelemetry.io/otel/sdk/log</code>. The option remains available for source compatibility but no longer affects behavior; <code>BatchProcessor</code> no longer maintains a separate export-request buffer. (<a href="">#8620</a>)</li>
</ul>
<h3>Removed</h3>
<ul>
<li>⚠️ <strong>Breaking Change:</strong> Remove <code>Kind</code>, <code>Value</code>, <code>KeyValue</code>, their constructors, and attribute conversion helpers from <code>go.opentelemetry.io/otel/log</code>. (<a href="">#8490</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> Remove the <code>AttributeValueLengthLimit</code> and <code>AttributeCountLimit</code> fields from <code>RecordFactory</code> in <code>go.opentelemetry.io/otel/sdk/log/logtest</code>; records produced by the factory now keep attribute limits disabled so test code can append exact attributes. (<a href="">#8556</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Apply TLS certificates configured through environment variables to gRPC connections in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploggrpc</code>.</li>
<li>Prevent panics in <code>go.opentelemetry.io/otel/bridge/opentracing</code> when OpenTracing baggage is propagated concurrently with <code>Span.SetBaggageItem</code>.</li>
<li>Fix an off-by-one error in <code>FixedSizeReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code> that prevented the first exemplar from being sampled after the reservoir was filled. (<a href="">#8309</a>)</li>
<li>Interpret HTTP <code>Retry-After</code> header values as seconds instead of nanoseconds when retrying OTLP HTTP exports in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code>, <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code>, and <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code>. (<a href="">#8383</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/CHANGELOG.md">go.opentelemetry.io/otel/sdk's changelog</a>.</em></p>
<blockquote>
<h2>[1.45.0/0.67.0/0.21.0/0.0.18] - 2026-08-03</h2>
<h3>Added</h3>
<ul>
<li>Add experimental observability metrics to <code>BatchProcessor</code> in <code>go.opentelemetry.io/otel/sdk/log</code>. (<a href="">#7124</a>)</li>
<li>Add the experimental <code>WithUnsafeAttributes</code> no-copy attribute option to <code>go.opentelemetry.io/otel/metric/x</code> for future performance improvements. This API is a work in progress. (<a href="">#8251</a>)</li>
<li>Add <code>Map</code> and <code>MapValue</code> functions for the new <code>MAP</code> attribute type in <code>go.opentelemetry.io/otel/attribute</code>. (<a href="">#8445</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric</code>. (<a href="">#8453</a>)</li>
<li>Support <code>MAP</code> attributes in <code>go.opentelemetry.io/otel/exporters/zipkin</code>. (<a href="">#8453</a>)</li>
<li>Apply <code>AttributeValueLengthLimit</code> recursively to values contained in <code>attribute.MAP</code> attributes in <code>go.opentelemetry.io/otel/sdk/trace</code>. (<a href="">#8454</a>)</li>
<li>Remove duplicate keys from <code>attribute.MAP</code> values in <code>go.opentelemetry.io/otel/sdk/resource</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/log</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in span, event, link, and instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/trace</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Remove duplicate keys by default from <code>attribute.MAP</code> values in measurement and instrumentation scope attributes in <code>go.opentelemetry.io/otel/sdk/metric</code> using last-value-wins semantics. (<a href="">#8471</a>)</li>
<li>Extend <code>WithAllowKeyDuplication</code> in <code>go.opentelemetry.io/otel/sdk/log</code> to disable duplicate-key removal in <code>attribute.MAP</code> values for instrumentation scope attributes. (<a href="">#8471</a>)</li>
<li>Add the <code>go.opentelemetry.io/otel/semconv/v1.42.0</code> package.
The package contains semantic conventions from the <code>v1.42.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/semconv/v1.42.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.41.0</code>. (<a href="">#8484</a>)</li>
<li>Add <code>WithoutPanicRecording</code> as a <code>TracerProviderOption</code> in <code>go.opentelemetry.io/otel/sdk/trace</code> to disable exception event recording for panics. (<a href="">#8532</a>)</li>
<li>Add the <code>go.opentelemetry.io/otel/semconv/v1.43.0</code> package.
The package contains semantic conventions from the <code>v1.43.0</code> version of the OpenTelemetry Semantic Conventions.
See the <a href="https://github.com/open-telemetry/opentelemetry-go/blob/main/semconv/v1.43.0/MIGRATION.md">migration documentation</a> for information on how to upgrade from <code>go.opentelemetry.io/otel/semconv/v1.42.0</code>. (<a href="">#8628</a>)</li>
</ul>
<h3>Changed</h3>
<ul>
<li><code>HistogramReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code> now uses a time-unbiased sampling algorithm for exemplars. (<a href="">#8306</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> Use <code>go.opentelemetry.io/otel/attribute.Value</code> and <code>go.opentelemetry.io/otel/attribute.KeyValue</code> for log bodies and attributes in <code>go.opentelemetry.io/otel/log</code>, <code>go.opentelemetry.io/otel/log/logtest</code>, <code>go.opentelemetry.io/otel/sdk/log</code>, and <code>go.opentelemetry.io/otel/sdk/log/logtest</code>. (<a href="">#8490</a>)</li>
<li>Encode log bodies and attributes as <code>go.opentelemetry.io/otel/attribute.Value</code> JSON in <code>go.opentelemetry.io/otel/exporters/stdout/stdoutlog</code>. (<a href="">#8490</a>)</li>
<li>Improve the performance of hashing <code>BOOLSLICE</code>, <code>INT64SLICE</code>, <code>FLOAT64SLICE</code>, and <code>STRINGSLICE</code> attribute values by avoiding reflection for short slices in <code>go.opentelemetry.io/otel/attribute</code>. (<a href="">#8511</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> <code>WithEndpointURL</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code> no longer appends the default signal path when an endpoint URL has no path, making the behavior consistent with <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> and with setting the endpoint through <code>OTEL_EXPORTER_OTLP_METRICS_ENDPOINT</code>. If the URL has no path component, the root path (<code>/</code>) is used. Use <code>WithEndpointURL(url.JoinPath(endpoint, &quot;/v1/metrics&quot;))</code> to preserve the previous behavior. (<a href="">#8538</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> <code>WithEndpointURL</code> in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code> no longer appends the default signal path when an endpoint URL has no path, making the behavior consistent with <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code> and with setting the endpoint through <code>OTEL_EXPORTER_OTLP_TRACES_ENDPOINT</code>. If the URL has no path component, the root path (<code>/</code>) is used. Use <code>WithEndpointURL(url.JoinPath(endpoint, &quot;/v1/traces&quot;))</code> to preserve the previous behavior. (<a href="">#8538</a>)</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>WithExportBufferSize</code> in <code>go.opentelemetry.io/otel/sdk/log</code>. The option remains available for source compatibility but no longer affects behavior; <code>BatchProcessor</code> no longer maintains a separate export-request buffer. (<a href="">#8620</a>)</li>
</ul>
<h3>Removed</h3>
<ul>
<li>⚠️ <strong>Breaking Change:</strong> Remove <code>Kind</code>, <code>Value</code>, <code>KeyValue</code>, their constructors, and attribute conversion helpers from <code>go.opentelemetry.io/otel/log</code>. (<a href="">#8490</a>)</li>
<li>⚠️ <strong>Breaking Change:</strong> Remove the <code>AttributeValueLengthLimit</code> and <code>AttributeCountLimit</code> fields from <code>RecordFactory</code> in <code>go.opentelemetry.io/otel/sdk/log/logtest</code>; records produced by the factory now keep attribute limits disabled so test code can append exact attributes. (<a href="">#8556</a>)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Apply TLS certificates configured through environment variables to gRPC connections in <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploggrpc</code>.</li>
<li>Prevent panics in <code>go.opentelemetry.io/otel/bridge/opentracing</code> when OpenTracing baggage is propagated concurrently with <code>Span.SetBaggageItem</code>.</li>
<li>Fix an off-by-one error in <code>FixedSizeReservoir</code> in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code> that prevented the first exemplar from being sampled after the reservoir was filled. (<a href="">#8309</a>)</li>
<li>Interpret HTTP <code>Retry-After</code> header values as seconds instead of nanoseconds when retrying OTLP HTTP exports in <code>go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp</code>, <code>go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp</code>, and <code>go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp</code>. (<a href="">#8383</a>)</li>
<li>Fix a memory leak in the <code>Reservoir</code> implementation in <code>go.opentelemetry.io/otel/sdk/metric/exemplar</code>, where storing the full <code>context.Context</code> pinned large objects such as gRPC transport buffers. (<a href="">#8389</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>93a693e</code></a> Release v1.45.0 (<a href="">#8693</a>)</li>
<li><a href=""><code>c65d435</code></a> Merge commit from fork</li>
<li><a href=""><code>223f9fd</code></a> sdk/metric: remove obsolete randomFloat64 TODO (<a href="">#8685</a>)</li>
<li><a href=""><code>06272bc</code></a> fix(deps): update googleapis to 6ac0973 (<a href="">#8694</a>)</li>
<li><a href=""><code>a4f238f</code></a> chore(deps): update github.com/charmbracelet/ultraviolet digest to 8b69304 (#...</li>
<li><a href=""><code>37140e7</code></a> chore(deps): update codspeedhq/action action to v5.0.2 (<a href="">#8690</a>)</li>
<li><a href=""><code>cef0855</code></a> chore(deps): update module github.com/lucasb-eyer/go-colorful to v1.4.1 (<a href="">#8689</a>)</li>
<li><a href=""><code>e814a72</code></a> Merge commit from fork</li>
<li><a href=""><code>bfd8eb7</code></a> chore(deps): update github.com/golangci/rowserrcheck digest to d2031e3 (<a href="">#8687</a>)</li>
<li><a href=""><code>48db2c6</code></a> chore(deps): update github/codeql-action action to v4.37.5 (<a href="">#8692</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/open-telemetry/opentelemetry-go/compare/v1.43.0...v1.45.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=go.opentelemetry.io/otel/sdk&package-manager=go_modules&previous-version=1.43.0&new-version=1.45.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b211efbe46d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.