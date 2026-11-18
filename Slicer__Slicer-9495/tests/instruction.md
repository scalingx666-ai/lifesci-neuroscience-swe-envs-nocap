# Issue

**Title:** Bump @babel/core from 7.2.0 to 7.29.6 in /Modules/Scripted/WebServer/Resources/docroot in the npm_and_yarn group across 1 directory

## Description

Bumps the npm_and_yarn group with 1 update in the /Modules/Scripted/WebServer/Resources/docroot directory: [@babel/core](https://github.com/babel/babel/tree/HEAD/packages/babel-core).

Updates `@babel/core` from 7.2.0 to 7.29.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/babel/babel/releases">@​babel/core's releases</a>.</em></p>
<blockquote>
<h2>v7.29.6 (2026-05-25)</h2>
<h4>:bug: Bug Fix</h4>
<ul>
<li><code>babel-generator</code>
<ul>
<li><a href="">#18014</a> Catchup source map position in preserveFormat (<a href="https://github.com/nicolo-ribaudo"><code>@​nicolo-ribaudo</code></a>)</li>
</ul>
</li>
<li><code>babel-core</code>
<ul>
<li><a href="">#18001</a> [7.x packport]Improve input source map handling (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
<li><code>babel-core</code>, <code>babel-generator</code>
<ul>
<li><a href="">#17998</a> Preserve original identifier names from input sourcemaps (<a href="">#17992</a>) (<a href="https://github.com/Andarist"><code>@​Andarist</code></a>)</li>
</ul>
</li>
</ul>
<h4>Committers: 3</h4>
<ul>
<li>Huáng Jùnliàng (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
<li>Mateusz Burzyński (<a href="https://github.com/Andarist"><code>@​Andarist</code></a>)</li>
<li>Nicolò Ribaudo (<a href="https://github.com/nicolo-ribaudo"><code>@​nicolo-ribaudo</code></a>)</li>
</ul>
<h2>v7.29.5 (2026-05-05)</h2>
<h4>:house:  Internal</h4>
<ul>
<li><code>babel-preset-env</code>
<ul>
<li>Update <code>@babel/*</code> dependencies</li>
</ul>
</li>
</ul>
<h2>v7.29.4 (2026-05-05)</h2>
<h4>:bug: Bug Fix</h4>
<ul>
<li><code>babel-plugin-transform-modules-systemjs</code>
<ul>
<li><a href="">#17974</a> [7.x backport]fix(systemjs): improve module string name support (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
</ul>
<h4>Committers: 1</h4>
<ul>
<li>Huáng Jùnliàng (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
<h2>v7.29.3 (2026-04-30)</h2>
<h4>:eyeglasses: Spec Compliance</h4>
<ul>
<li><code>babel-parser</code>
<ul>
<li><a href="">#17923</a> Support flow extends bound (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
</ul>
<h4>:bug: Bug Fix</h4>
<ul>
<li><code>babel-helper-create-class-features-plugin</code>, <code>babel-plugin-proposal-decorators</code>
<ul>
<li><a href="">#17931</a> fix(decorators): replace super within all removed static elements (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
<li><code>babel-register</code>
<ul>
<li><a href="">#17915</a> Fix thread synchronization issues in <code>@babel/register</code> (<a href="https://github.com/liuxingbaoyu"><code>@​liuxingbaoyu</code></a>)</li>
</ul>
</li>
<li><code>babel-compat-data</code>, <code>babel-plugin-bugfix-safari-rest-destructuring-rhs-array</code>, <code>babel-preset-env</code>
<ul>
<li><a href="">#17788</a> Add bugfix plugin for Safari array rest destructuring bug (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
</ul>
<h4>:nail_care: Polish</h4>
<ul>
<li><code>babel-parser</code>
<ul>
<li><a href="">#17782</a> Improve trailing comma comment handling (<a href="https://github.com/JLHwung"><code>@​JLHwung</code></a>)</li>
</ul>
</li>
</ul>
<h4>:memo: Documentation</h4>
<ul>
<li><a href="">#17847</a> Replace npmjs.com links with npmx.dev (<a href="https://github.com/nicolo-ribaudo"><code>@​nicolo-ribaudo</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>04ea6b2</code></a> v7.29.6</li>
<li><a href=""><code>99f498a</code></a> [7.x packport]Improve input source map handling (<a href="">#18001</a>)</li>
<li><a href=""><code>feba0a3</code></a> Preserve original identifier names from input sourcemaps (<a href="">#17992</a>) (<a href="">#17998</a>)</li>
<li><a href=""><code>aa8394e</code></a> v7.29.0</li>
<li><a href=""><code>ad0d03f</code></a> [7.x backport] feat: Allow specifying startLine in code frame (<a href="">#17739</a>)</li>
<li><a href=""><code>d7f4008</code></a> v7.28.6</li>
<li><a href=""><code>e130225</code></a> Polish(standalone): improve message on invalid preset/plugin (<a href="">#17606</a>)</li>
<li><a href=""><code>99dcba5</code></a> chore: enable some ts-eslint rules (<a href="">#17592</a>)</li>
<li><a href=""><code>c92c491</code></a> Improve Unicode handling in code-frame tokenizer (<a href="">#17589</a>)</li>
<li><a href=""><code>d725e39</code></a> Add <code>BABEL_7_TO_8_DANGEROUSLY_DISABLE_VERSION_CHECK</code> (<a href="">#17569</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/babel/babel/commits/v7.29.6/packages/babel-core">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for <code>@​babel/core</code> since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=@babel/core&package-manager=npm_and_yarn&previous-version=7.2.0&new-version=7.29.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/Slicer/Slicer/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdd346f0a3ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.