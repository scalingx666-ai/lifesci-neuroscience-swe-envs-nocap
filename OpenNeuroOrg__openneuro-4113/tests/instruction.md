# Issue

**Title:** chore(deps): Bump vm2 from 3.11.6 to 3.12.2

## Description

Bumps [vm2](https://github.com/patriksimek/vm2) from 3.11.6 to 3.12.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/releases">vm2's releases</a>.</em></p>
<blockquote>
<h2>v3.12.2</h2>
<p>Three advisories closed, and vm2 can now be shipped by single-file bundlers. Patch release — no API changes, with observable behaviour changes for host buffers and host promises handed to the sandbox (see Upgrade Notes).</p>
<h2>What's Changed</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-5h3f-q97h-ccvc</strong> — a <code>NodeVM</code> with a custom <code>require.resolve</code> recorded each resolver answer as a raw string prefix, so resolving an allowlisted package authorized every prefix-sharing sibling beside it (<code>.../node_modules/foo</code> authorized <code>.../node_modules/foo2/index.js</code>), and the <code>{module, path}</code> return shape authorized the whole search directory; under the default <code>context: 'host'</code> the sibling's top-level code ran with host authority. Resolver answers are now recorded as boundary-matched base paths (plus exact extension spellings for extension-probed answers), the object shape authorizes only the resolved package's directory, and an authorization is withdrawn again when its load finds nothing.</li>
<li><strong>GHSA-2v2p-6j97-cjg9</strong> — a host promise reaching the sandbox through a constructor return (<code>new HostFn()</code>), a host getter or data property, or a callback argument carried no rejection reaction, so sandbox code that simply dropped it terminated the host process under Node's <code>unhandledRejection</code> policy; the GHSA-gjq8 fix had covered only <code>apply</code> returns. Every host promise is now marked handled once at the single host→sandbox delivery chokepoint (a cheap prototype brand check that never invokes <code>.then</code> on non-promises and recognises promises from a second host realm), and the <code>construct</code> trap carries the same unconditional mark as <code>apply</code>. The sandbox still observes rejections through its own sanitized <code>.catch</code>.</li>
<li><strong>GHSA-489w-w794-jq94</strong> — a host-allocated <code>Buffer</code> (a builtin's return value such as <code>zlib.deflateSync</code>, an embedder-supplied buffer, a callback argument) exposed Node's shared 64 KiB allocation pool through <code>.buffer</code> or its legacy twin <code>.parent</code>, letting the sandbox read and overwrite unrelated host buffers — host memory disclosure and corruption. The GHSA-fcqc backing-store ownership rule now applies at the bridge for every host view, keyed on the identity of the delivered value so every alias of the store is covered by one rule; the raw <code>buffer</code> / <code>parent</code> / <code>offset</code> getters are no longer deliverable, the gate fails closed if the bridge cannot resolve <code>ArrayBuffer.isView</code>, and a foreign store planted on a view is refused.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li><strong>Single-file bundlers (Bun compile, esbuild, pkg, ...) can now ship vm2.</strong> The sandbox bootstrap files had to be read from disk at runtime, so a compiled binary failed with <code>ENOENT</code> as soon as the package directory was not on disk. They are now embedded as string literals in the generated <code>lib/sources.js</code>, and the sandbox-compiled scripts use a fixed virtual filename so bootstrap frames stay redacted from sandbox-visible stack traces.</li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Dev dependency <code>@humanfs/node</code> bumped from 0.16.6 to 0.16.8.</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>Categories <strong>46</strong> (custom-resolver sibling authorization, with two documented residuals), <strong>22</strong> (host promises on every delivery route) and <strong>41</strong> (host views and the shared pool, with the observable behaviour changes and two documented residuals) are extended in <a href="https://github.com/patriksimek/vm2/tree/main/docs/attacks"><code>docs/attacks/</code></a>, with matching rows in the &quot;How The Bridge Defends&quot; table.</li>
</ul>
<h2>Upgrade Notes</h2>
<ul>
<li><strong>Host buffers that do not own their whole backing store are delivered bounded.</strong> For such a view, <code>.buffer</code> / <code>.parent</code> is an exact-size copy (not identity-stable, not write-through), and <code>byteOffset</code> / <code>offset</code> read as <code>0</code> so <code>Buffer.from(v.buffer, v.byteOffset, v.length)</code> keeps working. Sub-views the sandbox creates from a host-backed buffer lose <code>.buffer</code> aliasing with their parent (index writes still alias), and <code>SharedArrayBuffer</code> sub-views are delivered as copies — hand over a view spanning the whole store for live sharing. Buffers that own their store (<code>Buffer.alloc(n)</code>, large buffers) are unchanged.</li>
<li><strong>Ignored host promises are silent on every route.</strong> Embedders no longer see <code>unhandledRejection</code> for a host promise handed to the sandbox through a getter, callback argument or constructor return, exactly as for call returns since GHSA-gjq8; attach an explicit <code>.catch()</code> to debug rejections.</li>
<li><strong>A custom resolver's <code>{module, path}</code> answer must name a package inside <code>path</code>.</strong> A <code>module</code> that is absolute, relative or contains <code>..</code> is now refused and reports module-not-found; return the string shape to name a path directly.</li>
<li><strong>Bundling:</strong> nothing to configure — <code>lib/sources.js</code> is part of the published package. If you patch a bootstrap file in a fork, run <code>npm run build:sources</code> (or <code>npm test</code>, which regenerates it) so the embedded copy does not go stale.</li>
<li>No other valid configurations are affected.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.12.1...v3.12.2">https://github.com/patriksimek/vm2/compare/v3.12.1...v3.12.2</a></p>
<h2>v3.12.1</h2>
<p>Four advisories closed. Patch release — no API changes, with one deliberate behaviour change for <code>NodeVM</code> embedders who granted <code>child_process</code> (see Upgrade Notes).</p>
<h2>What's Changed</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-6454-5x88-m6jw</strong> — an embedder-exposed host <code>Promise</code> could be turned into a sandbox escape. Sandbox code wrote <code>constructor[Symbol.species]</code> onto the raw host promise and then called <code>.then</code> / <code>.catch</code> / <code>.finally</code> with the settlement-direction handler omitted; V8 built the result capability through <code>SpeciesConstructor</code> off the raw object (no bridge trap on that read) and its internal Thrower/Identity reaction delivered the raw host settlement — e.g. <code>process</code> — to a sandbox-captured capability, with no callback slot for the rejection sanitizer to wrap. Host RCE. The bridge now shadows the host promise's <code>constructor</code> for the duration of every sandbox-initiated <code>then</code> / <code>catch</code> / <code>finally</code> call, so the result capability is always a genuine host <code>%Promise%</code>; the indirection peel also covers host <code>Reflect.apply</code> and <code>.finally</code>.</li>
<li><strong>GHSA-j89j-5m6r-cr2q</strong> — any ordinary sloppy-mode host function exposed to the sandbox leaked the host realm's global object when called with a nullish receiver (<code>greet()</code>, <code>.call(null)</code>, <code>Reflect.apply(fn, undefined, [])</code>, <code>bind(null)()</code>): V8's <code>OrdinaryCallBindThis</code> substituted the host global for <code>this</code>, and the bridge wrapped and delivered it — <code>greet().process.getBuiltinModule('child_process')</code> was host RCE. The host global is now cached at bridge init and refused at every host→sandbox coercion chokepoint, delivered as <code>undefined</code>, which is exactly what a strict-mode function's <code>this</code> already looked like.</li>
<li><strong>GHSA-x3v6-43hc-82mc</strong> — a <code>NodeVM</code> that allowlisted the <code>crypto</code> builtin let guest code call <code>crypto.setFips</code>, flipping the FIPS mode of the entire host process; the read-only wrap stops property writes but forwards host calls with full authority. Same process-wide-mutator class as <code>crypto.setEngine</code> (GHSA-46pr) and <code>tls.setDefaultCACertificates</code> (GHSA-98xx). <code>setFips</code> is now replaced with a throwing stub alongside <code>setEngine</code>; <code>getFips()</code> and the rest of <code>crypto</code> are unchanged. Configuration-integrity issue, not RCE.</li>
<li><strong>GHSA-pq68-rvw4-xp4r</strong> — <code>NodeVM</code>'s hard denylist blocked every other host-process launcher (<code>cluster</code>, <code>worker_threads</code>, <code>node:test</code>) but omitted <code>child_process</code>, so <code>require: { builtin: ['*'] }</code>, <code>['*', '-fs']</code>, an explicit <code>['child_process']</code>, and the <code>node:</code> spellings all handed the sandbox the real host module — one <code>execSync</code> call was host RCE. <code>child_process</code> now joins <code>DANGEROUS_BUILTINS</code>: filtered from the wildcard, refused on explicit request, and covered by the <code>node:</code> / family normalization.</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>The attack catalog is now split by mechanism family: <a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md"><code>docs/ATTACKS.md</code></a> is the index and common material, and each family lives under <a href="https://github.com/patriksimek/vm2/tree/main/docs/attacks"><code>docs/attacks/</code></a>. Category numbers are permanent and unchanged. <code>test/docs-catalog.js</code> fails the suite on a renumbering, a dead link, or a missing metadata line.</li>
<li>New Categories <strong>53</strong> (host-Promise <code>@@species</code> hijack with a missing handler) and <strong>54</strong> (host global leak via a sloppy function's nullish <code>this</code>), plus extensions to Categories <strong>21</strong> (<code>child_process</code> joins the denylist, with the upgrade path) and <strong>40</strong> (<code>crypto.setFips</code>), and matching rows in the &quot;How The Bridge Defends&quot; table.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/blob/main/CHANGELOG.md">vm2's changelog</a>.</em></p>
<blockquote>
<h2>[3.12.2]</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-5h3f-q97h-ccvc</strong> — NodeVM custom-resolver authorization admitted prefix-sharing siblings: resolving an allowlisted package recorded a raw <code>^&lt;path&gt;</code> prefix, so <code>.../node_modules/foo</code> authorized <code>.../node_modules/foo2/index.js</code> (and the <code>{module, path}</code> shape authorized the whole search directory), running the sibling's top-level code in the host realm under <code>context: 'host'</code>. Structural fix in <code>lib/resolver-compat.js</code>: resolver answers are recorded as boundary-matched base paths (plus exact extension spellings), the object shape authorizes only the resolved package directory, and a failed load withdraws its authorization. <strong>Behavior change:</strong> a <code>{module, path}</code> answer whose <code>module</code> is absolute, relative or contains <code>..</code> is now refused. See ATTACKS.md Category 46 and <code>test/ghsa/GHSA-5h3f-q97h-ccvc/</code>.</li>
<li><strong>GHSA-2v2p-6j97-cjg9</strong> — a host promise delivered into the sandbox through a constructor return, a host getter or data property, or a callback argument carried no rejection reaction, so sandbox code that dropped it terminated the host process under Node's <code>unhandledRejection</code> policy (GHSA-gjq8-xm47-88rc covered only <code>apply</code> returns). Structural fix in <code>lib/bridge.js</code>: every host promise is marked handled once at the delivery chokepoint (prototype brand check, cross-realm aware), and the <code>construct</code> trap gains the same unconditional mark as <code>apply</code>. <strong>Behavior change:</strong> embedders no longer see <code>unhandledRejection</code> for host promises handed to the sandbox on any route; debug rejections need an explicit <code>.catch()</code>. See ATTACKS.md Category 22 and <code>test/ghsa/GHSA-2v2p-6j97-cjg9/</code>.</li>
<li><strong>GHSA-489w-w794-jq94</strong> — host memory disclosure and corruption: a host-allocated <code>Buffer</code> (a builtin's return value such as <code>zlib.deflateSync</code>, an embedder-supplied buffer, a callback argument) exposed Node's shared 64 KiB pool through <code>.buffer</code> / <code>.parent</code>, letting the sandbox read and overwrite unrelated host buffers. Structural fix in <code>lib/bridge.js</code>: the GHSA-fcqc backing-store ownership rule now applies at the bridge for every host view, keyed on the delivered value's identity (so every alias of the store is covered), with the raw <code>buffer</code> / <code>parent</code> / <code>offset</code> getters undeliverable and a fail-closed gate. <strong>Behavior change:</strong> for a host view that does not own its whole store, <code>.buffer</code> / <code>.parent</code> is a bounded copy (not identity-stable, not write-through), <code>byteOffset</code> / <code>offset</code> read as <code>0</code>, sandbox-created sub-views lose <code>.buffer</code> aliasing with their parent, and <code>SharedArrayBuffer</code> sub-views are delivered as copies; owning buffers are unchanged. See ATTACKS.md Category 41 and <code>test/ghsa/GHSA-489w-w794-jq94/</code>.</li>
</ul>
<h3>Fixed</h3>
<ul>
<li><strong>Single-file bundlers (Bun compile, esbuild, pkg, ...) can now ship vm2.</strong> The sandbox bootstrap files (<code>bridge.js</code>, <code>setup-sandbox.js</code>, <code>setup-node-sandbox.js</code>, <code>events.js</code>) must reach the sandbox realm as source text and were read from disk at runtime with <code>fs.readFileSync(\</code>${__dirname}/...`)<code>, which a bundler cannot follow — a compiled binary failed with </code>ENOENT<code>as soon as the package directory was not on disk. They are now embedded as string literals in the generated</code>lib/sources.js<code> (</code>npm run build:sources<code>, regenerated by </code>pretest<code>/</code>prepublishOnly<code>and guarded by a staleness test). The sandbox-compiled scripts use the fixed virtual filename</code>/vm2/lib/<!-- raw HTML omitted -->` instead of the host install path, so bootstrap frames stay redacted from sandbox-visible stack traces.</li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>Dev dependency <code>@humanfs/node</code> bumped from 0.16.6 to 0.16.8.</li>
</ul>
<h2>[3.12.1]</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-6454-5x88-m6jw</strong> — sandbox-to-host RCE through an embedder-exposed host <code>Promise</code>. Writing <code>constructor[Symbol.species]</code> on the raw host promise and calling <code>.then</code> / <code>.catch</code> / <code>.finally</code> with the settlement-direction handler omitted made V8 deliver the raw host settlement (e.g. <code>process</code>) to a sandbox-captured capability, with no callback slot for the rejection sanitizer to wrap. Structural fix in <code>lib/bridge.js</code>: <code>neutralizeHostPromiseSpeciesOn</code> shadows the host promise's <code>constructor</code> across the call so the result capability is always a genuine host <code>%Promise%</code>, and the indirection peel now also covers host <code>Reflect.apply</code> and <code>.finally</code>. See ATTACKS.md Category 53 and <code>test/ghsa/GHSA-6454-5x88-m6jw/</code>.</li>
<li><strong>GHSA-j89j-5m6r-cr2q</strong> — sandbox escape to host RCE through any embedder-exposed sloppy-mode host function. Calling it with a nullish receiver (<code>greet()</code>, <code>.call(null)</code>, <code>Reflect.apply(fn, undefined, [])</code>, <code>bind(null)()</code>) makes V8 bind <code>this</code> to the host realm's global object, which the bridge then wrapped and delivered to the sandbox (<code>greet().process.getBuiltinModule('child_process')</code>). Structural fix in <code>lib/bridge.js</code>: the host global is cached at bridge init and refused at the three host→sandbox coercion chokepoints, returning <code>undefined</code> so strict-function semantics are preserved. See ATTACKS.md Category 54 and <code>test/ghsa/GHSA-j89j-5m6r-cr2q/</code>.</li>
<li><strong>GHSA-x3v6-43hc-82mc</strong> — a NodeVM that allowlists the <code>crypto</code> builtin let guest code call <code>crypto.setFips</code>, flipping the FIPS mode of the entire host process; the read-only wrap stops property writes but forwards host calls with full authority, the same process-wide-mutator class as <code>crypto.setEngine</code> and <code>tls.setDefaultCACertificates</code>. Fix in <code>lib/builtin.js</code>: <code>sanitizeCryptoModule</code> replaces <code>setFips</code> with a throwing stub alongside <code>setEngine</code>; <code>getFips()</code> and the rest of <code>crypto</code> are untouched. Configuration-integrity issue, not RCE. See ATTACKS.md Category 40 and <code>test/ghsa/GHSA-x3v6-43hc-82mc/</code>.</li>
<li><strong>GHSA-pq68-rvw4-xp4r</strong> — NodeVM's hard denylist omitted <code>child_process</code>, so <code>require: { builtin: ['*'] }</code>, <code>['*', '-fs']</code>, an explicit <code>['child_process']</code>, and the <code>node:</code> spellings all handed the sandbox the real host module and one <code>execSync</code> call was host RCE. Fix in <code>lib/builtin.js</code>: <code>child_process</code> joins <code>DANGEROUS_BUILTINS</code>, denied under the wildcard and on explicit request like <code>cluster</code> / <code>worker_threads</code> / <code>node:test</code>. <strong>Behavior change:</strong> embedders running trusted scripts that need it re-expose it through <code>require.mock</code> (the real module or a narrower facade); a bare <code>builtin: ['child_process']</code> no longer grants it. See ATTACKS.md Category 21 and <code>test/ghsa/GHSA-pq68-rvw4-xp4r/</code>.</li>
</ul>
<h2>[3.12.0]</h2>
<h3>Added</h3>
<ul>
<li><strong>Experimental Bun support (test suite and CI only).</strong> The suite now runs
under Bun, with engine-keyed assertion messages so patterns stay exactly as
strict on Node, a central <code>test/bun-skips.js</code> listing every JavaScriptCore
divergence, and a non-blocking CI job whose output is verified complete
before it is believed. Bun is <strong>not</strong> a supported security boundary — vm2's
threat model is derived from V8 internals and JavaScriptCore has not been
audited against the bridge. See the README Runtimes section.</li>
</ul>
<h3>Maintenance</h3>
<ul>
<li><strong><code>global.Proxy</code> install guarded for JavaScriptCore, and the sealed-slot attributes left implicit</strong> — <code>lib/setup-sandbox.js</code> installs the handler-sanitising <code>Proxy</code> with a bare assignment to a slot the <code>Object.defineProperties(global, ...)</code> block above declares as <code>undefined</code>. What that write does is engine-specific: on Node &gt;= 10 the slot is genuinely sealed and the write is a silent no-op, so the sandbox has no <code>Proxy</code> at all; on Node 8 the old V8 global proxy leaves the slot writable and the write is live, which is what gives that sandbox its <code>Proxy</code>; and JavaScriptCore (Bun) implements the strict-mode write correctly and throws, aborting sandbox setup before the first <code>run()</code>. The write is now wrapped in <code>try</code>/<code>catch</code> — the failure outcome is &quot;no <code>Proxy</code> in the sandbox&quot;, which is strictly more restrictive, never less. <code>test/vm.js</code> gains an AST-based guard (via <code>acorn</code>, already a runtime dependency) that fails if any write to <code>Error</code>, <code>Promise</code> or <code>Proxy</code> is left outside a <code>try</code> block, including through a local alias, and pins the sealed-slot descriptors on Node &gt;= 10 where the seal actually takes. <strong>Correction to 3.11.8's entry:</strong> that release described the assignment as dead code and removed it, and separately spelled out <code>writable: false, configurable: false</code> on the three sealed slots for readability, claiming no behaviour change. The second change was the damaging one — those attributes are the spec defaults, so the forms are equivalent on a current V8 but not on the Node 8 global proxy, where only the explicit form actually seals the slot. That silently removed <code>Proxy</code> from Node 8 sandboxes and broke six tests. The attributes are omitted again, with a comment saying why they must stay that way, and the assignment is restored.</li>
</ul>
<h2>[3.11.8]</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-3vgf-8m4q-q4qr</strong> (dup: <strong>GHSA-59g5-pmg6-5gr4</strong>) — default <code>VM</code> host intrinsic prototype pollution of the binary-data and iterator families. The protected inventory omitted <code>ArrayBuffer</code> / <code>SharedArrayBuffer</code> / <code>DataView</code> / every <code>TypedArray</code> / the abstract <code>%TypedArray%.prototype</code>, and the array/string/map/set/regexp-string iterator prototypes plus the shared <code>%IteratorPrototype%</code>. Because <code>Buffer</code> extends <code>Uint8Array</code>, the Category 20 proto-walk from a host <code>Buffer</code> reached those unprotected host prototypes and <code>Reflect.defineProperty</code> polluted them globally, corrupting every host-realm typed array and iterator. <code>lib/bridge.js</code> now lists the binary-data globals in <code>globalsList</code> and resolves the abstract intrinsic prototypes structurally into <code>thisGlobalPrototypes</code>, routing all of them into <code>protectedHostObjects</code>, the proto-mapping table, and the identity map so the write traps refuse sandbox <code>set</code>/<code>defineProperty</code>. See ATTACKS.md Category 20 (extended) and <code>test/ghsa/GHSA-3vgf-8m4q-q4qr/</code>.</li>
<li><strong>GHSA-88hf-g992-jg85</strong> — NodeVM default-config (<code>console: 'inherit'</code>) sandbox escape. The sandbox extracted the raw host <code>Object.prototype.__proto__</code> getter (via <code>Buffer.call.call(__lookupGetter__, …, '__proto__')</code>, the GHSA-v6mx/cfcw primitive) and, because that <em>getter</em> was never classified dangerous like the <em>setter</em>, climbed <code>console._stdout</code>'s host prototype chain to the non-intrinsic <code>EventEmitter.prototype</code>, overwrote <code>emit</code>, and had the host invoke it with <code>this === process</code> → RCE. Closed with two independent layers in <code>lib/bridge.js</code>: (1) the raw host proto-<em>readers</em> (<code>__proto__</code> getter, <code>Object.getPrototypeOf</code>, <code>Reflect.getPrototypeOf</code>) are denied delivery at <code>thisFromOtherWithFactory</code>/<code>thisEnsureThis</code>/<code>thisFromOtherForThrow</code> and the apply trap, so the sandbox can no longer climb host chains; (2) host <code>[[Prototype]]</code> objects are marked at delivery and sandbox function/accessor writes to them are diverted off the raw host object in <code>BaseHandler.set</code>/<code>defineProperty</code>. Legitimate <code>Object.getPrototypeOf</code> on host proxies and data/leaf writes are unchanged. See ATTACKS.md Category 50 and <code>test/ghsa/GHSA-88hf-g992-jg85/</code>.</li>
<li><strong>GHSA-f8gf-w286-fmq2</strong> — <code>allowAsync: false</code> async-execution boundary bypassed via Promise thenable assimilation. Blocking <code>Promise.prototype.then</code> left every native resolve capability open: <code>Promise.resolve</code>/<code>all</code>/<code>race</code>/<code>any</code>/<code>allSettled</code>/<code>try</code>, <code>new Promise(r =&gt; r(thenable))</code>, <code>withResolvers().resolve</code>, <code>Array.fromAsync</code>, and the realm-intrinsic base reached via <code>Object.getPrototypeOf(Promise)</code> all let V8's <code>PromiseResolveThenableJob</code> run an attacker <code>.then</code> in a microtask after <code>run()</code> returned, outside the configured <code>timeout</code>. Structural fix in <code>lib/setup-sandbox.js</code>, gated entirely to <code>allowAsync: false</code>: a TOCTOU-safe resolve-capability guard (refuses object/function values without ever reading <code>.then</code>), synchronous throws on the assimilating static methods, a non-configurable throwing <code>Array.fromAsync</code> stub, and a construct-guard Proxy on <code>localPromise</code>'s prototype that makes the native base un-constructable from the sandbox. <code>allowAsync: true</code> is untouched. See ATTACKS.md Category 51 and <code>test/ghsa/GHSA-f8gf-w286-fmq2/</code>.</li>
<li><strong>GHSA-gjq8-xm47-88rc</strong> — an embedder-exposed host function (or a host builtin such as <code>events.once</code>) that returns a rejected host <code>Promise</code> crashed the entire host process when sandbox code called it and ignored the result. The bridge handed the sandbox a wrapped promise but left the underlying host promise without a rejection reaction of its own, so Node's default <code>unhandledRejection</code> policy (Node 15+) tore the process down — a sandbox-triggered host DoS from a single line of untrusted code. Sibling of the parent advisory GHSA-hw58-p9xv-2mjh, which hardened the opposite (sandbox→host) direction. <code>lib/bridge.js</code> now attaches a benign no-op reaction to the underlying host promise on the host side, at the apply-trap boundary (<code>markHostPromiseHandled</code>). Promises multicast, so the sandbox's own GHSA-55hx-sanitized <code>.then</code>/<code>.catch</code> still fires and still observes the sanitized rejection; the no-op onRejected returns <code>undefined</code>, so it never creates a new unhandled rejection; fulfilled promises are untouched. See ATTACKS.md Category 22 (extended) and <code>test/ghsa/GHSA-gjq8-xm47-88rc/</code>.</li>
<li><strong>GHSA-r273-hxvj-fxhp</strong> — NodeVM exposed host <code>util</code> to the sandbox as an unfiltered <code>Object.assign({}, util)</code>, so <code>util.getCallSites()</code> (Node &gt;= 22.9) handed sandboxed code the host process call stack — absolute paths including vm2's own <code>lib/</code> and the embedder entrypoint — bypassing the GHSA-v27g host-frame redaction, which only covers sandbox-realm Error stacks. <code>getCallSite</code> / <code>setTraceSigInt</code> / private internals rode the same wholesale copy, and the <code>sys</code> alias leaked identically via the generic loader. <code>lib/builtin.js</code> now builds the exposed <code>util</code> from a vetted, forward-safe allowlist (<code>SAFE_UTIL_MEMBERS</code>, presence-gated Node 8→26) routed through the <code>BUILTIN_MEMBER_SANITIZERS</code> chokepoint for both <code>util</code> and <code>sys</code>, so no unreviewed host member reaches the sandbox. Information disclosure only. See ATTACKS.md Category 52 and <code>test/ghsa/GHSA-r273-hxvj-fxhp/</code>.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a0139cf</code></a> test: quarantine the five pool-dependent GHSA-489w cases under Bun</li>
<li><a href=""><code>1649f45</code></a> chore: bump to 3.12.2 and cut the release section</li>
<li><a href=""><code>0913368</code></a> docs: trim the 3.12.2 changelog entries to release-notes length</li>
<li><a href=""><code>9596bf5</code></a> fix(GHSA-489w-w794-jq94): bound a host view's backing store at the bridge</li>
<li><a href=""><code>6e487df</code></a> fix(GHSA-2v2p-6j97-cjg9): mark every host promise handled at the delivery cho...</li>
<li><a href=""><code>fb4977f</code></a> fix(GHSA-5h3f-q97h-ccvc): boundary-match custom-resolver authorizations</li>
<li><a href=""><code>a9a4943</code></a> chore(deps-dev): bump <code>@​humanfs/node</code> from 0.16.6 to 0.16.8 (<a href="">#577</a>)</li>
<li><a href=""><code>e1868c4</code></a> feat: embed sandbox bootstrap sources so bundlers can ship vm2 (<a href="">#579</a>)</li>
<li><a href=""><code>45e32a6</code></a> chore: bump to 3.12.1 and cut the release section</li>
<li><a href=""><code>d53e1c4</code></a> fix(GHSA-pq68-rvw4-xp4r): add child_process to DANGEROUS_BUILTINS</li>
<li>Additional commits viewable in <a href="https://github.com/patriksimek/vm2/compare/3.11.6...v3.12.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vm2&package-manager=npm_and_yarn&previous-version=3.11.6&new-version=3.12.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `160b62a854f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.