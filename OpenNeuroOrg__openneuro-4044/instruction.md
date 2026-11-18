# Issue

**Title:** chore(deps): Bump nx from 22.7.1 to 22.7.8

## Description

Bumps [nx](https://github.com/nrwl/nx/tree/HEAD/packages/nx) from 22.7.1 to 22.7.8.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nrwl/nx/releases">nx's releases</a>.</em></p>
<blockquote>
<h2>22.7.8 (2026-07-30)</h2>
<h3>🩹 Fixes</h3>
<ul>
<li><strong>angular-rspack:</strong> dispose stylesheet bundler so one-shot builds exit (<a href="">#35869</a>)</li>
<li><strong>core:</strong> use workspace package manager when fetching migrations via install (<a href="">#35866</a>)</li>
<li><strong>core:</strong> omit peer dependencies when installing packages to a temp dir (<a href="">#36295</a>)</li>
<li><strong>core:</strong> prevent shell injection in nx import (<a href="">#36348</a>)</li>
<li><strong>core:</strong> stop passing git revisions through a shell in affected commands (<a href="">#36379</a>)</li>
<li><strong>core:</strong> allow nx build scripts in generated pnpm-workspace.yaml (<a href="">#35564</a>)</li>
<li><strong>core:</strong> acknowledge <code>@​swc/core</code> build script in generated pnpm-workspace.yaml (<a href="">#35608</a>)</li>
<li><strong>core:</strong> keep real dependencies when omitting peers from npm temp installs (<a href="">#36518</a>, <a href="">#36295</a>)</li>
<li><strong>core:</strong> bump pinned axios and brace-expansion past vulnerable versions (<a href="">#36507</a>, <a href="">#36474</a>)</li>
<li><strong>detox:</strong> resolve jest versions locally instead of importing <code>@​nx/jest</code> internals (<a href="">3ce3f6ab6e</a>)</li>
<li><strong>docker:</strong> run release pipeline docker commands without a shell (<a href="">#36505</a>)</li>
<li><strong>js:</strong> exclude typescript 7 from supported versions on 22.7.x (<a href="">dc804964e9</a>)</li>
<li><strong>js:</strong> resolve the verdaccio bin through its package.json (<a href="">#36479</a>)</li>
<li><strong>misc:</strong> use default import for chalk in <code>@​nx/workspace</code> output.ts (<a href="">#35523</a>, <a href="">#35521</a>, <a href="">#34111</a>, <a href="">#21201</a>, <a href="">#26667</a>)</li>
<li><strong>repo:</strong> use default inputs instead of the '...' token in nx-dev on 22.7.x (<a href="">#35530</a>)</li>
<li><strong>repo:</strong> trust wix/brew tap so macOS detox CI can install applesimutils (<a href="">#36146</a>)</li>
<li><strong>testing:</strong> seed typescript before plugins in e2e workspaces to avoid TS7 stub (<a href="">7f5ffbfcbc</a>)</li>
</ul>
<h3>❤️ Thank You</h3>
<ul>
<li>Craigory Coppola <a href="https://github.com/AgentEnder"><code>@​AgentEnder</code></a></li>
<li>FrozenPandaz <a href="https://github.com/FrozenPandaz"><code>@​FrozenPandaz</code></a></li>
<li>Jack Hsu <a href="https://github.com/jaysoo"><code>@​jaysoo</code></a></li>
<li>Jason Jean <a href="https://github.com/FrozenPandaz"><code>@​FrozenPandaz</code></a></li>
<li>Jonathan Garvey <a href="https://github.com/jdgarvey"><code>@​jdgarvey</code></a></li>
<li>Miroslav Jonaš <a href="https://github.com/meeroslav"><code>@​meeroslav</code></a></li>
</ul>
<h2>22.7.7 (2026-07-10)</h2>
<h3>🩹 Fixes</h3>
<ul>
<li><strong>core:</strong> prevent path traversal / zip-slip in self-hosted remote cache (<a href="">#36116</a>)</li>
<li><strong>core:</strong> warn when the self-hosted remote cache disables TLS verification (NXC-4593) (<a href="">#36132</a>, <a href="">#36116</a>)</li>
<li><strong>dotnet:</strong> declare obj as a publish output to fix sandbox violation (<a href="">#35858</a>)</li>
<li><strong>dotnet:</strong> declare directory build props input for analyzer dotnet tasks (<a href="">df7540195a</a>)</li>
<li><strong>dotnet:</strong> declare directory build props on the separate release build target (<a href="">6545ee2222</a>)</li>
<li><strong>dotnet:</strong> declare directory build props on the analyzer tests dotnet targets (<a href="">e72ee0dd79</a>)</li>
</ul>
<h3>❤️ Thank You</h3>
<ul>
<li>FrozenPandaz <a href="https://github.com/FrozenPandaz"><code>@​FrozenPandaz</code></a></li>
<li>Jason Jean <a href="https://github.com/FrozenPandaz"><code>@​FrozenPandaz</code></a></li>
</ul>
<h2>22.7.6 (2026-06-23)</h2>
<h3>🩹 Fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f7afd77</code></a> fix(core): bump pinned axios and brace-expansion past vulnerable versions (<a href="">#3</a>...</li>
<li><a href=""><code>983413b</code></a> fix(core): keep real dependencies when omitting peers from npm temp installs ...</li>
<li><a href=""><code>4159295</code></a> fix(core): stop passing git revisions through a shell in affected commands (#...</li>
<li><a href=""><code>cf99649</code></a> fix(core): prevent shell injection in nx import (<a href="">#36348</a>)</li>
<li><a href=""><code>74311e7</code></a> fix(core): omit peer dependencies when installing packages to a temp dir (<a href="">#36</a>...</li>
<li><a href=""><code>84beebc</code></a> fix(core): use workspace package manager when fetching migrations via install...</li>
<li><a href=""><code>a328bf1</code></a> fix(core): warn when the self-hosted remote cache disables TLS verification (...</li>
<li><a href=""><code>a828076</code></a> fix(core): prevent path traversal / zip-slip in self-hosted remote cache (<a href="">#36</a>...</li>
<li><a href=""><code>dc849bb</code></a> fix(core): update brace-expansion and yaml (<a href="">#35790</a>)</li>
<li><a href=""><code>8fd1feb</code></a> fix(core): allow local plugin subpath imports without custom conditions (<a href="">#35751</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/nrwl/nx/commits/22.7.8/packages/nx">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=nx&package-manager=npm_and_yarn&previous-version=22.7.1&new-version=22.7.8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ac78fce8a45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.