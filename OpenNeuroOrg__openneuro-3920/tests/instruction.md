# Issue

**Title:** chore(deps): Bump vm2 from 3.10.3 to 3.11.2

## Description

Bumps [vm2](https://github.com/patriksimek/vm2) from 3.10.3 to 3.11.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/releases">vm2's releases</a>.</em></p>
<blockquote>
<h2>v3.11.2</h2>
<h2>What's Changed</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-9vg3-4rfj-wgcm</strong> — Sandbox-realm null-proto write-through via <code>bridge.from()</code> set trap (RCE)</li>
<li><strong>GHSA-2cm2-m3w5-gp2f</strong> — Internal state reachable via computed-key access on <code>globalThis</code></li>
<li><strong>GHSA-9qj6-qjgg-37qq</strong> — Bridge saved-state leak via sandbox-installed <code>Array.prototype[N]</code> setter (RCE)</li>
</ul>
<h2>Documentation</h2>
<ul>
<li><a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md"><code>docs/ATTACKS.md</code></a> updated through Category 28, plus a new Defense Invariant<br />
(&quot;Bridge-internal containers must not invoke sandbox code&quot;).</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.1...v3.11.2">https://github.com/patriksimek/vm2/compare/v3.11.1...v3.11.2</a></p>
<h2>v3.11.1</h2>
<p>Single advisory closed plus prominent documentation of an existing escape hatch. Patch release — no API changes for valid configurations.</p>
<p><strong>Embedders running untrusted code with <code>nesting: true</code> should read the new README section.</strong></p>
<h2>What's Changed</h2>
<h3>Security fix</h3>
<ul>
<li><strong>GHSA-8hg8-63c5-gwmx</strong> — <code>nesting: true</code> bypassed <code>require: false</code>, allowing sandbox-to-host RCE via inner NodeVM construction. The contradictory option pair <code>{ nesting: true, require: false }</code> now throws <code>VMError</code> at <code>new NodeVM(...)</code> time citing the advisory. Same shape as the GHSA-cp6g eager FileSystem-contract probe — surface contradictory configuration at the API surface, not silently produce an unsandboxed sandbox.</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>New README section <strong><a href="https://github.com/patriksimek/vm2#5-nesting-true-is-an-escape-hatch">&quot;<code>nesting: true</code> is an escape hatch&quot;</a></strong> under Hardening recommendations. Spells out the inner-VM independence: a nested VM's <code>require</code> config is chosen by the sandbox code that constructs it, not constrained by the outer VM. <strong>Do not enable <code>nesting: true</code> for untrusted code.</strong></li>
<li>JSDoc on the <code>nesting</code> option (<code>lib/nodevm.js</code>) upgraded to match.</li>
<li><a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md"><code>docs/ATTACKS.md</code></a> gains <a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md#attack-category-25-nodevm-nesting-true--require-false-configuration-trap">Category 25</a> documenting the configuration trap, plus a matching row in the &quot;How The Bridge Defends&quot; table.</li>
</ul>
<h2>Upgrade Notes</h2>
<ul>
<li><strong>If you set <code>{ nesting: true, require: false }</code></strong> anywhere in your codebase, <code>new NodeVM(...)</code> now throws. Either drop <code>nesting: true</code> (if you wanted deny-all), or replace <code>require: false</code> with an explicit <code>require</code> config (e.g. <code>require: { builtin: [] }</code>) to acknowledge that vm2 will be requireable. The error message is actionable and links to the README section.</li>
<li><strong>No other configurations are affected.</strong> Bare <code>new NodeVM({ nesting: true })</code> continues to work as documented; this is the documented escape hatch and is not closed by this patch (out of scope — would change <code>nesting: true</code> semantics substantially).</li>
</ul>
<h2>What This Fix Does NOT Close</h2>
<p><code>nesting: true</code> itself remains an escape hatch for any non-trivial <code>require</code> config. The fix closes the <strong>specific contradictory pair</strong> flagged by the advisory; the broader recommendation is in the new README section: do not enable <code>nesting: true</code> when running untrusted code. Constraint propagation from outer to inner NodeVM (where the outer's <code>require</code> config would constrain inner construction) was considered and deferred — it would change the documented semantics of <code>nesting: true</code> and is a major-version-shaped change.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.0...v3.11.1">https://github.com/patriksimek/vm2/compare/v3.11.0...v3.11.1</a></p>
<h2>v3.11.0</h2>
<p>Coordinated security release closing 13 advisories, plus a new <code>bufferAllocLimit</code> option and a <code>realpath()</code> method on the FileSystem adapter contract. Minor version bump because of the new public option and the FileSystem contract addition; no incompatible changes to the existing public API surface.</p>
<p><strong>Embedders running untrusted code should upgrade.</strong> Several of the advisories close full sandbox-escape RCE primitives.</p>
<h2>What's Changed</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/blob/main/CHANGELOG.md">vm2's changelog</a>.</em></p>
<blockquote>
<h2>[3.11.2]</h2>
<p>Three advisories closed. Patch release — no API changes.</p>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-2cm2-m3w5-gp2f</strong> — Internal state reachable via computed property access on <code>globalThis</code>. The previous fix (GHSA-wp5r-2gw5-m7q7) tightened the transformer's identifier-rejection but left <code>globalThis['VM2_INTERNAL_STATE_DO_NOT_USE_OR_PROGRAM_WILL_FAIL']</code> and every reflective probe of the global object (bracket access, <code>Reflect.get</code>, <code>Object.getOwnPropertyDescriptor</code>, <code>Object.getOwnPropertyNames</code> enumeration) returning the live state object — the transformer is a syntactic gate and cannot see through dynamic property keys. Structural fix: the bootstrap script (<code>vm.js</code>'s setupSandboxScript source) now declares <code>let VM2_INTERNAL_STATE_DO_NOT_USE_OR_PROGRAM_WILL_FAIL</code> at the script's top level, which lands the binding in the context's <code>[[GlobalLexicalEnvironment]]</code> — reachable as a bare identifier from every script (so transformer-emitted catch handlers still resolve), but absent from <code>globalThis</code>'s own-property table (so every computed-key probe returns <code>undefined</code>). The <code>defineProperty</code> install in <code>setup-sandbox.js</code> is removed entirely; the bootstrap IIFE assigns into the outer <code>let</code> instead. Supersedes GHSA-wp5r-2gw5-m7q7's identifier-only mitigation by closing the entire computed-key class. ATTACKS.md Category 27.</li>
<li><strong>GHSA-9vg3-4rfj-wgcm</strong> — Sandbox breakout via null-proto throw / <code>handleException</code>. The post-GHSA-mpf8 hardening switched <code>handleException</code> and <code>globalPromise.prototype.then</code> onFulfilled to wrap caught/resolved values with <code>bridge.from()</code> for &quot;symmetry&quot;. <code>from()</code> builds a sandbox-side proxy whose target the bridge treats as host-realm; calling it on a sandbox-realm null-proto value (<code>{__proto__: null}</code> thrown or <code>Promise.resolve</code>-d by sandbox JS) produced a proxy whose <code>set</code> trap unwrapped sandbox proxies of host references (e.g. <code>Buffer.prototype.inspect</code>) back to their raw host originals and stored them on the underlying sandbox object — readable via the original sandbox reference and pivot to host <code>Function</code> constructor → RCE. Three callsites in <code>lib/setup-sandbox.js</code> reverted to <code>ensureThis()</code> semantics; the host-Promise rejection sanitizer composes <code>from()</code> outside <code>handleException</code> so the GHSA-mpf8 invariant (host null-proto rejection values must reach sandbox callbacks bridge-wrapped) is preserved. ATTACKS.md Category 26.</li>
<li><strong>GHSA-9qj6-qjgg-37qq</strong> — sandbox breakout via the species-defense helper <code>neutralizeArraySpeciesBatch</code>. The helper appended saved-state records to a fresh <code>[]</code> literal that — being allocated by the sandbox-side bridge closure — inherited sandbox <code>Array.prototype</code>. A sandbox-installed setter on <code>Array.prototype[N]</code> therefore captured the next <code>saved[saved.length] = c</code> write and exposed <code>c.arr</code> (a host-realm proxy) directly to attacker code, leading to host <code>Function</code> extraction and RCE. Fixed in <code>lib/bridge.js</code> by writing every saved-state entry through <code>thisReflectDefineProperty</code> so the appended slot is an own data property and no <code>Array.prototype[N]</code> setter is ever invoked while the bridge holds raw saved state. ATTACKS.md gains a new Defense Invariant (&quot;Bridge-internal containers must not invoke sandbox code&quot;) codifying the cross-cutting principle.</li>
</ul>
<h2>[3.11.1]</h2>
<p>Single advisory closed plus prominent documentation of an existing escape hatch. Patch release — no API changes for valid configurations.</p>
<h3>Security fix</h3>
<ul>
<li><strong>GHSA-8hg8-63c5-gwmx</strong> — <code>nesting: true</code> bypassed <code>require: false</code>, allowing sandbox-to-host RCE via inner NodeVM construction. The contradictory option pair <code>{ nesting: true, require: false }</code> now throws <code>VMError</code> at <code>new NodeVM(...)</code> time citing the advisory. Same shape as the GHSA-cp6g eager FileSystem-contract probe — surface contradictory configuration at the API surface, not silently produce an unsandboxed sandbox. ATTACKS.md Category 25.</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>New README section <strong>&quot;<code>nesting: true</code> is an escape hatch&quot;</strong> under Hardening recommendations. Explains that <code>nesting: true</code> lets sandbox code <code>require('vm2')</code> and construct nested NodeVMs whose <code>require</code> config is chosen by the sandbox (not constrained by the outer config — by design of nesting). <strong>Do not enable <code>nesting: true</code> for untrusted code.</strong></li>
<li>JSDoc on the <code>nesting</code> option (<code>lib/nodevm.js</code>) upgraded to spell out the escape-hatch semantics and the GHSA-8hg8 contradictory-pair rejection.</li>
<li>ATTACKS.md gains Category 25 documenting the configuration trap and a matching row in the &quot;How The Bridge Defends&quot; table.</li>
</ul>
<h3>Upgrade notes</h3>
<ul>
<li><strong>If you set <code>{ nesting: true, require: false }</code></strong> anywhere in your codebase, <code>new NodeVM(...)</code> now throws. Either drop <code>nesting: true</code> (if you wanted deny-all), or replace <code>require: false</code> with an explicit <code>require</code> config (e.g. <code>require: { builtin: [] }</code>) to acknowledge that vm2 will be requireable. The error message is actionable and links to the README section.</li>
<li><strong>No other configurations are affected.</strong> Bare <code>new NodeVM({ nesting: true })</code> continues to work as documented; this is the documented escape hatch and is not closed by this patch (out of scope — would change <code>nesting: true</code> semantics substantially).</li>
</ul>
<h3>What this fix does NOT close</h3>
<p><code>nesting: true</code> itself remains an escape hatch for any non-trivial <code>require</code> config. The fix closes the <strong>specific contradictory pair</strong> flagged by the advisory; the broader recommendation is in the new README section: do not enable <code>nesting: true</code> when running untrusted code. Constraint propagation from outer to inner NodeVM (where the outer's <code>require</code> config would constrain inner construction) was considered and deferred — it would change the documented semantics of <code>nesting: true</code> and is a major-version-shaped change.</p>
<h2>[3.11.0]</h2>
<p>Coordinated security release closing 13 advisories, plus a new <code>bufferAllocLimit</code> option and a <code>realpath()</code> method on the FileSystem adapter contract. Minor version bump because of the new public option and the FileSystem contract addition; no incompatible changes to the existing public API surface. Embedders running untrusted code in memory-constrained environments should review the new <code>bufferAllocLimit</code> option and the README's <a href="https://github.com/patriksimek/vm2/blob/main/README.md#hardening-recommendations">Hardening recommendations</a> section.</p>
<h3>Upgrade notes</h3>
<ul>
<li><strong>Custom <code>fs</code> adapters with <code>require.root</code></strong> must implement <code>realpathSync</code> (or <code>realpath()</code> on a fully custom <code>FileSystem</code> class). Without it, <code>new NodeVM({require: {root, fs: customAdapter}})</code> now throws a <code>VMError</code> at construction, citing GHSA-cp6g-6699-wx9c. The eager probe converts what was previously silent deny-by-default at every later <code>require()</code> into a single, clearly-labelled construction-time error. Default <code>fs</code> users are unaffected — <code>DefaultFileSystem</code> and <code>VMFileSystem</code> ship <code>realpath()</code> out of the box.</li>
<li><strong>Embedders running untrusted async code</strong> should install a host-side <code>unhandledRejection</code> handler. The GHSA-hw58 fix closes synchronous executor throws but cannot reach async-function / async-generator / <code>await using</code> rejection paths (V8 creates rejection promises via the realm's intrinsic <code>Promise</code>). See README's Hardening recommendations and ATTACKS.md Category 22.</li>
<li><strong>Embedders running untrusted code in memory-constrained environments</strong> should opt into a finite <code>bufferAllocLimit</code> (e.g. <code>32 * 1024 * 1024</code>) as part of layered DoS defense. Default remains <code>Infinity</code> for backwards compatibility.</li>
</ul>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-grj5-jjm8-h35p</strong> — Array species self-return sandbox escape. Bridge <code>apply</code> and <code>construct</code> traps now neutralise host-array <code>constructor</code> and <code>Symbol.species</code> before every host call (and restore in a <code>finally</code> block). Direct write, <code>Object.assign</code>, non-configurable defineProperty, and prototype-level constructor variants all blocked.</li>
<li><strong>GHSA-v37h-5mfm-c47c</strong> — Handler reconstruction via <code>util.inspect</code> leak. Three-layer defense: closure-scoped construction token, <code>getHandlerObject</code> WeakMap guard, and <code>.constructor</code> sentinel rebind on every handler-class prototype (including <code>BufferHandler</code>).</li>
<li><strong>GHSA-qcp4-v2jj-fjx8</strong> — Trap method on leaked handler with forged target. New <code>handlerToTarget</code> WeakMap pairs every handler with its canonical proxy target at construction; <code>validateHandlerTarget(this, target)</code> at the entry of every trap method rejects forged-<code>this</code> and forged-<code>target</code> invocations with <code>VMError(OPNA)</code>.</li>
<li><strong>GHSA-47x8-96vw-5wg6</strong> — Cross-realm symbol extraction from host objects. Two-layer defense: dangerous cross-realm symbols (<code>nodejs.util.inspect.custom</code>, <code>nodejs.rejection</code>, <code>nodejs.util.promisify.custom</code>) are filtered at the bridge boundary; structural identity collapse pre-populates the bridge identity caches for every built-in intrinsic prototype + constructor pair so prototype walks land on sandbox primordials.</li>
<li><strong>GHSA-55hx-c926-fr95</strong> — Promise structural-leak / SuppressedError / AggregateError sanitisation. <code>handleException</code> now recurses into <code>AggregateError.errors[]</code> (in addition to <code>SuppressedError.error</code>/<code>.suppressed</code>); the bridge-level <code>apply</code>-trap recognises calls to host <code>Promise.prototype.{then,catch,finally}</code> by cached identity and pipes every sandbox callback through the same sanitiser.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a552e8</code></a> chore: bump to 3.11.2</li>
<li><a href=""><code>ca195f0</code></a> fix(GHSA-9qj6-qjgg-37qq): bridge saved-state leak via Array.prototype[N] setter</li>
<li><a href=""><code>99d410b</code></a> fix(GHSA-2cm2-m3w5-gp2f): bind internal state in GlobalLexicalEnvironment</li>
<li><a href=""><code>c33c2bb</code></a> fix(GHSA-9vg3-4rfj-wgcm): null-proto throw write-through via bridge from()</li>
<li><a href=""><code>46cbbdd</code></a> fix(GHSA-8hg8-63c5-gwmx): reject contradictory { nesting: true, require: fals...</li>
<li><a href=""><code>fc0da54</code></a> fix: enhance CallSite path leak tests for Node 14+ and Node 16+ compatibility</li>
<li><a href=""><code>fca270d</code></a> fix: ensure compatibility with Node 8 by replacing recursive mkdir with expli...</li>
<li><a href=""><code>5cc3037</code></a> fix: update test pipeline</li>
<li><a href=""><code>4e9fa06</code></a> chore: update mocha</li>
<li><a href=""><code>865439d</code></a> chore: bump to 3.11.0</li>
<li>Additional commits viewable in <a href="https://github.com/patriksimek/vm2/compare/v3.10.3...v3.11.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vm2&package-manager=npm_and_yarn&previous-version=3.10.3&new-version=3.11.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85c93e062734`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.