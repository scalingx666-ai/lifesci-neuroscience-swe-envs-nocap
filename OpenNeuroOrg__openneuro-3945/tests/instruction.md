# Issue

**Title:** chore(deps): Bump vm2 from 3.11.2 to 3.11.3

## Description

Bumps [vm2](https://github.com/patriksimek/vm2) from 3.11.2 to 3.11.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/releases">vm2's releases</a>.</em></p>
<blockquote>
<h2>v3.11.3</h2>
<h2>What's Changed</h2>
<h3>Security fix</h3>
<ul>
<li><strong>GHSA-248r-7h7q-cr24</strong> — Async generator <code>yield*</code>-return thenable exception capture (RCE)</li>
</ul>
<h2>Documentation</h2>
<ul>
<li><a href="https://github.com/patriksimek/vm2/blob/main/docs/ATTACKS.md"><code>docs/ATTACKS.md</code></a> updated through Category 29.</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patriksimek/vm2/compare/v3.11.2...v3.11.3">https://github.com/patriksimek/vm2/compare/v3.11.2...v3.11.3</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/patriksimek/vm2/blob/main/CHANGELOG.md">vm2's changelog</a>.</em></p>
<blockquote>
<h2>[3.11.3]</h2>
<p>Single advisory closed. Patch release — no API changes.</p>
<h3>Security fix</h3>
<ul>
<li><strong>GHSA-248r-7h7q-cr24</strong> — async generator <code>yield*</code>-return thenable exception capture. Calling <code>i.return(thenable)</code> on an async generator delegating to a no-<code>return</code> inner iterator let V8's <code>PromiseResolveThenableJob</code> capture synchronous throws from the thenable's <code>.then</code> and surface them to sandbox code as iterator results — bypassing both the transformer's <code>catch</code> instrumentation and the <code>globalPromise.prototype.then</code> rejection sanitiser. Two-layer defense on <code>%AsyncGeneratorPrototype%.next/.return/.throw</code> in <code>lib/setup-sandbox.js</code>: every iterator-result promise routes value and rejection through <code>handleException</code>, and every thenable argument is replaced with a sandbox-realm wrapper whose <code>.then</code> is a fixed <code>safeThen</code> that sanitises sync throws and recursively re-wraps any nested thenable handed to <code>resolve(...)</code>. When <code>safeThen</code> reads <code>value.then</code> and it is non-function, the wrapper always resolves with a <code>{__proto__: null}</code> shadow so V8's re-read of <code>.then</code> cannot observe attacker-controlled values — closing every counting/self-replacing-getter TOCTOU variant. Trade-off: identity is not preserved for non-thenable values passed to <code>i.return(x)</code>. ATTACKS.md Category 29.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>093494c</code></a> fix(GHSA-248r-7h7q-cr24): close async generator yield*-return thenable except...</li>
<li>See full diff in <a href="https://github.com/patriksimek/vm2/compare/v3.11.2...v3.11.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vm2&package-manager=npm_and_yarn&previous-version=3.11.2&new-version=3.11.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d6ac21e851e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.