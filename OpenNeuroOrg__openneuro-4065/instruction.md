# Issue

**Title:** chore(deps): Bump vm2 from 3.11.5 to 3.11.6

## Description

Bumps [vm2](https://github.com/patriksimek/vm2) from 3.11.5 to 3.11.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/releases">vm2's releases</a>.</em></p>
<blockquote>
<h2>v3.11.6</h2>
<p>Five advisories closed. Patch release — no API changes for valid configurations.</p>
<h2>What's Changed</h2>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-cfcw-xp6x-25gj</strong> — Stacked-indirection bypass of the GHSA-v6mx-mf47-r5wg apply-trap peel. Two layers of <code>Function.prototype.{call,apply,bind}</code> pushed the host prototype mutator out of the inspected position; a later variant ran the <code>__proto__</code> setter entirely host-side, defeating both identity checks (RCE).</li>
<li><strong>GHSA-gmc2-2x9w-cgh9</strong> — <code>bufferAllocLimit</code> bypass via <code>Buffer.concat(list, totalLength)</code> and <code>Buffer.from(arrayLike)</code>, which reach the host allocator without traversing the sandbox-side wrapper — one call allocates past a configured cap (host memory-exhaustion DoS).</li>
<li><strong>GHSA-m283-3h24-438v</strong> — Host errors leaked live host references into sandbox <code>catch</code> blocks via <code>Error.cause</code>, the <code>SuppressedError</code> / <code>AggregateError</code> slots, arbitrary own properties (<code>err.detail = process</code>), and the carrier's prototype chain. Any embedder function throwing an error that carried a host reference was an escape (RCE).</li>
<li><strong>GHSA-m5w8-4gq2-6f8x</strong> — NodeVM <code>builtin: ['*']</code> exposed <code>os</code> and <code>dns</code>, the last two process-wide builtins. Both leak host identity and network topology, and both write host state: <code>dns.setServers()</code> hijacks the host's DNS resolver, <code>os.setPriority()</code> renices the host process.</li>
<li><strong>GHSA-v836-6xw4-9cx3</strong> — <code>bufferAllocLimit</code> bypass via <code>ArrayBuffer</code>, <code>SharedArrayBuffer</code>, every TypedArray constructor, and <code>WebAssembly.Memory</code>, which hit the same timeout-immune V8 allocator uncapped — a ~200-byte payload becomes gigabytes of host RSS (host memory-exhaustion DoS).</li>
</ul>
<h2>Upgrade Notes</h2>
<ul>
<li><strong><code>builtin: ['*']</code> users depending on <code>os</code> or <code>dns</code></strong> — both are now denied, along with <code>node:os</code>, <code>node:dns</code> and <code>dns/promises</code>. Re-introduce a safe subset via <code>require.mock</code> / <code>require.override</code>.</li>
<li><strong>Finite <code>bufferAllocLimit</code> users</strong> — the cap now also covers <code>Buffer.concat</code> / <code>from</code> / <code>copyBytesFrom</code> and the <code>ArrayBuffer</code> / <code>SharedArrayBuffer</code> / TypedArray / <code>WebAssembly.Memory</code> constructors. The default <code>Infinity</code> is unaffected.</li>
<li><strong>Host errors now reach sandbox <code>catch</code> blocks as sandbox-realm errors.</strong> Primitive diagnostics are preserved and <code>instanceof</code> now works for subclasses; non-primitive properties and the host prototype chain are gone by design.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.5...3.11.6">https://github.com/patriksimek/vm2/compare/v3.11.5...3.11.6</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/blob/main/CHANGELOG.md">vm2's changelog</a>.</em></p>
<blockquote>
<h2>[3.11.6]</h2>
<p>Five advisories closed. Patch release — no API changes for valid configurations.</p>
<h3>Security fixes</h3>
<ul>
<li><strong>GHSA-cfcw-xp6x-25gj</strong> — stacked-indirection bypass of the GHSA-v6mx-mf47-r5wg apply-trap peel: the peel inspected one layer of <code>Function.prototype.{call,apply,bind}</code> indirection, so two layers slipped the host prototype mutator past it, and a follow-up variant laundered the severance entirely host-side. Closed at two independent chokepoints — <code>lib/bridge.js</code> refuses to deliver host prototype mutators, and both it and <code>handleException</code> reject any host object whose prototype chain reaches <code>null</code> without passing through the sandbox <code>Object.prototype</code>. See ATTACKS.md Category 37 and <code>test/ghsa/GHSA-cfcw-xp6x-25gj/</code>.</li>
<li><strong>GHSA-gmc2-2x9w-cgh9</strong> — <code>bufferAllocLimit</code> (GHSA-6785-pvv7-mvg7) bypass via <code>Buffer.concat(list, totalLength)</code> and <code>Buffer.from(arrayLike)</code>, whose host implementations reach the C++ allocator without traversing the sandbox-side <code>allocUnsafe</code> wrapper. <code>lib/setup-sandbox.js</code> now caps <code>concat</code>, <code>from</code>, and <code>copyBytesFrom</code>, and a fail-closed enumeration of <code>host.Buffer</code>'s own keys turns any future uncapped allocator into an explicit error rather than a silent bypass. See ATTACKS.md Category 23 (extended) and <code>test/ghsa/GHSA-gmc2-2x9w-cgh9/</code>.</li>
<li><strong>GHSA-m283-3h24-438v</strong> — host errors leaked live host references into sandbox <code>catch</code> blocks through four channels: <code>Error.cause</code>, the <code>SuppressedError</code> / <code>AggregateError</code> sub-error slots, arbitrary own properties (<code>err.detail = process</code>), and — beyond the reach of own-key enumeration — the carrier's own prototype chain. <code>handleException</code> now seals the spec-defined slots and rebuilds every host-wrapped carrier as a fresh sandbox-realm error carrying only its primitive properties, discarding the host prototype chain entirely. See ATTACKS.md Category 38 and <code>test/ghsa/GHSA-m283-3h24-438v/</code>.</li>
<li><strong>GHSA-m5w8-4gq2-6f8x</strong> — sibling of GHSA-9g8x: NodeVM <code>builtin: ['*']</code> still surfaced <code>os</code> and <code>dns</code>, the last two process-wide builtins. Beyond host-identity and network-topology reads, both carry writes reachable in one line of sandbox code — <code>dns.setServers()</code> hijacks the host's DNS resolver, <code>os.setPriority()</code> renices the host process. <code>lib/builtin.js</code> adds both to <code>DANGEROUS_BUILTINS</code>, covering <code>node:</code> spellings and <code>dns/promises</code> automatically. See ATTACKS.md Category 35 (extended) and <code>test/ghsa/GHSA-m5w8-4gq2-6f8x/</code>.</li>
<li><strong>GHSA-v836-6xw4-9cx3</strong> — <code>bufferAllocLimit</code> bypass via <code>ArrayBuffer</code> / <code>SharedArrayBuffer</code> / TypedArray / <code>WebAssembly.Memory</code>, which reach the same synchronous, timeout-immune V8 backing-store allocator uncapped. When a finite limit is set, <code>lib/setup-sandbox.js</code> wraps each constructor with a <code>construct</code> trap capping the ToIndex-coerced byte count, and pins <code>prototype.constructor</code> so the uncapped intrinsic cannot be recovered by a constructor walk. The default <code>Infinity</code> leaves them untouched. See ATTACKS.md Category 36 and <code>test/ghsa/GHSA-v836-6xw4-9cx3/</code>.</li>
</ul>
<h3>Upgrade notes</h3>
<ul>
<li><strong>If you use <code>NodeVM({ require: { builtin: ['*'] } })</code> and depend on <code>os</code> or <code>dns</code></strong>, those two builtins are now denied (GHSA-m5w8-4gq2-6f8x), together with <code>node:os</code>, <code>node:dns</code>, and <code>dns/promises</code>. They join the process-wide class closed in 3.11.4: they expose host-process identity and network topology, and <code>dns.setServers()</code> / <code>dns.setDefaultResultOrder()</code> / <code>os.setPriority()</code> are outright writes to host-process state. Embedders needing a sandbox-local subset (typically <code>os.platform()</code>, <code>os.EOL</code>, <code>os.constants</code>) should register a controlled wrapper via <code>require.mock</code> or <code>require.override</code>.</li>
<li><strong>If you set a finite <code>bufferAllocLimit</code></strong>, the cap now also covers <code>Buffer.concat</code>, <code>Buffer.from</code>, <code>Buffer.copyBytesFrom</code>, and the <code>ArrayBuffer</code> / <code>SharedArrayBuffer</code> / TypedArray / <code>WebAssembly.Memory</code> constructors (GHSA-gmc2-2x9w-cgh9, GHSA-v836-6xw4-9cx3). Sandbox code that previously allocated past the cap through those paths now gets the same <code>RangeError</code>. The default <code>bufferAllocLimit: Infinity</code> leaves every one of them untouched, so this is a no-op unless you opted into the cap.</li>
<li><strong>Errors thrown by embedder-exposed host functions now reach sandbox <code>catch</code> blocks as sandbox-realm errors</strong> rather than proxies of the host error (GHSA-m283-3h24-438v). Primitive diagnostics (<code>message</code>, <code>name</code>, <code>stack</code>, <code>code</code>, <code>errno</code>, <code>syscall</code>, <code>path</code>, …) are preserved and error subclasses (<code>TypeError</code>, <code>RangeError</code>, …) now satisfy <code>instanceof</code> correctly inside the sandbox; non-primitive properties, and anything reachable through the error's prototype chain, are gone by design.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a5b31cd</code></a> ci: pin the compilers job to TypeScript 6</li>
<li><a href=""><code>3dffc8f</code></a> test(GHSA-v836-6xw4-9cx3): raise the timeout on the documented-residual case</li>
<li><a href=""><code>a1cf31d</code></a> chore(deps-dev): refresh lockfile, clearing all dev-dependency advisories</li>
<li><a href=""><code>b76dd7d</code></a> chore: bump to 3.11.6 and cut the release section</li>
<li><a href=""><code>7e3faaf</code></a> fix(GHSA-m283-3h24-438v): sanitize host error carriers reaching the sandbox</li>
<li><a href=""><code>a85acb6</code></a> fix(GHSA-cfcw-xp6x-25gj): refuse host prototype mutators and severed host val...</li>
<li><a href=""><code>c950166</code></a> fix(GHSA-v836-6xw4-9cx3): cap ArrayBuffer/TypedArray/WebAssembly.Memory under...</li>
<li><a href=""><code>3ffb315</code></a> fix(GHSA-gmc2-2x9w-cgh9): close bufferAllocLimit bypass via concat / from / c...</li>
<li><a href=""><code>768bcfc</code></a> fix(GHSA-m5w8-4gq2-6f8x): deny os and dns NodeVM builtins</li>
<li><a href=""><code>5e0f255</code></a> feat: add maintainer skill governing the security advisory queue</li>
<li>See full diff in <a href="https://github.com/patriksimek/vm2/compare/v3.11.5...3.11.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vm2&package-manager=npm_and_yarn&previous-version=3.11.5&new-version=3.11.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1525b3aac3c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.