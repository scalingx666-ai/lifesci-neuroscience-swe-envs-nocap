# Issue

**Title:** chore(deps): Bump vm2 from 3.11.3 to 3.11.5

## Description

Bumps [vm2](https://github.com/patriksimek/vm2) from 3.11.3 to 3.11.5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/releases">vm2's releases</a>.</em></p>
<blockquote>
<h2>v3.11.5</h2>
<h2>What's Changed</h2>
<h3>Bug fixes</h3>
<ul>
<li><strong><a href="">#566</a></strong> — Restore <code>util.inspect</code> output on Node 26+. <code>console.log(vm.run(...))</code> was rendering as <code>Proxy(Proxy({}))</code> / <code>Proxy(Proxy([]))</code> instead of the underlying value. Triggered by Node 26's stricter handling of nested proxies in the inspector.</li>
<li><strong><a href="">#567</a></strong> — Restore array iteration on <code>vm.freeze()</code>'d host arrays. Calling <code>.map()</code> / <code>.filter()</code> / <code>.forEach()</code> etc. inside the sandbox on a frozen host object containing arrays threw
<code>TypeError: 'isExtensible' on proxy: trap result does not reflect extensibility of proxy target</code>. Regression from the 3.11.0 proxy-invariant hardening.</li>
<li><strong><a href="">#568</a></strong> — Fix <code>.node</code> extension handler key in <code>lib/resolver.js</code> (the key was <code>' .node'</code> with a leading space, so native addon resolution silently fell through to the default path). Thanks to <a href="https://github.com/cherr-cc"><code>@​cherr-cc</code></a>.</li>
</ul>
<h2>Upgrade Notes</h2>
<p>Drop-in replacement for 3.11.4. No API or configuration changes.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.4...v3.11.5">https://github.com/patriksimek/vm2/compare/v3.11.4...v3.11.5</a></p>
<h2>v3.11.4</h2>
<p>Ten advisories closed. Patch release — no API changes for valid configurations.</p>
<h2>What's Changed</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-c4cf-2hgv-2qv6</strong> — Bridge <code>set</code> trap ignoring ECMA-262 §9.5.9 <code>Receiver</code>, letting <code>Object.create(hostObj)</code> children and <code>Reflect.set(hostObj, k, v, custom)</code> writes leak onto the host object (write-channel → RCE).</li>
<li><strong>GHSA-m5q2-4fm3-vfqp</strong> — Cross-realm <code>Symbol.for</code> namespace leak + missing dangerous-symbol guards on the bridge's write traps (<code>set</code> / <code>defineProperty</code> / <code>deleteProperty</code>), enabling sandbox-installed <code>nodejs.util.promisify.custom</code> / stream brand / webstream hooks on host objects (RCE).</li>
<li><strong>GHSA-v6mx-mf47-r5wg</strong> — Host prototype mutation via <code>Function.prototype.{call,apply,bind}</code> and <code>Reflect.{apply,construct}</code> indirection through <code>Object.prototype.__proto__</code> setter, severing host intrinsic prototype chains and escaping via <code>thisEnsureThis</code> proto-walk fallthrough (RCE).</li>
<li><strong>GHSA-q3fm-4wcw-g57x</strong> — Defense Invariant <a href="">#11</a> violation in <code>defaultSandboxPrepareStackTrace</code> (second variant of GHSA-9qj6-qjgg-37qq in a different file): sandbox-installed <code>Array.prototype[N]</code> setter / <code>Array.prototype.join</code> override could observe bridge-internal stack-trace state.</li>
<li><strong>GHSA-76w7-j9cq-rx2j</strong> — Promise species hijack in <code>localPromise</code>'s swallow-tail, hijacking the downstream child constructor to capture V8's internal <code>(resolve, reject)</code> capability and reach a raw host-realm error → host <code>Function</code> (RCE).</li>
<li><strong>GHSA-m4wx-m65x-ghrr</strong> — NodeVM constructor patch bypass of GHSA-8hg8-63c5-gwmx: any truthy <code>nesting</code> paired with a non-real-config <code>require</code> produced a NESTING_OVERRIDE-only resolver → inner NodeVM with attacker-chosen <code>require</code> → <code>child_process</code> RCE.</li>
<li><strong>GHSA-6j2x-vhqr-qr7q</strong> — WebAssembly JSPI (<code>WebAssembly.promising</code> / <code>WebAssembly.Suspending</code>, Node 24+ behind a flag, Node 26+ default) producing Promise objects with a host-realm <code>[[Prototype]]</code> chain and no bridge interposition; species hijack delivers a raw host-realm rejection to sandbox <code>.catch</code> → host <code>Function</code> (RCE).</li>
<li><strong>GHSA-rp36-8xq3-r6c4</strong> — NodeVM builtin denylist bypass via <code>process</code> (whose <code>getBuiltinModule(name)</code> reloads any core module regardless of allow/deny config) and <code>inspector/promises</code> (whose <code>Session().post('Runtime.evaluate', ...)</code> evaluates attacker JS in the host realm). Supersedes GHSA-947f-4v7f-x2v8.</li>
<li><strong>GHSA-r9pm-gxmw-wv6p</strong> — NodeVM <code>builtin: ['*']</code> wildcard exposing Node's undocumented underscored network builtins (<code>_http_client</code>, <code>_http_server</code>, <code>_tls_*</code>, <code>_stream_*</code>) even when the documented <code>-http</code>/<code>-https</code>/<code>-net</code>/<code>-tls</code> exclusions were used — SSRF-class capability bypass (CVSS 8.6).</li>
<li><strong>GHSA-9g8x-92q2-p28f</strong> — NodeVM builtin allowlist surfacing four process-wide observability builtins (<code>diagnostics_channel</code>, <code>async_hooks</code>, <code>perf_hooks</code>, <code>v8</code>) that read state of the entire host process rather than sandbox-local state — HTTP header / async-context / perf-mark / heap-snapshot exfiltration.</li>
</ul>
<h2>Documentation</h2>
<ul>
<li><a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md"><code>docs/ATTACKS.md</code></a> extended through Category 35, plus two new Defense Invariants: <strong><a href="">#12</a></strong> (&quot;No sandbox-visible object has a host-realm prototype chain without bridge interposition&quot;) and <strong><a href="">#13</a></strong> (&quot;The NodeVM builtin allowlist is a closed system&quot;).</li>
</ul>
<h2>Upgrade Notes</h2>
<ul>
<li><strong>If you constructed <code>NodeVM({ nesting: &lt;truthy&gt; })</code> without an explicit <code>require</code> config object</strong>, <code>new NodeVM(...)</code> now throws (GHSA-m4wx-m65x-ghrr). This covers every shape that previously silently produced a <code>vm2</code>-only resolver: omitting <code>require</code>, or setting it to any falsy value (<code>false</code>/<code>undefined</code>/<code>null</code>/<code>0</code>/<code>''</code>) or any truthy non-object value (<code>true</code>/number/string/symbol/function); and also any truthy <code>nesting</code> value, not only <code>nesting: true</code>. Either drop <code>nesting</code>, or pass an explicit <code>require</code> config object (e.g. <code>require: { builtin: [] }</code>) to acknowledge that vm2 will be requireable from inside the sandbox. The error message is actionable and links to the README hardening section.</li>
<li><strong>No other valid configurations are affected.</strong> Embedders who explicitly listed any of <code>process</code> / <code>inspector</code> / <code>worker_threads</code> / <code>cluster</code> / <code>vm</code> / <code>repl</code> / <code>module</code> / <code>trace_events</code> / <code>wasi</code> / <code>diagnostics_channel</code> / <code>async_hooks</code> / <code>perf_hooks</code> / <code>v8</code> in <code>builtin</code> were already running an unsandboxed sandbox; those names now throw at load time and can be re-introduced as safe wrappers via <code>mock</code> / <code>override</code> / <code>SPECIAL_MODULES</code>.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.3...v3.11.4">https://github.com/patriksimek/vm2/compare/v3.11.3...v3.11.4</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/blob/main/CHANGELOG.md">vm2's changelog</a>.</em></p>
<blockquote>
<h2>[3.11.5]</h2>
<p>Patch release — no API changes.</p>
<h3>Fix</h3>
<ul>
<li><strong><a href="">#566</a></strong> — <code>util.inspect</code> of <code>vm.run(...)</code> results rendered as <code>Proxy(Proxy({}))</code> on Node 26+. Install <code>nodejs.util.inspect.custom</code> on host-side proxy targets so the inspect output reflects the underlying shape.</li>
<li><strong><a href="">#567</a></strong> — Array iteration methods on a <code>vm.freeze()</code>-d host array threw an <code>'isExtensible' on proxy</code> invariant error (regression from the GHSA-grj5-jjm8-h35p species defense). Align the ReadOnly proxy target's extensibility with its trap result and skip species neutralization on the host→sandbox apply path.</li>
</ul>
<h2>[3.11.4]</h2>
<p>Ten advisories closed. Patch release — no API changes for valid configurations.</p>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-c4cf-2hgv-2qv6</strong> — bridge escape via <code>BaseHandler.set</code> ignoring the ECMA-262 §9.5.9 <code>Receiver</code> argument; <code>Object.create(hostProxy).x = v</code> and <code>Reflect.set(hostProxy, k, v, sandboxObj)</code> wrote through to the host object instead of installing on the receiver, turning every embedder-exposed host object into a sandbox write channel. Receiver-gated install-on-receiver fix in <code>lib/bridge.js</code> mirroring <code>ReadOnlyHandler.set</code>. See ATTACKS.md Category 32 and <code>test/ghsa/GHSA-c4cf-2hgv-2qv6/</code>.</li>
<li><strong>GHSA-m5q2-4fm3-vfqp</strong> — sandbox escape via unblocked cross-realm <code>Symbol.for</code> keys plus missing dangerous-symbol guards on the bridge's write traps. Two-layer structural fix: <code>lib/setup-sandbox.js</code> denies the entire <code>nodejs.</code> namespace at <code>Symbol.for</code> and aligns the read-side filters with the full 9-symbol cache, and <code>lib/bridge.js</code> extends <code>isDangerousCrossRealmSymbol</code> and applies it to the <code>set</code>/<code>defineProperty</code>/<code>deleteProperty</code> traps. See ATTACKS.md Category 8 / Category 20 (both extended) and <code>test/ghsa/GHSA-m5q2-4fm3-vfqp/</code>.</li>
<li><strong>GHSA-v6mx-mf47-r5wg</strong> — host prototype mutation via apply-trap indirection. Sandbox code could reach host prototype-mutating setters (<code>Object.prototype.__proto__</code>, <code>setPrototypeOf</code>, <code>defineProperty</code>, <code>__defineSetter__</code>/<code>__defineGetter__</code>) through <code>Function.prototype.{call,apply,bind}</code> and <code>Reflect.{apply,construct}</code> indirection, sever a host intrinsic's prototype chain, and escape via the bridge's <code>thisEnsureThis</code> proto-walk fallthrough. Two-layer structural fix in <code>lib/bridge.js</code> (apply-trap blocklist + cache check before proto-walk). See ATTACKS.md Category 30 and <code>test/ghsa/GHSA-v6mx-mf47-r5wg/</code>.</li>
<li><strong>GHSA-q3fm-4wcw-g57x</strong> — Defense Invariant <a href="">#11</a> hardening for <code>defaultSandboxPrepareStackTrace</code> (second variant of GHSA-9qj6-qjgg-37qq in a different file). The sandbox stack-trace formatter accumulated frames in a sandbox-realm array and <code>.join</code>-ed them, so a sandbox-installed setter on <code>Array.prototype[N]</code> (or <code>.join</code> override) observed bridge-internal state — no host reference reachable today, but one enrichment away from regressing into the GHSA-9qj6 RCE shape. Fixed in <code>lib/setup-sandbox.js</code> by folding frames through a primitive string accumulator (no <code>Array.prototype</code> slot reachable) and converting <code>makeCallSiteGetters</code> to <code>localReflectDefineProperty</code> for symmetry. See ATTACKS.md Category 28 Variant B and <code>test/ghsa/GHSA-q3fm-4wcw-g57x/</code>.</li>
<li><strong>GHSA-76w7-j9cq-rx2j</strong> — Promise species hijack in the <code>localPromise</code> swallow tail. The swallow-tail <code>apply(globalPromisePrototypeThen, this, [...])</code> call inside <code>localPromise</code>'s constructor invoked the cached host <code>Promise.prototype.then</code> without first calling <code>resetPromiseSpecies(this)</code>, so a sandbox subclass overriding <code>[Symbol.species]</code> could redirect the downstream child constructor to a user function and capture V8's internal <code>(resolve, reject)</code> capability — delivering a raw host-realm error (RangeError from deep recursion + <code>e.stack</code>) to a sandbox collector and reaching the host <code>Function</code> constructor via <code>.constructor.constructor</code>. One-line fix in <code>lib/setup-sandbox.js</code> adds the missing <code>resetPromiseSpecies(this)</code> before the swallow-tail call, matching the pattern already used by the <code>.then</code>/<code>.catch</code>/<code>Reflect.apply</code> overrides. See ATTACKS.md Category 31 and <code>test/ghsa/GHSA-76w7-j9cq-rx2j/</code>.</li>
<li><strong>GHSA-m4wx-m65x-ghrr</strong> — NodeVM constructor patch bypass of GHSA-8hg8-63c5-gwmx: a truthy <code>nesting</code> paired with anything other than a real <code>require</code> config object produced a NESTING_OVERRIDE-only resolver → inner NodeVM with attacker-chosen <code>require</code> → <code>child_process</code> RCE. Structural fix in <code>lib/nodevm.js</code>: destructure first, then reject at construction whenever <code>nesting</code> is truthy and <code>requireOpts</code> is not a non-null object or <code>Resolver</code>. Supersedes GHSA-8hg8-63c5-gwmx. See ATTACKS.md Category 25 and <code>test/ghsa/GHSA-m4wx-m65x-ghrr/</code>.</li>
<li><strong>GHSA-6j2x-vhqr-qr7q</strong> — sandbox escape via WebAssembly JSPI (Node 24 behind <code>--experimental-wasm-jspi</code>, Node 26+ default). <code>WebAssembly.promising</code> returns Promise objects whose <code>[[Prototype]]</code> chain points directly at the host realm's <code>Promise.prototype</code> with no bridge proxy in between, so <code>p.finally()</code> reaches host <code>Promise.prototype.finally</code>, V8's <code>SpeciesConstructor</code> reads an attacker-controlled <code>p.constructor</code> getter, and the eventual host-realm rejection is dispatched through the attacker's class with no bridge wrapping — <code>e.constructor.constructor('return process')()</code> then evaluates in the host realm. Structural fix in <code>lib/setup-sandbox.js</code>: delete <code>WebAssembly.promising</code> and <code>WebAssembly.Suspending</code> at sandbox bootstrap, mirroring the existing <code>WebAssembly.JSTag</code> removal. Adds Defense Invariant <a href="">#12</a> (no sandbox-visible object may have a host-realm prototype chain without bridge interposition). See ATTACKS.md Category 33 and <code>test/ghsa/GHSA-6j2x-vhqr-qr7q/</code>.</li>
<li><strong>GHSA-rp36-8xq3-r6c4</strong> — NodeVM builtin denylist bypass via <code>process</code> and <code>inspector/promises</code>. The exact-match denylist in <code>lib/builtin.js</code> missed two host-passthrough families: <code>process</code> (whose <code>getBuiltinModule(name)</code> reloads any core module regardless of the embedder's allow/deny configuration) and <code>inspector/promises</code> (whose <code>Session().post('Runtime.evaluate', ...)</code> evaluates attacker JS in the host realm). Structural fix promotes the check to family-prefix via <code>isDangerousBuiltin(key)</code>, strips the <code>node:</code> URL prefix, and adds <code>process</code> to the dangerous set — enforced at both <code>BUILTIN_MODULES</code> source and <code>addDefaultBuiltin</code>. Supersedes GHSA-947f-4v7f-x2v8. Adds Defense Invariant <a href="">#13</a>. See ATTACKS.md Category 21 (extended) and <code>test/ghsa/GHSA-rp36-8xq3-r6c4/</code>.</li>
<li><strong>GHSA-r9pm-gxmw-wv6p</strong> — NodeVM <code>builtin: ['*']</code> wildcard exposed Node's undocumented underscored network builtins (<code>_http_client</code>, <code>_http_server</code>, the <code>_http_*</code> / <code>_tls_*</code> / <code>_stream_*</code> siblings), letting sandbox code make outbound HTTP requests and open listening sockets even when the documented <code>-http</code>/<code>-https</code>/<code>-net</code>/<code>-tls</code> exclusions were used — SSRF-class capability bypass (CVSS 8.6). Structural fix in <code>lib/builtin.js</code>: <code>BUILTIN_MODULES</code> filter now excludes any name starting with <code>_</code>, so <code>'*'</code> expands only to documented public builtins; explicit opt-in, <code>mock</code>, and <code>override</code> paths remain functional. See ATTACKS.md Category 34 and <code>test/ghsa/GHSA-r9pm-gxmw-wv6p/</code>.</li>
<li><strong>GHSA-9g8x-92q2-p28f</strong> — NodeVM builtin allowlist surfaced four process-wide observability builtins (<code>diagnostics_channel</code>, <code>async_hooks</code>, <code>perf_hooks</code>, <code>v8</code>) that read state from the entire host process rather than the sandbox: HTTP <code>IncomingMessage</code> headers (incl. auth tokens) via <code>diagnostics_channel.subscribe</code>, embedder <code>AsyncLocalStorage</code> context via <code>async_hooks.executionAsyncResource</code>, embedder <code>performance.mark</code> labels via <code>perf_hooks</code>, and the full V8 heap via <code>v8.getHeapSnapshot</code> / <code>v8.queryObjects</code>. Fix in <code>lib/builtin.js</code>: extends <code>DANGEROUS_BUILTINS</code> with the four names, reusing the existing two-layer enforcement (<code>BUILTIN_MODULES</code> filter + <code>addDefaultBuiltin</code> rejection, family-prefix and <code>node:</code>-normalised via <code>isDangerousBuiltin</code>). <code>mock</code>/<code>override</code> escape hatches preserved. See ATTACKS.md Category 35 and <code>test/ghsa/GHSA-9g8x-92q2-p28f/</code>.</li>
</ul>
<h3>Upgrade notes</h3>
<ul>
<li><strong>If you constructed <code>NodeVM({ nesting: &lt;truthy&gt; })</code> without an explicit <code>require</code> config object</strong>, <code>new NodeVM(...)</code> now throws (GHSA-m4wx-m65x-ghrr). This covers every shape that previously silently produced a <code>vm2</code>-only resolver: omitting <code>require</code> entirely, or setting it to any falsy value (<code>false</code>/<code>undefined</code>/<code>null</code>/<code>0</code>/<code>''</code>) or any truthy non-object value (<code>true</code>/number/string/symbol/function); and also any truthy <code>nesting</code> value, not only <code>nesting: true</code> (<code>1</code>/<code>'yes'</code>/<code>{}</code>/<code>[]</code>/function). Either drop <code>nesting</code>, or pass an explicit <code>require</code> config object (e.g. <code>require: { builtin: [] }</code>) to acknowledge that vm2 will be requireable from inside the sandbox. The error message is actionable and links to the README hardening section.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a1f510</code></a> Fix .node typo (<a href="">#568</a>)</li>
<li><a href=""><code>fac7fb4</code></a> fix: test compatibility</li>
<li><a href=""><code>2da83ed</code></a> fix(<a href="">#567</a>): restore array iteration on vm.freeze()'d host arrays</li>
<li><a href=""><code>51cc4bc</code></a> fix(<a href="">#566</a>): restore util.inspect output on Node 26+</li>
<li><a href=""><code>27354d5</code></a> fix: test compatibility</li>
<li><a href=""><code>59ccba9</code></a> feat: add merge-fix skill for integrating confirmed vulnerability fixes</li>
<li><a href=""><code>86ab819</code></a> fix(GHSA-m4wx-m65x-ghrr): widen NESTING_OVERRIDE guard to all input shapes</li>
<li><a href=""><code>e1c48fc</code></a> fix(GHSA-9g8x-92q2-p28f): deny process-wide observability builtins in NodeVM</li>
<li><a href=""><code>436053e</code></a> fix(GHSA-r9pm-gxmw-wv6p): exclude underscored builtins from NodeVM '*' wildca...</li>
<li><a href=""><code>a1ed47a</code></a> fix(GHSA-rp36-8xq3-r6c4): close NodeVM builtin denylist bypass via process/in...</li>
<li>Additional commits viewable in <a href="https://github.com/patriksimek/vm2/compare/v3.11.3...v3.11.5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vm2&package-manager=npm_and_yarn&previous-version=3.11.3&new-version=3.11.5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f90ce8ab3d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.